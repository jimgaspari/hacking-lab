#!/usr/bin/bash
set +x

QCOW=Metasploitable2.qcow2
SITE=https://download.vulnhub.com/metasploitable/metasploitable-linux-2.0.0.zip

TYPE=zip

if [ ! -f ${SITE##*/} ]; then
    curl -lO $SITE
else
    echo "File ${SITE##*/} has been downloaded"
fi

if [ ! -f "$QCOW" ]; then
    echo "Extracting file"
    unzip -n $(find . -type f -name *.$TYPE)
    echo "Converting to qcow2"
    qemu-img convert -f vmdk -O qcow2 $(find . -type f -name *.vmdk) $QCOW
    echo "The disk $QCOW has been converted"
else
    echo "Nothing to do."
fi