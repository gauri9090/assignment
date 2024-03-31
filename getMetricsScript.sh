#!/bin/bash

RESULT_DIR="/metrics"

mkdir -p $RESULT_DIR

CURRENT_TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

METRICS_CMD="curl -s http://node-exporter.default.svc.cluster.local:9100/metrics "

METRIC_FILE="$RESULT_DIR/metricsAT_$CURRENT_TIMESTAMP.txt"

$METRICS_CMD  > $METRIC_FILE

echo "Metric file is created and stored here: $METRIC_FILE"


