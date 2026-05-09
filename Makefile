COMPILED_WASM := ./target/wasm32-unknown-unknown/release/encre_css_typst.wasm
TYPST_DEPS    := $(shell typst c lib.typ --deps - --deps-format zero --features html -f html /dev/null | tr '\0' '\n')

# cargo would be responsible for tracking the intermediates
.PHONY: $(COMPILED_WASM)

dist/: README.md LICENSE typst.toml $(TYPST_DEPS)
	rm -rf ./dist
	mkdir $@
	cp $^ $@/

main.wasm: $(COMPILED_WASM)
	wasm-opt -Oz --enable-bulk-memory-opt $< -o $@

$(COMPILED_WASM):
	cargo build --release --target wasm32-unknown-unknown
