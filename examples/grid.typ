#!/usr/bin/env -S typst c --open --features html -f html

#import "@local/typhoon:0.1.0": *
#show: tailwind-page
#import html: *

#div(class: "h-full w-full dark:bg-neutral-900", div(
  class: "min-h-screen max-w-4xl mx-auto py-20",
  div(class: "flex flex-row gap-4 flex-wrap", {
    input(type: "checkbox", class: "peer p-4 flex-1")
    div(class: "flex-3 flex-row p-4 bg-white shadow-sm rounded-sm")[Check for interesting colours!]
    lorem(256)
      .split(" ")
      .enumerate()
      .map(((idx, it)) => button(
        it,
        class: "flex-1 p-4
                rounded-sm
                shadow-sm
                bg-["
          + color.map.rainbow.at(idx).darken(30%).desaturate(50%).to-hex()
          + "]
                peer-checked:bg-["
          + color.map.rainbow.at(idx).to-hex()
          + "]
                ring-blue-400
                hover:ring-5
                hover:bg-blue-200
                transition-all",
      ))
      .join()
  }),
))
