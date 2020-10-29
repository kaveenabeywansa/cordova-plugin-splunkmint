package com.commontime.mdesign.plugins.action;

import com.commontime.mdesign.plugins.action.*;
import android.os.Handler;
import android.util.Log;
import com.splunk.mint.Mint;
import org.apache.cordova.CallbackContext;
import org.json.JSONArray;
import org.json.JSONObject;

public class TransactionCancel implements SplunkMintAction {

    public static final String NAME = "name";
    public static final String REASON = "reason";

    @Override
    public boolean action(JSONArray args, CallbackContext callbackContext) {
        try {
            JSONObject jso = args.getJSONObject(0);
            String name = jso.getString(NAME);
            String reason = jso.getString(REASON);
            Mint.transactionCancel(name, reason);
            callbackContext.success();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            Mint.logException(e);
            return true;
        }

    }
}