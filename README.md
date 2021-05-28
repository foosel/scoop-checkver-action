# 🥄 Scoop checkver Action

Simple action that does exactly one thing: run `checkver -u` to update the manifests in a [scoop]() bucket. 

No automatic checkout, no limitation to event triggers, no notification support. All this you can provide via separate steps in your workflow -- maximum flexibility.

## Inputs

### `bucket` (required)

Path to the bucket to update, relative to the GitHub Action workspace.

### `apps`

Which app manifests to update, comma separated list. If not provided, defaults to `*`, so all found manifests.

### `dry`

Set to any non empty string to only perform a dry-run without applying any changes.

### `force`

Set to any non empty string to force upgrade even if the version is the same. Ignored for dry-runs.

## Usage

The most basic use with manifests located in a folder called `bucket`:

``` yaml
- uses: foosel/scoop-checkver-action@main
  with:
    bucket: bucket
```

Dry-run:

``` yaml
- uses: foosel/scoop-checkver-action@main
  with:
    bucket: bucket
    dry: dry
```

Forced upgrade:

``` yaml
- uses: foosel/scoop-checkver-action@main
  with:
    bucket: bucket
    force: force
```

## Full example

Check out repository, runs checkver with upgrade and commits back the results. Runs every 30min and also on manual dispatch.

``` yaml
on:
  schedule:
    - cron: '*/30 * * * *'
  workflow_dispatch:

name: Update bucket
jobs:
  update:
    name: ♻ Update manifests
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@master
      - uses: foosel/scoop-checkver-action@main
        with:
          bucket: bucket
      - uses: EndBug/add-and-commit@v7
        with:
          message: "Updated manifests..."
          author_name: 'github-actions[bot]'
          author_email: 'github-actions[bot]@users.noreply.github.com'
```
