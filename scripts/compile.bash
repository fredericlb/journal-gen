#!/bin/bash
echo << EOM
    <!doctype html>
    <html>
        <head>
            <meta charset="utf-8">
        </head>
        <body>
EOM

echo "<style>`cat includes/style.css`</style>";

for filename in ./articles/${SESSION_ID}_*.json; do
    echo "<div class='article-head'>"
    echo "<h1>`cat $filename | jq -r '.title'`</h1>"
    echo "<div class='qrcode-cont'><div class='qrcode' data-url='`cat $filename | jq -r '.url'`'></div></div>"
    echo "</div>"
    echo "<div class='article'>`cat $filename | jq -r '.content'`</div>"
    echo "</div>"
    rm ${filename}
done

echo "<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js'></script>";
echo "<script>`cat includes/qrcode.js`</script>"
echo "<script>`cat includes/format.js`</script>";
echo << EOM
        </body>
    </html>
EOM
