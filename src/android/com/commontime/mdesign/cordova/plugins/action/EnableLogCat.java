package com.commontime.mdesign.plugins.action;

import com.commontime.mdesign.plugins.action.*;
import android.os.Handler;
import android.util.Log;

import com.splunk.mint.Mint;
import org.apache.cordova.CallbackContext;
import org.json.JSONArray;
import org.json.JSONObject;

public class EnableLogCat implements SplunkMintAction {

    public static final String ENABLE = "enable";
    public static final String LINES = "lines";
    public static final String FILTER = "filter";

    @Override
    public boolean action(JSONArray args, CallbackContext callbackContext) {
        try {
            JSONObject jso = args.getJSONObject(0);
            boolean enable = jso.getBoolean(ENABLE);
            int loglines = jso.optInt(LINES, 0);
            String filter = jso.optString(FILTER, "");
            Mint.enableLogging(enable);
            if (loglines > 0)
                Mint.setLogging(loglines);
            if (!filter.isEmpty())
                Mint.setLogging(filter);
            callbackContext.success();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            Mint.logException(e);
            return true;
        }
    }
}