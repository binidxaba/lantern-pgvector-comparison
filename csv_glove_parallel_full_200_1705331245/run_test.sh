#!/bin/bash

set -xe

date
python run.py --dataset glove-200-angular --algorithm lantern --timeout 18000 --batch --force
date
python run.py --dataset glove-200-angular --algorithm pgvector --timeout 18000 --batch --force
date
