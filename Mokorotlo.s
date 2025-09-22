.data
prompt: .asciz "Enter height of the Mokorotlo: "
newline: .asciz "\n"
space: .asciz " "
star: .asciz "* "
buffer: .space 4       # buffer for input (moved to .data section)

.text
.globl main

main:
    # Print prompt
    li a0, 1           # file descriptor 1 (stdout)
    la a1, prompt      # load address of prompt
    li a2, 29          # length of prompt string
    li a7, 64          # syscall: write
    ecall
    
    # Read integer n
    li a0, 0           # file descriptor 0 (stdin)
    la a1, buffer      # buffer to store input
    li a2, 4           # read 4 bytes (integer)
    li a7, 63          # syscall: read
    ecall
    
    # Convert ASCII input to integer
    la t0, buffer
    lb t1, 0(t0)       # load first character
    li t2, 0           # initialize n = 0
    
    # Convert ASCII digit to integer (simple version for single digit)
    addi t1, t1, -48   # convert ASCII to integer
    mv t2, t1          # n = input value
    
    # Store n in s0
    mv s0, t2          # s0 = n
    
    # Initialize i = 0 (s1 = i)
    li s1, 0

outer_loop:
    # Check if i < n
    bge s1, s0, end_program
    
    # Print leading spaces
    # j = 0 (s2 = j)
    li s2, 0

space_loop:
    # Calculate n - i - 1
    sub t3, s0, s1     # t3 = n - i
    addi t3, t3, -1    # t3 = n - i - 1
    
    # Check if j < n - i - 1
    bge s2, t3, end_space_loop
    
    # Print space
    li a0, 1           # file descriptor 1 (stdout)
    la a1, space       # load address of space
    li a2, 1           # length of space string
    li a7, 64          # syscall: write
    ecall
    
    # j++
    addi s2, s2, 1
    j space_loop

end_space_loop:
    # Print stars in Pascal's triangle style
    # j = 0 (s3 = j)
    li s3, 0

star_loop:
    # Check if j <= i
    bgt s3, s1, end_star_loop
    
    # Print star with space
    li a0, 1           # file descriptor 1 (stdout)
    la a1, star        # load address of star
    li a2, 2           # length of star string
    li a7, 64          # syscall: write
    ecall
    
    # j++
    addi s3, s3, 1
    j star_loop

end_star_loop:
    # Print newline
    li a0, 1           # file descriptor 1 (stdout)
    la a1, newline     # load address of newline
    li a2, 1           # length of newline string
    li a7, 64          # syscall: write
    ecall
    
    # i++
    addi s1, s1, 1
    j outer_loop

end_program:
    # Exit program
    li a0, 0           # exit status 0
    li a7, 93          # syscall: exit
    ecall