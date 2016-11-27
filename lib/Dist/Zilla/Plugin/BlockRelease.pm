use strict;
use warnings;
package Dist::Zilla::Plugin::BlockRelease;
# vim: set ts=8 sts=4 sw=4 tw=115 et :
# ABSTRACT: Prevent a release from occurring
# KEYWORDS: plugin distribution release sanity safety prevent

our $VERSION = '0.004';

use Moose;
with 'Dist::Zilla::Role::BeforeRelease',
    'Dist::Zilla::Role::Releaser';

use Term::ANSIColor 3.00 'colored';
use namespace::autoclean;

sub BUILD
{
    my $self = shift;
    $self->log('releases will be prevented!');
}

around dump_config => sub
{
    my ($orig, $self) = @_;
    my $config = $self->$orig;

    my $data = {
        blessed($self) ne __PACKAGE__ ? ( version => $VERSION ) : (),
    };
    $config->{+__PACKAGE__} = $data if keys %$data;

    return $config;
};

sub before_release
{
    my $self = shift;
    $self->log_fatal(colored('halting release', 'yellow'));
}

sub release {}

__PACKAGE__->meta->make_immutable;
__END__

=pod

=head1 SYNOPSIS

In your F<dist.ini>:

    [BlockRelease]

=head1 DESCRIPTION

This plugin, when loaded, prevents C<dzil release> from completing. It is
useful to include temporarily, while developing (perhaps while using some
development-only requirements or code, to guard against an accidental release.

Load it last to allow all other C<BeforeRelease> plugins to still perform
their checks, or first to stop these pre-release checks from occurring.

=for Pod::Coverage BUILD before_release release

=cut
