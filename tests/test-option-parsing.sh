#! /bin/bash

# otca
#
# Copyright (c) 2015 Karol Babioch <karol@babioch.de>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

# Include file common to all test files
. common.sh

# Tests if servername is detected correctly, i.e. hostname(1)
testServernameAutodetect()
{

    $OTCA clientname | grep -q -E "Server:\s*$(hostname)"
    assertEquals 0 $?

}

# Tests if servername can be set with long option
testSetServernameLongOption()
{

    $OTCA --servername=servername clientname | grep -q -E "Server:\s*servername"
    assertEquals 0 $?

}

# Tests if servername can be set with short option
testSetServernameShortOption()
{

    $OTCA -s servername clientname | grep -q -E "Server:\s*servername"
    assertEquals 0 $?

}

# Tests if clientname can be set
testClientnameIsTakenOver()
{

    $OTCA clientname | grep -q -E "Client:\s*clientname"
    assertEquals 0 $?

}

# Source (and thereby invoke) shunit2
. shunit2

