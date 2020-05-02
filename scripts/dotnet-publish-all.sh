#!/bin/bash
export ASPNETCORE_ENVIRONMENT=local
PUBLISH=./scripts/dotnet-publish.sh
PREFIX=Metigator
SERVICE=$PREFIX.Services
REPOSITORIES=($PREFIX.Api $PREFIX.Api.Next $SERVICE.Customers $SERVICE.Identity $SERVICE.Permissions $SERVICE.Tickets $SERVICE.Clients $SERVICE.Appointments $SERVICE.Payments)


for REPOSITORY in ${REPOSITORIES[*]}
do
	 echo ========================================================
	 echo Publishing a project: $REPOSITORY
	 echo ========================================================
     cd $REPOSITORY
     $PUBLISH
     cd ..
done