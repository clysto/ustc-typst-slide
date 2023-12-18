#import "@preview/polylux:0.3.1": *

#let ustc-footer = state("ustc-footer", [])

#let ustc-theme(aspect-ratio: "16-9", footer: [], body) = {
  set page(
    paper: "presentation-" + aspect-ratio,
    margin: 0pt,
  )
  ustc-footer.update(footer)
  set text(size: 25pt, font: ("Noto Sans CJK SC"), lang: "zh")
  body
}

#let title-slide(title: [], subtitle: []) = {
  set heading(outlined: false)
  let height = (100% - 180pt) * 0.7
  [
    #block(
      width: 100%,
      height: 100pt,
      fill: rgb("#f3f3f3"),
      inset: (x: 1em),
      below: 0pt,
      align(horizon, image("imgs/ustc-logo.svg", width: 250pt))
    )
    #v(8pt)
    #line(length: 100%, stroke: 4pt + rgb("#f3f3f3"))
    #v(1fr)
    #block(
      width: 100%,
      height: height,
      fill: gradient.linear(rgb("#3366ad"), rgb("#004098")),
      [
        #place(top + left, image("imgs/banner.svg", height: 100%, width: 50%, fit: "stretch"))
        #set align(center + horizon)
        #set text(fill: white)
        #pad(
          x: 1em,
          [
            = #title
            #subtitle
          ]
        )
      ]
    )
    #v(1fr)
    #line(length: 100%, stroke: 4pt + rgb("#f3f3f3"))
    #v(8pt)
    #block(
      width: 100%,
      height: 80pt,
      fill: rgb("#f3f3f3"),
      above: 0pt,
    )
  ]
}

#let slide(title: [], alignment: start + top, body) = {
  let footer = block(
    width: 100%,
    height: 25pt,
    fill: rgb("#004098"),
    stroke: (
      top: (2pt + rgb("#eaebed"))
    ),
    [
      #set text(fill: white, size: 14pt)
      #set align(center + horizon)
      #pad(
        x: 25pt,
        {
          ustc-footer.display()
          h(1fr)
          logic.logical-slide.display()
        }
      )
    ]
  )
  let header = block(
    width: 100%,
    height: 50pt,
    fill: gradient.linear(rgb("#3366ad"), rgb("#004098")),
    stroke: (
      bottom: (2pt + rgb("#eaebed"))
    ),
    [
      #set align(horizon)
      #place(top + left, image("imgs/banner.svg", height: 49pt, width: 50%, fit: "stretch"))
      #pad(
        x: 25pt,
        stack(
          dir: ltr,
          spacing: 1fr,
          align(horizon, text(fill: white, size: 30pt, weight: "bold", title)),
          align(horizon, image("imgs/ustc-logo-white.svg", height: 40pt))
        )
      )
    ]
  )
  let content = align(alignment, pad(x: 25pt, y: 20pt, body))
  set page(
    margin: (bottom: 25pt, top: 50pt),
    footer: footer,
    header: header,
    footer-descent: 0pt,
    header-ascent: 0pt,
  )
  polylux-slide(content)
}

#let focus-slide(body) = {
  let content = block(
    width: 100%,
    height: 100%,
    fill: gradient.linear(rgb("#3366ad"), rgb("#004098")),
    [
      #place(top + left, image("imgs/banner.svg", height: 100%, fit: "stretch"))
      #set align(center + horizon)
      #set text(fill: white)
      #pad(
        x: 25pt,
        y: 25pt,
        body
      )
    ]
  )
  logic.polylux-slide(content)
}
