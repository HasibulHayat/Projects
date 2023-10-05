# Find The Maximum Element


# Solving the problem with a function

def find_max_num(arr):
    if not arr:            # Checks if the array is empty
        return None

    max_element = arr[0]   # Initializing the first element as max element

    for element in arr:
        if element > max_element:
            max_element = element     # Updating max element if a larger element is found

    return max_element


# Solving the problem without a function

nums = [8, 0, -8]

if not nums:                  # Checks if the arr/list is empty
    print("No Array Found!")
else:
    max_num = nums[0]         # Initializing the first element as max element

    for num in nums:
        if num > max_num:
            max_num = num     # # Updating min element if a larger element is found

    print(max_num)


# Checking if the function works

print(find_max_num(nums))
