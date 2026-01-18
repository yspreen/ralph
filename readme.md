![](./ralph.webp)

# My Take On The Ralph Loop

Inspired by the [original blogpost](https://ghuntley.com/ralph/) and theo's coverage of it.

Put your vague project description into `./userinput.txt` and let it rip:

```sh
./ralph.sh
```

Or, on mac, if you want an audio queue when the loop finishes:

```sh
./ralph.sh; say Done
```

You can optionally get feedback on your userinput before starting the loop with something like:

```
Can you give me feedback on ./userinput.txt?
Is this project definition complete and understandable?
Is there a definition of done? Does it include which tests to run?
```

and if you like the feedback

```
great please make those changes
```

# Secrets

We're prompting ralph to put all secrets into a file that he can understand: secrets.txt
It has a loose format:
```
some secret: some value
```

There's a prompt in init.sh that adapts the plan and makes sure all secrets are only stored in that file because we have a commit hook that scans all new commits for any secrets added to the code. That hook scans secrets.txt

If you're using ralph in an existing repo, chances are you have .env files and other secrets instead. Please comment out this line in init.sh:

```
	run_clod "Go into all step files (except 1, that's just init) and make sure that any time we read/write env vars for local dev or any secrets, we use ./secrets.txt and don't create multiple sources of truth for those values"
```
