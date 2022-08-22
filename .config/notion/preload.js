// echo \n'require(`${process.env.HOME}/.config/notion/preload.js`);' >> /Applications/Notion.app/Contents/Resources/app/renderer/preload.js
const fs = require('fs')
const read = (file) => fs.readFileSync(`${process.env.HOME}/.config/notion/${file}`, 'utf-8')

document.addEventListener('readystatechange', () => {
    const style = document.createElement('style')
    style.innerHTML = read('style.css')

    const script = document.createElement('script')
    script.type = 'module'
    script.text = read('script.js')

    document.head.append(style, script)
}, { once: true })
