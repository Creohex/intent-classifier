#!/bin/bash

set -e

MODELS="./models"
PARAMS="./parameters"

# train new model if either none found or it is forced
if [ ! "$(ls -A ./models)" ] || [ "$1" == "-f" ]; then
    rasa train --data $PARAMS/nlu.yml -d $PARAMS/domain.yml --config $PARAMS/config.yml
fi

rasa run --enable-api
