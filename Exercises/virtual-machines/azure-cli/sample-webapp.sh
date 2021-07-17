#!/usr/bin/env bash
mkdir webapp
cd webapp || exit

echo "Hallo this is simple web app" > index.html

python3 -m http.server
