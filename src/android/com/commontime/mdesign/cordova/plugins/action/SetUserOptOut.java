package com.commontime.mdesign.plugins.action;

import com.commontime.mdesign.plugins.action.*;
import com.splunk.mint.Mint;
import org.apache.cordova.CallbackContext;
import org.json.JSONArray;
import org.json.JSONObject;

public class SetUserOptOut implements SplunkMintAction {

    public static final String ENABLE = "enable";

    @Override
    public boolean action(JSONArray args, CallbackContext callbackContext) {
        try {
            JSONObject jso = args.getJSONObject(0);
            boolean enable = jso.getBoolean(ENABLE);
            Mint.setUserOptOut(enable);
            callbackContext.success();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            Mint.logException(e);
            return true;
        }

    }
}