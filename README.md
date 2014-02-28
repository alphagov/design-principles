# Design Principles

This is a Rails app which essentially serves static content for various
parts of GOV.UK where we haven't yet got around to building specialist
publishing tools.

This includes [Design Principles for the Government Digital Service](https://www.gov.uk/design-principles),
the [Content style guide for the Government Digital Service](https://www.gov.uk/design-principles/style-guide),
the [Government Service Design Manual](https://www.gov.uk/service-manual) and
[Digital Transformation](https://www.gov.uk/transformation) section of GOV.UK.

For the latter 2, the actual content is in separate git repositories,
and this application is used as vehicle within which to deploy that content.

Assumes the GDS development environment is setup via puppet.

## Run Design Principles

    ./startup.sh


## Content Style guide

The [style guide for GOV.UK](https://www.gov.uk/design-principles/style-guide).

## What's New section for the Style guide

This section is [generated from a](config/whats-new.yaml)
[YAML](http://en.wikipedia.org/wiki/YAML) file, to provide an
[Atom](http://en.wikipedia.org/wiki/Atom_(standard))
[feed](https://www.gov.uk/design-principles/style-guide.atom) and
[HTML representation](https://www.gov.uk/design-principles/style-guide/whats-new).

## Digital by Default Service Manual
### How Search Works

This app provides a search interface for the Digital by Default Service Manual.
That search is exposed at /service-manual/search.

#### Indexing content

* Content for search should be placed in JSON files in ```db/index``` eg. ```db/index/service-manual.json``` (this is done during the compilation step that adds the manual content to this repository)
* The rake task ```rake rummager:index``` will post these to the rummager service for inclusion in an index called 'service-manual'
* That task is run upon deployment
