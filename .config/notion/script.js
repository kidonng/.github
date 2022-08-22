import { observe } from 'https://esm.sh/selector-observer@2.1.6'

/* Auto reload failed external images with canonical URL */
const failedImages = new Set()
observe('img[src^="/image/"]', {
    add(el) {
        // Notion reverts mutations to page content
        if (el.closest('.notion-page-content')) return

        const image = decodeURIComponent(new URL(el.src).pathname.replace('/image/', ''))
        if (image.startsWith('https://s3-us-west-2.amazonaws.com/secure.notion-static.com/')) return

        if (failedImages.has(image)) {
            el.src = image
            return
        }

        el.addEventListener('error', () => {
            console.warn('Reloading image with canonical URL:', image)
            failedImages.add(image)

            // Seems to race with Notion without timeout
            setTimeout(() => {
                el.src = image
            }, 100)
        }, { once: true })
    },
})
