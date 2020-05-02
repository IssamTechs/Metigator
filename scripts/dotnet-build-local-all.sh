#!/bin/bash
export ASPNETCORE_ENVIRONMENT=local
BUILD=./scripts/dotnet-build-local.sh
PREFIX=Metigator
SERVICE=$PREFIX.Services
REPOSITORIES=(
$PREFIX.Api 
$PREFIX.Api.Next 
$PREFIX.Infrastructure 
$SERVICE.Customers 
$SERVICE.Identity 
$SERVICE.Permissions 
$SERVICE.Tickets 
$SERVICE.Clients 
$SERVICE.Appointments 
$SERVICE.Payments)

for REPOSITORY in ${REPOSITORIES[*]}
do
	 echo ========================================================
	 echo Building a project: $REPOSITORY
	 echo ========================================================
     cd $REPOSITORY
     $BUILD
     cd ..
done