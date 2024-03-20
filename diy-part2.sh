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

# Modify default IP
sed -i 's/192.168.1.1/192.168.0.253/g' package/base-files/files/bin/config_generate


sed -i 's/=1.21/=1.22/g' feeds/packages/lang/golang/golang/Makefile
sed -i 's/GO_VERSION_PATCH:=5/GO_VERSION_PATCH:=1/g' feeds/packages/lang/golang/golang/Makefile
sed -i 's/285cbbdf4b6e6e62ed58f370f3f6d8c30825d6e56c5853c66d3c23bcdb09db19/79c9b91d7f109515a25fc3ecdaad125d67e6bdb54f6d4d98580f46799caea321/g' feeds/packages/lang/golang/golang/Makefile

# Add CPU Temperature
# echo 'msgid "CPU Temperature"'>>feeds/luci/modules/luci-base/po/zh-cn/base.po
# echo 'msgid "CPU温度"'>>feeds/luci/modules/luci-base/po/zh-cn/base.po
# sed -i '/local cpu_usage/a\\n\t\tlocal cpu_temperature = luci.sys.exec("cat /sys/class/thermal/thermal_zone0/temp | awk '\''{print int(($0+50)/100)/10}'\''") .. "°C"' feeds/luci/modules/luci-mod-admin-full/luasrc/view/admin_status/index.htm
# sed -i '/userinfo    = user_info,/a\\t\t\tcputemp    = cpu_temperature,' feeds/luci/modules/luci-mod-admin-full/luasrc/view/admin_status/index.htm
# sed -i '/e.innerHTML = info.cpuusage;/a\\n\t\t\tif (e = document.getElementById('\''cputemp'\''))\n\t\t\t\te.innerHTML = info.cputemp;' feeds/luci/modules/luci-mod-admin-full/luasrc/view/admin_status/index.htm
# sed -i '/<tr><td width="33%"><%:CPU usage (%)%><\/td><td id="cpuusage">-<\/td><\/tr>/a\\t\t<tr><td width="33%"><%:CPU Temperature%><\/td><td id="cputemp">-<\/td><\/tr>' feeds/luci/modules/luci-mod-admin-full/luasrc/view/admin_status/index.htm
