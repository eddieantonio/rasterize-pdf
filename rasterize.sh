#!/bin/sh

# Saves the first page of a PDF as a PNG.
#
# Synopsis
#
#   ./rasterize.sh INPUT.pdf
#
# Will create a file called INPUT.png, 300 DPI, with white background.
#
# System requirements:
#   ImageMagick 7+
#   optipng

set -ex

test ! -z "$1" || exit 1

OUTPUT_NAME="$(basename "$1" .pdf).png"

magick "$1[0]" \
    -render -density 300 \
    -background white -alpha remove \
    "$OUTPUT_NAME"
optipng "$OUTPUT_NAME"
