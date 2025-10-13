#let primary-colour = rgb("#059669")


#let icon(name, shift: 1.5pt) = {
  box(
    baseline: shift,
    height: 10pt,
    image("assets/icons/" + name + ".svg"),
  )
  h(3pt)
}

#let contacts(services) = {
  set text(9pt)
  let icon = icon.with(shift: 2.5pt)

  services
    .map(service => {
      icon(service.name)

      if "display" in service.keys() {
        link(service.link)[#{ service.display }]
      } else {
        link(service.link)
      }
    })
    .join(h(7.5pt))
  v(0.5em)
}

#let term(period, location) = {
  text(9pt)[#icon("calendar") #period #h(1fr) #icon("location") #location]
}

#let project-header(name, proj-link, year) = {
  grid(
    columns: (1fr, auto),
    column-gutter: 1em,
    [*#name*],
    if year != none {
      [#icon("calendar") #str(year)]
    },
  )
}
#let project-content(content, proj-link) = {
  text(tracking: 0.02em)[#content]
  if proj-link.display != none {
    v(-2pt)
    [#link(proj-link.url)[#icon("website") #proj-link.display]]
  }
  v(5pt)
}

#let styled-link(dest, content) = emph(text(
  fill: link-colour,
  link(dest, content),
))

#let resume(
  name: "Dohn Joe",
  position: "Software Engineer",
  links: (),
  summary: [],
  left-side,
  right-side,
) = {
  // Set Document Properties and Metadata ==================
  set document(
    title: name + "'s Resume",
    author: name,
    description: "Resume of " + name,
    date: datetime.today(),
  )
  set text(9.8pt, font: "Space Grotesk")
  set page(
    margin: (x: 1.2cm, y: 1.2cm),
  )

  // Headings Styling =======================================
  show heading.where(level: 2): it => text(
    size: 11.5pt,
    fill: primary-colour,
    [
      #{ it.body }
      #v(-7pt)
      #line(length: 100%, stroke: 0.5pt + primary-colour)
    ],
  )
  show heading.where(level: 3): it => text(it.body)

  // Assembling the Resume =================================

  // Name and Position -------------------------------------
  text(18pt, weight: "bold", fill: primary-colour)[#name #v(-10pt)]
  text(12pt, weight: "medium")[#position #v(0pt)]

  // Contacts ----------------------------------------------
  contacts(links)

  // Professional Summary ----------------------------------
  text(10pt, weight: "regular", spacing: 102%, tracking: 0.2pt, hyphenate: false, overhang: false)[#summary]
  v(0.5em)

  // Split Layout ------------------------------------------
  grid(
    columns: (7fr, 4fr),
    column-gutter: 2em,
    left-side, right-side,
  )
}
