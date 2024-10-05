#CSCI 213
#Lab 4
#Student Name: Malik Kemp 

.text
main:
# Your code goes here
    # Initialize needed values for sum, loop counter and array
    li  t1, 0             # Initialize total sum to 0
    li  t2, 0             # Initialize counter (index)
    li  t3, 6             # Number of elements in the array (6)

    # Load the starting address of arr
    lui     t4, %hi(arr)         # Load the upper 20 bits of the array address into t4
    addi    t4, t4, %lo(arr)     # Add the lower 12 bits of the array address to t4

loop:
    # Compare t2 and t3 and check if
    beq     t2, t3, done     # If t2 == t3, exit the loop
    lw      t5, 0(t4)        # Load the current word from the array into t5
    add     t1, t1, t5       # Add the current word to the total sum
    addi    t4, t4, 4        # Move to the next word in the array
    addi    t2, t2, 1        # Increment the counter
    j loop                   # Jump back to loop

done:
	mv 	    a0, t1		#Copies t1 to a0
	li 	    t0, 1		#Sets the system call code for printing an integer
	ecall			    #1 is in t0, so the integer in a0 is printed

.data
arr: 
       .word   4
       .word   8
       .word   15
       .word   16
       .word   23
       .word   42 
