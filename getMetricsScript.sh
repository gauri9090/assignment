#!/bin/bash

RESULT_DIR="/myNodeMetrics"

mkdir -p $RESULT_DIR

CURRENT_TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

METRICS_CMD="node_exporter &"

METRIC_FILE="$RESULT_DIR/metricsAT_$CURRENT_TIMESTAMP.txt"

$METRICS_CMD 

curl -s http://localhost:9100/metrics | grep -E '^node_(cpu_seconds_total|memory_(usage|bytes))|node_filesystem_usage' > $METRIC_FILE

echo "Metric file is created and stored here: $METRIC_FILE"


