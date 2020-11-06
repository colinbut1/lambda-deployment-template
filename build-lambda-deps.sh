#!/bin/sh
LAMBDA_FILE=$1

apt-get update -y
apt-get install zip -y

python3 -m venv env
cd env/lib64/python3.8/site-packages/
. ../../../bin/activate
pip3 install -qr /workspace/requirements.txt
chmod -R 755 .; deactivate

echo 'Zipping up boto, snowflake dependencies'
zip -qr9 /workspace/${LAMBDA_FILE}.zip .

echo 'Cleaning up build workspace...'
rm -rf /workspace/env