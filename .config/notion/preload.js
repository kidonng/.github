// echo \n'require(`${process.env.HOME}/.config/notion/preload.js`);' >> /Applications/Notion.app/Contents/Resources/app/renderer/preload.js

const fs = require('fs')
const fetch = require('node-fetch')

const read = (file) => fs.readFileSync(`${process.env.HOME}/.config/notion/${file}`, 'utf-8')
const toText = (response) => response.text()

document.addEventListener('readystatechange', async () => {
    for await (const text of [
        read('style.css'),
        fetch('https://cdn.jsdelivr.net/gh/kidonng/cherry@75b79d723a3f2105cb28ab71005d4b28f392d780/styles/menlo-to-jetbrains-mono.user.css').then(toText),
    ]) {
        const style = document.createElement('style')
        style.append(text)
        document.head.append(style)
    }

    for await (const text of [
        read('script.js'),
        fetch('https://cherry.xuann.wang/block-notion-analytics.user.js').then(toText),
    ]) {
        const script = document.createElement('script')
        script.text = text
        document.head.append(script)
    }
}, { once: true })
