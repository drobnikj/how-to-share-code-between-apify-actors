#!/usr/bin/env bash

echo "$@"

MY_PWD=$PWD
MY_SHARED='shared'

cd "$MY_SHARED"

rm -rf ./node_modules ./package-lock.json ./shared-1.0.0.tgz

npm install
npm pack

cd ..

if [[ -n "$@" ]]; then
  for folder in "$@" ; do
    if [[ -d $folder && "$MY_SHARED" != "$folder" ]]; then
      rm -rf "./$folder/node_modules/$MY_SHARED" "./$folder/package-lock.json" "./$folder/shared-1.0.0.tgz"
      cp "./$MY_SHARED/shared-1.0.0.tgz" "./$folder/shared-1.0.0.tgz"
      cd "$folder"
      npm install
      echo "Shared was rebuild in $folder!"
      cd ..
    fi
  done
else
  for folder in * ; do
    if [[ -d $folder && "$MY_SHARED" != "$folder" ]]; then
      rm -rf "./$folder/node_modules/$MY_SHARED" "./$folder/package-lock.json" "./$folder/shared-1.0.0.tgz"
      cp "./$MY_SHARED/shared-1.0.0.tgz" "./$folder/shared-1.0.0.tgz"
      cd "$folder"
      npm install
      echo "Shared was rebuild in $folder!"
      cd ..
    fi
  done
fi

echo "Done!"
