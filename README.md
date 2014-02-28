# Design Principles

Design Principles for the Government Digital Service.

Assumes the GDS development environment is setup via puppet.

## Run Design Principles

    ./startup.sh

## How Search Works

This app provides a search interface for the Digital by Default Service Manual.
That search is exposed at /service-manual/testsearch and should be moved once
it is ready to go public.

### Indexing content

* Content for search should be placed in JSON files in ```db/index``` eg. ```db/index/service-manual.json``` (this is done during the compilation step that adds the manual content to this repository)
* The rake task ```rake rummager:index``` will post these to the rummager service for inclusion in an index called 'service-manual'
* That task is run upon deployment

# Content Style guide

The [style guide for GOV.UK](https://www.gov.uk/design-principles/style-guide).

## What's New section for the Style guide

This section is [generated from a](config/whats-new.yaml)
[YAML](http://en.wikipedia.org/wiki/YAML) file, to provide an
[Atom](http://en.wikipedia.org/wiki/Atom_(standard))
[feed](https://www.gov.uk/design-principles/style-guide.atom) and
[HTML representation](https://www.gov.uk/design-principles/style-guide/whats-new).
