# -*- shell-script -*-
# return command.
#
#   Copyright (C) 2008 Rocky Bernstein  rocky@gnu.org
#
#   zshdb is free software; you can redistribute it and/or modify it under
#   the terms of the GNU General Public License as published by the Free
#   Software Foundation; either version 2, or (at your option) any later
#   version.
#
#   zshdb is distributed in the hope that it will be useful, but WITHOUT ANY
#   WARRANTY; without even the implied warranty of MERCHANTABILITY or
#   FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
#   for more details.
#   
#   You should have received a copy of the GNU General Public License along
#   with zshdb; see the file COPYING.  If not, write to the Free Software
#   Foundation, 59 Temple Place, Suite 330, Boston, MA 02111 USA.

_Dbg_help_add return \
'return [RETURN-VALUE] -- Force an immediate return from a function.

The remainder of function will not be executed. If RETURN-VALUE is given,
it should be an integer and will be the return value passed back as
$?. See also "finish", "quit", and "run."
'

# Return value when a return is taken.
typeset -i _Dbg_return_rc=0

_Dbg_do_return() {
    set -x
    rc=${1:-0}

    if [[ $_Dbg_return_rc == [0-9]* ]] ; then
	_Dbg_return_rc=$rc
    else
	_Dbg_errmsg "Argument ($rc) should be a number or nothing."
	_Dbg_skip_ignore=0
	return 0
    fi
    
    _Dbg_write_journal_eval "_Dbg_step_ignore=1"
    return 255
}
