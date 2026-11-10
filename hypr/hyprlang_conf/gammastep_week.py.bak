#!/usr/bin/env python
import datetime
import os

#######################
### 0 = Monday      ###
### 1 = Tuesday     ###
### 2 = Wednesday   ###
### 3 = Thursday    ###
### 4 = Friday      ###
### 5 = Saturday    ###
### 6 = Sunday      ###
#######################

#   --> bW[0,0,0,0,1,1,0] <--
# bW[1] == 0 -> Default on Tuesday
# bW[5] == 1 -> Saturday on config1
# sets different custom file

defaultConf = 'gammastep'
config1 = 'gammastep -c /home/salem/.config/hypr/gammas_conf1.ini'
booleanWeek=[0,0,0,0,1,1,0]
now = datetime.datetime.today().weekday()
if booleanWeek[now] == 0:
    os.system(defaultConf+' & disown')
elif booleanWeek[now] == 1:
    os.system(config1)
else:
    os.system(defaultConf)
