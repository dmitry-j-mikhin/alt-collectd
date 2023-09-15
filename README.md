# alt-collectd

This repository is used to build `collectd-5.12.0-alt1.x86_64.rpm` with additional Python and Curl_json plugins.
Plugins are built as separate rpm packages.

Assembly steps:
```Shell
./build.sh
```
As a result, an `out` folder with build artifacts is created.
Compiled rpm packages are also located here - [https://github.com/dmitry-j-mikhin/alt-collectd/releases/tag/v1.0](https://github.com/dmitry-j-mikhin/alt-collectd/releases/tag/v1.0).
