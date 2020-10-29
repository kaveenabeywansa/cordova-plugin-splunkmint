package com.commontime.mdesign.plugins.action;

import com.commontime.mdesign.plugins.action.*;
import android.os.Handler;
import android.util.Log;
import com.splunk.mint.Mint;
import org.apache.cordova.CallbackContext;
import org.json.JSONArray;

public class TransactionStart implements SplunkMintAction {

    @Override
    public boolean action(JSONArray args, CallbackContext callbackContext) {
        try {
            String name = args.getString(0);
            Mint.transactionStart(name);
            callbackContext.success();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            Mint.logException(e);
            return true;
        }

    }
}