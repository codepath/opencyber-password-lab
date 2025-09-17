# Password Security Lab

This is the README documentation for the Password Security Lab, produced and maintained by [CodePath.org](https://codepath.org).

## Quick Start

Want to jump into the lab? Navigate to the [Part 0 Instructions](./instructions/lab_part0.md) to get started!

## About this Lab

<img src="https://i.imgur.com/SJoYQ10.png" style="width: 60%; min-width: 350px;" alt="Screenshot of provided Docker Container printing welcome message for Password Security Lab"></img>

The Password Security Lab is designed to teach you about password security, cracking techniques, and the tools used in the industry. You'll gain hands-on experience with real-world scenarios and learn how passwords can be compromised. This will help you understand the importance of strong passwords and secure authentication methods.

### Learning Objectives

- Run programs in a bash command line environment
- Understand password security concepts and best practices
- Use John the Ripper to crack password hashes
- Analyze and interpret the results of password cracking attempts

### Lab Activities

0. [Set up the lab environment using Docker.](./instructions/lab_part0.md)
1. [Learn: Password Cracking 101](./instructions/lab_part1.md)
2. [Apply: Crack a Small File (4 passwords)](./instructions/lab_part2.md)
3. [Challenge: Crack the Leaked Passwords (1000 passwords!)](./instructions/lab_part3.md)

## Technical Details

### Provided Tools

In the provided Docker container, you will find all the necessary tools and dependencies pre-installed. This includes:

- `bash` - A Unix shell and command language (this is how you will interact with the container)
- John the Ripper (`john`) - A password cracking tool, and the main focus of this lab
- `mkpasswd` - A utility for generating password hashes
- `less` - A text file viewer
- `wget` - A utility for downloading files from the web
- `unzip` - A utility for extracting compressed files

In addition, you may use built-in commands such as `ls`, `cd`, and `cat` to navigate and manipulate files within the container.