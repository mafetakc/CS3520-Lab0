.data
prompt: .asciz "Enter number of cattle: "
not_enough: .asciz "Not enough for bohali\n"
small: .asciz "Small herd\n"
wealthy: .asciz "Wealthy cattle owner\n"

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
    
    # Classification
    li t1, 10        # threshold for bohali
    li t2, 50        # threshold for wealthy
    
    blt t0, t1, not_enough_label
    blt t0, t2, small_label
    j wealthy_label

not_enough_label:
    la a0, not_enough
    j print_result

small_label:
    la a0, small
    j print_result

wealthy_label:
    la a0, wealthy

print_result:
    li a7, 4
    ecall
    
    # Exit
    li a7, 10
    ecall
