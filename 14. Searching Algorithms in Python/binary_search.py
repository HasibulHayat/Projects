# Various Binary Search Algorithms

def binary_search(nums, target):
    left = 0
    right = len(nums)-1

    while right >= left:
        mid = (left + right) // 2

        if nums[mid] == target:
            return mid
        elif target > nums[mid]:
            left = mid + 1
        else:
            right = mid - 1

    return -1


def binary_search_first_occurrence(nums, target):
    left = 0
    right = len(nums)-1
    result = -1

    while right >= left:
        mid = (left + right) // 2

        if nums[mid] == target:
            result = mid
            right = mid - 1
        elif target > nums[mid]:
            left = mid + 1
        else:
            right = mid - 1

    return result


def binary_search_last_occurrence(nums, target):
    left = 0
    right = len(nums)-1
    result = -1

    while right >= left:
        mid = (left + right) // 2

        if nums[mid] == target:
            result = mid
            left = mid + 1
        elif target > nums[mid]:
            left = mid + 1
        else:
            right = mid - 1

    return result


def binary_search_closest_element(nums, target):
    left = 0
    right = len(nums) - 1
    closest_value = None

    while right >= left:
        mid = (left + right) // 2
        current_value = nums[mid]

        if closest_value is None or abs(current_value - target) < abs(closest_value - target):
            closest_value = current_value

        if current_value < target:
            left = mid + 1
        else:
            right = mid - 1

    return closest_value


def binary_search_rotated_sorted_array(nums, target):
    left = 0
    right = len(nums) - 1

    while right >= left:
        mid = (left + right) // 2

        if nums[mid] == target:
            return mid

        if nums[left] <= nums[mid]:
            if nums[left] <= target < nums[mid]:
                right = mid - 1
            else:
                left = mid + 1
        else:
            if nums[mid] < target <= nums[right]:
                left = mid + 1
            else:
                right = mid - 1

    return -1


def binary_search_with_comparator(arr, target, comparator):
    left, right = 0, len(arr) - 1

    while left <= right:
        mid = left + (right - left) // 2  # Calculate the middle index

        comparison_result = comparator(arr[mid], target)

        if comparison_result == 0:
            return mid  # Element found, return its index
        elif comparison_result < 0:
            left = mid + 1  # Adjust the left boundary
        else:
            right = mid - 1  # Adjust the right boundary

    return -1  # Element not found in the array

# Example usage:
def custom_comparator(a, b):
    # Custom comparison function: Returns -1 if a < b, 0 if a == b, and 1 if a > b
    if a < b:
        return -1
    elif a == b:
        return 0
    else:
        return 1

arr = [1, 3, 5, 7, 9, 11, 13, 15]
target = 7
result = binary_search_with_comparator(arr, target, custom_comparator)
if result != -1:
    print(f"Element {target} found at index {result}")
else:
    print(f"Element {target} not found in the array")


# Binary Search in python


def binarySearch(array, x, low, high):

    if high >= low:

        mid = low + (high - low)//2

        # If found at mid, then return it
        if array[mid] == x:
            return mid

        # Search the left half
        elif array[mid] > x:
            return binarySearch(array, x, low, mid-1)

        # Search the right half
        else:
            return binarySearch(array, x, mid + 1, high)

    else:
        return -1


array = [3, 4, 5, 6, 7, 8, 9]
x = 4

result = binarySearch(array, x, 0, len(array)-1)

if result != -1:
    print("Element is present at index " + str(result))
else:
    print("Not found")