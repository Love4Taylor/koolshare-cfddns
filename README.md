# koolshare-cfddns

### 注意

1. API Key: CF 网站中 My Profile 里的 Global API Key.
2. 不需要知道 Zone ID 和 Domain ID, 只需要填写域名即可.
3. 域名 A/AAAA 记录: XXX.com 或者 YYY.XXX.com, 不能是 @.XXX.com.
4. TTL 必须大于等于 120 (秒); 或者填写 1, 表示自动.
   
### Change logs
   
1.1.1: 支持 IPv6 的 AAAA 记录.  
1.1.0: 支持 koolshare 的 X7.9.1 版本梅林, 使用 Cron 定时运行; 修复 CF API 使用中 TTL 值格式错误; 其他优化.  
1.0: 第一版.
