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

git clone --depth=1 https://github.com/xiaoxiao29/luci-app-adguardhome package/AdGuardHome
# git clone --depth=1 -b main https://github.com/fw876/helloworld package/luci-app-ssr-plus
git clone --depth=1 https://github.com/niuhongdao/openwrt-passwall2-packages package/openwrt-passwall
git clone --depth=1 https://github.com/niuhongdao/openwrt-passwall2 package/luci-app-passwall2

# echo  >> package/openwrt-passwall/luci-app-passwall2/luci-app-passwall2/po/zh-cn/passwall2.po
# echo 'msgid "Manually update"' >> package/openwrt-passwall/luci-app-passwall2/luci-app-passwall2/po/zh-cn/passwall2.po
# echo 'msgstr "手动更新"' >> package/openwrt-passwall/luci-app-passwall2/luci-app-passwall2/po/zh-cn/passwall2.po
# echo  >> package/openwrt-passwall/luci-app-passwall2/luci-app-passwall2/po/zh-cn/passwall2.po
