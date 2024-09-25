#CSCI 213
#Lab 3
#Student Name: Malik Kemp

#Only use instructions that have been demonstrated in the lecture slides 
#or in the sample code provided

.text

Main:
	# print prompt for hourly wage
	la 	$a0, wage_prompt     	# load address of wage_prompt
	li 	$v0, 4		     	# load syscall for printing strings 
	syscall				# print string
	
	# Read and store float input from user for hourly wage
	li 	$v0, 6 			# set syscall for reading float
	syscall				# read float
	mov.s 	$f1, $f0		# moves the input from $f0 to $f1 for later use
	
	#### Compare the float input with 0.0 (check if value is negative)
	lwc1 	$f4, float_zero		# Load 0.0 into $f4
	c.lt.s 	$f1, $f4		# Compare if $f1 (hourly wage) < $f4 (0.0)
	bc1t 	Invalid			# Branch to Invalid if $f1 (hourly wage) < $f4 (0.0)
	
	# Print the prompt for amount of hours worked 
	la 	$a0, hours_prompt     	# load address of hours_prompt
	li 	$v0, 4		     	# load syscall for printing strings 
	syscall				# print string
	
	# Read and store float input from user for hours worked
	li 	$v0, 6 			# set syscall for reading float
	syscall				# read float
	mov.s 	$f2, $f0		# moves the input from $f0 to $f2 for later use
	
	#### Compare the float input with 0.0 (check if value is negative)
	c.lt.s 	$f2, $f4		# Compare if $f2 (hours worked) < $f4 (0.0)
	bc1t 	Invalid			# Branch to Invalid if $f1 (hourly wage) < $f4 (0.0)

	# Perform the calculation of the two inputs (hourly wage * hours worked)
	mul.s 	$f3, $f1, $f2		# $f3 = $f1 * $f2 (Total pay = hourly wage * hours worked)

    	# Print the total pay
	li 	$v0, 4			# Load syscall for printing a string
	la 	$a0, total_prompt	# Load address of result_prompt
	syscall				# Print the prompt

	# Print the result (total pay)
	li 	$v0, 2			# Load syscall for printing a float
	mov.s  	$f12, $f3		# Move the result to $f12 (for printing)
	syscall				# Print the total pay
	
	# jump to end after completing program
	j End

Invalid:
	# print invalid prompt
	la 	$a0, invalid_prompt     # load address of invalid_prompt
	li 	$v0, 4		     	# load syscall for printing strings 
	syscall				# print string
	j Main				# jump back to main program

End:
	# Exit Program
	li 	$v0, 10			# load syscall to exit
	syscall				# exit program

.data
# initialize the three prompts needed
wage_prompt:	.asciiz	"Enter the employee's hourly wage: " 			# ask for the employees wage
hours_prompt:	.asciiz	"Enter the number of hours worked: " 			# ask for the number of hours worked by the employee
total_prompt:	.asciiz	"The employee's total pay is: $" 			# print total pay message
invalid_prompt: .asciiz	"You cannot use a negative value. Please try again..\n" # Error Message
float_zero:	.float	0.0							# Will use this to check if an input is negative