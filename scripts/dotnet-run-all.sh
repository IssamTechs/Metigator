#!/bin/bash
export ASPNETCORE_ENVIRONMENT=local
DOTNET_RUN= ./scripts/dotnet-run.sh
PREFIX=Metigator
SERVICE=$PREFIX.Services
REPOSITORIES=(
$PREFIX.Api
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
	 echo Starting a service: $REPOSITORY
	 echo echo $PWD/$REPOSITORY
	 echo ========================================================
     cd $REPOSITORY
	 $PWD
     $DOTNET_RUN &
     cd ..
done
read