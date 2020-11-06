#!/bin/bash
LAMBDA_FILE=$1
LAMBDA_FUNCTION_NAME=$2

rm -f ${LAMBDA_FILE}.zip
docker build -t lambda-deps-build .
docker run --rm --name lambda-deps-build -v $(pwd):/workspace lambda-deps-build /bin/sh build-lambda-deps.sh ${LAMBDA_FILE}
docker rmi lambda-deps-build:latest
zip -g ${LAMBDA_FILE}.zip ${LAMBDA_FUNCTION_NAME}.py