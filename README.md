# cordova-plugin-data-protection

This plugin retrieves information about an Android/iOS devices device encryption.

Currently only returns true/false based on whether iOS has Data Protection available or Android has whole device encryption (passcode at boot)

```js
onDeviceReady: function () {
    "use strict";
    console.log("device ready");

    if(cordova.plugins && cordova.plugins.dataprotection){
      cordova.plugins.dataprotection.isEnabled(
        function(result) {
          console.log("stored data encryption available: " + result);
        }, function(error) {
          console.log("dataprotection error: " + error);
      });
    }

    app.receivedEvent('deviceready');
},
```
