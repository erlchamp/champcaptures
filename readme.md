<h1 align="center">ChampCaptures - Photography Portfolio</h1>

<p align="center">A personal portfolio built with Hugo and Tailwind CSS, featuring a robust CI/CD pipeline and optimized image hosting.</p>

---

## 📸 Project Purpose

ChampCaptures is a personal portfolio designed to showcase high-quality images with an elegant and responsive design. Built using Hugo and Tailwind CSS, this project focuses on performance, security, and scalability, leveraging modern cloud infrastructure and automated workflows.

---

## 🛠 Tech Stack

- **Static Site Generator:** [Hugo](https://gohugo.io/)
- **CSS Framework:** [Tailwind CSS v4.0](https://tailwindcss.com/)
- **Web Server:** NGINX (for local development and future deployment)
- **Containerization:** Docker
- **Cloud & Hosting:** Google Kubernetes Engine (GKE), Google Cloud Storage (GCS) + CDN (`cdn.erloumiguel.com`)
- **CI/CD:** GitHub Actions workflows (`ci.yml`, `security.yml`, `docker.yml`)
- **Security & Quality Tools:** Snyk, Hadolint, Lighthouse, html-validate, Lychee (image link checker)

---

## ☁️ Image Hosting Migration

All images are hosted on Google Cloud Storage and served via a CDN at `cdn.erloumiguel.com` to ensure fast delivery and scalability. This migration improves site performance and reliability compared to local hosting.

---

## ⚙️ CI/CD Workflows

- **ci.yml:** Runs Hugo build, HTML validation, Lighthouse audits, and image link validation with Lychee.
- **security.yml:** Performs container image security scans using Snyk and Hadolint.
- **docker.yml:** Builds and pushes Docker images for deployment.

This automated pipeline ensures code quality, security, and smooth deployments.

---

## 📦 Repository Layout

- `assets/images/` — Stores local images used in the site before migration to CDN.
- `content/english/portfolio/` — Markdown content for portfolio items.
- `layouts/` — Hugo templates and partials, including CDN rewrite partials for image URLs.
- `.github/workflows/` — GitHub Actions workflows for CI/CD and security checks.

---

## 🚀 Getting Started

To get the project up and running locally, follow these steps:

### Prerequisites

- [Hugo Extended v0.144+](https://gohugo.io/installation/)
- [Node.js v22+](https://nodejs.org/en/download/)
- [Go v1.24+](https://go.dev/doc/install)

### Setup

1. Clone the repository:

```bash
git clone https://github.com/yourusername/champcaptures.git
cd champcaptures
```

2. Install dependencies:

```bash
npm install
```

3. Start the development server:

```bash
npm run dev
```

4. Build the static site:

```bash
npm run build
```

---

## 🎨 Customization

You can customize the site through the following configurations:

- **Site Config:** Modify `hugo.toml` to change site title, base URL, language, theme, and plugins.
- **Site Params:** Adjust parameters in `config/_default/params.toml` such as logo, favicon, SEO metadata, and search settings.
- **Colors and Fonts:** Edit `data/theme.json` to update primary/secondary colors, font families, and sizes.
- **Social Links:** Manage social media links in `data/social.json` to display on the site.

---

## 📦 Deployment Flow

The deployment process follows this flow:

1. **Push changes** to the repository.
2. **CI tests** run: Hugo build, HTML validation, Lighthouse audits, and Lychee image checks.
3. **Security scans** execute via Snyk and Hadolint.
4. **Docker image** is built and pushed if tests pass.
5. **Deployment** triggered (currently to GitHub Pages; future plans include GKE).

---

## 📝 Notes

- All images must reside in `assets/images` before being migrated to the CDN.
- Use the CDN rewrite partials in Hugo templates to serve images from `cdn.erloumiguel.com`.
- DNS and SSL for `erloumiguel.com` are managed by GitHub Pages.
- DNS and SSL for `cdn.erloumiguel.com` are handled via Google Cloud Platform.

---

## 📜 License

This project is based on the [Hugoplate](https://github.com/zeon-studio/hugoplate) starter template, which is released under the MIT license. ChampCaptures is a customized and extended version tailored specifically for personal use.

---

Thank you for exploring ChampCaptures! For questions or contributions, please open an issue or submit a pull request.
