#!/bin/bash
export ASPNETCORE_ENVIRONMENT=docker
BUILD=./scripts/dotnet-build.sh
PREFIX=Metigator
SERVICE=$PREFIX.Services
REPOSITORIES=($PREFIX.Api $PREFIX.Infrastructure $SERVICE.Customers $SERVICE.Identity $SERVICE.Permissions $SERVICE.Tickets $SERVICE.Clients $SERVICE.Appointments $SERVICE.Payments)

for REPOSITORY in ${REPOSITORIES[*]}
do
	 echo ========================================================
	 echo Building a project: $REPOSITORY
	 echo ========================================================
     cd $REPOSITORY
     $BUILD
     cd ..
done