var KillSwitch = function() {};

KillSwitch.prototype.start = function(options) {
    cordova.exec(function() {}, function() {}, 'KillSwitch', 'start', [options]);
}

KillSwitch.prototype.engage = function(options) {
    cordova.exec(function() {}, function() {}, 'KillSwitch', 'engage', [options]);
}

if(!window.plugins) {
    window.plugins = {};
}

if (!window.plugins.killSwitch) {
    window.plugins.killSwitch = new KillSwitch();
}

if (typeof module != 'undefined' && module.exports) {
    module.exports = KillSwitch;
}