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
| memory region | Memory region | 0x00000001007bc000-0x0000000100bbc000) rw- | |
| register read | ARM64 Registers | x15 = 0x00000001f1ed8940  (void )0x00000001f1ed8968: TtCs12_SwiftObject | |
| disassemble | Swift assembly | 0x100000a44 <+0>:   sub    sp, sp, #0x30 | |
