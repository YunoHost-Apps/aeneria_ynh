# æneria for YunoHost

[![Integration level](https://dash.yunohost.org/integration/aeneria.svg)](https://dash.yunohost.org/appci/app/aeneria) ![](https://ci-apps.yunohost.org/ci/badges/aeneria.status.svg) ![](https://ci-apps.yunohost.org/ci/badges/aeneria.maintain.svg)
[![Install æneria with YunoHost](https://install-app.yunohost.org/install-with-yunohost.png)](https://install-app.yunohost.org/?app=aeneria)


**DO NOT USE, WORK IN PROGRESS**

> *This package allows you to install æeneria quickly and simply on a YunoHost server.
If you don't have YunoHost, please consult [the guide](https://yunohost.org/#/install) to learn how to install it.*

## Overview
The idea of [æneria](https://gitlab.com/aeneria/aeneria-app) is to display electricity consumption and weather data on a little dashboard that allow the user to:

 * Better understand his electricity consumption
 * Analyse his electricity consumption throw weather data

 **Shipped version:** 1.0.3

## Screenshots

![æneria startup screen](https://gitlab.com/aeneria/aeneria-app/-/raw/master/docs/img/dash_accueil.png)

## Configuration

First of all:

* You'll need a Linky (obviously) and a [Enedis account](https://mon-compte-client.enedis.fr/)

Then, go parameter page to follow instructions.

That's it, now wait a bit to see data appear !

## Documentation

More information can be found on [æneria documentation](https://docs.aeneria.com).

## Comming from Pilea

æneria is the new name Pilea. This new name came whith a brand new version.

This new version instroduce some breaking changes in data structure : migration from Pilea can't be done automaticly. But don't worry, if you want to migrate from Pilea, and
keep all of your data, follow [this documentation]().

## YunoHost specific features

* Integrate with YunoHost users and SSO
* Allow one user to be the administrator (set at the installation)
* Allow multiple instances of this application

#### Supported architectures

* x86-64 - [![Build Status](https://ci-apps.yunohost.org/ci/logs/aeneria%20%28Apps%29.svg)](https://ci-apps.yunohost.org/ci/apps/aeneria/)
* ARMv8-A - [![Build Status](https://ci-apps-arm.yunohost.org/ci/logs/aeneria%20%28Apps%29.svg)](https://ci-apps-arm.yunohost.org/ci/apps/aeneria/)

## Links

 * æneria repo: https://gitlab.com/aeneria/aeneria-app
 * YunoHost website: https://yunohost.org/

---

Developer info
----------------

Please send your pull request to the [testing branch](https://github.com/YunoHost-Apps/aeneria_ynh/tree/testing).

To try the testing branch, please proceed like that.
```
sudo yunohost app install https://github.com/YunoHost-Apps/aeneria_ynh/tree/testing --debug
or
sudo yunohost app upgrade aeneria -u https://github.com/YunoHost-Apps/aeneria_ynh/tree/testing --debug
```
