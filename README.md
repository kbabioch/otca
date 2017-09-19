# otca

otca is a script supporting you in quickly setting up a simple [public-key
infrastructure][x509] with only two entities. This, for instance, can be used
for point-to-point [OpenVPN][openvpn] installations. Typically there is only
a single server and client in such setups. While a static key setup might
be easier to configure, a certificate based approach provides additional
security because of the [SSL/TLS handshake][tls] involved (ephemeral keys,
forward secrecy, etc.).

Generating the appropriate certificates consists of multiple steps and quickly
becomes cumbersome. [Easy RSA][easy-rsa], which is shipped along with OpenVPN
is a set of scripts powerful enough to deal with many PKI aspects (e.g. issuing
new certificates, revoking certificates, creating CRLs, etc.). However, this is
massive overkill in most setups.

This is where otca comes in handy. It will:

 - Generate a self-signed CA

 - Generate and sign certificates for the server and client

 - Remove CAs private key

The name otca actually stands for One-Time CA, and is a reference to the way
the CA is used, i.e. only once. The appropriate key is permanently removed and
no further actions can be taken by this CA.

In case of a breach, or whenever certificates expire, one simply starts from
scratch and simply replaces the old certificates. Given that only two entities
are involved, this is not too much of a hassle.

## PREREQUISITES

otca is a somehwat sophisticated Bash script built around [openssl][openssl].
It has been developed and tested with OpenSSL 1.0.2 in mind, but other versions
should work fine, too.

## USAGE

Execute the `otca` script. Its options are described in detail when invoked
with the `-h` option. Basically you only need to provide a name for the client,
as the default values should be sane enough in most cases.

Most aspects of the generated certificates are controlled with OpenSSL
configuration files (config(5)). A default configuration file is shippd with
this script and should be placed under `/etc/otca/otca.cnf`.

## THEORY OF OPERATION

After some basic option and argument parsing, otca sets up a suitable
temporary environment for the `ca(1)` command. It then generates and self-signs
a certificate for the CA, handing over the appropriate options. Afterwards
a [certificate signing request][csr] for the server and client is generated
using OpenSSL's `req(1)` command. These CSRs are then signed by the previously
created CA using the `ca(1)` command again. After some conversions (see
`pkcs12(1)`), the certificates and keys are moved into the specified output
directory. Then the temporary scratch space is removed, including the CA's
private key.

## CONTRIBUTIONS

The source code is maintained using git and lives over at [github.com][repo].
Contributions of any kind are highly welcome. The fastest way is to use pull
requests, and report bugs or submit feature requests.

In case you are looking for something to work on, you probably want to take a
look at the [issue tracker][tracker] or the `TODO` file in the root directory.

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
[openssl]: https://www.openssl.org
[openvpn]: https://openvpn.net
[tls]: https://en.wikipedia.org/wiki/Transport_Layer_Security
[csr]: https://en.wikipedia.org/wiki/Certificate_signing_request
[easy-rsa]: https://openvpn.net/easyrsa.html
[broken-revocation]: http://news.netcraft.com/archives/2013/05/13/how-certificate-revocation-doesnt-work-in-practice.html
[github]: https://github.com/kbabioch/otca
[tracker]: https://github.com/kbabioch/otca/issues

