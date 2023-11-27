# expand gdb
#source /usr/share/peda/peda.py
set debuginfod enabled on
source ~/bin/pwndbg/gdbinit.py

# disassembly as intel notation
set disassembly-flavor intel

# command history
set history filename ~/.gdbhist
set history save on

set auto-load local-gdbinit

set print elements 0

# specify follow target process when execute parallel
set follow-fork-mode parent

# enable golang debug
add-auto-load-safe-path /usr/lib/go/src/runtime/runtime-gdb.py
