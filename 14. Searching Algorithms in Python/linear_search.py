# Various Linear Search Algorithms

def linear_search(nums, target):
    for i in range(len(nums)):
        if nums[i] == target:
            return i

    return -1


def linear_search_count(nums, target):
    count = 0

    for i in range(len(nums)):
        if nums[i] == target:
            count += 1

    return count


def linear_search_indices(nums, target):
    indexes = []

    for i in range(len(nums)):
        if nums[i] == target:
            indexes.append(i)

    return indexes


def linear_search_with_comparator(nums, target, comparator):
    for i in range(len(nums)):
        if comparator(nums[i], target):
            return i
    return -1



def linear_search_sentinel(arr, target):
    n = len(arr)
    arr.append(target)  # Add the target as a sentinel value at the end of the list
    i = 0
    while arr[i] != target:
        i += 1
    arr.pop()  # Remove the sentinel value (optional)
    if i < n:
        return i
    return -1  # Target element not found

# Example usage:
my_list = [1, 3, 5, 7, 9]
target_element = 5
result = linear_search_sentinel(my_list, target_element)

if result != -1:
    print(f"Element {target_element} found at index {result}")
else:
    print(f"Element {target_element} not found in the list")
