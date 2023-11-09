#source /usr/share/peda/peda.py
set debuginfod enabled on
source ~/bin/pwndbg/gdbinit.py

set disassembly-flavor intel

set history filename ~/.gdbhist
set history save on

set auto-load local-gdbinit

set print elements 0

set follow-fork-mode parent
