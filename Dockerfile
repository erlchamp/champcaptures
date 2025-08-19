# ---- build stage -------------------------------------------------------------
FROM debian:bookworm-slim AS build
ARG HUGO_VERSION=0.141.0
ARG GO_VERSION=1.23.3

# Optional: pass Tina tokens at build time ONLY if they're safe to publish.
# ARG TINA_CLIENT_ID
# ARG TINA_TOKEN
# ARG TINA_SEARCH_TOKEN
# ENV TINA_CLIENT_ID=$TINA_CLIENT_ID
# ENV TINA_TOKEN=$TINA_TOKEN
# ENV TINA_SEARCH_TOKEN=$TINA_SEARCH_TOKEN

ENV DEBIAN_FRONTEND=noninteractive \
    PATH="/usr/local/go/bin:${PATH}" \
    HUGO_ENV=production

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates curl wget git tar xz-utils nodejs npm \
 && rm -rf /var/lib/apt/lists/*

# Install Hugo Extended
RUN wget -O /tmp/hugo.deb https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_linux-amd64.deb \
 && apt-get update && apt-get install -y /tmp/hugo.deb \
 && rm -f /tmp/hugo.deb

# Install Go (for Hugo Modules)
RUN wget -O /tmp/go.tar.gz https://dl.google.com/go/go${GO_VERSION}.linux-amd64.tar.gz \
 && tar -C /usr/local -xzf /tmp/go.tar.gz \
 && rm -f /tmp/go.tar.gz

WORKDIR /src
# Install NPM deps first for better layer caching
COPY package*.json ./
RUN npm ci
# Project files
COPY . .

# If you have a setup script (as in your GH Actions): 
# this usually pulls themes, sets up modules, copies assets, etc.
RUN npm run project-setup

# Build the static site (you can also call `hugo --minify` directly)
RUN npm run build
# Result goes to /src/public

# ---- runtime stage (non-root nginx on 8080) ---------------------------------
FROM nginxinc/nginx-unprivileged:stable-alpine
# Basic hardening & caching rules; provides /healthz too
COPY ./ops/nginx/default.conf /etc/nginx/conf.d/default.conf

# Copy built site
COPY --from=build /src/public /usr/share/nginx/html

EXPOSE 8080
# USER is already non-root (101) in this image
CMD ["nginx", "-g", "daemon off;"]