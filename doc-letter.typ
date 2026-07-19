// ==== Letter Content =====================================

#import "layouts/letter-styles.typ": *

#let content-path = sys.inputs.at("content", default: "content/doc-letter/devops-letter.yaml")
#let cfg = yaml(content-path)

#show: letter.with(
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

#recipient(
  to: cfg.recipient.at("to", default: none),
  org: cfg.recipient.at("org", default: none),
  loc: cfg.recipient.at("loc", default: none),
  date: cfg.date,
)

#subject(cfg.subject)

#salutation(cfg.salutation)

#for para in cfg.body [
  #body-paragraph(para)
]

#closing(sign-off: cfg.closing, name: cfg.personal.name)
