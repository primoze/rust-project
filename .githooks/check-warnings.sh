echo "Running clippy. This may take a minute..."
if ! cargo +nightly clippy -Z unstable-options --workspace --keep-going -- --no-deps -D warnings 2>/dev/null; then
  echo "There are warnings in the code. Run 'make warn' to see them (and fix them)."
  exit 1
fi