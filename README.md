# otca

otca is a script supporting you in quickly setting up a [public-key
infrastrcuture][x509] for [OpenVPN][openvpn] installations. Its intended to be
used in simple point-to-point setups, where you typically only have a single
server and client. While a static key setup might be easier to configure, a
certificate based approach provides additional security because of the
[SSL/TLS handshake][ssl-tls-handshake] involved (ephemeral keys, forward
secrecy).

However generating the appropriate certificates consists of multiple steps and
quickly becomes inconvinient when done manually. This is where otca comes in
handy.

It will:

 - Generate a self-signed CA

 - Generate certificates for the server and client and sign them

 - Remove CAs private key

 - Derive a configuration file from a given template for the server and client

 - Create a tarball for the server and client for quick deployment

The name otca actually stands for One-Time CA, and is a reference to the way
the CA is used, i.e. only once. The appropriate key is then permanently removed
and no further certificates can be issued by this CA. In particular it is also
not possible to revoke certificates. Since revocation can be considered to be
broken in practice anyway, this can even be considered an additional benefit as
it forces you to start from scratch.

In case of a breach, one simply can generate a new set of certificates and
replace the old ones. Given that no other parties are involved, nobody should
notice the difference.

## USAGE

Execute the `otca` script. Its options are described in detail when invoked
with the `-h` option. Basically you only need to provide a name for the client.
The default values should be sane enough in most cases.

## CONTRIBUTIONS

The source code is maintained using git. The project lives over at
[github.com][github-repo]. Contributions of any kind are highly welcome. The
simplest and fastest way for these kind of things is to use pull requests, and
report bugs or submit feature requests.

In case you are looking for something to work on, you probably want to take a
look at the [issue tracker][issue-tracker], which is used, among other things,
to coordinate the development of new features. There is more than enough work
left to do, so feel free to start hacking away ;).

## DONATIONS

[![Flattr this git repo](http://api.flattr.com/button/flattr-badge-large.png "Flattr This!")](https://flattr.com/submit/auto?user_id=johnpatcher&url=https://github.com/kbabioch/otca)

[![PayPal donation](https://www.paypalobjects.com/en_US/i/btn/btn_donate_SM.gif "PayPal")](https://www.paypal.com/cgi-bin/webscr?cmd=_donations&business=karol%40babioch%2ede&lc=DE&item_name=otca&no_note=0&currency_code=EUR&bn=PP%2dDonationsBF%3abtn_donateCC_LG%2egif%3aNonHostedGuest)

Bitcoin: `1D15BsSb3CNiH7bFgQtAY6KbBVSGKEs9Wb`

## LICENSE

[![GNU GPLv3](http://www.gnu.org/graphics/gplv3-127x51.png "GNU GPLv3")](http://www.gnu.org/licenses/gpl.html)

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.

[x509]: https://en.wikipedia.org/wiki/X.509
[openvpn]: https://openvpn.net/
[ssl-tls-handshake]: https://en.wikipedia.org/wiki/Transport_Layer_Security
[broken-revocation]: http://news.netcraft.com/archives/2013/05/13/how-certificate-revocation-doesnt-work-in-practice.html
[github-repo]: https://github.com/kbabioch/otca
[issue-tracker]: https://github.com/kbabioch/otca/issues

