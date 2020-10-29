package com.commontime.mdesign.plugins.factory;

import java.util.Map;
import java.util.HashMap;

import com.commontime.mdesign.plugins.splunkmint.*;
import com.commontime.mdesign.plugins.action.*;

public class ActionFactory {

    public static final String CRASH = "crash";
    public static final String ENABLE_LOG_CAT = "enableLogCat";
    public static final String LOG_EVENT = "logEvent";
    public static final String ENABLE_DEBUG_LOG = "enableDebugLog";
    public static final String TRANSACTION_CANCEL = "transactionCancel";
    public static final String TRANSACTION_STOP = "transactionStop";
    public static final String TRANSACTION_START = "transactionStart";
    public static final String LOG_VIEW = "logView";
    public static final String FLUSH = "flush";
    public static final String SET_USER_OPT_OUT = "setUserOptOut";
    public static final String SET_USER_IDENTIFIER = "setUserIdentifier";
    public static final String SET_FLUSH_ONLY_OVER_WIFI = "setFlushOnlyOverWiFi";

    static Map<String, SplunkMintAction> actionMap = new HashMap<>();
    static {
        actionMap.put(CRASH, new Crash());
        actionMap.put(ENABLE_LOG_CAT, new EnableLogCat());
        actionMap.put(LOG_EVENT, new LogEvent());
        actionMap.put(ENABLE_DEBUG_LOG, new EnableDebugLog());
        actionMap.put(TRANSACTION_CANCEL, new TransactionCancel());
        actionMap.put(TRANSACTION_STOP, new TransactionStop());
        actionMap.put(TRANSACTION_START, new TransactionStart());
        actionMap.put(LOG_VIEW, new LogView());
        actionMap.put(FLUSH, new Flush());
        actionMap.put(SET_USER_OPT_OUT, new SetUserOptOut());
        actionMap.put(SET_USER_IDENTIFIER, new SetUserIdentifier());
        actionMap.put(SET_FLUSH_ONLY_OVER_WIFI, new SetFlushOnlyOverWiFi());
    }

    public static SplunkMintAction getAction(String action) {
        return actionMap.get(action);
    }
}
