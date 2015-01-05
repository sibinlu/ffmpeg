SRCDIR=$(pwd)
BUILDDIR="${SRCDIR}/build"

mkdir -p ${BUILDDIR}/universal/lib
cd ${BUILDDIR}/armv7/lib

for file in *.a
do

cd ${SRCDIR}/build
xcrun -sdk iphoneos lipo -output universal/lib/$file  -create -arch armv7 armv7/lib/$file -arch armv7s armv7s/lib/$file -arch i386 i386/lib/$file  -arch x86_64 x86_64/lib/$file
#echo "Universal $file created."

done
cp -r ${BUILDDIR}/armv7/include ${BUILDDIR}/universal/

echo "Done."
