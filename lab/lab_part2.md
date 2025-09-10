# Part 2 | Apply: Crack a Small File (4 passwords)

**Estimated Time:** 60 minutes

**Environment:** Our provided docker container (see [Part 0](./lab_part0.md) for setup instructions)

**Tools Needed:** `john`, `less`, `wget` (these are already installed for you!)

**[Back to home](https://github.com/codepath/opencyber-password-lab)**

## Instructions

A challenger approaches!

For this challenge, you'll need to crack the password hashes provided in `crackChallenge.txt`. There are four users to crack:
- 🦜 Birb (easy)
- 🐶 Pupper (medium)
- 🐱 Kitty (hard)
- 🐺 Doggo (impossible)

Try your best!  All the tools you need are at your fingertips!

### Guidance

- [ ] If you haven't already, from your Docker container, run `unzip crackfiles.zip`.
- [ ] Take a look at the `crackChallenge.txt` file to see the hashes you need to crack.
- [ ] Think back to what you learned in [Part 1](./lab_part1.md) - you have the tools to crack these hashes!

### Password File Hints

You should make an honest effort first, but if you've been stuck for more than 20 minutes on a particular user, here are some hints:


<details> 
  <summary>🦜 Birb (easy)</summary>
  You're looking for a word included in `lower.lst` -- no mangling needed!
</details>

<details> 
  <summary>🐶 Pupper (medium)</summary>
  Have you tried looking at the `crackChallenge.txt` file?  What's different about this entry?
</details>

<details> 
  <summary>🐶 Kitty (hard)</summary>
  You still want to use `lower.list`, but you'll need a `--rules` flag...  
</details>

<details> 
  <summary>🐺 Doggo (impossible)</summary>
  It's alphanumeric and 5 digits or less.
</details>

### Completing the Challenge

Password cracking is a unique art, in that you either need to be very creative or very patient in order to succeed. This lab is not designed to make you wait around for hours!

If you spend more than 2 hours on this activity, **it's okay to move on to Part 3**, even if you didn't crack all 4 passwords.

If you did crack all 4 passwords, great work! We encourage you to try for the **stretch goals** in the Part 3 challenge.

[**Go to Part 3**](./lab_part3.md)

## Extra Practice

> 🤔 *"Wait, can people crack MY passwords?!"*

- Play around with John and see if various passwords are crackable with the wordlist here's how to create some password hashes to mess around with, try this - it will spit out a username and password line in the format john is expecting:

```bash
# You might need to install mkpasswd first, that's okay!
$ echo -n theusername: ; mkpasswd -m md5 thepassword
$ echo -n theusername: ; mkpasswd -m sha-256 thepassword
$ echo -n theusername: ; mkpasswd -m sha-512 thepassword
```

> [!TIP]
> You can save the output of the `mkpasswd` commands directly into a file you wish to use John on! For example, `echo -n theusername: ; mkpasswd -m md5 thepassword > mypasswords.txt`

> [!CAUTION]
> Using your own passwords here could expose them!
>
> Instead, try substituting a similar password to see how crackable yours is -- for example, if your passwords is `fish29`, try another 4-letter 2-number password, like `lamp36`.

MD5, SHA-256, and SHA-512 are different hash algorithms that you might find in these types of password files. They can coexist in the same file so go ahead, copy several lines with different hash mechanisms, usernames and passwords and try a few and see if John is able to crack them.

- If you have some experience with coding you may want to try writing your own password cracking program!
  - Think of both the technical elements and human elements! If a capital letter and a number are required for complexity reasons, what will a human likely do?
  - If the password requirements are at least 8 characters and less than 12 what can you do?

### ✨ AI Opportunity

Writing a password cracking program can be an arduous task depending on your experience level and how robust you want your program to be, so feel free to ask ChatGPT for help along the way or for assistance with the initial setup!

You can copy the instructions above into ChatGPT, explain what you're trying to do, and tell the AI how you'd like it to respond.

[**Go to Part 3**](./lab_part3.md)
