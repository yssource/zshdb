# -*- shell-script -*-
# alias.cmd - gdb-like "alias" debugger command
#
#   Copyright (C) 2008 Rocky Bernstein rocky@gnu.org
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

typeset -A _Dbg_aliases

# Add an new alias in the alias table
function add_alias {
    (( $# != 2 )) && return 1
    _Dbg_aliases[$1]=$2
    return 0
}

function remove_alias {
    (( $# != 1 )) && return 1
    unset "_Dbg_aliases[$1]"
    return 0
}

function expand_alias {
    (( $# != 1 )) && return 1
    expanded_alias=$1
    [[ ${_Dbg_aliases[(k)$1]} != '' ]] && expanded_alias=$_Dbg_aliases[$1]
    return 0
}

_Dbg_do_alias() {
  add_alias $1 $2
}