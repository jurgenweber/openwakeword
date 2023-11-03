#!/usr/bin/env bash

exec python3 -m wyoming_openwakeword \
    --uri 'tcp://0.0.0.0:10400' \
    --preload-model 'ok_nabu' \
    --custom-model-dir /share/openwakeword \
    --threshold "${THRESHOLD}" \
    --trigger-level "${TRIGGER_LEVEL}"
