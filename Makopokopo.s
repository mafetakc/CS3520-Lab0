.data
prompt: .asciz "Enter quantity in litres: "
result1: .asciz "Number of makokopo (20L): "
result2: .asciz "Remaining litres: "
newline: .asciz "\n"

.text
.globl _start
_start:
    # Print prompt
    la a0, prompt
    li a7, 4
    ecall
    
    # Read integer input
    li a7, 5
    ecall
    mv t0, a0        # store input in t0
    
    # Calculate makokopo (20L containers)
    li t1, 20
    div t2, t0, t1   # t2 = makokopo count
    rem t3, t0, t1   # t3 = remainder
    
    # Print makokopo count
    la a0, result1
    li a7, 4
    ecall
    
    mv a0, t2
    li a7, 1
    ecall
    
    # Print newline
    la a0, newline
    li a7, 4
    ecall
    
    # Print remainder
    la a0, result2
    li a7, 4
    ecall
    
    mv a0, t3
    li a7, 1
    ecall
    
    # Exit
    li a7, 10
    ecall