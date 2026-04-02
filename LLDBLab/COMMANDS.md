#  LLDB Commands

## Stage 1

| Command | Description | Example | Explanation |
| ------- | ----------- | ------- | ----------- |
| po | Print variable | | |
| p | Raw print | (LLDBLab.User) 0x000000010085a380 (id = 42, name = "Max") | Actual memory structure, 0x000000010085a380 - heap pointer |
| expr | Expression evaluation | expr user.name = "John" | |
| next | Step over | | |
| step | Step into | | |
| finish | Run until return | | |
| memory read | Memory inspection | 0x1007be380: 18 81 00 00 01 00 00 00 03 00 00 00 02 00 00 00  ................ | | 
| register read | ARM64 Registers | x15 = 0x00000001f1ed8940  (void )0x00000001f1ed8968: TtCs12_SwiftObject | |
| disassemble | Swift assembly | 0x100000a44 <+0>:   sub    sp, sp, #0x30 | |

CPU registers are the fastest, smallest, and most accessible storage units inside a computer's CPU, storing data and instructions currently being processed for near-instantaneous access. Acting as the CPU's temporary memory, they store numbers, memory addresses, and instruction sets that are processed during the fetch-decode-execute cycle.
