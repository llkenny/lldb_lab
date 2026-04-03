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

## Catch object allocations

Command:
    
    breakpoint set -n swift_allocObject # or add Symbolic Breakpoint, symbol: swift_allocObject
    
    bt                                  # allocation stack
    register read x0 x1 x2              # allocation arguments
    po $x0                              # allocated type
    
    finish                              # step out
    register read x0                    # object pointer
    memory read -f x -s 8 -c 4 $x0

Example: performance debugging UICollectionView scroll

    UICollectionViewCell allocation
    UILabel allocation
    UIImageView allocation
    
Explanation:

    x0 = 0x... OBJC_METACLASS_$__StringStorage  ← String allocation
    x1 = 0x40                                   ← 64 bytes - heap string, not small-string
    x2 = 0x7                                    ← runtime flags (aligned / refcounted / swift object)

## Catch ARC retain / release

Command:
    
    # use breakpoint to stop at an object creation
    register read x0 # 0x000000010085e560
    breakpoint set -n swift_retain
    breakpoint set -n swift_release
    
    # using the Breakpoints Navigator add condition for both: $x0==0x000000010085e560
    # optional: add Action, Debugger Command: bt, set automatically continue 

Example: debugging deinit, leak, retain cycle

Explanation:
    
    * thread #1, queue = 'com.apple.main-thread', stop reason = breakpoint 1.1
    * frame #0: 0x0000000198f64da8 libswiftCore.dylib`swift_retain              ← retain
    frame #1: 0x0000000100000d18 LLDBLab`main at main.swift:10:16               ← location 
    frame #2: 0x000000018573dd54 dyld`start + 7184
    
    * thread #1, queue = 'com.apple.main-thread', stop reason = breakpoint 2.1
    * frame #0: 0x0000000198f64a94 libswiftCore.dylib`swift_release             ← release
    frame #1: 0x0000000100000d58 LLDBLab`main at main.swift:13:3                ← location
    frame #2: 0x000000018573dd54 dyld`start + 7184

## Heap / Stack

Command:
    
    p heapUser
    p stackUser
    # or
    frame variable -L heapUser
    frame variable -L stackUser
    
Example: checking where the object is located

Explanation: 

    (LLDBLab.User) 0x00000001007d5e70 (id = 42, name = "Max")   ← heap (0x00000001007d5e70)
    (LLDBLab.StackUser)  (id = 1, name = "Alex")                ← stack
    
    scalar: (LLDBLab.User) heapUser = 0x00000001007d5e70 {      ← heap (0x00000001007d5e70)
    0x00000001007d5e80:   id = 42
    0x00000001007d5e88:   name = "Max"
    }
    0x00000001000081a8: (LLDBLab.StackUser) stackUser = {       ← stack
    0x00000001000081a8:   id = 1
    0x00000001000081b0:   name = "Alex"
    }
    
Optional:
    
    (lldb) memory region 0x00000001007d5e70                     
    [0x00000001007bc000-0x0000000100bbc000) rw-                 ← region
