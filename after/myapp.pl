#!/usr/bin/env perl
use Mojolicious::Lite;

use feature 'state';
use lib 'lib';

use MyApp::Schema;

helper db => sub {
    my $c = shift;

    state $schema = do {
        my $config = plugin 'Config';
        MyApp::Schema->connect(
            $config->{dsn},
            $config->{user},
            $config->{password},
        ) or die;
    };
    
    return $schema;
};

get '/' => sub {
    my $c = shift;
    $c->render( text => $c->db->resultset('Foo')->last->message );
};

get '/add/:message' => sub {
    my $c = shift;
    $c->db->resultset('Foo')->create( { message => $c->param('message') } );
    $c->redirect_to('/');
};

app->start;
