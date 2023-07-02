import 'https://cherry.xuann.wang/block-notion-analytics.user.js'

// Slash key to focus database search
addEventListener('keydown', (event) => {
	if (
			event.key === '/' &&
			!event.ctrlKey &&
			!event.altKey &&
			!event.shiftKey &&
			!event.metaKey &&
			!document.activeElement.matches('input, [contenteditable]')
	) {
		const [search] = [...document.querySelectorAll('.collectionSearch')]
		if (!search) return

		event.preventDefault()
		const {parentElement} = search
		parentElement.click()
		parentElement.nextElementSibling.querySelector('input')?.focus()
	}
})
