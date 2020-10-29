package com.commontime.mdesign.plugins.action;

import com.commontime.mdesign.plugins.action.*;
import android.os.Handler;
import android.util.Log;
import com.splunk.mint.Mint;
import org.apache.cordova.CallbackContext;
import org.json.JSONArray;
import org.json.JSONObject;

public class SetFlushOnlyOverWiFi implements SplunkMintAction {

    public static final String ENABLE = "enable";

    @Override
    public boolean action(JSONArray args, CallbackContext callbackContext) {
        try {
            JSONObject jso = args.getJSONObject(0);
            boolean enable = jso.getBoolean(ENABLE);
            Mint.setFlushOnlyOverWiFi(enable);
            callbackContext.success();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            Mint.logException(e);
            return true;
        }
    }
}