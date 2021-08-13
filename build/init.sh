#!/bin/sh

echo 'Starting init.sh'

BUILDPATH="/intersect_build"
TARGETPATH="/intersect"

# Copy the Intersect Server executable
if [ ! -f "$TARGETPATH/Intersect Server.exe" ]; then
  echo "Copying Intersect Server executable..."
  cp "$BUILDPATH/Intersect Server.exe" "$TARGETPATH/Intersect Server.exe"
fi

# Copy the Intersect Server .pdb file
if [ ! -f "$TARGETPATH/Intersect Server.pdb" ]; then
  echo "Copying Intersect Server .pdb file..."
  cp "$BUILDPATH/Intersect Server.pdb" "$TARGETPATH/Intersect Server.pdb"
fi

# Copy the sqlite3 lib
if [ ! -f "$TARGETPATH/libe_sqlite3.dylib" ]; then
  echo "Copying sqlite3 library..."
  cp "$BUILDPATH/libe_sqlite3.dylib" "$TARGETPATH/libe_sqlite3.dylib"
fi

chown -R nobody:users $TARGETPATH
chmod -R g+rw $TARGETPATH

cd /intersect
LD_LIBRARY_PATH=. mono /intersect/Intersect\ Server.exe
