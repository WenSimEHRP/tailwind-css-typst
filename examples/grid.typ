#!/usr/bin/env -S typst c --open --root . --features html -f html

#import "../lib.typ": *
#show: tailwind-page
#import html: *

#div(
  class: "min-h-screen max-w-4xl mx-auto mt-20",
  div(class: "flex flex-row gap-4 flex-wrap",
    lorem(256).split(" ").enumerate().map(((idx, it)) =>
      button(it,
        class: "flex-1 p-4
                rounded-sm
                shadow-sm
                bg-[" + color.map.rainbow.at(idx).to-hex() + "]
                ring-blue-400
                hover:ring-5
                hover:bg-blue-200
                transition-all",
      )).join()
))
