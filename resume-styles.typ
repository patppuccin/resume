// ==== Resume Styles ===========================================
// Space Grotesk + Emerald theme
// ==============================================================

#let color-primary = rgb("#059669")
#let color-text-base = rgb("#1a1a1a")
#let color-text-muted = rgb("#6b7280")

// ==== Document Styling Entrypoint =============================

#let resume(doc-title: none, doc-author: none, doc-keywords: none, font: "Calibri", body) = {
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

  // H2: Section headers
  show heading.where(level: 2): it => [
    #set text(size: 10pt, weight: "semibold", fill: color-primary, tracking: 0.5pt)
    #v(6pt)
    #upper(it.body)
    #v(-5pt)
    #line(length: 100%, stroke: 0.5pt + color-primary)
    #v(5pt)
  ]

  set par(justify: true, leading: 0.6em)
  set list(indent: 0.5em, body-indent: 0.5em, spacing: 0.7em)

  body
}

// ==== Component Styling =======================================

#let icon(name, shift: 1.5pt) = {
  box(baseline: shift, height: 9pt, image("assets/icons/" + name + ".svg"))
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
}

#let summary(content) = {
  block(above: 0.9em, below: 1.2em, content)
}


#let workex(role: none, date: none, org-name: none, org-link: none, location: none, details: none) = {
  let org-display = if org-link != none {
    link(org-link)[#org-name]
  } else {
    org-name
  }

  grid(
    columns: (1fr, auto),
    gutter: 1em,
    // row-gutter: 0.75em,
    [*#role*], align(right, text(size: 9pt, fill: color-text-muted)[#date]),
    [#emph(org-display)], align(right, text(size: 9pt)[#location]),
  )

  if details != none {
    block(below: 1.4em, details)
  }
}

// ---- Education Section ---------------------------------------
#let edu(degree: none, date: none, inst-name: none, inst-link: none, location: none, gpa: none) = {
  let inst-display = if inst-link != none {
    link(inst-link)[#inst-name]
  } else {
    inst-name
  }

  let subtitle = if gpa != none [
    #emph(inst-display) | GPA: #gpa
  ] else [
    #emph(inst-display)
  ]

  block(
    above: 0.3em,
    grid(
      columns: (1fr, auto),
      gutter: 8pt,
      [*#degree*], align(right, text(size: 9pt)[#date]),
      subtitle, align(right, text(size: 9pt)[#location]),
    ),
  )
}

#let project(name: none, technologies: (), date: none, url: none, desc: none) = {
  grid(
    columns: (1fr, auto),
    gutter: 8pt,
    [
      #text(weight: "semibold")[#name]
      #if technologies.len() > 0 {
        text(size: 9pt, fill: color-text-muted)[ · #technologies.join(" · ")]
      }
    ],
    align(right)[
      #if date != none {
        text(size: 9pt, fill: color-text-muted)[#date]
      }
      #if url != none {
        text(size: 9pt, fill: color-text-muted)[ · ]
        link(url, text(size: 9pt, weight: "medium", fill: color-primary)[Link])
      }
    ],
  )

  if desc != none {
    v(-4pt)
    text(size: 9pt)[#desc]
  }
}

#let skills(category) = {
  block(below: 0.8em, [*#category.name:* #category.tools.join(", ")])
}

#let certification(name: none, issuer: none, year: none) = {
  set block(spacing: 0.9em)
  grid(
    columns: (1fr, auto),
    gutter: 8pt,
    [
      #text(weight: "semibold")[#name]
      #text(size: 9pt, fill: color-text-muted)[· #issuer]
    ],
    align(right, text(size: 9pt)[#year]),
  )
}
