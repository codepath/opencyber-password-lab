# Part 0 | Set up the lab environment using Docker

**Estimated Time:** 15 minutes

**Environment:** Your own computer

**Tools Needed:** Docker, make

**[Back to home](https://github.com/codepath/opencyber-password-lab)**

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