.globl argmax

.text
# =================================================================
# FUNCTION: Maximum Element First Index Finder
#
# Scans an integer array to find its maximum value and returns the
# position of its first occurrence. In cases where multiple elements
# share the maximum value, returns the smallest index.
#
# Arguments:
#   a0 (int *): Pointer to the first element of the array
#   a1 (int):  Number of elements in the array
#
# Returns:
#   a0 (int):  Position of the first maximum element (0-based index)
#
# Preconditions:
#   - Array must contain at least one element
#
# Error Cases:
#   - Terminates program with exit code 36 if array length < 1
# =================================================================
argmax:
    li t6, 1
    blt a1, t6, handle_error

    lw t0, 0(a0)

    li t1, 0        # largest index
    li t2, 0        # current index
    
loop_start:
    # TODO: Add your own implementation
    beqz a1,end
    
    lw t3,0(a0)     # lw
    
    bgt t3,t0,change
    
    addi a1,a1,-1
    addi t2,t2,1
    addi a0,a0,4
    j loop_start
    
change:
    add t0,x0,t3    # if t3>t0, replace largest number as t3
    add t1,x0,t2    # store largest index into t1
    addi a1,a1,-1   
    addi t2,t2,1    # next element number
    addi a0,a0,4
    j loop_start
end:
    add a0,x0,t1
    jr ra

handle_error:
    li a0, 36
    j exit
