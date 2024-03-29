#!/bin/bash

RUST_ANALYZER="https://github.com/rust-lang/rust-analyzer/releases/latest/download/rust-analyzer-x86_64-unknown-linux-gnu.gz"

curl -L ${RUST_ANALYZER} | gunzip -c - >"$HOME/.local/bin/rust-analyzer"
RETURN_CODE="$?"
if [[ "${RETURN_CODE}" -eq "0" ]]; then
	echo "download complete!"
	chmod +x ~/.local/bin/rust-analyzer
	echo "rust analyzer is updated!"
	rust-analyzer --version
	exit 0
else
	echo "${RUST_ANALYZER} is not reachable"
	exit 1
fi
