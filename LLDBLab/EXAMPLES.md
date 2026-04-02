#  Examples

## memory read

Command:

    memory read -f x -s 8 -c 4 $x0
    
* -f x → hex format
* -s 8 → 8 bytes (64-bit)
* -c 4 → 4 values
* -f p prints pointers nicely

Example:

    (lldb) memory read -f p -c 4 $x0
    0x1007be380: 0x0000000100008118 0x0000000200000003 0x000000000000002a 0x0000000078656c41

Explanation:

    0x1007be380: 0x0000000100008118  ← metadata
    0x1007be388: 0x0000000200000003  ← refcount + flags
    0x1007be390: 0x000000000000002a  ← id = 42
    0x1007be398: 0x0000000078656c41  ← "Alex"

    41 6c 65 78
    A  l  e  x
