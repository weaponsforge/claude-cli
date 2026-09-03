FROM node:24.11.0-bookworm AS base

# Install development tools
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    python3 \
  && rm -rf /var/lib/apt/lists/*

# Create app directory and set ownership
WORKDIR /opt/app

# Install Claude Code using the official Linux installer
RUN curl -fsSL https://claude.ai/install.sh | bash
ENV PATH="/root/.local/bin:$PATH"
RUN claude --version

# Use a more appropriate entrypoint
CMD ["bash"]
