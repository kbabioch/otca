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

DIRS = \
	/usr/bin \
	/usr/share/man/man1


install:

ifneq ($(strip $(DESTDIR)),)
	mkdir -p $(DESTDIR)
endif
	$(foreach dir,$(DIRS),install -dm755 $(DESTDIR)$(dir);)

	install -m0775 src/otca $(DESTDIR)/usr/bin
	install -m0644 etc/otca.cnf $(DESTDIR)/etc
	install -m0644 man/otca.1 $(DESTDIR)/usr/share/man/man1

.PHONY: install

