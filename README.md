# DailyReport
A command line application to send daily report 

# Usage

1. Write your daily report to a text file: "my_report.txt"
2. Configure `.Rprofile` such as:

```
options(
  from = "Your mail address",
  to = c("Your manager", "You"),
  subject = sprintf("Daily Report：%s", Sys.Date()),
  user.name = "Your acount of SMTP mail server",
  passwd = "Your password of SMTP mail server")
```

You can check <https://cran.r-project.org/web/packages/mailR/README.html> for details.

3. Execute `Rscript send_report.R my_report.txt` and double check your report content:

```
wushwude-MacBook-Air:DailyReport wush.wu$ Rscript send_report.R my_report.txt
body:

- I resolve issue 1
- I resolve issue 2

Do you want to send the daily report to wush.wu@generalmobi.com? (y/n) y
```
