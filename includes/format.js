/*
[].forEach.call(document.querySelectorAll("img"), function(img) {
    img.src = img.src.split('%22')[1].replace(/\/$/, '');
});
*/

function endsWith(str, pattern) {
    var d = str.length - pattern.length;
    return d >= 0 && str.lastIndexOf(pattern) === d;
};


$(".qrcode").each(function(i, div) {
    var url = div.dataset.url;
    new QRCode(div, {
        text: url
    });
});

$("iframe").each(function(i, iframe) {
    var div = document.createElement("div");
    div.className = "qrcode";
    new QRCode(div, {
        text: iframe.src,
        colorDark : "#ff0000"
    });
    $(iframe).replaceWith(div);
});

$("img").each(function(i, img) {
    var div = document.createElement("div");
    if (endsWith(img.src, ".gif")) {
        div.className = "qrcode";
        new QRCode(div, {
            text: img.src,
            colorDark : "#00ff00"
        });
        $(img).replaceWith(div);
    }
});

$("p:has(> img)").css("text-align", "center");
