#!/bin/bash

rm myapp.db
sqlite3 myapp.db <data/db.sql
dbicdump -o dump_directory=./lib MyApp::Schema 'dbi:SQLite:dbname=myapp.db'
