#!/usr/bin/env perl
use strict;
use warnings;
use App::Prove;
use File::Temp 'tempfile';
use Data::Dump 'pp';
use FindBin;

use lib "$FindBin::Bin/../lib";

# create temorary DB
use Test::DBIx::Class {
    schema_class => 'MyApp::Schema',
    connect_info => [ 'dbi:SQLite:dbname=unittest.db', '', '' ],
};

# insert fixtures
ResultSet('Foo')->create( { message => "Hello World" } );

# grab connection info from Schema
my $connect_info = Schema->storage->connect_info->[0];
my $config       = {
    dsn      => $connect_info->{dsn},
    user     => $connect_info->{user},
    password => $connect_info->{password},
};

# write config to a temporary file
my ( $fh, $config_file ) = tempfile( 'tmpconfigXXXX', DIR => '.', UNLINK => 1 );
print $fh pp $config;
close $fh or die $!;

# force mojo to use temporary config
$ENV{MOJO_CONFIG} = $config_file;

# run prove
my $app = App::Prove->new;
$app->process_args(@ARGV);
exit $app->run ? 0 : 1;
