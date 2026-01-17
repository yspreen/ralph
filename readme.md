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
