#!/bin/bash
TMP=$(mktemp)
FROM_EMAIL_ADDRESS="support@ххх.ru"
TO_EMAIL_ADDRESS=$1
EMAIL_SUBJECT="Текст"
SMTP="relay.ххх.ru:587"
FRIENDLY_NAME="support@ххх.ru"
EMAIL_ACCOUNT_PASSWORD="*****"

cat > $TMP << EOF
EOF

cat $TMP | \
        echo "${EMAIL_SUBJECT}"| iconv -t UTF-8 | s-nail -v \
        -s "Текст" \
        -S smtp-auth=login \
	-S smtp-use-starttls \
        -S smtp=${SMTP} \
        -S from="${FROM_EMAIL_ADDRESS}(${FRIENDLY_NAME})" \
        -S smtp-auth-user=maksimov@ххх.ru \
        -S smtp-auth-password=$EMAIL_ACCOUNT_PASSWORD \
	-S ssl-verify=ignore \
	-c support@ххх.ru \
        $TO_EMAIL_ADDRESS

[ -e $TMP ] && rm $TMP

