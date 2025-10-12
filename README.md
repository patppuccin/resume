# RESUME - Modern ATS-Friendly Resume with Typst

A clean, ATS-friendly resume template built with Typst. Features a two-column layout optimized for readability and information density.

The published version of the resume can be found [here](https://patrickambrose.com/resume-patrick-ambrose.pdf).

## Features

- **ATS Friendly**: Structured markup that applicant tracking systems can easily parse
- **YAML Configuration**: Separate your content from layout—edit your resume data in a simple YAML file
- **Two-Column Layout**: Experience and projects on the left, skills and details on the right
- **Sleek and Modern**: Uses Space Grotesk font for a contemporary look with clean icons from [SVG Repo](https://www.svgrepo.com)

## Quick Start

> Prerequisites: Install the [Typst CLI](https://github.com/typst/typst#installation) on your machine.

## Project Structure

```
├── assets/
│   ├── fonts/                 # Space Grotesk font files
│   └── icons/                 # SVG icons for contact info
├── layout.typ                 # Template and styling functions
├── resume-config.yaml         # Resume data (configuration - edit this file)
├── resume-entrypoint.yaml     # Entrypoint for ther resume
└── resume-layout.typ          # Layout and styling
```

### Usage

1. **Clone the repository**:
   ```sh
   git clone https://github.com/patpuuccin/resume.git && cd resume
   ```

2. **Edit the information**: Edit the details in `resume-config.yaml` with the preferred editor of your choice to update your resume.

3. **Compile to PDF**:
   ```sh
   typst compile --font-path ./assets/fonts/ ./resume.typ
   ```
   
   Your resume will be generated as `resume.pdf` in the same directory.

4. **Auto-compile on changes** (optional):
   ```sh
   typst watch --font-path ./assets/fonts/ ./resume.typ
   ```

## Customization

### Updating Your Information

Edit `resume-config.yaml` with your:

- Personal details and contact information
- Work experience
- Projects
- Skills and methodologies
- Education
- Certifications

### Modifying the Layout

To customize colors, spacing, or structure, edit `resume-layout.typ`. The template uses modular functions that are easy to adjust.

### Changing Fonts

Replace the `.ttf` files in `assets/fonts/` with your preferred typeface and update the font references in `resume-layout.typ`.

## Acknowledgments

- Inspired by:
   - [alta-typst](https://github.com/GeorgeHoneywood/alta-typst) by George Honeywood
   - [vantage-typst](https://github.com/sardorml/vantage-typst) by Sardor Mamadaliev
- Icons from [SVG Repo](https://www.svgrepo.com) under their [licensing terms](https://www.svgrepo.com/page/licensing/).
- Fonts from [Google Fonts](https://fonts.google.com) under their [licensing terms](https://fonts.google.com/attribution).

## License

MIT License - see [LICENSE](./LICENSE) for details.

---

**Questions or issues?** Open an issue on GitHub or submit a pull request!