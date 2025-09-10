# Part 1 | Learn: Password Cracking 101

**Estimated Time:** 45 minutes

**Environment:** Our provided docker container (see [Part 0](./lab_part0.md) for setup instructions)

**Tools Needed:** `john`, `less`, `wget` (these are already installed for you!)

**[Back to home](./instructions.md)**

## Instructions

### Step 0: The "What" and "Why" of password hashes

> [!NOTE]
> This section provides key background information the importance of password hashing and the risks of storing passwords in plain text. The actual lab instructions begin in Step 1.

Let's say you are the lead developer of PathCode.com, a social media website. When users sign up, they create a password. They expect to be able to use this password to log in, over and over again.

Storing passwords in **plain text** is a huge security risk. If an attacker gains access to the database, they can instantly see all user passwords. Not good!

#### Hash functions

A [Cryptographic hash function](https://en.wikipedia.org/wiki/Cryptographic_hash_function) is a **one-way** calculation that takes an input (like a password) and produces a **consistent** output.

This means:
- A hash will always produce the same output for the same input, and even a small change in the input will produce a very different output.
- This process is designed to be irreversible, meaning you can't take the hash and convert it back to the original input.

#### Hashing passwords

Let's go back to the scenario. You're the lead developer of PathCode.com, and I'm requesting to make an account on your server:

```text
username: t_lee
password: chinchillaFriend42
```

Rather than risk storing my password directly, you calculate the hash for my password. In this case, let's say `chinchillaFriend42`, hashes to `6ccf`. 

You save this in your database:

```text
user=t_lee,password=6ccf
```

Later, I try to log in with the password `chinchillaEnemy42`.

You calculate the hash for `chinchillaEnemy42`, which hashes to `29da`. Then you compare that result to your database.

Since `29da` isn't the same as `6ccf`, you now know I **didn't send the correct password** -- even though you didn't store my actual password!

>[!IMPORTANT]
> Passwords are stored as hashes, not plain text. To determine if a user entered their password correctly, you must hash the entered password and compare it to the stored hash.

### Step 1: Exploring the password files

Alright, let's get started!

- [ ] From your Docker container, run `ls` to **l**i**s**t the files in your directory. Look for the file `crackfiles.zip`.

🎯 **Checkpoint 1.1**: You should have located the file `crackfiles.zip` on your Ubuntu VM.

Next, go ahead and unzip the folder (you can use the `unzip` command) and take a look at the files created (using `ls`).  You should have:

- `crackA.txt`
- `crackB.txt`
- `crackC.txt`
- `crackChallenge.txt`
- `lower.lst`

As you can probably guess, all of the `crackX` files are password files! To look at them, you can use the `less` command.  

- [ ] Try using `less crackA.txt` to view the first password file.  What do you think the fields mean?

> [!TIP]
> Press the `q` key to exit the `less` screen and return to your terminal.

The other file, `lower.lst`, is a wordlist file... we'll get to that in the next step.

🎯 **Checkpoint 1.2**: We can view our individual password files and are ready to start cracking!

> [!CAUTION]
> Cracking password hashes can be illegal and unethical. Always have permission before attempting to crack any passwords.
> You should only crack hashes that you own or have explicit permission to test, like the ones provided in this lab.

### Step 2: Cracking with wordlists

Since **hash functions are one-way**, we can't just "calculate" the password for a hash. Instead, we'll use a technique called **cracking**:

- First, we'll identify the hashing algorithm used to create the hash.
- Next, we'll use a **wordlist** to make educated guesses about the password.
- Finally, we'll compare the hashes and hopefully find a match!

As you might expect, guessing every possible password could take an infinitely long amount of time. Instead of going in blind, people create text files full of the most commonly used passwords -- Literally, a pass***word-list***.  

In this step, we'll add some popular **wordlists** to our Ubuntu boxes, and explore a bit.  

- [ ] Run the following command: `wget https://github.com/brannondorsey/naive-hashcat/releases/download/data/rockyou.txt`

Awesome!  We have the `rockyou.txt` wordlist, which is what real-world password crackers use!  Use the `ls` command to make sure you got the file:

```bash
student@containerid:~$ ls
crackfiles.zip  rockyou.txt  cp_leak.txt
```

- [ ] Run the following command: `less -N ./rockyou.txt`
  - (The `-N` flag makes line numbers show up.  If you don't want line numbers, you can run `less` without it.)

> [!TIP]
> ✨To learn more about `less` controls, try asking ChatGPT for a cheat sheet of helpful commands. Explain what you're trying to do and be clear about how you want the tool to respond.

Now that you're in there you can actually do some searching with the `&` key. 

- [ ] Type `&puppy` then hit <kbd>Enter</kbd> to see all entries that contain the text `"puppy"`. 

```bash
   1556 puppy
   1647 puppylove
   2769 puppy1
   3412 puppys
   3664 puppydog
   8464 puppyluv
  11011 puppy123
  13688 puppylove1
  15080 puppy2
  ... //etc
```

Now it's your turn!'

- [ ] Try out some other options and explore what sorts of passwords people thought were secure at one time or another.

> [!CAUTION]
> If you choose to search for your own password, make sure no one else can see your screen!  

> [!NOTE]
> For this lab, we're not going to use `rockyou.txt`.  Why?  Because it's **big**, and takes a **long time** to run.  Instead, we'll use a much smaller wordlist, the provided `lower.lst`.  Feel free to check it out too with `less -N lower.lst`!

🎯 **Checkpoint 2**: We know where our wordlists are, and have taken a peek inside them!

### Step 3: Cracking passwords with John

This is the step you've been waiting for!  It's time to crack the passwords in the provided file.  We're going to do this in a few different ways:

- [ ] Run John against our files in single crack mode
- [ ] Run John against our files in wordlist crack mode
- [ ] Stop and resume John in the middle of a crack.
- [ ] Run John against our files in incremental mode (brute-force)
- [ ] Stop John WITHOUT saving our place in the algorithm

-----

**SINGLE CRACK MODE (`crackA.txt`)** 

Single crack is a mode that uses information about the user (stored in [the GECOS fields](https://en.wikipedia.org/wiki/Gecos_field)) to make educated guesses about the password.  
- For example, if the username is admin, single-crack mode will guess passwords like admin, admin1, ADMIN, admin=, etc... 

GECOS fields aren't commonly used today, but they could also contain information like the user's full name, email address, and phone numbers. 
- If this data exists, John will use elements from all these fields to make guesses. 

✏️ Your turn!
- [ ] First, take a look at `crackA.txt`.  What additional data do you see for users `squirtle`, `charmander`, and `bulbasaur`?
- [ ] Now let's try running John in single crack mode: `john --single crackA.txt`
  - Did the passwords crack?
  
Successful cracking will look something like this, except... we've censored the last two passwords!

```bash
codepath@lab000001:~$ john -single crackA.txt 
Using default input encoding: UTF-8
Loaded 3 password hashes with 3 different salts (md5crypt, crypt(3) $1$ (and variants) [MD5 512/512 AVX512BW 16x3])
Press 'q' or Ctrl-C to abort, almost any other key for status
waterSquirtle    (squirtle)     
███████████      (charmander) 
██████████       (bulbasaur)    
```

🎯 **Checkpoint 3**: You should have successfully all three pokemon's passwords!   Run `john --show crackA.txt` to view them.

Okay, but what about one of our other files?  🤔
- [ ] Try running John in single crack mode against `crackB.txt`
  - (If you open this file, you'll notice there's no GECOS field data!)

Uh oh!  We may need something fancier for this one...

-----

**WORDLIST MODE (`crackB.txt`)**

Let's bring back the wordlists from step 2!  John's **wordlist mode** will take any wordlist as a dictionary and try every password in there.  (It will also do basic *mangling*, trying different mixes of upper/lowercase letters, etc.)

**🔑 Jim**'s password is crackable with the wordlist directly. Let's start with that:

- [ ] `john --wordlist=lower.lst crackB.txt`

Ugh.... this is taking FOREVER.  What if my laptop dies, I have something else to do, etcetera?

- [ ] Stop `john` any time by pressing the <kbd>q</kbd> key.  It may take a moment while John saves your place!
- [ ] Resume any time by running: `john --restore`
- [ ] Wait for John to finish.  It may take 2-3 minutes.  Press any key (except `q`) to see your progress!

If all goes well, you should crack one of the passwords!  (Oh, Jim...)  But there are three passwords in the file.  To get the other passwords, we'll need to add some *mangling rules*:

**🔑 Dwight** used some [l33tspeak](https://en.wikipedia.org/wiki/Leet), which we can check for with `--rules=l33t`
- [ ] `john --wordlist=lower.lst crackB.txt --rules=l33t`
  - Once it cracks, go ahead and stop `john`.

**🔑 Pam** tried mixing up her lower and upper case letters.  
- [ ]  `john --wordlist=lower.lst crackB.txt --rules=shifttoggle`
  - Sneaky, Pam, but we still got it!

🎯 **Checkpoint 4**: You should have successfully cracked Jim, Dwight, and Pam's passwords!   Run `john --show crackB.txt` to view them.

-----

**INCREMENTAL MODE (`crackC.txt`)**

Finally, there's incremental. This mode is the most powerful... but also the most slow.

Have you ever tried to guess someone's PIN number by just trying things? *1111, 1112, 1113, etc..*  Well, John's incremental mode does this at a huge scale.
- By default, it will try every legal permutation of all 97 ASCII characters up to 13 characters long.  That's over **67 septillion** possibilities, and will take a **really long time**.  
- To speed things up, we can make some educated guesses about how people *usually* construct their passwords.

**🔑 `pinball`**: This password is strictly **numeric** and **4-6 digits long**.
- [ ] `john --incremental=digits --min-length=4 --max-length=6 crackC.txt`
- [ ] Once `pinball` cracks, stop John with <kbd>q</kbd>

**🔑 `pacman`**: This password follows a common pattern: A number, an uppercase letter, and some lowercase letters.  To do this, we'll use a mask. 
- [ ] `john --mask=?d?u?l?l crackC.txt`
  - Where '?u' represents an uppercase letter, '?l' represents a lowercase letter, and '?d' is a digit.  
- [ ] Once `pacman` cracks, you can stop John if it's not done yet.

**🔑 `frogger`**: This password follows an even more common pattern: A 4-letter word, a number, and an exclamation mark!  (Ever make a password that resembles that?)
- [ ] Take a guess at what the `--mask` should be.  (Hint: You can put the `!` directly into the mask)

<details> 
  <summary>💡 Stuck?</summary>
  Try this:  `john --mask=?l?l?l?l?d! crackC.txt`
</details>

🎯 **Checkpoint 5**: You should have successfully cracked all the games' passwords!   Run `john --show crackC.txt` to view them.

For more information on masking, check out: https://www.openwall.com/john/doc/RULES.shtml

> [!TIP]
> John auto-saves where it is in it's guessing scheme every 10 minutes by default.
> If you stop it mid-way, it will attempt to save its place so you can resume later, which can take some time. If you want it to stop quickly, and don't care if it saves your place, you can hit <kbd>Ctrl</kbd>-<kbd>C</kbd> TWICE to force John to exit.

> [!IMPORTANT]
> You've completed Part 1 of the Password Security Lab!

### Extra Info

#### Auto mode

Finally, if you just need it cracked and don't care about optimizing it... John does have an "auto-run" mode.  

It will try the following, in order, until it is successful:
- single-crack mode 
- wordlist mode (using John's built-in `password.lst` wordlist)
- incremental mode (brute-force)

This is the simplest mode to invoke.  Simply run:

```bash
$ john crackA.txt
```

This mode can be useful, but it may not be optimal if you already have some information about the password(s) in question!

#### Config files

We've already seen that John stores cracked passwords.  To check what we've already cracked for a file, we can use the `--show` option when we run John:

```bash
$ john --show crackA.txt
```

If you want to view all passwords in John's memory, you'll need to look inside the John installation `/opt/john/run`.

- [ ] Try using `less` to view all passwords in `/opt/john/run/john.pot`.

Another important file is the configuration file `john.conf` (also located in `/snap/john-the-ripper/610/run/john.conf`).  

- You don't need to edit it for this lab, but in a real-world pen-testing environment, you might make tweaks to `john.conf` to optimize your workflow.
- For example, you could:
  - change the default wordlist
  - use only idle time on your system so it's not bogging it down when you need to do something else
  - make it save its bookmark more or less frequently
  - have it beep if you find a password!

Finally, we can see all the different sessions you have, both the ones you aborted early and any that are still running:

```bash
$ john --status
```

Thanks for reading! Check out [Part 2](lab/lab_part2.md) of this lab for a new password cracking challenge!