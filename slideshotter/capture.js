var system = require('system');

var page = require('webpage').create();
page.viewportSize = { width: system.args[1], height: system.args[2] };
page.open('http://127.0.0.1:9292', function () {
    img = page.render('slide.png');
    console.log(img);
    phantom.exit();
});
