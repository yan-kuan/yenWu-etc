# These cmd equivalent to editing ~/.gitconfig

# username
git config --global user.name yenWu
git config --global user.email yenwu.tw@gmail.com

# color
git config --global color.ui true

# merge
git config --global merge.tool vimdiff

# sendmail
git config --global sendemail.smtpserver smtp.gmail.com
git config --global sendemail.smtpencryption tls
git config --global sendemail.smtpserverport 587
git config --global sendemail.smtpuser yenwu.tw@gmail.com

# alias
git config --global alias.lg "log --color --graph --all --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgree    n(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --"
