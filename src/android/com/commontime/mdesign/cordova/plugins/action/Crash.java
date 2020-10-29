package com.commontime.mdesign.plugins.action;

import com.commontime.mdesign.plugins.action.*;
import android.os.Handler;
import org.apache.cordova.CallbackContext;
import org.json.JSONArray;

public class Crash implements SplunkMintAction {

    @Override
    public boolean action(JSONArray args, CallbackContext callbackContext) {
        Handler handler = new Handler();
        handler.post(new Runnable() {
            @Override
            public void run() {
                run();
            }
        });
        return true;
    }
}