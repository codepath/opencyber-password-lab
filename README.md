# Password Security Lab

This is the README documentation for the Password Security Lab, produced and maintained by [[CodePath.org]].

## Quick Start

Want to jump into the lab? Navigate to the [Part 0 Instructions](./lab/lab_part0.md) to get started!

## About this Lab

The Password Security Lab is designed to teach you about password security, cracking techniques, and the tools used in the industry. You'll gain hands-on experience with real-world scenarios and learn how passwords can be compromised. This will help you understand the importance of strong passwords and secure authentication methods.

### Learning Objectives

- Run programs in a bash command line environment
- Understand password security concepts and best practices
- Use John the Ripper to crack password hashes
- Analyze and interpret the results of password cracking attempts

### Lab Activities

0. Set up the lab environment using Docker.
1. Learn: Password Cracking 101
2. Apply: Crack a Small File (4 passwords)
3. Challenge: Crack the Leaked Passwords (1000 passwords!)

## Technical Details

### Provided Tools

In the provided Docker container, you will find all the necessary tools and dependencies pre-installed. This includes:

- `bash` - A Unix shell and command language (this is how you will interact with the container)
- John the Ripper (`john`) - A password cracking tool, and the main focus of this lab
- `less` - A text file viewer
- `wget` - A utility for downloading files from the web
- `unzip` - A utility for extracting compressed files

In addition, you may use built-in commands such as `ls`, `cd`, and `cat` to navigate and manipulate files within the container.

### Provided Files

You'll find the following files in your lab environment:

- `crackfiles.zip` - A ZIP archive containing simulated password files to crack
- `password_leak.txt` - A text file of a simulated "password leak", containing hashes for 1000 passwords to crack
