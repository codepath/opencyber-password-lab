# Password Security Lab: Part 0

[*(back to home)*](https://github.com/codepath/opencyber-password-lab)

Lab Parts:

0. [Set up the lab environment using Docker.](./lab_part0.md) (✅ You are here!)
1. [Learn: Password Cracking 101](./lab_part1.md)
2. [Apply: Crack a Small File (4 passwords)](./lab_part2.md)
3. [Challenge: Crack the Leaked Passwords (1000 passwords!)](./lab_part3.md)

## Part 0 | Set up the lab environment using Docker

**Estimated Time:** 15 minutes

**Environment:** Your own computer

**Tools Needed:** Docker

## Instructions

Follow these steps to set up your lab environment:

- [ ] Make sure you have Docker installed and running on your computer.
  - **Mac**: [Download Docker Desktop for Mac](https://docs.docker.com/desktop/install/mac-install/)
  - **Windows**: [Download Docker Desktop for Windows](https://docs.docker.com/desktop/install/windows-install/)
  - **Linux**: [Install Docker Engine](https://docs.docker.com/engine/install/) (or [Docker Desktop for Linux](https://docs.docker.com/desktop/install/linux/))
  - Once installed, open Docker Desktop and confirm it's running before continuing.

- [ ] Open a terminal on your computer:
  - **Mac**: Open **Terminal** (search "Terminal" in Spotlight with ⌘+Space)
  - **Windows**: Open **Command Prompt** or **PowerShell** (search either in the Start menu)
  - **Linux**: Open your system's terminal emulator

- [ ] Run the Lab container with `docker run --rm -it ghcr.io/codepath/opencyber-password-lab:latest`

At this point, you should see a `student@...~$` prompt, indicating that you are inside the Docker container.

If so, you are ready to [**proceed to Part 1**](./lab_part1.md).

> [!TIP]
> If you have issues pulling the image, you can build it manually by cloning this repository and running:
>
> ```bash
> git clone https://github.com/codepath/opencyber-password-lab.git
> cd opencyber-password-lab
> docker build --target john-builder -f docker/Dockerfile .
> docker build -t opencyber-password-lab:local -f docker/Dockerfile .
> docker run --rm -it opencyber-password-lab:local
> ```
