package com.commontime.mdesign.plugins.action;

import com.commontime.mdesign.plugins.action.*;
import com.splunk.mint.Mint;
import com.splunk.mint.MintLogLevel;
import org.apache.cordova.CallbackContext;
import org.json.JSONArray;
import org.json.JSONObject;
import java.util.HashMap;
import java.util.Iterator;

public class LogEvent implements SplunkMintAction {

    public static final String UNABLE_TO_LOG = "Unable to log.";

    @Override
    public boolean action(JSONArray args, CallbackContext callbackContext) {
        try {
            String eventName = (String) args.getString(0);
            String extraData = args.getString(1);
            JSONObject mintEventJsonObject = new JSONObject(extraData);
            HashMap<String, Object> mintExtraData = new HashMap<String, Object>();
            Iterator<?> keys = mintEventJsonObject.keys();
            while (keys.hasNext()) {
                String key = (String) keys.next();
                mintExtraData.put(key, (String) mintEventJsonObject.get(key));
            }
            Mint.logEvent(eventName, MintLogLevel.Error, mintExtraData);
            callbackContext.success();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            callbackContext.error(UNABLE_TO_LOG);
            Mint.logException(e);
            return true;
        }
    }
}