#!/bin/bash

if [ ! -f "csgoserver" ]; then
    wget https://gameservermanagers.com/dl/csgoserver
    chmod +x csgoserver
fi
if [ ! -d "serverfiles" ]; then
    yes Y | ./csgoserver install
fi

yes Y | ./csgoserver update

yes Y | ./csgoserver start

/bin/bash