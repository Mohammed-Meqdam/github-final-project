#!/usr/bin/env bash

set -euo pipefail

read -r -p "Enter the principal amount: " principal
read -r -p "Enter the annual rate of interest (percent): " rate
read -r -p "Enter the time period (years): " time

if ! [[ $principal =~ ^([0-9]+([.][0-9]*)?|[.][0-9]+)$ ]] ||
   ! [[ $rate =~ ^([0-9]+([.][0-9]*)?|[.][0-9]+)$ ]] ||
   ! [[ $time =~ ^([0-9]+([.][0-9]*)?|[.][0-9]+)$ ]]; then
    printf '%s\n' "Error: principal, rate, and time must be non-negative numbers." >&2
    exit 1
fi

awk -v principal="$principal" -v rate="$rate" -v time="$time" \
    'BEGIN {
        interest = principal * rate * time / 100
        printf "Simple interest: %.2f\n", interest
    }'
