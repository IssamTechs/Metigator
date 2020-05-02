#!/bin/bash
BUILD=./scripts/docker-build-local.sh
PREFIX=Metigator
SERVICE=$PREFIX.Services
REPOSITORIES=($PREFIX.Api $SERVICE.Customers $SERVICE.Identity $SERVICE.Permissions $SERVICE.Tickets $SERVICE.Clients $SERVICE.Appointments $SERVICE.Payments)

for REPOSITORY in ${REPOSITORIES[*]}
do
	 echo ========================================================
	 echo Building a local Docker image: $REPOSITORY
	 echo ========================================================
     cd $REPOSITORY
     $BUILD
     cd ..
done