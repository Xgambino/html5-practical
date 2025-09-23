# Stage 1: no build step (static HTML+CSS)
FROM docker.io/library/nginx:alpine

# Copy site into nginx web root
COPY . /usr/share/nginx/html

# Health check (simple HTTP 200 on /)
HEALTHCHECK --interval=30s --timeout=3s \
  CMD wget -qO- http://localhost:80/ >/dev/null || exit 1
