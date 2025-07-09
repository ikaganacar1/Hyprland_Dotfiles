#!/bin/bash

interface=$(ip route | grep '^default' | awk '{print $5}' | head -n1)

while true; do
  tx_now=$(($(cat /sys/class/net/$interface/statistics/tx_bytes)))

  sleep 1

  tx_next=$(($(cat /sys/class/net/$interface/statistics/tx_bytes)))

  tx_speed=$((($tx_next - $tx_now) / 1024))

  # Format for MB/s if > 1024 KB
  if [ $tx_speed -gt 1024 ]; then
    tx_speed=$(printf "%.1fM" $(echo "$tx_speed/1024" | bc -l))
  else
    tx_speed="${tx_speed}K"
  fi

  echo "{\"text\":\"<span> $tx_speed</span>\"}"
done
