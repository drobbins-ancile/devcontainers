#!bin/bash

dotnet nuget remove source ancile-sdig/uperform-development
export CODEARTIFACT_AUTH_TOKEN=`aws codeartifact get-authorization-token --domain ancile-sdig --domain-owner 405085646316 --region us-east-1 --query authorizationToken --output text --profile ${AWS_SDIG_PROFILE}`
dotnet nuget add source "https://ancile-sdig-405085646316.d.codeartifact.us-east-1.amazonaws.com/nuget/uperform-development/v3/index.json" -n "ancile-sdig/uperform-development" -u "aws" -p "${CODEARTIFACT_AUTH_TOKEN}" --store-password-in-clear-text
dotnet tool install -g dotnet-ef
dotnet tool install -g csharpier
sudo dotnet workload update