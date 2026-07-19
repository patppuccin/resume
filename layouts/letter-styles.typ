// ==== Letter Styles ===========================================
// Space Grotesk + Emerald theme
// ==============================================================

#let color-primary = rgb("#059669")
#let color-text-base = rgb("#1a1a1a")
#let color-text-muted = rgb("#6b7280")

// ==== Document Styling Entrypoint =============================

#let letter(doc-title: none, doc-author: none, doc-keywords: none, font: "Calibri", body) = {
  set document(author: doc-author, title: doc-title, keywords: doc-keywords)
  set text(font: font, size: 9.5pt, hyphenate: false, ligatures: false)
  set page(margin: (x: 1cm, y: 1cm))

  show link: it => {
    set text(fill: color-primary)
    it
  }

  // H1: Name
  show heading.where(level: 1): it => [
    #set text(size: 16pt, weight: "bold", fill: color-primary, tracking: 0.3pt)
    #it.body
    #v(-6pt)
  ]

  set par(justify: true, leading: 0.7em)

  body
}

// ==== Component Styling =======================================

#let icon(name, shift: 1.5pt) = {
  box(baseline: shift, height: 9pt, image("../assets/icons/" + name + ".svg"))
  h(2.5pt)
}

#let header(name: none, title: none, location: none, contacts: ()) = {
  [= #name]

  if title != none or location != none {
    text(size: 11pt, weight: "medium")[#title #if location != none [· #location]]
    v(0.2em)
  }

  if contacts.len() > 0 {
    set text(size: 8pt)
    contacts
      .map(c => {
        icon(c.type, shift: 2pt)
        link(c.url)[#text(fill: black)[#c.label]]
      })
      .join(h(0.8em))
    v(0.4em)
  }

  line(length: 100%, stroke: 0.5pt + color-primary)
  v(0.6em)
}

#let recipient(to: none, org: none, loc: none, date: none) = {
  grid(
    columns: (1fr, auto),
    gutter: 4pt,
    row-gutter: 1em,
    [
      #let parts = ()
      #if to != none { parts.push(to) }
      #if org != none { parts.push(org) }
      #text(weight: "semibold")[#parts.join(" · ")]
    ],
    align(right, text(fill: color-text-muted, size: 9pt)[#date]),

    [#if loc != none [#text(fill: color-text-muted)[#loc]]], [],
  )
  v(1.2em)
}

#let subject(content) = {
  text(weight: "semibold")[#upper(content)]
  v(0.8em)
}

#let salutation(content) = {
  text()[#content]
  v(0.4em)
}

#let body-paragraph(content) = {
  block(below: 1.6em)[#content]
}

#let closing(sign-off: none, name: none) = {
  v(0.8em)
  text()[#sign-off]
  v(0.1em)
  text(size: 11pt, weight: "bold", fill: color-primary)[#name]
}
