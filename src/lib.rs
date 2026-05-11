use cbor4ii::serde::from_slice;
use encre_css::Config;
use encre_css_typography::Prose;
use typst_wasm_protocol::wasm_export;

#[wasm_export]
pub fn generate(content: &[u8], config_bytes: &[u8]) -> Vec<u8> {
    let s = std::str::from_utf8(content).unwrap();
    let mut config = if config_bytes.is_empty() {
        Config::default()
    } else {
        from_slice(config_bytes).unwrap()
    };
    config.register_plugin("prose", &Prose);
    encre_css::generate(s.split_whitespace(), &config).into_bytes()
}
