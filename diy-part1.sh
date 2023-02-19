#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
# sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default
mkdir -p pakage/helloworld && git clone https://github.com/fw876/helloworld package/helloworld
#mkdir -p pakage/openwrt-passwall && git clone https://github.com/xiaorouji/openwrt-passwall package/openwrt-passwall
#mkdir -p pakage/openwrt-passwall/luci-app-passwall && git clone https://github.com/xiaorouji/openwrt-passwall -b luci package/openwrt-passwall/luci-app-passwall

