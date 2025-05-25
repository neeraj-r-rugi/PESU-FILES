#membership operator
	#Used to check whether a given element occurs within a specified list of values
	#Output is Boolean
	#in 
	#not in

a=[12,45,12,0,"pes"]
print(12 in a)
s="pes"
print(s in a)
print(s not in a)

print(12 in (-1,23,90,12))

#variations

print([12] in a)   # False   checking for the [12] in a.  
print(13 in a)
c="e"
d="E"
print(c in "pes")
print(d in "pes")
print("app" in "watsapp")    #True
print("pap" in "watsapp")   #False   checks for the string "pap" in "whatsapp". Not the character p and a and p


