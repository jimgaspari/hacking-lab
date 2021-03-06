#!/usr/bin/bash
set +x

QCOW=GoldenEye-v1.qcow2
SITE=https://download.vulnhub.com/goldeneye/GoldenEye-v1.ova
TYPE=ova


if [ ! -f ${SITE##*/} ]; then
    curl -lO $SITE
else
    echo "File ${SITE##*/} has been downloaded"
fi

if [ ! -f "$QCOW" ]; then
    echo "Extracting file"
    tar -xf $(find . -type f -name *.$TYPE)
    echo "Converting to qcow2"
    qemu-img convert -f vmdk -O qcow2 $(find . -type f -name *.vmdk) $QCOW
    echo "The disk $QCOW has been converted"
else
    echo "Nothing to do."
fi