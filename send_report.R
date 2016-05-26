argv <- commandArgs(TRUE)
library(mailR)

params <- new.env()
check_param <- function(key) {
  if (is.null(getOption(key))) {
    params[[key]] <- readline(sprintf("Please enter the value of %s: ", key))
  } else {
    params[[key]] <- getOption(key)
  }
}

check_param("from")
check_param("to")
check_param("subject")
check_param("user.name")
check_param("passwd")

body <- paste(readLines(argv[1], n = -1), collapse = "\n")
cat("body:\n")
cat(body)
cat("\n\n")
cat(sprintf("Do you want to send the daily report to %s? (y/n) ", params$to))
yesno <- tolower(readLines("stdin", n = 1))
cat("\n")
while(!(yesno[1] %in% c("y", "n"))) {
  cat(sprintf("Do you want to send the daily report to %s? (y/n) ", params$to))
  yesno <- tolower(readLines("stdin", n = 1))
  cat("\n")
}
switch(yesno,
       "y" = {
         email <- send.mail(from = params$from,
                            to = params$to,
                            subject = params$subject,
                            body = body,
                            encoding = "utf-8",
                            smtp = list(host.name = "smtp.gmail.com", port = 465, user.name = params$user.name, passwd = params$passwd, ssl = T),
                            authenticate = TRUE,
                            send = TRUE)
       },
       "n" = quit('no'),
       stop("logic error"))
