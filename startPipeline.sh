#!/bin/bash

clear
echo Welcome to Your Jankins CI/CD Pipeline!
echo ---------------------------------------
echo
echo -n "Configure your environment dev/prod: "
read TESTENV
echo -Configuring environment...


if [[ "$TESTENV" == "dev" ]]; then
    CONFIGNUM=$(cat ./config/developmentEnv.txt)
fi

if [[ "$TESTENV" == "prod" ]]; then
    CONFIGNUM=$(cat ./config/productionEnv.txt)
fi


echo -Running code...
NUM=$CONFIGNUM node ./src/fizzBuzzFeature.js > answer.txt


echo -Running Tests...
ANSWER=$(cat ./answer.txt)
ANSWER=$ANSWER node ./tests/testSuite.js > testResults.txt


echo -Emailing results...
cp ./email/emailForm.txt ./email/emailResults.txt
cat ./testResults.txt >> ./email/emailResults.txt
#curl -s --url 'smtps://smtp.gmail.com:465' --ssl-reqd --mail-from 'EXAMPLE EMAIL --mail-rcpt 'EXAMPLE EMAIL' --upload-file ./email/emailResults.txt --user 'EMAIL:PASSWORD'


echo -Cleaning up...
rm ./answer.txt ./testResults.txt ./email/emailResults.txt