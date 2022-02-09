// Usage:
// 1. echo \n'require(`${process.env.HOME}/.config/notion/script.js`)' >> /Applications/Notion.app/Contents/Resources/app/renderer/preload.js
// 2. Edit `script.js` and `style.css`
// 3. Profit
const fs = require('fs')

document.addEventListener('readystatechange', () => {
    const style = document.createElement('style')
    style.innerHTML = = fs.readFileSync(`${process.env.HOME}/.config/notion/style.css`, 'utf-8')
    document.head.append(style)
}, { once: true })
