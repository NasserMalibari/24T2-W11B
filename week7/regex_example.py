import re

# re.search
match_obj = re.search('[hH]+', "hhHello world")

# get indexes of original string where match occured
# >> (0,3)
print(match_obj.span())

# get matched part
# >> "hhH"
print(match_obj.group(0))

# get the string we searched
# >> "hhHello world"
print(match_obj.string)


# re.findall()

# find all sequences of capital letters
all_matches = re.findall("[A-Z]+", "AAABBC some ZZZ capitals123 BCD")

# print(len(all_matches))
# >> 3

print(all_matches)
# >> ['AAABBC', 'ZZZ', 'BCD']



#####

# other functions

###

# re.match
# like re.search but only matches from start of string (like adding a ^)

# re.fullmatch
# like search but matches only whole strings (like '^pattern$')

