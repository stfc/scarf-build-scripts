#!/bin/sh

APPNAME="hpcg"
VERSION="3.0"
ARCH="Scarf"

. /etc/profile.modules
module load intel/16.1
module load intel/mkl/11.3.1.150

BUILDDIR=`mktemp -d`
cp Make.${ARCH} ${BUILDDIR}
cd ${BUILDDIR}

tar xvzf /apps/src/${APPNAME}/${APPNAME}-${VERSION}.tar.gz
cp Make.${ARCH} ${APPNAME}-${VERSION}/setup

echo $LOADEDMODULES
mkdir -p /apps/procspec/${APPNAME}/${VERSION}

cd ${APPNAME}-${VERSION}

make arch=${ARCH} 

cp -a bin/ /apps/procspec/${APPNAME}/${VERSION}/


cd ../..
#rm -fr ${BUILDDIR}

