package com.commontime.mdesign.plugins.action;

import com.commontime.mdesign.plugins.action.*;
import com.splunk.mint.Mint;
import org.apache.cordova.CallbackContext;
import org.json.JSONArray;

public class EnableDebugLog implements SplunkMintAction {

    @Override
    public boolean action(JSONArray args, CallbackContext callbackContext) {
        Mint.enableDebugLog();
        callbackContext.success();
        return true;
    }
}