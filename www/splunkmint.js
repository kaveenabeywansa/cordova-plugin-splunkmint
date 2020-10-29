
module.exports = {

  crash : function() {
    return new Promise((resolve,reject) => {
      cordova.exec(resolve,reject,'SplunkMint','crash',[]);
    })
  },
  enableLogCat : function(options){
    return new Promise((resolve,reject) => {
      cordova.exec(resolve,reject,'SplunkMint','enableLogCat',[options]);
    })
  },
  logEvent : function(eventName, extraData){
    return new Promise((resolve,reject) => {
      cordova.exec(resolve,reject,'SplunkMint','logEvent',[eventName, extraData]);
    })
  },
  logView : function(log){
    return new Promise((resolve,reject) => {
      cordova.exec(resolve,reject,'SplunkMint','logView',[log]);
    })
  },
  transactionStart : function(name){
    return new Promise((resolve,reject) => {
      cordova.exec(resolve,reject,'SplunkMint','transactionStart',[name]);
    })
  },
  transactionStop : function(name){
    return new Promise((resolve,reject) => {
      cordova.exec(resolve,reject,'SplunkMint','transactionStop',[name]);
    })
  },
  transactionCancel : function(options){
    return new Promise((resolve,reject) => {
      cordova.exec(resolve,reject,'SplunkMint','transactionCancel',[options]);
    })
  },
  enableDebugLog : function(){
    return new Promise((resolve,reject) => {
      cordova.exec(resolve,reject,'SplunkMint','enableDebugLog',[]);
    })
  },
  flush : function(){
    return new Promise((resolve,reject) => {
      cordova.exec(resolve,reject,'SplunkMint','flush',[]);
    })
  },
  log : function(options){
    return new Promise((resolve,reject) => {
      cordova.exec(resolve,reject,'SplunkMint','log',[options]);
    })
  },
  setUserOptOut : function(options){
    return new Promise((resolve,reject) => {
      cordova.exec(resolve,reject,'SplunkMint','setUserOptOut',[options]);
    })
  },
  setUserIdentifier : function(userIdentifier){
    return new Promise((resolve,reject) => {
      cordova.exec(resolve,reject,'SplunkMint','setUserIdentifier',[userIdentifier]);
    })
  },
  setFlushOnlyOverWiFi : function(options){
    return new Promise((resolve,reject) => {
      cordova.exec(resolve,reject,'SplunkMint','setFlushOnlyOverWiFi',[options]);
    })
  }
}
