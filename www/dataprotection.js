/*global cordova, module, console*/



module.exports = {
    isEnabled: function (success, error) {
        "use strict";
        cordova.exec(success, error, "CDVDataProtection", "isEnabled", []);
    }
};
