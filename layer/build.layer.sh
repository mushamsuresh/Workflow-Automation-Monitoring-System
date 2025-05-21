#!/bin/bash

set -e

LAYER_DIR="python"
mkdir -p $LAYER_DIR

pip install -r ../lambda/requirements.txt -t $LAYER_DIR

zip -r layer.zip $LAYER_DIR
echo "Layer package created: layer.zip"
