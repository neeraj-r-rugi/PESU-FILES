# Addressing Modes in Computer Architecture

Addressing modes are methods used by the CPU to access operands (data) needed to execute instructions. They define **how** the processor calculates the effective address of data in memory or registers.

## Why Addressing Modes Matter

Different addressing modes provide flexibility in how programs access data, enabling efficient code for various scenarios like arrays, pointers, constants, and dynamic memory access.

## Common Addressing Modes

### 1. **Immediate Addressing**
The operand is part of the instruction itself (a constant value).

**Example:** `MOV A, #5` → Move the value 5 into register A

**Use case:** Loading constants

---

### 2. **Direct/Absolute Addressing**
The instruction contains the actual memory address of the operand.

**Example:** `LOAD R1, 1000` → Load data from memory address 1000 into R1

**Use case:** Accessing specific memory locations (global variables)

---

### 3. **Indirect Addressing**
The instruction specifies a register or memory location that contains the address of the actual operand.

**Example:** `LOAD R1, (R2)` → Load data from the address stored in R2

**Use case:** Pointers, dynamic memory access

---

### 4. **Register Addressing**
The operand is in a CPU register.

**Example:** `ADD R1, R2` → Add contents of R2 to R1

**Use case:** Fastest access, used for frequently accessed data

---

### 5. **Indexed Addressing**
Combines a base address with an index register to calculate the effective address.

**Example:** `LOAD R1, 1000(R2)` → Load from address (1000 + value in R2)

**Use case:** Array access, where R2 might hold the array index

---

### 6. **Register Indirect Addressing**
Similar to indirect, but the address is stored in a register.

**Example:** `LOAD R1, @R2` → Load from the address pointed to by R2

**Use case:** Pointer dereferencing

---

### 7. **Relative Addressing**
The effective address is calculated relative to the program counter (PC).

**Example:** `JMP +10` → Jump to an instruction 10 positions ahead

**Use case:** Branch instructions, position-independent code

---

### 8. **Base + Offset Addressing**
Combines a base register with an offset value.

**Example:** `LOAD R1, 4(R2)` → Load from address (R2 + 4)

**Use case:** Accessing structure fields, stack frames

---

## Quick Comparison

| Mode | Speed | Flexibility | Example Use |
|------|-------|-------------|-------------|
| Immediate | Fastest | Low | Constants |
| Register | Very Fast | Medium | Temp variables |
| Direct | Fast | Low | Global variables |
| Indirect | Slower | High | Pointers |
| Indexed | Medium | High | Arrays |

## Practical Example

Consider accessing the 3rd element of an array starting at address 1000:

- **Direct:** `LOAD R1, 1008` (if each element is 4 bytes)
- **Indexed:** `LOAD R1, 1000(R2)` where R2 = 8
- **Base+Offset:** `LOAD R1, 8(R2)` where R2 = 1000

The choice depends on whether the base address or index varies in your program!

Would you like me to explain any specific addressing mode in more detail, or show examples in a particular assembly language?