# TailwindCSS-Typst

Tailwind CSS generation for Typst. Powered by [encre-css](https://docs.rs/encre-css/latest/encre_css/).

## Getting started

It just works. Enter your classes as follows:

```typst
// First import the library
#import "@local/tailwindcss": *

// Then define your elements. No special notation needed. The plugin would 
// read the classes.
#html.div(
  class: "p-10 w-full h-screen border-1 bg-neutral-300 overflow-x-scroll "
    + "grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-10",
  html.div(class: "p-5 border-1 border-neutral-500 " + it)[Hi from grid!] * 5
)
```

Then add the magical line:

```typst
#tailwind-css()
```

## Building

Run `make` to bundle everything including LICENSE, README, .typ files, and the wasm file.
