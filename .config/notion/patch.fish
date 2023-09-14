# Requires @electron/asar

set --local resources /Applications/Notion.app/Contents/Resources
set --local unpacked (mktemp -d)
set --local packed $unpacked/app.asar

asar extract $resources/app.asar $unpacked
echo \n'require(`${process.env.HOME}/.config/notion/preload.js`);' >> $unpacked/renderer/preload.js
asar pack $unpacked $packed
mv -f $packed $resources/

rm -r $unpacked

