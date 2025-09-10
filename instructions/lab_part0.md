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

1. Make sure you have Docker installed and running in your dev environment.

2. Clone this repository:

```bash
git clone https://github.com/codepath/opencyber-password-lab.git
```

1. Use `make build` to build the base Docker image, then `make student` to create the student Docker image.

2. Start the Docker container with `make run`

At this point, you should see a `student@...~$` prompt, indicating that you are inside the Docker container.

If so, you are ready to [**proceed to Part 1**](./lab_part1.md).

