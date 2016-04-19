# certutils

certutils are a set of utilities built around [OpenSSL][openssl] helping you to
setup and maintain a simple [public-key infrastructure][x509]. Currently it
consists of:

 - otca: A script to quickly generate two certificates signed by a single
   certificate authority

 - certck: A script that checks certificates for their expire date

### otca

Generating the appropriate certificates consists of multiple steps and quickly
becomes cumbersome. [Easy RSA][easy-rsa], which is shipped along with OpenVPN
is a set of scripts powerful enough to deal with many PKI aspects (e.g. issuing
new certificates, revoking certificates, creating CRLs, etc.). However, this is
massive overkill in most setups.

This is where otca comes in handy. It will:

 - Generate a self-signed CA

 - Generate and sign certificates for the server and client

 - Remove CAs private key

This, for instance, can be used for point-to-point [OpenVPN][openvpn]
installations. Typically there is only a single server and client in such
setups. While a static key setup might be easier to configure, a certificate
based approach provides additional security because of the
[SSL/TLS handshake][tls] involved (ephemeral keys, forward secrecy).

The name otca actually stands for One-Time CA, and is a reference to the way
the CA is used, i.e. only once. The appropriate key is permanently removed and
no further actions can be taken by this CA.

In case of a breach, or whenever certificates expire, one simply starts from
scratch and simply eplaces the old certificates. Given that only two entities
are involved, this is not too much of a hassle.

### certck

This script will iterate over all certificates within a directory and will
examine its expire date. When a certificate is about to expire, it will output
an appropriate message. It can also verify the certificat itself, look for gaps
in the certificate chain.

## PREREQUISITES

certutils are sophisticated Bash scripts built around OpenSSL. There are no
particular restrictions on used versions. It has been developed and tested with
OpenSSL 1.0.2 in mind, but other versions should work fine, too.

## USAGE

Options for each utility are described by invoking the command with the
`-h` or `--help` option. Furthermore each script comes along a man page
describing its mode of operation and all parameters.

## CONTRIBUTIONS

The source code is maintained using git and lives over at [github.com][repo].
Contributions of any kind are highly welcome. The fastest way is to use pull
requests, and report bugs or submit feature requests.

In case you are looking for something to work on, you probably want to take a
look at the [issue tracker][tracker] or the `TODO` file in the root directory.

## DONATIONS

[![Flattr this git repo](http://api.flattr.com/button/flattr-badge-large.png "Flattr This!")](https://flattr.com/submit/auto?user_id=johnpatcher&url=https://github.com/kbabioch/certutils)

[![PayPal donation](https://www.paypalobjects.com/en_US/i/btn/btn_donate_SM.gif "PayPal")](https://www.paypal.com/cgi-bin/webscr?cmd=_donations&business=karol%40babioch%2ede&lc=DE&item_name=certutils&no_note=0&currency_code=EUR&bn=PP%2dDonationsBF%3abtn_donateCC_LG%2egif%3aNonHostedGuest)

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

[openssl]: https://www.openssl.org
[x509]: https://en.wikipedia.org/wiki/X.509
[openvpn]: https://openvpn.net
[tls]: https://en.wikipedia.org/wiki/Transport_Layer_Security
[easy-rsa]: https://openvpn.net/easyrsa.html
[github]: https://github.com/kbabioch/certutils
[tracker]: https://github.com/kbabioch/certutils/issues

