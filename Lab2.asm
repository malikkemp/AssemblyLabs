#CSCI 213
#Lab 2
#Student Name: Malik Kemp

#Only use instructions that have been demonstrated in the lecture slides 
#or in the sample code provided.
.text

# Initialize counter and load starting addresses of strings
init:
	la $t0, string1		# Loads starting address of string1 into $t0
	la $t1, string2		# Loads starting address of string2 into $t1
	li $t2, 0		# Initializes the counter register to 0

# Perform loop to check each character in provided string
loop:
	lb $t3, 0($t0) 			# Loads current char (byte) from string1 into register $t3
	lb $t4, 0($t1) 			# Loads current char (byte) from string2 into register $t4
	beq $t3, $t4, next		# If characters are equal, move to next character
	bgt $t3, $t4, string1_after_2 	# If $t3 > $t4, string1 comes after string2
	blt $t3, $t4, string1_before_2 	# If $t3 < $t4, string1 comes before string2

#  Move to the next character
next:
	addi $t0, $t0, 1 	# Move to next character in string1
	addi $t1, $t1, 1 	# Move to next character in string2
	addi $t2, $t2, 1 	# Increment the counter by 1
	lb $t5, 0($t0) 		# Check if end of string1
	lb $t6, 0($t1) 		# Check if end of string2 
	beqz $t5, string1_equal_2	# If end of string1, strings are equal
	beqz $t6, string1_after_2	# If end of string2, string1 is before string2
	j loop 			# jump to beginning of loop

	# Code to run if string 1 comes after string 2 numerically
string1_after_2:
	la $a0, string1			# Load address of string1 to print
	li $v0, 4			# Syscall code for print string
	syscall				# Print string1
	la $a0, out3			# Load address of " comes after "
	li $v0, 4			# Syscall code for print string
	syscall				# Print message
	la $a0, string2			# Load address of string2 to print
	li $v0, 4			# Syscall code for print string
	syscall				# Print string2
	j end_program			# Jump to exit

# Code to run if string 1 comes before string 2 numerically
string1_before_2:
	la $a0, string1		# Load address of string1 to print
	li $v0, 4			# Syscall code for print string
	syscall				# Print string1
	la $a0, out2			# Load address of " comes before "
	li $v0, 4			# Syscall code for print string
	syscall				# Print message
	la $a0, string2		# Load address of string2 to print
	li $v0, 4			# Syscall code for print string
	syscall				# Print string2
	j end_program			# Jump to exit

# Code to run if strings are identical
string1_equal_2:
	la $a0, string1		# Load address of string1 to print
	li $v0, 4			# Syscall code for print string
	syscall				# Print string1
	la $a0, out1			# Load address of " is equal to "
	li $v0, 4			# Syscall code for print string
	syscall				# Print message
	la $a0, string2		# Load address of string2 to print
	li $v0, 4			# Syscall code for print string
	syscall				# Print string2
	j end_program			# Jump to exit


end_program:
	li $v0, 10 			# Sets syscall code to exit program
	syscall				# Use syscall to exit program
	
.data
#Do not modify these or add any additional entries to the data segment
string1:  .asciiz  "abc"
string2:  .asciiz  "def"
out1:     .asciiz  " is equal to "
out2:     .asciiz  " comes before "
out3:     .asciiz  " comes after "
