COMPILED_WASM := ./target/wasm32-unknown-unknown/release/encre_css_typst.wasm
TYPST_SRC := $(shell find . -path ./dist -prune -o -name '*.typ' -print)

# cool unstable solution for not using .d files
dist/: README.md LICENSE.md typst.toml main.wasm $(TYPST_SRC)
	rm -rf ./dist
	mkdir $@
	cp $^ $@/

main.wasm: $(COMPILED_WASM)
	wasm-opt -Oz --enable-bulk-memory-opt $< -o $@

$(COMPILED_WASM): $(wildcard Cargo.*) src/
	cargo build --release --target wasm32-unknown-unknown
