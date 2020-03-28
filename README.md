# SmarTvitcher
SmartTV [Twitch](https://www.twitch.tv/) client.

# Build
```
git clone git@github.com:comrat/smartvitcher.git
cd smartvitcher
git submodule init
git submodule update
```

# Install

### LG WebOS
Prepare your LG WebOS TV first (see this [guide](http://webostv.developer.lge.com/develop/app-test/) for more details).

```
./smart-tv-deployer/build -p webos -t <YOUR_TV_NAME>
```

### LG NetCast
Run the script:
```
./smart-tv-deployer/build.py -p netcast
```
After deploying all files will be archived in zip file in ```build.netcast/smartvitcher_<version>.zip``` where

* ```version``` - app version from the manifest or ```1.0.0``` if it wasn't defined

Follow this steps to install your app zip file on your TV:
* subscribe app zip file on [corresponded LG site](http://developer.lge.com/apptest/retrieveApptestOSList.dev)
* download subscribed archive and unzip it on USB storage in special directory (you should create it first) ```./lgapps/installed/```
* stick USB storage in your Smart TV and open "My Apps" there and find your app in USB part, for more details see [this guide](http://webostv.developer.lge.com/download_file/view_inline/3513/)

### Samsung Tizen
To deploy tuzen projects you need [Tizen Studio](https://developer.tizen.org/ko/development/tizen-studio/download?langredirect=1) to install.
Then you must generate certificate or add existed with [tizen certificate manager](https://developer.tizen.org/ko/development/visual-studio-tools-tizen/tools/certificate-manager?langredirect=1).
After that configure path to tizen-studio profiles:

```tizen cli-config -g profiles.path='/home/username/tizen-workspace/.metadata/.plugins/org.tizen.common.sign/profiles.xml'```


To deploy your app on TV you need to connect to it first via [sdb](https://developer.tizen.org/ko/development/tizen-studio/web-tools/running-and-testing-your-app/sdb?langredirect=1). For example if your TV IP address is ```192.168.1.1``` the considered command will be ```sdb connect 192.168.1.1:26101```

Now you must figure out your TV name. You can get it from available devices list via command:```sdb devices```

Then you need to add an security profile:
```
tizen security-profiles add -n MyProfile -a /home/username/tizen-studio-data/keystore/author/mycert.p12 -p 1234"
```

There ```1234``` is your certificate password"
If you've done all this steps correctly you can now pass in ```--tizen-profile``` or ```-tp``` flag your profile name: ```MyProfile``` in our example

Finally we can build our project:

```
./smart-tv-deployer/build.py -p tizen --tizen-profile <PROFILE> --tv <TV_NAME> -s resolutionWidth 1920 -s resolutionHeight 1080
```
Where
* ```PROFILE``` - is profile name like ```MyProfile``` in example below
* ```TV_NAME``` - TV name from ```sdb devices```

### Samsung Orsay
Run the script:
```
./smart-tv-deployer/build.py -p orsay
```
After deploying all files will be archived in zip file in ```smartvitcher__<version>.zip``` where

* ```version``` - app version from the manifest or ```1.0.0``` if it wasn't defined

To run the app on your SmartTV just unzip archive in USB storage and stick it in your TV and open your app in 'My Apps'
