# weewx-docker

Yet another docker container for weewx.  This one is mine and uses micromamba / pip to build a python environment which runs weewx.  Designed to be as simple as possible.  

## Note about logging in docker, weewx needs a config change.  

Copy the config [here](https://github.com/weewx/weewx/wiki/WeeWX-v4-and-logging) over to the weewx.conf.  And then change

```yaml
# Root logger
    [[root]]
      level = {log_level}
      handlers = syslog,
```
the ```syslog``` to ```console```.  Now it'll behave.  
