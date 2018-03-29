WORKING WITH A DATABASE IN UNIT TESTS WHEN YOU HAVE A LARGE TEST SUITE, HOW TO WRAP PROVE AND MAKE STUFF AVAILABLE,
===

I gave this presentation at the London.pm technical meeting in March 2018. The title was one of the suggestions for a general topic I gave to the organizer, which he then copied, including the trailing comma. :)

Run the presentation
===

Run this using [App::revealup](https://metacpan.org/pod/App::revealup). It will run on port 5000 by default.

    $ revealup serve testing-db.md

<!-- -->

Run the demos
===

There are two folders with applications in this repository. _before_ and _after_. _before_ has a demo application that uses the _production_ SQLite database for its tests, and _after_ has the same application refactored to deploy its own unit test database for every test invocation.

The test application uses a database table to store messages, and by default always displays the latest message. You should always just run one of them at the same time because they both by default listen on the same port.

Before
---

It makes sense to re-create the production database first.

    $ cd before
    $ bin/create_db.sh

You can then start the application, which will listen on [localhost:3000](http://localhost:3000/) by default. You can add a new message by calling the `/add/:message` action.

    $ perl myapp.pl

    $ curl http://localhost:3000/add/foobar

To run the unit tests, call:

    $ prove -lv t

They should fail.

After
---

To run the refactored application, first re-create the database in the other folder.

    $ cd after
    $ bin/create_db.sh

Then start the application.

    $ perl myapp.pl

    $ curl http://localhost:3000/add/foobar

Now run the unit tests here, and they will pass.

    $ prove -lv t

<!-- -->

PDF
==

http://localhost:5000/?print-pdf# and print as PDF.
