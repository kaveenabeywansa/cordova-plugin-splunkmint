package com.commontime.mdesign.plugins.action;

import org.apache.cordova.CallbackContext;
import org.json.JSONArray;

public interface SplunkMintAction {
    boolean action(JSONArray args, CallbackContext callbackContext);
}