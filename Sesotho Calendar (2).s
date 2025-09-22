.data
prompt: .asciz "Enter a number (1-7): "
error_msg: .asciz "Error: Invalid input. Please enter 1-7.\n"
newline: .asciz "\n"

# Sesotho day names
days:
    .asciz "Mantaha\n"  # Monday (1)
    .asciz "Labobeli\n"      # Tuesday (2)
    .asciz "Laboraro\n"      # Wednesday (3)
    .asciz "Labone\n"        # Thursday (4)
    .asciz "Labohlano\n"     # Friday (5)
    .asciz "Moqebelo\n"      # Saturday (6)
    .asciz "Sontaha\n"       # Sunday (7)

.text
.globl main
main:
    # Print prompt
    la a0, prompt
    li a7, 4
    ecall
    
    # READ INTEGER - RARS USES a7=5
    li a7, 5        # ? CHANGED TO 5 FOR RARS
    ecall           # Input goes to a0
    mv t0, a0       # Store input in t0
    
    # Validate input (1-7)
    li t1, 1
    li t2, 7
    blt t0, t1, error    # If < 1, error
    bgt t0, t2, error    # If > 7, error
    
    # Calculate address of day string
    addi t0, t0, -1      # Convert to 0-indexed (0-6)
    li t1, 12            # Each string is approx 12 bytes
    mul t3, t0, t1       # Offset = index * 12
    
    la a0, days          # Base address
    add a0, a0, t3       # Address of specific day
    
    # Print the day name
    li a7, 4
    ecall
    j exit

error:
    la a0, error_msg
    li a7, 4
    ecall

exit:
    # Print newline for clean output
    la a0, newline
    li a7, 4
    ecall
    
    # Exit program
    li a7, 10
    ecall