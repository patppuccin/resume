#import "resume-layout.typ": *
#let cfg = yaml("resume-config.yaml")


#resume(
  name: cfg.personal.name,
  position: cfg.personal.title,
  links: (
    (name: "location", link: "", display: cfg.contacts.address),
    (name: "email", link: "mailto:" + cfg.contacts.email),
    (name: "github", link: cfg.contacts.github.url, display: cfg.contacts.github.displayText),
    (name: "linkedin", link: cfg.contacts.linkedin.url, display: cfg.contacts.linkedin.displayText),
    (name: "website", link: cfg.contacts.website.url, display: cfg.contacts.website.displayText),
  ),
  summary: (cfg.summary),

  // left-side =============================================
  [

    == Experience
    #for job in cfg.jobs [
      === #job.position
      #v(-2pt)
      _#link(job.company.link)[#job.company.name]_
      #v(0.2em)
      #term[#job.period][#job.company.location]

      #for point in job.description [
        - #eval(point, mode: "markup")
      ]
      #v(1em)
    ]

    == Open Source Projects
    #for project in cfg.projects [
      #project-header(project.name, project.link, project.year)
      #project-content(project.description, project.link)
    ]

  ],

  // right-side =============================================
  [
    == Methodologies
    #text(tracking: 0.02em)[#cfg.methodologies.join(", ")]

    == Tech Stack
    #for tech in cfg.tech_stack [
      #text(weight: "semibold", spacing: 102%, tracking: 0.2pt)[#tech.name]:
      #text(spacing: 102%, tracking: 0.2pt)[#tech.tools.join(", ")]
      #v(-2pt)
    ]

    == Certifications

    #for cert in cfg.certifications [
      #grid(
        columns: (1fr, auto),
        column-gutter: 1em,
        [=== #cert.name], align(right)[#text()[#cert.year]],
      )
      #cert.description \
    ]

    == Education
    #for edu in cfg.education [
      #if edu.place.link != "" [
        *#link(edu.place.link)[#edu.place.name]*\
      ] else [
        *#edu.place.name*\
      ]
      #edu.degree in #edu.major

      #edu.from - #edu.to #h(1fr) #edu.location
    ]

  ],
)
