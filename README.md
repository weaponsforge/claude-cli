## claude-cli

This repository contains Docker files and recommended configurations for a quick and minimal setup of the [Claude Code CLI](https://docs.anthropic.com/en/docs/claude-code/overview), installing it in an isolated container to avoid direct installation in a host machine.

> [!NOTE]
> This Docker setup similar to [weaponsforge/gemini-cli](https://github.com/weaponsforge/gemini-cli) but for **Claude Code CLI**.

> [!IMPORTANT]
> Claude Code CLI needs an Anthropic account with **at least $5 credits** or a **Pro** or **Max subscription** to run.<br>
> Use the browser-based [Claude AI](https://claude.ai/) if you do not wish to add credits or upgrade billing from a Free plan.

<br>

### 📋 Requirements

1. Anthropic account
   - With **at least $5 credits** or a **Pro** or **Max subscription** (only when using the Claude Code CLI)
   - > 💡 **NOTE:** Using a Free-plan Anthropic account works with [Claude AI](https://claude.ai/) for limited usage.
2. (Optional) Anthropic API Key
   - This key is tied to the **Anthropic account**.
   - It is an optional method for using the **Claude Code CLI** instead of using the login-generated key.
   - Generate an Anthropic key at the [Anthropic Console](https://console.anthropic.com/settings/keys)
2. Docker
   - Windows OS (Docker Desktop): Docker version 27.4.0, build bde2b89
   - Linux/Mac OS: _(applicable Docker versions)_

Demo

_(To be updated)_

## 🛠️ Installation

1. Clone this repository.
   - `git clone https://github.com/weaponsforge/claude-cli.git`

2. **(Optional) To use an Anthropic API Key:** Create a `.env` file from the `.env.example` file. Replace the value of the `ANTHROPIC_API_KEY` with your own Anthropic API key.

   | ID | Description |
   | --- | --- |
   | ANTHROPIC_API_KEY | Anthropic API key |

   > **INFO:** Use this key when prompted to change keys after login within the CLI (**Usage - step #4**)

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
   ```sh
   docker compose up -d
   ```

2. Verify the container is running.
   ```sh
   docker ps
   ```

3. Start the Claude Code CLI from the container's command line.
   ```sh
   docker exec -it weaponsforge-claude-cli claude
   ```

4. Initialize the Claude Code CLI.
   - Select a theme (eg., "Dark Mode")
   - Select a login method
      - Select **2. Anthropic Console account/API Usage billing** if not subscribed to Pro or Max subscription
      - Open the resulting URL in a web browser.
      - Authorize Claude Code to connect with your Anthropic organization when prompted
      - Copy the resulting code back to the Claude CLI
   - When prompted with: "Detected a custom API key in your environment", "Do you want to use this API key?"
      - Choose between `Yes` or `No`.
   - Read and continue with the proceeding initialization prompts

4. Use the Claude Code CLI.
   - Type messages or prompts in the Claude Code CLI's input message area.
   - Use the `projects/` folder to reference codes or repositories within the Claude Code CLI (mounted as Docker volumes) eg., `@projects/my-app`

5. Exit the Claude Code CLI.
   - Type `/exit` or press `Ctrl + C`

6. Stop the container.
   ```sh
   docker compose down
   ```

7. Verify the container stopped running. The following should yield empty logs.
   ```sh
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

