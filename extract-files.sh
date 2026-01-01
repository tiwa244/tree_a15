#!/bin/bash
#
# Auto-fixed extract-files.sh for your setup
#

set -e

DEVICE=a15
VENDOR=samsung

# Hardcode directories
MY_DIR="/home/thiwa21062016/android_tools_extract-utils"
ANDROID_ROOT="/home/thiwa21062016"

HELPER="${MY_DIR}/extract_utils.sh"

if [ ! -f "${HELPER}" ]; then
    echo "Unable to find helper script at ${HELPER}"
    exit 1
fi

# Source the helper properly
source "${HELPER}"

# Default cleanup
CLEAN_VENDOR=true
KANG=
SECTION=

# Parse arguments
while [ "${#}" -gt 0 ]; do
    case "${1}" in
        -n|--no-cleanup)
            CLEAN_VENDOR=false
            ;;
        -k|--kang)
            KANG="--kang"
            ;;
        -s|--section)
            SECTION="${2}"; shift
            CLEAN_VENDOR=false
            ;;
        *)
            SRC="${1}"
            ;;
    esac
    shift
done

# Default source if not passed
if [ -z "${SRC}" ]; then
    SRC="adb"
fi

# Initialize vendor
setup_vendor "${DEVICE}" "${VENDOR}" "${ANDROID_ROOT}" false "${CLEAN_VENDOR}"

# Extract files
extract "/home/thiwa21062016/EvolutionQ1/device/samsung/a15/proprietary-files.txt" "${SRC}" "${KANG}"

# Run makefiles setup
"/home/thiwa21062016/EvolutionQ1/device/samsung/a15/setup-makefiles.sh"


