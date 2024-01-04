#!/bin/bash

set -xe
python run.py --dataset gist-960-euclidean --algorithm lantern --timeout 18000 --batch --force
python run.py --dataset gist-960-euclidean --algorithm pgvector --timeout 18000 --batch --force
