import collections

my_nums = [1,2,2,2,3,3,42]
my_counter = collections.Counter(my_nums)


my_counter[5] += 1
print(my_counter)