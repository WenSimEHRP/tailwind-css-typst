use encre_css::Config;
use typst_wasm_protocol::wasm_export;

#[wasm_export]
pub fn generate(content: &[u8], config_bytes: &[u8]) -> Vec<u8> {
    let s = std::str::from_utf8(content).unwrap();
    let config = if config_bytes.is_empty() {
        Config::default()
    } else {
        toml::from_str(std::str::from_utf8(config_bytes).unwrap()).unwrap()
    };
    encre_css::generate(s.split_whitespace(), &config).into_bytes()
}
