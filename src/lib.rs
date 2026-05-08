use encre_css::Config;
use typst_wasm_protocol::wasm_export;

#[wasm_export]
pub fn generate(content: &[u8]) -> Vec<u8> {
    let s: &str = str::from_utf8(content).unwrap();
    encre_css::generate(s.split_whitespace(), &Config::default()).into_bytes()
}
