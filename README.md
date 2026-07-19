# jobdocs

A YAML-driven document generation system for job applications, built with Typst and automated via GitHub Actions.

## Documents

- **Resume** — structured work history, skills, projects, and certifications
- **Letter** — cover letter with recipient, body paragraphs, and a signature

## Structure

```
assets/
  fonts/          # Space Grotesk + Pinyon Script
  icons/          # SVG icons for contact links
content/
  doc-resume/     # One YAML file per resume variant
  doc-letter/     # One YAML file per letter variant
layouts/
  resume-styles.typ
  letter-styles.typ
scripts/
  list-variants.ps1
  list-variants.sh
generated/        # gitignored — compiled PDFs land here
  resume/
  letter/
doc-resume.typ    # Resume entrypoint
doc-letter.typ    # Letter entrypoint
taskfile.yaml
```

## Prerequisites

- [Typst](https://typst.app) `v0.14.2`
- [Task](https://taskfile.dev)

## Usage

```sh
# List available variants
task list

# Compile resume (default variant: devops-resume)
task generate:resume

# Compile letter (default variant: devops-letter)
task generate:letter

# Compile both
task generate

# Watch resume for changes
task watch:resume

# Watch letter for changes
task watch:letter

# Clean generated artifacts
task cleanup
```

To use a specific variant:

```sh
task generate:resume -- my-variant
task generate:letter -- my-variant
```

## Adding a Variant

Drop a new YAML file in `content/doc-resume/` or `content/doc-letter/` and pass its name as the variant argument. The YAML structure is documented in the existing files.

## CI/CD

Pushing to `main` compiles the declared variants and pushes the PDFs to a target repository. Configure which variants go live at the top of `.github/workflows/compile.yml`:

```yaml
env:
  RESUME_VARIANT: devops-resume
  LETTER_VARIANT: devops-letter
```

## License

This project is licensed under the [MIT License](LICENSE).
