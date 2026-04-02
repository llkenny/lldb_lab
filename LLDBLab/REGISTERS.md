#  REGISTERS

| register | example | description |
| -------- | ------- | ----------- |
| x0 | 0x00000001007be380 | return value register (ARM64 ABI) |
| x17 | type metadata for LLDBLab.User | Swift runtime metadata pointer |

## PATTERNS

| Pattern | code | menas |
| ------- | ---- | ----- |
| constant | mov w8, #0x2a | 42 |
| call | bl something | call function |
| return | ret | return |
| stack frame | sub sp, sp, #0x30 | function start |
| | stp x29, x30 | |
