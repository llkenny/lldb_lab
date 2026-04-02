#  Examples

## Memory read

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

## Catch all Swift object allocations

Command:
    
    breakpoint set -n swift_allocObject # or add Symbolic Breakpoint, symbol: swift_allocObject
    
    bt                                  # allocation stack
    register read x0 x1 x2              # allocation arguments
    po $x0                              # allocated type
    
    finish                              # step out
    register read x0                    # object pointer
    memory read -f x -s 8 -c 4 $x0

Purpose:
* detect unexpected allocations
* debug performance issues
* find hidden class creation
* observe ARC behavior
* reverse engineer frameworks

Example: performance debugging UICollectionView scroll

    UICollectionViewCell allocation
    UILabel allocation
    UIImageView allocation
    
Explanation:

    x0 = 0x... OBJC_METACLASS_$__StringStorage  ← String allocation
    x1 = 0x40                                   ← 64 bytes - heap string, not small-string
    x2 = 0x7                                    ← runtime flags (aligned / refcounted / swift object)
