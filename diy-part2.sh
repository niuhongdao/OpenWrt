#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
sed -i 's/192.168.1.1/192.168.0.254/g' package/base-files/files/bin/config_generate     #更换初始IP

echo  >> feeds/small8/luci-app-passwall2/po/zh-cn/passwall2.po
echo 'msgid "Manually update"' >> feeds/small8/luci-app-passwall2/po/zh-cn/passwall2.po
echo 'msgstr "手动更新"' >> feeds/small8/luci-app-passwall2/po/zh-cn/passwall2.po
echo  >> feeds/small8/luci-app-passwall2/po/zh-cn/passwall2.po

# add v2ray suport
sed -i "/document.getElementsByName('cbid.shadowsocksr.' + sid + '.server_port')\[0\].value = ssm.port;/a\ \t\t\tdocument.getElementsByName('cbid.shadowsocksr.' + sid + '.alter_id')\[0\].value = ssm.aid; " feeds/small8/luci-app-ssr-plus/luasrc/view/shadowsocksr/ssrurl.htm
line=`sed -n '/if info.aid and (tonumber(info.aid) > 0) then/=' feeds/small8/luci-app-ssr-plus/root/usr/share/shadowsocksr/subscribe.lua `
sed -i "${line},$((${line}+2))d" feeds/small8/luci-app-ssr-plus/root/usr/share/shadowsocksr/subscribe.lua
sed -i "/result.v2ray_protocol = 'vmess'/a\ \t\tresult.alter_id = info.aid" feeds/small8/luci-app-ssr-plus/root/usr/share/shadowsocksr/subscribe.lua
sed -i '/-- VmessId/i -- AlterId\no = s:option(Value, "alter_id", translate("AlterId"))\no.datatype = "port"\no.default = 16\no.rmempty = true\no:depends({type = "v2ray", v2ray_protocol = "vmess"})' feeds/small8/luci-app-ssr-plus/luasrc/model/cbi/shadowsocksr/client-config.lua
sed -i '/id = server.vmess_id,/a\ \t\t\t\t\t\talterId = (server.v2ray_protocol == "vmess" or not server.v2ray_protocol) and tonumber(server.alter_id) or nil,' feeds/small8/luci-app-ssr-plus/root/usr/share/shadowsocksr/gen_config.lua

# Add CPU Temperature
echo 'msgid "CPU Temperature"'>>feeds/luci/modules/luci-base/po/zh-cn/base.po
echo 'msgid "CPU温度"'>>feeds/luci/modules/luci-base/po/zh-cn/base.po
sed -i '/local cpu_usage/a\\n\t\tlocal cpu_temperature = luci.sys.exec("cat /sys/class/thermal/thermal_zone0/temp | awk '\''{print int(($0+50)/100)/10}'\''") .. "°C"' feeds/luci/modules/luci-mod-admin-full/luasrc/view/admin_status/index.htm
sed -i '/userinfo    = user_info,/a\\t\t\tcputemp    = cpu_temperature,' feeds/luci/modules/luci-mod-admin-full/luasrc/view/admin_status/index.htm
sed -i '/e.innerHTML = info.cpuusage;/a\\n\t\t\tif (e = document.getElementById('\''cputemp'\''))\n\t\t\t\te.innerHTML = info.cputemp;' feeds/luci/modules/luci-mod-admin-full/luasrc/view/admin_status/index.htm
sed -i '/<tr><td width="33%"><%:CPU usage (%)%><\/td><td id="cpuusage">-<\/td><\/tr>/a\\t\t<tr><td width="33%"><%:CPU Temperature%><\/td><td id="cputemp">-<\/td><\/tr>' feeds/luci/modules/luci-mod-admin-full/luasrc/view/admin_status/index.htm
