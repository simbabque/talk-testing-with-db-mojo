requires 'App::Prove';
requires 'App::revealup';
requires 'DBIx::Class::Core';
requires 'DBIx::Class::ResultSet';
requires 'DBIx::Class::Schema';
requires 'Data::Dump';
requires 'File::Temp';
requires 'FindBin';
requires 'Mojolicious::Lite';
requires 'Moose';
requires 'MyApp::Schema';
requires 'Test::DBIx::Class';
requires 'base';
requires 'feature';
requires 'lib';
requires 'strict';
requires 'utf8';
requires 'warnings';

on test => sub {
    requires 'FindBin';
    requires 'Test::Mojo';
    requires 'Test::More', '0.88';
};

