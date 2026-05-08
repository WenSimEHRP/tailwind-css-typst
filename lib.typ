#let _plugin = plugin("main.wasm")
#let tailwind-classes = state("tailwind-classes", "")

#show html.elem: elem => {
  // this is safe because when the class attr is array
  // type typst would ensure that every single element
  // inside the array doesn't contain whitespaces
  let classes = elem.fields().attrs.at("class", default: ())
  if type(classes) == array {
    classes = classes.join(" ")
  }
  tailwind-classes.update(it => it + " " + classes)
  elem
}

#let tailwind-css() = context {
  let classes = tailwind-classes.get()
  let s = str(_plugin.generate(bytes(classes)))
  html.style(s)
}
