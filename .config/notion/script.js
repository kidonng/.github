// Usage:
// 1. echo \n'require(`${process.env.HOME}/.config/notion/script.js`)' >> /Applications/Notion.app/Contents/Resources/app/renderer/preload.js
// 2. Edit `script.js` and `style.css`
// 3. Profit
const fs = require('fs')

;(() => {
    const json = data => new Response(JSON.stringify(data))
    // `window.CONFIG.api.http`
    const api = '/api/v3'

    const rawFetch = window.fetch
    window.fetch = async (...args) => {
        const [url] = args

        if (url === `${api}/getUserAnalyticsSettings`) {
            return json({
                isAmplitudeEnabled: false,
                isIntercomEnabled: false,
                isSegmentEnabled: false,
            })
        } else if ([
            `${api}/identifySegmentWorkspace`,
            `${api}/trackSegmentEvent`,
        ].includes(url)) {
            return json({})
        } else if (url === 'https://api.statsig.com/v1/rgstr') {
            return json({ success: true })
        }

        return rawFetch(...args)
    }

    Object.defineProperty(window, '__SENTRY__', {
        get() {
            return {
                hub: {
                    isOlderThan() {},
                    getScope() {},
                    bindClient() {},
                    configureScope() {},
                }
            }
        },
        set() {},
    })
})()

document.addEventListener('readystatechange', () => {
    const style = document.createElement('style')
    style.innerHTML = fs.readFileSync(`${process.env.HOME}/.config/notion/style.css`, 'utf-8')
    document.head.append(style)
}, { once: true })
