#Bitwise Operators
#	Uses: Embedded system software
#		  Bit stream serialization
#		  Encoding algorithms
#(&, |, ~, ^, <<, >>)


# Here all examples are solved using 8 bits. If the number is more than (2**7) - 1 .. Please use more bits
#Any queries, meet me
#Precedence of Bitwise operators
			~		
			>> <<   L to R
			&		L to R
			| ^		L to R


a = int(input("Enter first number"))
b = int(input("Enter second number"))

# bitwise &, | and ^
print("a & b:", a & b)
print("a | b:", a | b)
print("a ^ b:", a ^ b)


print("a & b & b:", a & b & b)
print("a & b | b:", a & b | b)
print("a | b & b:", a | b & b) # & operator has more precedence than |
print("a | b ^ a:", a | b ^ a) # ^ has more precedence than | . So right to left associativity
print("a & b ^ a:", a & b ^ a) # & operator has more precedence than ^
print("a | b & a ^ b:", a | b & a ^ b)

#Bitwise negation or complement
print("~a:", ~a )
#	If a is a positive number ex: 2
#			~a =-3
#			a = 00000010
#			i's complement of a is = 11111101
#			MSB is 1. So negative number  .. Now take the 2's complement of 1111101.
#					1's complement is 0000010. Adding 1 to this gives 2's complement.
#					Answer is 0000011 = 3

#    If a is a negative number ex: -2
#			~a =1
#Negative Numbers are represented in 2s complement form
#			First get the binary for -2. This can be found by 2's complement of 2
#			2 = 00000010
#			1's complement is 11111101. Add 1 to this to get binary for -2 = 11111110. This is how it is stored in memory.
#			1's complement of 11111110 is 00000001 = 1
# 			Answer is 00000001 = 1	


print("a | ~b & a ^ b:", a | ~b & a ^ b)


#Bitwise left shift (<<) and right shift(>>)
a=14     # change the value of a to bigger values and analyse the output
print("a << 2:", a << 3)   #multiplying the number a by 2**3(where 3 is the number of bits to be shifted to left)
print("a >> 2:", a >> 3)   #Dividing the number a by 2**3(where 3 is the number of bits to be shifted to right)


 # change the value to -5 and higher and see the output

print(a<<1)   # #multiplying the number a by 2**1
#take the binary of -4 by finding the 2's complement of 4. 
#     -4 = 11111100
#Now left shift it by one position = 11111000  adding 0 to LSB. MSB is 1 means it is a -ve number. Now get the 2's complement of 1111000 i.e equals to 00001111+1 =0001000
#Answer is -8

print(a>>1)		#dividing the number a by 2**1
#     -4 = 11111100
#Now right shift it by one position = 11111110 by adding 1 to MSB. MSB is 1 means it is a -ve number. Now get the 2's complement of 1111110 i.e equals to 0000001+1 = 0000010
#Answer is -2

Left Shift:
Binary Representation: The binary representation of -3 in two's complement (infinite bits) looks like ...11111101.
Shifting Left: When you left shift -3 by 1, it shifts all bits to the left and fills the right with 0. 
The result will look like ...11111010, which is the two's complement representation of -6.
Result: Thus, -3 << 1 gives you -6

Explanation
Binary Representation: The binary representation of -8 in two's complement looks like ...11111000.
Shifting Right: When you right shift -8 by 1, it shifts all bits to the right, and the sign bit (1 for negative numbers) is preserved. The result will look like ...11111100, which is the two's complement representation of -4.
Result: Thus, -8 >> 1 gives you -4.