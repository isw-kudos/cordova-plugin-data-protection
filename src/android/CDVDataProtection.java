package au.net.isw.cordova.dataprotection;

import org.apache.cordova.*;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import android.app.Activity;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.RestrictionEntry;
import android.content.RestrictionsManager;
import android.os.Bundle;
import android.util.Log;

import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

public class CDVDataProtection extends CordovaPlugin{
    final Boolean DEBUG = BuildConfig.DEBUG;
    final String TAG = "CDVDataProtection";

    @Override
    public boolean execute(String action, JSONArray data, CallbackContext callbackContext) throws JSONException {
        final String funcName = "execute";
        if(DEBUG)Log.v(TAG, funcName + " start. data: " + data.toString());
        return true;
    }

    public Context getContext(){
        return getActivity();
    }
    public Activity getActivity(){
        return this.cordova.getActivity();
    }

    /**
     * Called when the system is about to start resuming a previous activity.
     * Unregister for receiving the restrictions changed event. Reregisters in onResume.
     *
     * @param multitasking		Flag indicating if multitasking is turned on for app
     */
    @Override
    public void onPause(boolean multitasking) {

    }

    /**
     * Called when the activity will start interacting with the user.
     * Reregister to receive restriction changed events
     *
     * @param multitasking		Flag indicating if multitasking is turned on for app
     */
    @Override
    public void onResume(boolean multitasking) {

    }

    /**
     * Called when the activity is becoming visible to the user.
     */
    @Override
    public void onStart() {
    }

    /**
     * Called when the activity is no longer visible to the user.
     */
    @Override
    public void onStop() {
    }

    /**
     * Called when the activity receives a new intent.
     */
    @Override
    public void onNewIntent(Intent intent) {
    }

    /**
     * The final call you receive before your activity is destroyed.
     */
    @Override
    public void onDestroy() {
    }


}
