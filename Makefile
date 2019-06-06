#export THEOS=/var/theos
#export THEOS_DEVICE_IP=192.168.0.20 THEOS_DEVICE_PORT=22

#FINALPACKAGE=1
USB=1

ifeq ($(USB),1)
	export THEOS_DEVICE_IP=localhost
	export THEOS_DEVICE_PORT=2222
endif


include $(THEOS)/makefiles/common.mk

SUBPROJECTS += Tweak Prefs

include $(THEOS_MAKE_PATH)/aggregate.mk

after-install::
ifeq ($(RESPRING),1)
	# install.exec "killall SpringBoard"
endif
	/Applications/OSDisplay.app/Contents/MacOS/OSDisplay -m 'Install success' -i 'tick' -d '1'