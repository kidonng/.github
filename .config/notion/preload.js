const fs = require('node:fs')
const {env} = require('node:process')

const read = file => fs.readFileSync(`${env.HOME}/.config/notion/${file}`, 'utf-8')

document.addEventListener('readystatechange', async () => {
    for await (const text of [
        read('style.css'),
    ]) {
        const style = document.createElement('style')
        style.append(text)
        document.head.append(style)
    }

    for await (const text of [
        read('script.js'),
    ]) {
        const script = document.createElement('script')
        script.type = 'module'
        script.text = text
        document.head.append(script)
    }
}, { once: true })
