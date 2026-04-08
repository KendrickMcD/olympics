#!/usr/bin/env bash
# Refreshes LA28 SCHEDULE.xlsx from the live Google Sheet.
# Runs automatically via SessionStart hook, or manually: bash scripts/refresh-schedule.sh

SHEET_ID="1N8y_tcoS54UFA20kW2Sg3E1lGjupyoHC8c0KZ3WCfvs"
URL="https://docs.google.com/spreadsheets/d/${SHEET_ID}/export?format=xlsx"
TARGET="LA28 SCHEDULE.xlsx"

curl -sfL -o "${TARGET}.tmp" "$URL" 2>/dev/null
if [ $? -eq 0 ] && [ -s "${TARGET}.tmp" ]; then
    mv "${TARGET}.tmp" "$TARGET"
    echo "Refreshed schedule from live Google Sheet."
else
    rm -f "${TARGET}.tmp"
    echo "Could not fetch live sheet. Using existing local snapshot."
fi
