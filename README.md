# NAME

Dist::Zilla::Plugin::BlockRelease - Prevent a release from occurring

# VERSION

version 0.001

# SYNOPSIS

In your `dist.ini`:

    [BlockRelease]

# DESCRIPTION

This plugin, when loaded, prevents `dzil release` from completing. It is
useful to include temporarily, while developing (perhaps while using some
development-only requirements or code, to guard against an accidental release.

Load it last to allow all other `BeforeRelease` plugins to still perform
their checks, or first to stop these pre-release checks from occurring.

# SUPPORT

Bugs may be submitted through [the RT bug tracker](https://rt.cpan.org/Public/Dist/Display.html?Name=Dist-Zilla-Plugin-BlockRelease)
(or [bug-Dist-Zilla-Plugin-BlockRelease@rt.cpan.org](mailto:bug-Dist-Zilla-Plugin-BlockRelease@rt.cpan.org)).
I am also usually active on irc, as 'ether' at `irc.perl.org`.

# AUTHOR

Karen Etheridge <ether@cpan.org>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Karen Etheridge.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
