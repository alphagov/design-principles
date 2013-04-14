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
