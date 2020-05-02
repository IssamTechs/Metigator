#!/bin/bash
REPOSITORIES=(
Metigator 
Metigator.Api 
Metigator.Infrastructure 
Metigator.Services.Customers 
Metigator.Services.Identity 
Metigator.Services.Permissions 
Metigator.Services.Tickets 
Metigator.Services.Clients 
Metigator.Services.Appointments 
Metigator.Services.Payments)

if [ "$1" = "-p" ]
  then
    echo ${REPOSITORIES[@]} | sed -E -e 's/[[:blank:]]+/\n/g' | xargs -I {} -n 1 -P 0 sh -c 'printf "========================================================\nCloning repository: {}\n========================================================\n"; git clone https://github.com/devmentors/{}.git'
  else
    for REPOSITORY in ${REPOSITORIES[*]}
    do
      echo ========================================================
      echo Cloning repository: $REPOSITORY
      echo ========================================================
      REPO_URL=https://github.com/IssamTechs/$REPOSITORY.git
      git clone $REPO_URL
    done
fi
