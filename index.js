const redirectUrl = "https://nirokay.com";

function redirect(href) {
    window.location = href;
}

setTimeout(redirect(redirectUrl), 3000);
