package com.commontime.mdesign.plugins.action;

import com.commontime.mdesign.plugins.action.*;
import com.splunk.mint.Mint;
import org.apache.cordova.CallbackContext;
import org.json.JSONArray;

public class LogView implements SplunkMintAction {

    @Override
    public boolean action(JSONArray args, CallbackContext callbackContext) {
        try {
            String log = args.getString(0);
            Mint.logView(log);
            callbackContext.success();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            Mint.logException(e);
            return true;
        }

    }
}