#!/bin/bash

clear
echo Welcome to Your Jankins CI/CD Pipeline!
echo ---------------------------------------
echo


echo --Configuring environment...
CONFIGNUM=$(cat ./config/developmentEnv.txt)

echo
echo --Running code...
NUM=$CONFIGNUM node ./src/fizzBuzzFeature.js > answer.txt

echo
echo --Running Tests...
ANSWER=$(cat ./answer.txt)
ANSWER=$ANSWER node ./tests/testSuite.js > testResults.txt

echo
echo --Emailing results...
cp ./email/emailForm.txt ./email/emailResults.txt
cat ./testResults.txt >> ./email/emailResults.txt
#curl -s --url 'smtps://smtp.gmail.com:465' --ssl-reqd --mail-from 'EXAMPLE EMAIL --mail-rcpt 'EXAMPLE EMAIL' --upload-file ./email/emailResults.txt --user 'EMAIL:PASSWORD'

echo
echo --Cleaning up...
rm ./answer.txt ./testResults.txt ./email/emailResults.txt
echo