use utf8;
package MyApp::Schema::Result::Foo;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

MyApp::Schema::Result::Foo

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<foo>

=cut

__PACKAGE__->table("foo");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 message

  data_type: 'varchar'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "message",
  { data_type => "varchar", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2018-03-22 12:22:06
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:/Fe7gWoY3dkurgXxtt7AOA

# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
