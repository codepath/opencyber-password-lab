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

**Tools Needed:** Docker, make

## Instructions

Follow these steps to set up your lab environment:

- [ ] Make sure you have Docker installed and running in your dev environment.

- [ ] Run the Lab container with `docker run --rm -it ghcr.io/codepath/opencyber-password-lab:latest`

At this point, you should see a `student@...~$` prompt, indicating that you are inside the Docker container.

If so, you are ready to [**proceed to Part 1**](./lab_part1.md).

> [!TIP]
> If you have issues, you can build manually by cloning this repository, and using the provided Makefile to build the Docker image yourself:
>
> ```bash
> git clone https://github.com/codepath/opencyber-password-lab.git
> cd opencyber-password-lab
> docker build --target john-builder -f docker/Dockerfile .
> docker build -t opencyber-password-lab:local -f docker/Dockerfile .
> docker run --rm -it opencyber-password-lab:local
> ```
