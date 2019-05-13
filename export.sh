#!/bin/sh

mkdir -p data
watchme export --out data/oakland.json air-quality task-air-oakland oakland.txt --force
watchme export --out data/boulder.json air-quality task-air-boulder boulder.txt --force
watchme export --out data/durham.json air-quality task-air-durham durham.txt --force
watchme export --out data/pittsurgh.json air-quality task-air-pittsburgh pittsburgh.txt --force
