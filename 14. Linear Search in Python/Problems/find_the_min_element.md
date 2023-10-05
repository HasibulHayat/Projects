# Task Description:

> **Find the Minimum Element : Given an array of integers, find the minimum element in the array.**

<br>

**Time Complexity :** Since the algorithm needs to examine each each of the array once, time complexity is **'O(n)'**

**Space Complexity :** Since we only use a constant amount of extra space to store variables like **min_element**, which don't depend on the size of the input array, space complexity is **'O(1)'**

<br>

## Code Snippet :

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
