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
# mkdir -p package/helloworld && git clone https://github.com/fw876/helloworld package/helloworld
# mkdir -p package/AdGuardHome && git clone https://github.com/xiaoxiao29/luci-app-adguardhome package/AdGuardHome
mkdir -p package/openwrt-passwall && git clone https://github.com/xiaorouji/openwrt-passwall package/openwrt-passwall
# mkdir -p package/openwrt-passwall/luci-app-passwall && git clone https://github.com/xiaorouji/openwrt-passwall -b luci package/openwrt-passwall/luci-app-passwal
mkdir -p package/openwrt-passwall/luci-app-passwall2 && git clone https://github.com/xiaorouji/openwrt-passwall2 package/openwrt-passwall/luci-app-passwall2

# add v2ray suport
# sed -i "/document.getElementsByName('cbid.shadowsocksr.' + sid + '.server_port')\[0\].value = ssm.port;/a\ \t\t\tdocument.getElementsByName('cbid.shadowsocksr.' + sid + '.alter_id')\[0\].value = ssm.aid; " package/helloworld/luci-app-ssr-plus/luasrc/view/shadowsocksr/ssrurl.htm
# line=`sed -n '/if info.aid and (tonumber(info.aid) > 0) then/=' package/helloworld/luci-app-ssr-plus/root/usr/share/shadowsocksr/subscribe.lua `
# sed -i "${line},$((${line}+2))d" package/helloworld/luci-app-ssr-plus/root/usr/share/shadowsocksr/subscribe.lua
# sed -i "/result.v2ray_protocol = 'vmess'/a\ \t\tresult.alter_id = info.aid" package/helloworld/luci-app-ssr-plus/root/usr/share/subscribe.lua
# sed -i '/-- VmessId/i -- AlterId\no = s:option(Value, "alter_id", translate("AlterId"))\no.datatype = "port"\no.default = 16\no.rmempty = true\no:depends({type = "v2ray", v2ray_protocol = "vmess"})' package/helloworld/luci-app-ssr-plus/luasrc/model/cbi/shadowsocksr/client-config.lua
# sed -i '/id = server.vmess_id,/a\ \t\t\t\t\t\talterId = (server.v2ray_protocol == "vmess" or not server.v2ray_protocol) and tonumber(server.alter_id) or nil,' package/helloworld/luci-app-ssr-plus/root/usr/share/shadowsocksr/gen_config.lua
