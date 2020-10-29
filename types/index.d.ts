export class Splunkmint {
  crash(): Promise<any>;
  enableLogCat(options: string): Promise<any>;
  logEvent(eventName: string, extraData: string): Promise<any>;
  logView(log: string): Promise<any>;
  transactionStart(name: string): Promise<any>;
  transactionStop(name: string): Promise<any>;
  transactionCancel(options: string): Promise<any>;
  enableDebugLog(): Promise<any>;
  flush(): Promise<any>;
  log(options: string): Promise<any>;
  setUserOptOut(options: string): Promise<any>;
  setUserIdentifier(userIdentifier: string): Promise<any>;
  setFlushOnlyOverWiFi(options: string): Promise<any>;
}
