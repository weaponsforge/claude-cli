# Lite version of the Dockerfile for Claude CLI
# It does not install Playwright and Chromium

FROM node:24.11.0-bookworm AS base

# Install development tools
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    python3 \
    python3-pip \
  && rm -rf /var/lib/apt/lists/*

# Create app directory and hand ownership to the non-root user
WORKDIR /opt/app

# Node.js dependencies, Next.js artifacts, and build temporary directories
RUN mkdir -p \
  /opt/app/node_modules \
  /opt/app/.next \
  /opt/app/node_modules/.vite \
  /opt/app/node_modules/.tmp \
  && chown -R node:node /opt/app

# Switch to the non-root user
USER node
ENV PATH="/home/node/.local/bin:${PATH}"

# Install Claude Code using the official Linux installer
RUN curl -fsSL https://claude.ai/install.sh | bash
RUN claude --version

# Use a more appropriate entrypoint
CMD ["bash"]
