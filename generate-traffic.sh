#!/bin/bash

PODINFO_URL="${1:-http://localhost:3000/api/users}"

echo ""
echo "🌐 Target Podinfo URL: $PODINFO_URL"
echo "🚀 Simulating realistic traffic with metrics, logs, and traces"
echo "⏱ Press Ctrl+C to stop."
echo ""

# Use temporary files for tracking request counts
SUCCESS_FILE=$(mktemp)
FAIL_FILE=$(mktemp)
TOTAL_FILE=$(mktemp)
echo 0 > "$SUCCESS_FILE"
echo 0 > "$FAIL_FILE"
echo 0 > "$TOTAL_FILE"

# Cleanup temp files on exit
cleanup() {
  rm -f "$SUCCESS_FILE" "$FAIL_FILE" "$TOTAL_FILE"
  echo "👋 Load simulation stopped."
}
trap cleanup EXIT

# Update stats function
update_stats() {
  local code="$1"
  echo $(( $(<"$TOTAL_FILE") + 1 )) > "$TOTAL_FILE"
  if [[ "$code" =~ ^2 ]]; then
    echo $(( $(<"$SUCCESS_FILE") + 1 )) > "$SUCCESS_FILE"
  else
    echo $(( $(<"$FAIL_FILE") + 1 )) > "$FAIL_FILE"
  fi
}

# Send requests in a loop
send_requests() {
  while true; do
    endpoints=(
      "/" "/version" "/healthz" "/readyz" "/headers" "/env" "/configs"
      "/status/200" "/status/404" "/status/500"
      "/delay/1" "/chunked/1"
      "/api/users"  # Main valid endpoint
    )

    for endpoint in "${endpoints[@]}"; do
      code=$(curl -s -o /dev/null -w "%{http_code}" "$PODINFO_URL$endpoint")
      update_stats "$code"
    done

    sleep 1
  done
}

# Print stats periodically
print_stats() {
  while true; do
    sleep 5
    success=$(<"$SUCCESS_FILE")
    fail=$(<"$FAIL_FILE")
    total=$(<"$TOTAL_FILE")

    echo ""
    echo "📊 Stats for last 5 seconds:"
    echo "  ✅ Success: $success"
    echo "  ❌ Failures: $fail"
    echo "  📦 Total Requests: $total"
    echo ""

    echo 0 > "$SUCCESS_FILE"
    echo 0 > "$FAIL_FILE"
    echo 0 > "$TOTAL_FILE"
  done
}

# Start stats printer in background
print_stats &

# Run traffic generator
send_requests
