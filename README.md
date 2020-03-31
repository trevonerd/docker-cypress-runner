# Docker Cypress Runner

A docker image with Cypress installed, ready for your E2E needs.
It's based on cypress/browsers:node10.16.0-chrome77-ff71, which includes Chrome 77 and Firefox 71.

See it in Docker hub: https://cloud.docker.com/repository/docker/rdelafuente/cypress

There is a CircleCI hourly build that pulls the latest Cypress, tags it, and pushes it.

## How to use

### Use directly

```bash
docker run -v /my/project:/workdir trevonerd/cypress
```

### Or build your own image:

```dockerfile
FROM    trevonerd/cypress:3.1.3
ADD     cypress cypress.json /workdir/
```

### Run your own command:
```bash
docker run trevonerd/cypress cypress run --spec ... --reporter ...
```

## Use with a specific Cypress version

You will find Cypress 4.3.0, for example, in trevonerd/cypress:4.3.0

You will also find any new Cypress versions published at most 1 hour after they reach the yarn repos.

In the unlikely case you don't want to pin down a Cypress version, you can just use trevonerd/cypress:latest for... well, for the latest Cypress.

## Why does this exist

Cypress publishes an image that contains Chrome, but it does not contain the Cypress binary.
That causes Cypress to download and unzip every time our CI builds run. That is a lot of downloading
and unzipping, with all the time waste and flakiness that comes with it.

This image is currently saving us around 1 minute per build. 
This number will vary based on the specs of your CI machines.

## If you're missing an old Cypress version

I haven't included anything before 2.0.0.
Message me or create an issue here and I'll run the script manually with the missing version.

## If you find a bug

Oops! PR the fix if you can, or raise an issue otherwise.
