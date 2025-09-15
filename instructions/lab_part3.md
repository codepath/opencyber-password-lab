# Password Security Lab: Part 3

[*(back to home)*](https://github.com/codepath/opencyber-password-lab)

Lab Parts:

0. [Set up the lab environment using Docker.](./lab_part0.md)
1. [Learn: Password Cracking 101](./lab_part1.md)
2. [Apply: Crack a Small File (4 passwords)](./lab_part2.md) 
3. [Challenge: Crack the Leaked Passwords (1000 passwords!)](./lab_part3.md) (✅ You are here!)

## Part 3 | Challenge: Crack the Leaked Passwords (1000 passwords!)

**Estimated Time:** 120 minutes

**Environment:** Our provided docker container (see [Part 0](./lab_part0.md) for setup instructions)

**Tools Needed:** `john`, `less`, `wget` (these are already installed for you!)

**[Back to home](https://github.com/codepath/opencyber-password-lab)**

## Instructions

### Context

For this challenge, you'll be working with a (fictional) **leaked password file**, modeled after famous data breaches such as the [2012 LinkedIn Hack](https://en.wikipedia.org/wiki/2012_LinkedIn_hack) and [2016 Yahoo Data Breaches](https://en.wikipedia.org/wiki/Yahoo!_data_breaches). In both of these incidents, usernames and hashed passwords were leaked in simple `txt` files, making people's private data available to anyone who could crack the hashes.  

Your task is simple: Crack as many hashes as possible, so those passwords can be removed from production and those users' accounts secured.


> [!IMPORTANT]
> To help guide your cracking efforts, you've been provided with some metadata about the leaked passwords. This metadata can help you prioritize your cracking efforts by focusing on the most common password lengths and likely words used.
>
> <img src="https://i.imgur.com/ZZ9mszz.png" style="width: 60%; min-width: 350px;" alt="password_leak.txt inforgraphic, stating primary user language is English and a histogram showing frequency of password lengths (2, 13, 87, 284, 487, 107, 18, and 2 passwords of lengths 1, 2, 3, 4, 5, 6, 7, 8, respectively)."></img>

### Challenge Goal

- [ ] Your goal is to crack hashes in the `part3/password_leak.txt` file on your Docker container, using what you learned in [Part 1](./lab_part1.md) and [Part 2](./lab_part2.md).
- [ ] There are 1000 hashes in `password_leak.txt`, but completion of this challenge requires you to crack 25%, or 250 passwords.
  - [ ] For each additional 25% cracked, you'll earn 1 bonus point.

> [!TIP]
> To check how many passwords you've cracked so far, run `john --show part3/password_leak.txt`


> [!WARNING]
> This challenge is designed to be difficult, and getting 100% of the passwords cracked is not expected!
> 
> That said, if you do manage this extremely tricky task... you'll win some serious bragging rights. 😎


### How to Succeed

- **Utilize wordlists**: Just using `lower.lst` isn't going to be enough here, you'll need to find and use larger, more comprehensive wordlists for this one.
- **Apply rulesets**: John comes with built-in rulesets you can apply. You can list them with a command like: `grep -E "^\[List.Rules" /opt/john/run/john.conf`
- **Use masks**: Try using masks to specify patterns for the passwords you're trying to crack. For example, you could use a mask like `--mask='?l?l?l?l?l?l'` to target 6-character lowercase passwords.
- **Don't wait forever**: If you find a command is taking too long, don't hesitate to stop it and try a different approach. (It's possible reach the required 250 cracks in 30 minutes or less!)
- **Leverage AI tools**: Consider using AI tools to help you analyze the password patterns and suggest cracking strategies.
  - Try asking ChatGPT to help you read through [the John docs](https://www.openwall.com/john/doc/RULES.shtml) and identify useful rules and strategies.
  - If you have an idea for an approach or strategy, you can ask ChatGPT for feedback or suggestions on how to refine it.
