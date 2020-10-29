package com.commontime.mdesign.plugins.action;

import com.commontime.mdesign.plugins.action.*;
import com.splunk.mint.Mint;
import org.apache.cordova.CallbackContext;
import org.json.JSONArray;

public class TransactionStop implements SplunkMintAction {

    @Override
    public boolean action(JSONArray args, CallbackContext callbackContext) {
        try {
            String name = args.getString(0);
            Mint.transactionStop(name);
            callbackContext.success();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            Mint.logException(e);
            return true;
        }

    }
}