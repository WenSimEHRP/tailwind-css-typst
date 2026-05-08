#let _plugin = plugin("main.wasm")
#let tailwind-classes = state("tailwind-classes", "")
#let tailwind-config = state("tailwind-config", "")

#let tailwind-css-init(body, config: "") = {
  tailwind-config.update(c => config)

  show html.elem: elem => {
    // this is safe because when the class attr is array
    // type typst would ensure that every single element
    // inside the array doesn't contain whitespaces
    let classes = elem.attrs.at("class", default: ())
    if type(classes) == array {
      classes = classes.join(" ")
    }
    tailwind-classes.update(it => it + " " + classes)
    elem
  }

  body
}

#let tailwind-css() = context {
  let classes = tailwind-classes.get()
  let s = str(_plugin.generate(bytes(classes), bytes(tailwind-config.get())))
  html.style(s)
}
