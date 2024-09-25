#CSCI 213
#Lab 3
#Student Name: Malik Kemp

#Only use instructions that have been demonstrated in the lecture slides 
#or in the sample code provided.i

.text
# Aritmetic instructions

.data
# initialize the three prompts needed
wage_prompt:	.asciiz	"Enter the employee's hourly wage: " 			# ask for the employees wage
hours_prompt:	.asciiz	"Enter the number of hours worked: " 			# ask for the number of hours worked by the employee
total_prompt:	.asciiz	"The employee's total pay is: $" 			# print total pay message
invalid_prompt: .asciiz	"You cannot use a negative value. Please try again.." 	# Error Message

main:
	# prompt for hourly wage
	li $v0, 4		# load syscall for printing strings 
	la $a0, wage_prompt	# load address of wage_prompt
	syscall			# use syscall to print message

	# Exit Program
	li $v0, 10		# load syscall to exit
	syscall			# exit program

# store user input if valid
# else return to first prompt
# print: enter the number of hours worked
# store number of hours worked
# calculate: hoursworked x wage
# store: result
# print: result



