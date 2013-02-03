var system = require('system');

var page = require('webpage').create();
page.viewportSize = { width: system.args[1], height: system.args[2] };
page.open(system.args[3], function () {
    img = page.render(system.args[4]);
    console.log(img);
    phantom.exit();
});
