// ==== Resume Content =====================================

#import "resume-styles.typ": *

#let content-path = sys.inputs.at("content", default: "content/devops-resume.yaml")
#let cfg = yaml(content-path)

#show: resume.with(
  doc-title: cfg.document.title,
  doc-author: cfg.document.author,
  doc-keywords: cfg.document.keywords,
  font: "Space Grotesk",
)

#header(
  name: cfg.personal.name,
  title: cfg.personal.title,
  location: cfg.personal.location,
  contacts: cfg.contacts,
)

#summary(cfg.summary)

== Work Experience

#for job in cfg.experience [
  #workex(
    role: job.role,
    date: job.date,
    org-name: job.org_name,
    org-link: job.at("org_link", default: none),
    location: job.location,
    details: {
      for point in job.details [
        - #point
      ]
    },
  )
]

== Skills

#for skill-category in cfg.skills [
  #skills(skill-category)
]

// #skills(cfg.skills)

== Projects

#for proj in cfg.projects [
  #project(
    name: proj.name,
    technologies: proj.at("technologies", default: ()),
    date: proj.at("date", default: none),
    url: proj.at("url", default: none),
    desc: proj.at("desc", default: none),
  )
]

== Certifications

#for cert in cfg.certifications [
  #certification(name: cert.name, issuer: cert.issuer, year: cert.year)
]

== Education

#for ed in cfg.education [
  #edu(
    degree: ed.degree,
    date: ed.date,
    inst-name: ed.inst_name,
    inst-link: ed.at("inst_link", default: none),
    location: ed.location,
    gpa: ed.at("gpa", default: none),
  )
]
