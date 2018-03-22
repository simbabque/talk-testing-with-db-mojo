use Test::More;
use Test::Mojo;

use FindBin;
require "$FindBin::Bin/../myapp.pl";

my $t = Test::Mojo->new;
$t->get_ok('/')->status_is(200)->content_like(qr/Hello/);

$t->get_ok('/add/unittest')->status_is(302);

$t->get_ok('/')->status_is(200)->content_like(qr/unittest/);

done_testing;
