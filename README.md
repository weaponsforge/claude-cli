## claude-cli

This repository contains Docker files and recommended configurations for a quick and minimal setup of the [Claude Code CLI](https://docs.anthropic.com/en/docs/claude-code/overview), installing it in an isolated container to avoid direct installation in a host machine.

> [!NOTE]
> This is a Docker setup similar to [weaponsforge/gemini-cli](https://github.com/weaponsforge/gemini-cli) but for **Claude Code CLI**.

### 📋 Requirements

1. Anthropic API Key
   - This requires a free (or paid) [Anthropic Console account](https://console.anthropic.com/)
   - Generate an Anthropic key at [https://console.anthropic.com/settings/keys](https://console.anthropic.com/settings/keys)

2. Docker
   - Windows OS (Docker Desktop): Docker version 27.4.0, build bde2b89
   - Linux/Mac OS: _(applicable Docker versions)_

Demo

https://github.com/user-attachments/assets/c314e1be-7315-4a45-af37-41ed050d9be3

## 🛠️ Installation

1. Clone this repository.
   - `git clone https://github.com/weaponsforge/claude-cli.git`

2. Create a `.env` file from the `.env.example` file. Replace the value of the `ANTHROPIC_API_KEY` with your own Claude Code API key.

   | ID | Description |
   | --- | --- |
   | ANTHROPIC_API_KEY | Anthropic API key |

3. (Optional) Put code repositories or directories for Claude Code CLI inspection under the `"/projects"` directory.
   - See  the [projects/README.md](projects/README.md) file for more details on organizing your project repositories.
   - **INFO:** this step is optional since the Claude Code CLI does not require code repositories to answer general prompts.

4. **Local build:** build the Docker image.
   - Run this command only during the **initial installation** or if there are **changes to the `Dockerfile`**.<br>
   - `docker compose build`

5. **Pull the pre-built Docker image**: (Optional) This repository deploys the "latest" Docker image to Docker Hub on the creation of new Release/Tags. It is available at: https://hub.docker.com/r/weaponsforge/claude-cli
   - Use this step to skip building the image locally at **step # 4**.
   - Pull the pre-built development Docker image:
      `docker pull weaponsforge/claude-cli`

## 📖 Usage

1. Run the container.
   - `docker compose up -d`

2. Verify the container is running.
   - `docker ps`

3. Start the Claude Code CLI from the container's command line.
   - `docker exec -it weaponsforge-claude-cli claude`

4. Use the Claude Code CLI.
   - Select a theme (eg., "ANSI Light")
   - Type messages or prompts in the Claude Code CLI's input message area.
   - Use the `projects/` folder to reference codes or repositories within the Claude Code CLI (mounted as Docker volumes) eg., `@projects/my-app`

5. Exit the Claude Code CLI.
   - Press `Ctrl + C`

6. Stop the container.
   - `docker compose down`

7. Verify the container stopped running. The following should yield empty logs.
   ```
   docker ps
   docker ps -a
   ```

8. Cleanup: delete unused volumes.
   - `docker volume prune`

## 📝 References

- [Claude Code Overview](https://docs.anthropic.com/en/docs/claude-code/overview)
- [Anthropic Cookbook](https://github.com/anthropics/anthropic-cookbook)
- [Development Containers](https://docs.anthropic.com/en/docs/claude-code/devcontainer)
- [Claude Code CLI Reference](https://docs.anthropic.com/en/docs/claude-code/cli-reference)

@weaponsforge<br>
20250802

