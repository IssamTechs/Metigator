#!/bin/bash
REPOSITORIES=(
  Metigator Metigator.Api 
  Metigator.Api.Next 
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
    echo ${REPOSITORIES[@]} | sed -E -e 's/[[:blank:]]+/\n/g' | xargs -I {} -n 1 -P 0 sh -c 'printf "========================================================\nUpdating repository: {}\n========================================================\n"; git -C {} checkout develop; git -C {} pull; git -C {} checkout master; git -C {} pull;git -C {} checkout develop;'
  else
    for REPOSITORY in ${REPOSITORIES[*]}
    do
      echo ========================================================
      echo Updating repository: $REPOSITORY
      echo ========================================================
      cd $REPOSITORY
      git checkout develop
      git pull
      git checkout master
      git pull
      git checkout develop
      cd ..
    done
fi