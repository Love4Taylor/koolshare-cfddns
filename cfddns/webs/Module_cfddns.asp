<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta http-equiv="Pragma" content="no-cache" />
        <meta http-equiv="Expires" content="-1" />
        <link rel="shortcut icon" href="images/favicon.png" />
        <link rel="icon" href="images/favicon.png" />
        <title>Cloudflare DDNS</title>
        <link rel="stylesheet" type="text/css" href="index_style.css" />
        <link rel="stylesheet" type="text/css" href="form_style.css" />
        <link rel="stylesheet" type="text/css" href="usp_style.css" />
        <link rel="stylesheet" type="text/css" href="css/element.css" />
        <script type="text/javascript" src="/js/jquery.js"></script> 
        <script src="/state.js"></script> 
        <script src="/help.js"></script> 
    </head>
    <body>
        <div id="TopBanner"></div>
        <div id="Loading" class="popup_bg"></div>
        <table class="content" align="center" cellpadding="0" cellspacing="0">
            <tbody>
                <tr>
                    <td width="17">&nbsp;</td>
                    <td valign="top" width="202">
                        <div id="mainMenu"></div>
                        <div id="subMenu"></div>
                    </td>
                    <td valign="top">
                        <div id="tabMenu" class="submenuBlock"></div>
                        <!--=====Beginning of Main Content=====--> 
                        <table width="98%" border="0" align="left" cellpadding="0" cellspacing="0" style="display: block;">
                            <tbody>
                                <tr>
                                    <td align="left" valign="top">
                                        <div>
                                            <table width="760px" border="0" cellpadding="5" cellspacing="0" bordercolor="#6b8fa3" class="FormTitle" id="FormTitle">
                                                <tbody>
                                                    <tr>
                                                        <td bgcolor="#4D595D" colspan="3" valign="top">
                                                            <div>&nbsp;</div>
                                                            <div style="float:left;" class="formfonttitle" style="padding-top: 12px">Cloudflare DDNS - 设置</div>
                                                            <div style="float:right; width:15px; height:25px;margin-top:10px"><img id="return_btn" onclick="reload_Soft_Center();" align="right" style="cursor:pointer;position:absolute;margin-left:-30px;margin-top:-25px;" title="返回软件中心" src="/images/backprev.png" onMouseOver="this.src='/images/backprevclick.png'" onMouseOut="this.src='/images/backprev.png'"></img></div>
                                                            <div style="margin-left:5px;margin-top:10px;margin-bottom:10px"><img src="/images/New_ui/export/line_export.png"></div>
                                                            <div class="SimpleNote" id="head_illustrate"><i></i><em>Cloudflare DDNS</em> 是基于 Cloudflare API 实现的个人 DDNS 工具. <a href='https://github.com/Love4Taylor/koolshare-cfddns' target='_blank'><i>&nbsp;&nbsp;<u>点击查看插件详情</u></i></a></div>
                                                            <table style="margin:20px 0px 0px 0px;" width="100%" border="1" align="center" cellpadding="4" cellspacing="0" bordercolor="#6b8fa3" class="FormTable">
                                                                <thead>
                                                                    <tr>
                                                                        <td colspan="2">Cloudflare DDNS - 设置面板</td>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <tr id="switch_tr">
                                                                        <th>开启 Cloudflare DDNS</th>
                                                                        <td colspan="2">
                                                                            <div class="switch_field" style="display:table-cell;float: left;">
                                                                                <label for="switch">
                                                                                    <input id="switch" class="switch" type="checkbox" style="display: none;" /> 
                                                                                    <div class="switch_container">
                                                                                        <div class="switch_bar"></div>
                                                                                        <div class="switch_circle transition_style">
                                                                                            <div></div>
                                                                                        </div>
                                                                                    </div>
                                                                                </label>
                                                                            </div>
                                                                            <div id="cfddns_version_status" style="padding-top:5px;margin-left:230px;margin-top:0px;float:left;"><i>当前版本: 1.1.1</i>
                                                                            </div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="last_act_tr">
                                                                        <th>上次运行记录</th>
                                                                        <td> <% dbus_get_def("cfddns_last_act", "--"); %> </td>
                                                                    </tr>
                                                                    <tr id="key_tr">
                                                                        <th>API Key</th>
                                                                        <td> <input type="text" style="width: 70%" id="cfddns_key" value="<% dbus_get_def("cfddns_key", "example"); %>" class="input_ss_table"></td>
                                                                    </tr>
                                                                    <tr id="email_tr">
                                                                        <th>User Email</th>
                                                                        <td><input type="text" id="cfddns_email" value="<% dbus_get_def("cfddns_email", "example@love4taylor.dev"); %>" class="input_ss_table"></td>
                                                                    </tr>
																	<tr id="zone_tr">
                                                                        <th>Zone Name</th>
                                                                        <td><input type="text" id="cfddns_zone" value="<% dbus_get_def("cfddns_zone", "love4taylor.dev"); %>" class="input_ss_table"></td>
                                                                    </tr>
                                                                    <tr id="type_tr">
																		<th title="A 为 IPv4, AAAA 为 IPv6">域名记录类型(?)</th>
																		<td><input type="text" id="cfddns_type" value="<% dbus_get_def("cfddns_type", "A"); %>" class="input_ss_table"></td>
																	</tr>                                                                    
                                                                    <tr id="domain_tr">
																		<th title="@ 记录请填写裸域名, 如 love4taylor.dev 其余例如 www 填写 www.love4taylor.dev">域名 A 记录(?)</th>
																		<td><input type="text" id="cfddns_domain" value="<% dbus_get_def("cfddns_domain", "example.love4taylor.dev"); %>" class="input_ss_table"></td>
																	</tr>
                                                                    <tr id="curl_tr">
                                                                        <th title="可自行修改, 以获得正确的公网 IP. IPv4 推荐 curl -s ipv4.ip.sb , IPv6 推荐 curl -s ipv6.ip.sb">获得 IP 命令(?)</th>
                                                                        <td><textarea id="cfddns_curl" class="input_ss_table" style="width: 94%; height: 2.4em"><% dbus_get_def("cfddns_curl", "curl -s ipv4.ip.sb"); %></textarea></td>
                                                                    </tr>
                                                                    <tr id="ttl_tr">
                                                                        <th title="TTL 必须为 120 到 2147483647 之间的数值, 或者使用 1 代表自动">TTL(?)</th>
                                                                        <td><input id="cfddns_ttl" style="width: 4.5em" class="input_ss_table"value="<% dbus_get_def("cfddns_ttl", "1"); %>">s (1 or >=120)</td>
                                                                    </tr>
																	<tr id="interval_tr">
                                                                        <th>检查周期</th>
                                                                        <td><input type="text" style="width: 2.5em" id="cfddns_interval" value="<% dbus_get_def("cfddns_interval", "120"); %>" class="input_ss_table">s</td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                            <div class="apply_gen"> 
                                                                <input class="button_gen" type="button" value="提交" /> 
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <!--=====end of Main Content=====--> 
                    </td>
                </tr>
            </tbody>
        </table>
        <div id="footer"></div>
        <script>
            $(function () {
                show_menu(menu_hook);
                var enable = "<% dbus_get_def("cfddns_enable", "0"); %>";
                $('#switch').prop('checked', enable === "1");
                buildswitch();
                update_visibility();
                var posting = false;
            	var inputs = ['key', 'email', 'zone', 'type', 'domain', 'curl', 'ttl', 'interval'];
                $('.button_gen').click(function () {
                    if(posting) return;
                    posting = true; // save
            		var data = {
            			cfddns_enable: $('#switch').prop('checked') | 0,
            			action_mode: ' Refresh ',
            			current_page: 'Module_cfddns.asp',
            			next_page: 'Module_cfddns.asp',
            			SystemCmd: 'cfddns_config.sh'
            		};
            		for(var i = 0; i< inputs.length; i++) {
            			var key = 'cfddns_' + inputs[i];
            			data[key] = $('#'+key).val()
            		}
                    $.ajax({
                        type: 'POST',
                        url: 'applydb.cgi?p=cfddns_',
                        data: $.param(data)
                    }).then(function () {
                        posting = false;
                        alert('配置保存成功...');
                    }, function () {
                        posting = false;
                       alert('配置保存失败!'); 
                    })
                })
            })

            function menu_hook(title, tab) {
                tabtitle[tabtitle.length -1] = new Array("", "Cloudflare DDNS");
                tablink[tablink.length -1] = new Array("", "Module_cfddns.asp");
            }
            
            function reload_Soft_Center(){
                location.href = "/Main_Soft_center.asp";
            }
            
            function buildswitch(){
            	$("#switch").click(
            	function(){
            		update_visibility();
            	});
            }
            
            function update_visibility(){
                if (document.getElementById('switch').checked) {
                    document.getElementById("last_act_tr").style.display = "";
                    document.getElementById("key_tr").style.display = "";
                    document.getElementById("email_tr").style.display = "";
					document.getElementById("zone_tr").style.display = "";
                    document.getElementById("type_tr").style.display = "";
					document.getElementById("domain_tr").style.display = "";
                    document.getElementById("curl_tr").style.display = "";
                    document.getElementById("ttl_tr").style.display = "";
					document.getElementById("interval_tr").style.display = "";

                } else {
                    document.getElementById("last_act_tr").style.display = "none";
                    document.getElementById("key_tr").style.display = "none";
                    document.getElementById("email_tr").style.display = "none";
					document.getElementById("zone_tr").style.display = "none";
                    document.getElementById("type_tr").style.display = "none";
					document.getElementById("domain_tr").style.display = "none";
                    document.getElementById("curl_tr").style.display = "none";
                    document.getElementById("ttl_tr").style.display = "none";
					document.getElementById("interval_tr").style.display = "none";
                }
                      
            }
            
        </script>   
    </body>
</html>