# Splunk Mint Plugin

The Splunk Mint plugin provides a way of integrating Splunk Mint crash reporting into a Cordova app. There are two ways of configuring and starting it: via the `config.xml` file, in which case Splunk Mint is started as soon as the plugin loads; and via a call to `plugins.splunkmint.start`, in which case, Splunk Mint won't be started until this call completes.

This is a modification of the opensource splunk mint plugin available here: https://github.com/commontime/com.commontime.cordova.splunk-mint. The modifications done allow logging js exceptions and application errors in the js code to splunk mint as event logs.

The documentation for the splunk mint plugin is available here : https://wiki.gtnexus.info/pages/viewpage.action?pageId=112460052

