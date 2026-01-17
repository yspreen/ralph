so far this project is still in planning mode. your first step is to come up with the spec files.

Goal: create/overwrite:
1. ./entry.md
2. ./progress.txt
3. ./$system.md for each system that we will need to build

Source: read ./userinput.txt and turn it into these files. a good list of system files might be ./db-schema.md, ./frontend.md, ./backend.md, ./fly-deployment.md, ./docker.md

here's an example for each file. follow the structure closely:

./entry.md
```
We are building a web application that is deployed on fly.io. Here is a list of all the subsystems that are documented in separate markdown files:
- [Drizzle Database Scheme](./db.md)
- [Nextjs Frontend Pages](./frontend.md)
- [Hono Backend API Methods](./backend.md)

Update each file if you need to make changes to our architecture, they should remain in sync.

Our list of technologies is:
- bun, not node, npm, pnpm
- hono for backend
- statically compiled dist folder from a nextjs codebase for frontend
- drizzle ORM
- fly deployment with flycli
- shadcn
```

./progress.txt
```
Each of this steps might have subtasks, so please refer to the stepfile ./step-$n.md for details!

Pick the first task that's in progress or not yet started and pick the most important subtask to work on. You're only doing ONE subtask right now, then update the status of that subtask in ./step-$n.md and mark the whole task as done in ./progress.txt if the task is now done.

1. [NOT STARTED] Create dockerfile
2. [NOT STARTED] Hono API scaffold
3. [NOT STARTED] Add drizzle db schema
4. [NOT STARTED] Write backend routes
5. [NOT STARTED] Design frontend
5. [NOT STARTED] Deploy to fly
6. [NOT STARTED] Create and commit ./done.txt in the root of this project (i.e. ./done.txt not ./proj/done.txt)

Acceptance criteria for each full step: Passing tests. Be specific about which tests are needed in ./step-$n.md
```

In this example ./step-1.md would contain information like setting up hono, nginx as a reverse proxy to serve the static next files and hono api requests, and maybe a local test sh file which spins up postgres for running local tests.
Each progress.txt file ALWAYS ends with a step that says: "Create and commit ./done.txt in the root of this project (i.e. not ./proj/done.txt but ./done.txt)"

---

the planning phase is done when the files are all created
1. ./entry.md
2. ./progress.txt
3. ./$system.md for each system that we will need to build

do not run any code in the planning phase just write those files.
