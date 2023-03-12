.PHONY: all init test quiet-test warn clean release run

all: release

init:
	ln -sf rust-bin/config config
	rustup component add rustfmt
	rustup component add clippy
	git config core.hooksPath .githooks
	cargo install cargo-expand

test:
	cargo test --all-features --release -- --skip bench_ --nocapture --test-threads=1

quiet-test:
	cargo test --all-features --release -- --skip bench_ --test-threads=1

warn:
	cargo +nightly clippy -Z unstable-options --workspace --keep-going -- --no-deps -D warnings

clean:
	cargo clean

release:
	cargo build --release

run:	release
	cargo run --release
