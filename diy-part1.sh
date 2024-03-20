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

# git clone --depth=1 https://github.com/fw876/helloworld package/helloworld
# git clone --depth=1 https://github.com/xiaoxiao29/luci-app-adguardhome package/AdGuardHome
# git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall-packages package/openwrt-passwall
# git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall2 package/luci-app-passwall2
# git clone --depth=1 https://github.com/vernesong/OpenClash package/openclash

# sed -i '22,32d' package/openwrt-passwall/gn/Makefile
rm -rf package/openwrt-passwall/gn/patches
# sed -i '22,32d' package/openwrt-passwall/naiveproxy/Makefile
