var system = require('system');
var page = require('webpage').create();

var width = system.args[1];
var height = system.args[2];

page.viewportSize = { width: width, height: height };
page.clipRect = { top: 0, left: 0, width: width, height: height };
page.open(system.args[3], function() {
  page.render(system.args[4]);
  phantom.exit();
});