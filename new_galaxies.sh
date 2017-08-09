#!/usr/bin/env bash

# colors has 101 (0-100) f606w filter galaxies
# new_stamps has 201 (0-200) f606 filter galaxies
# combine them to a new folder

rm galaxies/*
cp new_stamps/f6* galaxies/     # 201 files
cp new_stamps/f8* galaxies/     # 201 files
python3 increase_filenumber.py
cp colors/f6*.fits galaxies/    # 101 files
cp colors/f8*.fits galaxies/    # 101 files
echo 'number of files: '
ls galaxies | wc -l  # 402 + 202 = 604 (302 each filter)
