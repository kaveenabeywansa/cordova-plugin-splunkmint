package com.commontime.mdesign.plugins.splunkmint;

import android.util.Log;

import com.splunk.mint.Mint;
import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaPlugin;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import java.util.Iterator;

import com.commontime.mdesign.plugins.splunkmint.*;
import com.commontime.mdesign.plugins.action.*;
import com.commontime.mdesign.plugins.factory.ActionFactory;

public class SplunkMint extends CordovaPlugin {

    public static final String TAG = "SplunkMint";

    @Override
    protected void pluginInitialize() {
        String api_key = preferences.getString("splunk_android_api_key", "");
        String extra_data = preferences.getString("splunk_extra_data", "");
        initSplunk(api_key, extra_data);
    }

    private void initSplunk(String api_key, String extra_data) {
        if (api_key != null && !api_key.isEmpty()) {
            try {
                Mint.disableNetworkMonitoring();
                Mint.initAndStartSession(cordova.getActivity().getApplication(), api_key);
                if (extra_data != null && !extra_data.isEmpty()) {
                    JSONObject jso = new JSONObject(extra_data);
                    Iterator<String> keyIter = jso.keys();
                    while (keyIter.hasNext()) {
                        String key = keyIter.next();
                        String val = jso.getString(key);
                        Mint.addExtraData(key, val);
                    }
                }
            } catch (IllegalArgumentException e) {
                Log.e(TAG, e.getMessage());
                e.printStackTrace();
                Mint.logException(e);
            } catch (JSONException e) {
                Log.e(TAG, e.getMessage());
                e.printStackTrace();
                Mint.logException(e);
            }
        }
    }

    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {
        SplunkMintAction splunkMintAction = ActionFactory.getAction(action);
        return splunkMintAction.action(args, callbackContext);

    }
}
