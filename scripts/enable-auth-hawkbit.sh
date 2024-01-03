#!/bin/bash

# Step 1: Enable Target Token Authentication
echo "Step 1: Enable Target Token Authentication"
curl -i -X PUT 'http://localhost:8080/rest/v1/system/configs/authentication.targettoken.enabled/' \
-u 'admin:admin' \
-H 'Content-Type: application/json' \
-d '{"value": true}'
echo "--------------------------------------------------"



echo "PART 4 - Step 1.1: Enable Gateway Token Authentication (Mgmt API)"
echo "---------------------------------------------------"
curl -i -X PUT http://localhost:8080/rest/v1/system/configs/authentication.gatewaytoken.enabled/ \
-u 'admin:admin' \
-H 'Content-Type: application/json' -d '{"value" : true}'

echo "--------------------------------------------------"

echo "PART 4 - Step 1.2: Initialize Gateway Token (Mgmt API) "
echo "---------------------------------------------------"
curl -i -X PUT http://localhost:8080/rest/v1/system/configs/authentication.gatewaytoken.key/ \
-u 'admin:admin' \
-H 'Content-Type: application/json' \
-d '{"value": "e61c6b2b78a674d19304c357a20f1d09"}'

echo "--------------------------------------------------"
