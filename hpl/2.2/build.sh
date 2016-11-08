#!/bin/sh

APPNAME="hpl"
VERSION="2.2"
ARCH="Linux_Intel64"

. /etc/profile.modules
module load intel/16.1
module load intel/mkl/11.3.1.150

BUILDDIR=`mktemp -d`
cp Make.${ARCH} ${BUILDDIR}
cd ${BUILDDIR}

tar xvzf /apps/src/${APPNAME}/${APPNAME}-${VERSION}.tar.gz
cp Make.${ARCH} ${APPNAME}-${VERSION}/

echo $LOADEDMODULES
mkdir -p /apps/procspec/${APPNAME}/${VERSION}/bin/${ARCH}

cd ${APPNAME}-${VERSION}
sed -i -e "s#^TOPdir.*#TOPdir = ${BUILDDIR}/${APPNAME}-${VERSION}#"  Make.${ARCH}

make arch=${ARCH} install

cd ../..
rm -fr ${BUILDDIR}









