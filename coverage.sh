#!/bin/sh

cargo +nightly build --verbose
cargo +nightly test --verbose
zip -0 ccov.zip $(find -name "${PROJECT_NAME}*.gc*" -print)
grcov ccov.zip -s . -t lcov --llvm --branch --ignore-not-existing --ignore-dir "/*" -o /output/lcov.info
