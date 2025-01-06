#!/bin/bash

set -ex

cabal build -v0 -fforce-recomp all

export EXE=$(cabal exec -v0 which ghcjs-test)".jsexe"
export IN1=$EXE"/all.js"
export IN2=$EXE"/all.externs.js"
export OUT1=$EXE"/all.min.js"

export OUT2="dev/index.js"

npx google-closure-compiler -O ADVANCED --js_output_file $OUT1 $IN1 $IN2
cp $OUT1 $OUT2
# terser $IN --compress toplevel=true --mangle toplevel=true --output $OUT
npx http-server dev/ # -- or parcel dev/index.html or webpack