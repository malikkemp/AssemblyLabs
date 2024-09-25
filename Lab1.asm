#CSCI 213
#Lab 1
#Student Name: Malik Kemp

#Only use instructions that have been demonstrated in the lecture slides 
#or in the sample code provided.

#Address 1 (Store in t0):          10.1.123.19 -> 00001010.00000001.01111011.00010011 -> 09017B13
#Netmask 1 (Store result in t1):   255.255.240.0 -> 11111111.11111111.11110000.00000000 -> FFFFF000
#Put your instructions here
li $t0, 0x09017B13 # Address 1
li $t1, 0xFFFFF00 # Netmask 1

#Subnet 1:  TYPE THE RESULTING SUBNET ADDRESS HERE                
and $s0, $t0, $t1 # adding result to register
# Result = 0x09017b00
# Subnet IP = 9.1.123.0

#Address 2 (Store in t2):          172.24.82.31 -> 10101100.00011000.1010010.00011111 -> AC18A21F
#Netmask 2 (Store result in t3):   255.255.252.0 -> 11111111.11111111.11111100.00000000 -> FFFFFC00
#Put your instructions here
li $t2, 0xAC18A21F # Address 2
li $t3, 0xFFFFFC00 # Netmask 2

#Subnet 2:  TYPE THE RESULTING SUBNET ADDRESS HERE   
and $s1, $t2, $t3 # adding result to register
# Result = 0xac18a000
# Subnet IP = 172.24.160.0

#Address 3 (Store in t4):          192.168.1.90 -> 11000000.10101000.00000001.1011010 -> C0A801BA
#Netmask 3 (Store result in t5):   255.255.255.192 -> 11111111.11111111.11111111.110000000 -> FFFFFFC0
#Put your instructions here
li $t4, 0xC0A801BA # Address 3
li $t5, 0xFFFFFFC0 # Netmask 3

#Subnet 3:  TYPE THE RESULTING SUBNET ADDRESS HERE   
and $s2, $t4, $t5 # adding result to register
# Result = 0xc0a80180
# Subnet IP = 192.168.1.128

