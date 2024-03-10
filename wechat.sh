#!/bin/bash

# wechat-beta only support xcb
BWRAP_ENV_APPEND="--setenv QT_QPA_PLATFORM xcb "

if [ -z ${QT_IM_MODULE} ]; then
	BWRAP_ENV_APPEND="${BWRAP_ENV_APPEND} --setenv QT_IM_MODULE fcitx"
fi

#if [ -z ${QT_SCALE_FACTOR} ]; then
#	BWRAP_ENV_APPEND="${BWRAP_ENV_APPEND} --setenv QT_SCALE_FACTOR 1.5"
#fi

if [ -z ${GTK_USE_PORTAL} ]; then
	BWRAP_ENV_APPEND="${BWRAP_ENV_APPEND} --setenv GTK_USE_PORTAL 1"
fi

if [ ! -d "${HOME}/Documents/WeChat_Data" ]; then
	mkdir -p ${HOME}/Documents/WeChat_Data
fi

exec bwrap \
	--dev-bind / / \
	--bind ${HOME}/Documents/WeChat_Data ${HOME} \
	--ro-bind /usr/share/wechat-kylin/lsb-release /etc/lsb-release \
	--ro-bind /usr/share/wechat-kylin/.kyact /etc/.kyact \
	--ro-bind /usr/share/wechat-kylin/LICENSE /etc/LICENSE \
	--ro-bind-try /usr/lib/snapd-xdg-open/xdg-open /usr/bin/xdg-open \
	${BWRAP_ENV_APPEND} \
	/opt/wechat-beta/wechat $@
