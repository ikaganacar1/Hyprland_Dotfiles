#!/bin/bash

interface=$(ip route | grep '^default' | awk '{print $5}' | head -n1)

while true; do
  rx_now=$(($(cat /sys/class/net/$interface/statistics/rx_bytes)))

  sleep 1

  rx_next=$(($(cat /sys/class/net/$interface/statistics/rx_bytes)))

  rx_speed=$((($rx_next - $rx_now) / 1024))

  # Format for MB/s if > 1024 KB
  if [ $rx_speed -gt 1024 ]; then
    rx_speed=$(printf "%.1fM" $(echo "$rx_speed/1024" | bc -l))
  else
    rx_speed="${rx_speed}K"
  fi

  echo "{\"text\":\"<span> $rx_speed</span>\"}"
done
