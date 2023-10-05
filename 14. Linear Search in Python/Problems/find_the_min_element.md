```
# Find The Minimum Element


# Solving the problem with a function

def find_min_num(arr):
    if not arr:            # Checks if the array is empty
        return None

    min_element = arr[0]   # Initializing the first element as min element

    for element in arr:
        if element < min_element:
            min_element = element     # Updating min element if a larger element is found

    return min_element


# Solving the problem without a function

nums = [8, 0, -8]

if not nums:                  # Checks if the arr/list is empty
    print("No Array Found!")
else:
    min_num = nums[0]         # Initializing the first element as max element

    for num in nums:
        if num < min_num:
            min_num = num     # # Updating min element if a larger element is found

    print(min_num)


# Checking if the function works

print(find_min_num(nums))
```
