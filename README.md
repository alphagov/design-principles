# Design Principles

This is a Rails app which essentially serves static content for various
parts of GOV.UK where we haven't yet got around to building specialist
publishing tools.

This includes [Design Principles for the Government Digital Service](https://www.gov.uk/design-principles) and
[Digital Transformation](https://www.gov.uk/transformation) section of GOV.UK.

The actual content of Digital Transformation is in a separate git repository,
and this application is used as vehicle within which to deploy that content.

Assumes the GDS development environment is setup via puppet.

## Run Design Principles

    ./startup.sh

## What's New section for the Style guide

This section is [generated from a](config/whats-new.yaml)
[YAML](http://en.wikipedia.org/wiki/YAML) file, to provide an
[Atom](http://en.wikipedia.org/wiki/Atom_(standard))
[feed](https://www.gov.uk/design-principles/style-guide.atom) and
[HTML representation](https://www.gov.uk/design-principles/style-guide/whats-new).
