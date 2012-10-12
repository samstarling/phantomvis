var page = require('webpage').create();
page.viewportSize = { width: 300, height: 300 };
page.open('http://127.0.0.1:9292', function () {
    img = page.render('slide1.png');
    console.log(img);
    phantom.exit();
});

