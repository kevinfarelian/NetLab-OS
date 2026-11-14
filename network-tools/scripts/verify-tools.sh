#!/bin/bash

# Network Tools Verification

PACKAGES=(
    nmap
    traceroute
    net-tools
    iperf3
    tcpdump
    openvpn
    putty
    curl
)

REPORT="reports/installation-report.txt"

mkdir -p reports

echo "======================================" | tee "$REPORT"
echo "       NETWORK TOOLS VERIFICATION" | tee -a "$REPORT"
echo "======================================" | tee -a "$REPORT"

SUCCESS=0
FAILED=0

for PACKAGE in "${PACKAGES[@]}"; do

    STATUS=$(dpkg-query -W -f='${Status}' "$PACKAGE" 2>/dev/null)

    if [[ "$STATUS" == "install ok installed" ]]; then
        echo "[INSTALLED] $PACKAGE" | tee -a "$REPORT"
        ((SUCCESS++))
    else
        echo "[NOT INSTALLED] $PACKAGE" | tee -a "$REPORT"
        ((FAILED++))
    fi

done

echo "" | tee -a "$REPORT"
echo "======================================" | tee -a "$REPORT"
echo "             SUMMARY" | tee -a "$REPORT"
echo "======================================" | tee -a "$REPORT"

echo "Total packages : ${#PACKAGES[@]}" | tee -a "$REPORT"
echo "Installed      : $SUCCESS" | tee -a "$REPORT"
echo "Failed         : $FAILED" | tee -a "$REPORT"

if [[ "$FAILED" -eq 0 ]]; then
    echo "RESULT: ALL TOOLS INSTALLED" | tee -a "$REPORT"
else
    echo "RESULT: SOME TOOLS ARE MISSING" | tee -a "$REPORT"
fi

echo "" | tee -a "$REPORT"
echo "Report saved to: $REPORT"

if [[ "$FAILED" -gt 0 ]]; then
    exit 1
fi
