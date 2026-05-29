import '../models/problem.dart';

final List<Problem> allProblems = [
  // ==================== BASIC (1-33) ====================
  Problem(
    id: '1',
    title: 'Two Sum',
    description: 'Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.',
    difficulty: Difficulty.basic,
    tags: ['Array', 'Hash Table'],
    solution: '''def two_sum(nums, target):
    seen = {}
    for i, num in enumerate(nums):
        complement = target - num
        if complement in seen:
            return [seen[complement], i]
        seen[num] = i
    return []''',
    timeComplexity: 'O(n)',
    spaceComplexity: 'O(n)',
    explanation: 'Use a hash map to store seen numbers. For each number, check if its complement exists in the map.',
    hints: ['Think about using a hash map for O(1) lookups.', 'For each element, what number would you need to reach the target?'],
    examples: [Example(input: 'nums = [2,7,11,15], target = 9', output: '[0, 1]', explanation: 'Because nums[0] + nums[1] == 9')],
  ),
  Problem(
    id: '2',
    title: 'Reverse String',
    description: 'Write a function that reverses a string. The input string is given as an array of characters.',
    difficulty: Difficulty.basic,
    tags: ['String', 'Two Pointers'],
    solution: '''def reverse_string(s):
    left, right = 0, len(s) - 1
    while left < right:
        s[left], s[right] = s[right], s[left]
        left += 1
        right -= 1''',
    timeComplexity: 'O(n)',
    spaceComplexity: 'O(1)',
    explanation: 'Use two pointers from both ends and swap characters in-place until they meet in the middle.',
    hints: ['Use two pointers approach.', 'Swap characters from both ends moving inward.'],
    examples: [Example(input: 's = ["h","e","l","l","o"]', output: '["o","l","l","e","h"]')],
  ),
  Problem(
    id: '3',
    title: 'Palindrome Number',
    description: 'Given an integer x, return true if x is a palindrome, and false otherwise.',
    difficulty: Difficulty.basic,
    tags: ['Math'],
    solution: '''def is_palindrome(x):
    if x < 0:
        return False
    original, reversed_num = x, 0
    while x > 0:
        reversed_num = reversed_num * 10 + x % 10
        x //= 10
    return original == reversed_num''',
    timeComplexity: 'O(log n)',
    spaceComplexity: 'O(1)',
    explanation: 'Reverse half or all of the number mathematically and compare with the original.',
    hints: ['Negative numbers are not palindromes.', 'Reverse the number mathematically without converting to string.'],
    examples: [Example(input: 'x = 121', output: 'true', explanation: '121 reads the same backward as forward')],
  ),
  Problem(
    id: '4',
    title: 'Valid Parentheses',
    description: 'Given a string s containing just the characters \'()\', \'{}\', \'[]\', determine if the input string is valid.',
    difficulty: Difficulty.basic,
    tags: ['Stack', 'String'],
    solution: '''def is_valid(s):
    stack = []
    mapping = {')': '(', '}': '{', ']': '['}
    for char in s:
        if char in mapping:
            top = stack.pop() if stack else '#'
            if mapping[char] != top:
                return False
        else:
            stack.append(char)
    return not stack''',
    timeComplexity: 'O(n)',
    spaceComplexity: 'O(n)',
    explanation: 'Use a stack to track opening brackets. When encountering a closing bracket, check if it matches the top of the stack.',
    hints: ['Use a stack data structure.', 'Match each closing bracket with the most recent unmatched opening bracket.'],
    examples: [Example(input: 's = "()[]{}"', output: 'true', explanation: 'Each opening bracket has a corresponding closing bracket in the correct order')],
  ),
  Problem(
    id: '5',
    title: 'Merge Two Sorted Lists',
    description: 'Merge two sorted linked lists and return it as a sorted list.',
    difficulty: Difficulty.basic,
    tags: ['Linked List', 'Recursion'],
    solution: '''class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next

def merge_two_lists(l1, l2):
    dummy = ListNode()
    current = dummy
    while l1 and l2:
        if l1.val < l2.val:
            current.next = l1
            l1 = l1.next
        else:
            current.next = l2
            l2 = l2.next
        current = current.next
    current.next = l1 or l2
    return dummy.next''',
    timeComplexity: 'O(n + m)',
    spaceComplexity: 'O(1)',
    explanation: 'Iterate through both lists, always taking the smaller element and appending it to the result.',
    hints: ['Use a dummy head node to simplify edge cases.', 'Compare nodes one by one and link the smaller one.'],
    examples: [Example(input: 'l1 = [1,2,4], l2 = [1,3,4]', output: '[1,1,2,3,4,4]', explanation: 'Merged list contains all nodes from both lists in sorted order')],
  ),
  Problem(
    id: '6',
    title: 'Remove Duplicates from Sorted Array',
    description: 'Given a sorted array nums, remove the duplicates in-place such that each element appears only once.',
    difficulty: Difficulty.basic,
    tags: ['Array', 'Two Pointers'],
    solution: '''def remove_duplicates(nums):
    if not nums:
        return 0
    i = 0
    for j in range(1, len(nums)):
        if nums[j] != nums[i]:
            i += 1
            nums[i] = nums[j]
    return i + 1''',
    timeComplexity: 'O(n)',
    spaceComplexity: 'O(1)',
    explanation: 'Use two pointers: one for the position of the next unique element, another to scan through the array.',
    hints: ['Use a slow pointer for unique elements position.', 'Only move the slow pointer when a new unique element is found.'],
    examples: [Example(input: 'nums = [1,1,2]', output: '2', explanation: 'The first two elements are [1, 2], so return length 2')],
  ),
  Problem(
    id: '7',
    title: 'Best Time to Buy and Sell Stock',
    description: 'Given prices array, find max profit by buying on one day and selling on a different future day.',
    difficulty: Difficulty.basic,
    tags: ['Array', 'Dynamic Programming'],
    solution: '''def max_profit(prices):
    min_price = float('inf')
    max_profit = 0
    for price in prices:
        min_price = min(min_price, price)
        max_profit = max(max_profit, price - min_price)
    return max_profit''',
    timeComplexity: 'O(n)',
    spaceComplexity: 'O(1)',
    explanation: 'Track the minimum price seen so far and calculate potential profit at each day.',
    hints: ['Track the minimum price encountered so far.', 'Calculate profit if you sold at the current price.'],
    examples: [Example(input: 'prices = [7,1,5,3,6,4]', output: '5', explanation: 'Buy on day 2 at 1 and sell on day 5 at 6 for a profit of 5')],
  ),
  Problem(
    id: '8',
    title: 'Contains Duplicate',
    description: 'Given an integer array nums, return true if any value appears at least twice.',
    difficulty: Difficulty.basic,
    tags: ['Array', 'Hash Table'],
    solution: '''def contains_duplicate(nums):
    seen = set()
    for num in nums:
        if num in seen:
            return True
        seen.add(num)
    return False''',
    timeComplexity: 'O(n)',
    spaceComplexity: 'O(n)',
    explanation: 'Use a set to track seen numbers. If a number is already in the set, return true.',
    hints: ['A set provides O(1) lookup time.', 'Return True as soon as you find a duplicate.'],
    examples: [Example(input: 'nums = [1,2,3,1]', output: 'true', explanation: 'The value 1 appears at indices 0 and 3')],
  ),
  Problem(
    id: '9',
    title: 'Single Number',
    description: 'Given non-empty array of integers where every element appears twice except one, find that single one.',
    difficulty: Difficulty.basic,
    tags: ['Array', 'Bit Manipulation'],
    solution: '''def single_number(nums):
    result = 0
    for num in nums:
        result ^= num
    return result''',
    timeComplexity: 'O(n)',
    spaceComplexity: 'O(1)',
    explanation: 'XOR all elements. Since a ^ a = 0 and a ^ 0 = a, all pairs cancel out leaving the single number.',
    hints: ['XOR of a number with itself is 0.', 'XOR is commutative and associative.'],
    examples: [Example(input: 'nums = [4,1,2,1,2]', output: '4', explanation: 'All numbers except 4 appear twice, so XOR leaves 4')],
  ),
  Problem(
    id: '10',
    title: 'Plus One',
    description: 'Given large integer represented as array of digits, increment by one.',
    difficulty: Difficulty.basic,
    tags: ['Array', 'Math'],
    solution: '''def plus_one(digits):
    n = len(digits)
    for i in range(n - 1, -1, -1):
        if digits[i] < 9:
            digits[i] += 1
            return digits
        digits[i] = 0
    return [1] + digits''',
    timeComplexity: 'O(n)',
    spaceComplexity: 'O(1) / O(n) worst case',
    explanation: 'Traverse from right to left. If digit < 9, increment and return. If all are 9, prepend 1.',
    hints: ['Start from the rightmost digit.', 'Handle carry propagation and the all-9s case.'],
    examples: [Example(input: 'digits = [1,2,3]', output: '[1,2,4]', explanation: 'Adding 1 to 123 gives 124')],
  ),
  Problem(
    id: '11',
    title: 'Fizz Buzz',
    description: 'Return array of strings from 1 to n. For multiples of 3 use "Fizz", 5 use "Buzz", both use "FizzBuzz".',
    difficulty: Difficulty.basic,
    tags: ['Math', 'String'],
    solution: '''def fizz_buzz(n):
    result = []
    for i in range(1, n + 1):
        s = ''
        if i % 3 == 0:
            s += 'Fizz'
        if i % 5 == 0:
            s += 'Buzz'
        result.append(s or str(i))
    return result''',
    timeComplexity: 'O(n)',
    spaceComplexity: 'O(1) excluding output',
    explanation: 'Iterate from 1 to n, building the string based on divisibility rules.',
    hints: ['Use modulo operator to check divisibility.', 'Build the string incrementally.'],
    examples: [Example(input: 'n = 15', output: '["1","2","Fizz","4","Buzz","Fizz","7","8","Fizz","Buzz","11","Fizz","13","14","FizzBuzz"]')],
  ),
  Problem(
    id: '12',
    title: 'Maximum Subarray (Kadane\'s Algorithm)',
    description: 'Find contiguous subarray with largest sum and return its sum.',
    difficulty: Difficulty.basic,
    tags: ['Array', 'Dynamic Programming'],
    solution: '''def max_subarray(nums):
    current_sum = max_sum = nums[0]
    for num in nums[1:]:
        current_sum = max(num, current_sum + num)
        max_sum = max(max_sum, current_sum)
    return max_sum''',
    timeComplexity: 'O(n)',
    spaceComplexity: 'O(1)',
    explanation: 'Kadane\'s algorithm: at each position, decide whether to start a new subarray or extend the existing one.',
    hints: ['At each element, ask: is it better to start fresh or extend?', 'Track both current running sum and global maximum.'],
    examples: [Example(input: 'nums = [-2,1,-3,4,-1,2,1,-5,4]', output: '6', explanation: 'The subarray [4,-1,2,1] has the largest sum of 6')],
  ),
  Problem(
    id: '13',
    title: 'Count Primes',
    description: 'Count the number of prime numbers less than a non-negative number n.',
    difficulty: Difficulty.basic,
    tags: ['Math', 'Sieve of Eratosthenes'],
    solution: '''def count_primes(n):
    if n <= 2:
        return 0
    sieve = [True] * n
    sieve[0] = sieve[1] = False
    for i in range(2, int(n**0.5) + 1):
        if sieve[i]:
            sieve[i*i:n:i] = [False] * len(sieve[i*i:n:i])
    return sum(sieve)''',
    timeComplexity: 'O(n log log n)',
    spaceComplexity: 'O(n)',
    explanation: 'Sieve of Eratosthenes: mark multiples of each prime starting from 2.',
    hints: ['Use the Sieve of Eratosthenes algorithm.', 'Only need to sieve up to sqrt(n).'],
    examples: [Example(input: 'n = 10', output: '4', explanation: 'There are 4 primes less than 10: 2, 3, 5, 7')],
  ),
  Problem(
    id: '14',
    title: 'Roman to Integer',
    description: 'Convert Roman numeral to integer.',
    difficulty: Difficulty.basic,
    tags: ['String', 'Hash Table'],
    solution: '''def roman_to_int(s):
    values = {'I': 1, 'V': 5, 'X': 10, 'L': 50,
              'C': 100, 'D': 500, 'M': 1000}
    total = 0
    for i in range(len(s) - 1):
        if values[s[i]] < values[s[i+1]]:
            total -= values[s[i]]
        else:
            total += values[s[i]]
    return total + values[s[-1]]''',
    timeComplexity: 'O(n)',
    spaceComplexity: 'O(1)',
    explanation: 'If a symbol is smaller than the next one, subtract it; otherwise, add it.',
    hints: ['Roman numerals are usually written largest to smallest.', 'When a smaller value precedes a larger value, subtract it.'],
    examples: [Example(input: 's = "MCMXCIV"', output: '1994', explanation: 'M=1000, CM=900, XC=90, IV=4, so total is 1994')],
  ),
  Problem(
    id: '15',
    title: 'Length of Last Word',
    description: 'Given a string s consisting of words and spaces, return the length of the last word.',
    difficulty: Difficulty.basic,
    tags: ['String'],
    solution: '''def length_of_last_word(s):
    return len(s.strip().split()[-1])''',
    timeComplexity: 'O(n)',
    spaceComplexity: 'O(1)',
    explanation: 'Strip trailing spaces and find the last word, or iterate from the end.',
    hints: ['Be careful with trailing spaces.', 'You can iterate from the end of the string.'],
    examples: [Example(input: 's = "Hello World"', output: '5', explanation: 'The last word is "World" which has length 5')],
  ),
  Problem(
    id: '16',
    title: 'Sqrt(x)',
    description: 'Compute and return the square root of x, rounded down to nearest integer.',
    difficulty: Difficulty.basic,
    tags: ['Math', 'Binary Search'],
    solution: '''def my_sqrt(x):
    if x < 2:
        return x
    left, right = 1, x // 2
    while left <= right:
        mid = (left + right) // 2
        if mid * mid == x:
            return mid
        elif mid * mid < x:
            left = mid + 1
        else:
            right = mid - 1
    return right''',
    timeComplexity: 'O(log n)',
    spaceComplexity: 'O(1)',
    explanation: 'Binary search for the square root. The answer is the largest number whose square is <= x.',
    hints: ['Use binary search between 1 and x//2.', 'When mid*mid > x, search the left half.'],
    examples: [Example(input: 'x = 8', output: '2', explanation: 'The square root of 8 is 2.828..., rounded down to 2')],
  ),
  Problem(
    id: '17',
    title: 'Climbing Stairs',
    description: 'You are climbing a staircase of n steps. Each time you can climb 1 or 2 steps. How many distinct ways?',
    difficulty: Difficulty.basic,
    tags: ['Dynamic Programming'],
    solution: '''def climb_stairs(n):
    if n <= 2:
        return n
    a, b = 1, 2
    for _ in range(3, n + 1):
        a, b = b, a + b
    return b''',
    timeComplexity: 'O(n)',
    spaceComplexity: 'O(1)',
    explanation: 'Fibonacci sequence. Ways(n) = Ways(n-1) + Ways(n-2). Use rolling variables for space optimization.',
    hints: ['This follows the Fibonacci sequence pattern.', 'You only need the previous two values, not the entire array.'],
    examples: [Example(input: 'n = 3', output: '3', explanation: 'There are 3 ways to climb 3 stairs: 1+1+1, 1+2, 2+1')],
  ),
  Problem(
    id: '18',
    title: 'Valid Anagram',
    description: 'Given two strings s and t, return true if t is an anagram of s.',
    difficulty: Difficulty.basic,
    tags: ['String', 'Hash Table', 'Sorting'],
    solution: '''def is_anagram(s, t):
    if len(s) != len(t):
        return False
    count = {}
    for char in s:
        count[char] = count.get(char, 0) + 1
    for char in t:
        count[char] = count.get(char, 0) - 1
        if count[char] < 0:
            return False
    return True''',
    timeComplexity: 'O(n)',
    spaceComplexity: 'O(1) - at most 26 letters',
    explanation: 'Count characters in both strings and compare. If counts match, it is an anagram.',
    hints: ['Anagrams have the same characters with the same frequencies.', 'Use a hash map or array of size 26 for counting.'],
    examples: [Example(input: 's = "anagram", t = "nagaram"', output: 'true', explanation: 'Both strings contain the same characters with the same frequencies')],
  ),
  Problem(
    id: '19',
    title: 'Missing Number',
    description: 'Given array containing n distinct numbers in range [0, n], find the one missing.',
    difficulty: Difficulty.basic,
    tags: ['Array', 'Math', 'Bit Manipulation'],
    solution: '''def missing_number(nums):
    n = len(nums)
    expected = n * (n + 1) // 2
    actual = sum(nums)
    return expected - actual''',
    timeComplexity: 'O(n)',
    spaceComplexity: 'O(1)',
    explanation: 'Use the sum formula n*(n+1)/2 and subtract the actual sum to find the missing number.',
    hints: ['Sum of 0 to n is n*(n+1)/2.', 'Subtract actual sum from expected sum.'],
    examples: [Example(input: 'nums = [3,0,1]', output: '2', explanation: 'The array contains 3 distinct numbers from [0,3], so 2 is missing')],
  ),
  Problem(
    id: '20',
    title: 'Move Zeroes',
    description: 'Given integer array nums, move all 0s to the end while maintaining relative order of non-zero elements.',
    difficulty: Difficulty.basic,
    tags: ['Array', 'Two Pointers'],
    solution: '''def move_zeroes(nums):
    insert_pos = 0
    for num in nums:
        if num != 0:
            nums[insert_pos] = num
            insert_pos += 1
    while insert_pos < len(nums):
        nums[insert_pos] = 0
        insert_pos += 1''',
    timeComplexity: 'O(n)',
    spaceComplexity: 'O(1)',
    explanation: 'Use a pointer for the position to insert the next non-zero element. Fill remaining with zeros.',
    hints: ['Maintain a pointer for where the next non-zero should go.', 'Iterate through and place non-zeros at the front.'],
    examples: [Example(input: 'nums = [0,1,0,3,12]', output: '[1,3,12,0,0]', explanation: 'Non-zero elements maintain their relative order while zeros move to the end')],
  ),
  Problem(
    id: '21',
    title: 'Intersection of Two Arrays II',
    description: 'Given two integer arrays, return their intersection. Each element in result must appear as many times as it shows.',
    difficulty: Difficulty.basic,
    tags: ['Array', 'Hash Table'],
    solution: '''def intersect(nums1, nums2):
    from collections import Counter
    c1, c2 = Counter(nums1), Counter(nums2)
    result = []
    for num, count in c1.items():
        if num in c2:
            result.extend([num] * min(count, c2[num]))
    return result''',
    timeComplexity: 'O(n + m)',
    spaceComplexity: 'O(min(n, m))',
    explanation: 'Count elements in both arrays and take the minimum count for each common element.',
    hints: ['Use Counter to count frequency of elements.', 'For each common element, add it min(count1, count2) times.'],
    examples: [Example(input: 'nums1 = [1,2,2,1], nums2 = [2,2]', output: '[2,2]', explanation: '2 appears twice in both arrays, so it appears twice in the result')],
  ),
  Problem(
    id: '22',
    title: 'First Unique Character',
    description: 'Given a string s, find the first non-repeating character and return its index.',
    difficulty: Difficulty.basic,
    tags: ['String', 'Hash Table'],
    solution: '''def first_uniq_char(s):
    from collections import Counter
    count = Counter(s)
    for i, char in enumerate(s):
        if count[char] == 1:
            return i
    return -1''',
    timeComplexity: 'O(n)',
    spaceComplexity: 'O(1) - 26 letters',
    explanation: 'Count all characters first, then scan the string to find the first character with count 1.',
    hints: ['Count all characters in one pass.', 'Then find the first character with a count of 1.'],
    examples: [Example(input: 's = "leetcode"', output: '0', explanation: 'The first non-repeating character is l at index 0')],
  ),
  Problem(
    id: '23',
    title: 'Majority Element',
    description: 'Given array of size n, find majority element (appears more than n/2 times).',
    difficulty: Difficulty.basic,
    tags: ['Array', 'Boyer-Moore Voting'],
    solution: '''def majority_element(nums):
    candidate = None
    count = 0
    for num in nums:
        if count == 0:
            candidate = num
        count += 1 if num == candidate else -1
    return candidate''',
    timeComplexity: 'O(n)',
    spaceComplexity: 'O(1)',
    explanation: 'Boyer-Moore Voting Algorithm: pair up different elements and cancel them out. The survivor is the majority.',
    hints: ['Think about canceling out pairs of different elements.', 'The majority element survives the cancellation.'],
    examples: [Example(input: 'nums = [3,2,3]', output: '3', explanation: '3 appears twice, which is more than n/2 = 1.5 times')],
  ),
  Problem(
    id: '24',
    title: 'Reverse Linked List',
    description: 'Given the head of a singly linked list, reverse the list and return the reversed list.',
    difficulty: Difficulty.basic,
    tags: ['Linked List'],
    solution: '''def reverse_list(head):
    prev = None
    current = head
    while current:
        next_temp = current.next
        current.next = prev
        prev = current
        current = next_temp
    return prev''',
    timeComplexity: 'O(n)',
    spaceComplexity: 'O(1)',
    explanation: 'Iteratively change each node\'s next pointer to point to the previous node.',
    hints: ['Store the next node before changing pointers.', 'Point current node\'s next to the previous node.'],
    examples: [Example(input: 'head = [1,2,3,4,5]', output: '[5,4,3,2,1]', explanation: 'The linked list is reversed in-place')],
  ),
  Problem(
    id: '25',
    title: 'Isomorphic Strings',
    description: 'Given two strings s and t, determine if they are isomorphic.',
    difficulty: Difficulty.basic,
    tags: ['String', 'Hash Table'],
    solution: '''def is_isomorphic(s, t):
    if len(s) != len(t):
        return False
    s_to_t, t_to_s = {}, {}
    for c1, c2 in zip(s, t):
        if (c1 in s_to_t and s_to_t[c1] != c2) or (c2 in t_to_s and t_to_s[c2] != c1):
            return False
        s_to_t[c1] = c2
        t_to_s[c2] = c1
    return True''',
    timeComplexity: 'O(n)',
    spaceComplexity: 'O(1) - limited charset',
    explanation: 'Maintain two mappings. A character in s must consistently map to the same character in t and vice versa.',
    hints: ['Need two-way mapping between characters.', 'A character cannot map to two different characters.'],
    examples: [Example(input: 's = "egg", t = "add"', output: 'true', explanation: 'e maps to a and g maps to d consistently')],
  ),
  Problem(
    id: '26',
    title: 'Linked List Cycle',
    description: 'Given head of a linked list, determine if it has a cycle.',
    difficulty: Difficulty.basic,
    tags: ['Linked List', 'Two Pointers'],
    solution: '''def has_cycle(head):
    slow = fast = head
    while fast and fast.next:
        slow = slow.next
        fast = fast.next.next
        if slow == fast:
            return True
    return False''',
    timeComplexity: 'O(n)',
    spaceComplexity: 'O(1)',
    explanation: 'Floyd\'s Cycle Detection (Tortoise and Hare): if there\'s a cycle, fast pointer will eventually meet slow pointer.',
    hints: ['Use two pointers moving at different speeds.', 'If there is a cycle, the fast pointer will catch up.'],
    examples: [Example(input: 'head = [3,2,0,-4], pos = 1', output: 'true', explanation: 'There is a cycle where the tail connects to node at index 1')],
  ),
  Problem(
    id: '27',
    title: 'Min Stack',
    description: 'Design a stack that supports push, pop, top, and retrieving the minimum element in constant time.',
    difficulty: Difficulty.basic,
    tags: ['Stack', 'Design'],
    solution: '''class MinStack:
    def __init__(self):
        self.stack = []
        self.min_stack = []

    def push(self, val):
        self.stack.append(val)
        if not self.min_stack or val <= self.min_stack[-1]:
            self.min_stack.append(val)

    def pop(self):
        val = self.stack.pop()
        if val == self.min_stack[-1]:
            self.min_stack.pop()

    def top(self):
        return self.stack[-1]

    def getMin(self):
        return self.min_stack[-1]''',
    timeComplexity: 'O(1) for all operations',
    spaceComplexity: 'O(n)',
    explanation: 'Use an auxiliary stack that keeps track of minimums. Push to min_stack only when a new minimum is encountered.',
    hints: ['Maintain a separate stack for minimums.', 'Only push to min stack when value is <= current min.'],
    examples: [Example(input: 'push(-2), push(0), push(-3), getMin(), pop(), top()', output: '-3, 0', explanation: 'getMin returns -3; after pop, top is 0')],
  ),
  Problem(
    id: '28',
    title: 'Symmetric Tree',
    description: 'Given the root of a binary tree, check whether it is a mirror of itself.',
    difficulty: Difficulty.basic,
    tags: ['Tree', 'Depth-First Search'],
    solution: '''def is_symmetric(root):
    def is_mirror(left, right):
        if not left and not right:
            return True
        if not left or not right:
            return False
        return (left.val == right.val and
                is_mirror(left.left, right.right) and
                is_mirror(left.right, right.left))
    return is_mirror(root, root)''',
    timeComplexity: 'O(n)',
    spaceComplexity: 'O(h) - recursion stack',
    explanation: 'Recursively check if left subtree is a mirror of the right subtree.',
    hints: ['A tree is symmetric if left subtree mirrors right subtree.', 'Compare outer and inner pairs recursively.'],
    examples: [Example(input: 'root = [1,2,2,3,4,4,3]', output: 'true', explanation: 'The tree is a mirror of itself around the center')],
  ),
  Problem(
    id: '29',
    title: 'Binary Tree Level Order Traversal',
    description: 'Given root of binary tree, return level order traversal of its nodes values.',
    difficulty: Difficulty.basic,
    tags: ['Tree', 'Breadth-First Search'],
    solution: '''from collections import deque

def level_order(root):
    if not root:
        return []
    result = []
    queue = deque([root])
    while queue:
        level = []
        for _ in range(len(queue)):
            node = queue.popleft()
            level.append(node.val)
            if node.left:
                queue.append(node.left)
            if node.right:
                queue.append(node.right)
        result.append(level)
    return result''',
    timeComplexity: 'O(n)',
    spaceComplexity: 'O(w) where w is max width',
    explanation: 'Use BFS with a queue. Process all nodes at the current level before moving to the next.',
    hints: ['Use a queue for BFS.', 'Process nodes level by level.'],
    examples: [Example(input: 'root = [3,9,20,null,null,15,7]', output: '[[3],[9,20],[15,7]]', explanation: 'Nodes are traversed level by level from top to bottom')],
  ),
  Problem(
    id: '30',
    title: 'Maximum Depth of Binary Tree',
    description: 'Given the root of a binary tree, return its maximum depth.',
    difficulty: Difficulty.basic,
    tags: ['Tree', 'Depth-First Search'],
    solution: '''def max_depth(root):
    if not root:
        return 0
    return 1 + max(max_depth(root.left), max_depth(root.right))''',
    timeComplexity: 'O(n)',
    spaceComplexity: 'O(h)',
    explanation: 'Recursively find the maximum depth of left and right subtrees and add 1 for the current node.',
    hints: ['Base case: null node has depth 0.', 'Recursive case: 1 + max of left and right depths.'],
    examples: [Example(input: 'root = [3,9,20,null,null,15,7]', output: '3', explanation: 'The maximum depth is 3 along the path 3 -> 20 -> 15 or 3 -> 20 -> 7')],
  ),
  Problem(
    id: '31',
    title: 'Validate Binary Search Tree',
    description: 'Given the root of a binary tree, determine if it is a valid BST.',
    difficulty: Difficulty.basic,
    tags: ['Tree', 'Depth-First Search'],
    solution: '''def is_valid_bst(root):
    def validate(node, low, high):
        if not node:
            return True
        if not (low < node.val < high):
            return False
        return (validate(node.left, low, node.val) and
                validate(node.right, node.val, high))
    return validate(root, float('-inf'), float('inf'))''',
    timeComplexity: 'O(n)',
    spaceComplexity: 'O(h)',
    explanation: 'Each node must be within a valid range. Pass down min and max constraints for left and right subtrees.',
    hints: ['Each node must be greater than all left descendants and less than all right descendants.', 'Pass valid ranges down the tree.'],
    examples: [Example(input: 'root = [2,1,3]', output: 'true', explanation: 'Left child 1 is less than 2, and right child 3 is greater than 2')],
  ),
  Problem(
    id: '32',
    title: 'Same Tree',
    description: 'Given roots of two binary trees p and q, check if they are the same.',
    difficulty: Difficulty.basic,
    tags: ['Tree', 'Depth-First Search'],
    solution: '''def is_same_tree(p, q):
    if not p and not q:
        return True
    if not p or not q:
        return False
    return (p.val == q.val and
            is_same_tree(p.left, q.left) and
            is_same_tree(p.right, q.right))''',
    timeComplexity: 'O(n)',
    spaceComplexity: 'O(h)',
    explanation: 'Recursively check if values are equal and left/right subtrees are also the same.',
    hints: ['Base cases handle null nodes.', 'Recursive case checks value and both subtrees.'],
    examples: [Example(input: 'p = [1,2,3], q = [1,2,3]', output: 'true', explanation: 'Both trees have the same structure and node values')],
  ),
  Problem(
    id: '33',
    title: 'Number of 1 Bits',
    description: 'Given a positive integer n, write a function that returns the number of set bits in its binary representation.',
    difficulty: Difficulty.basic,
    tags: ['Bit Manipulation'],
    solution: '''def hamming_weight(n):
    count = 0
    while n:
        n &= n - 1
        count += 1
    return count''',
    timeComplexity: 'O(k) where k is number of set bits',
    spaceComplexity: 'O(1)',
    explanation: 'n & (n-1) clears the lowest set bit. Count how many times we can do this until n becomes 0.',
    hints: ['n & (n-1) clears the lowest set bit.', 'Count iterations until n becomes 0.'],
    examples: [Example(input: 'n = 11', output: '3', explanation: '11 in binary is 1011, which has 3 set bits')],
  ),

  // ==================== INTERMEDIATE (34-66) ====================
  Problem(
    id: '34',
    title: '3Sum',
    description: 'Given integer array nums, return all unique triplets [nums[i], nums[j], nums[k]] such that i != j != k and sum = 0.',
    difficulty: Difficulty.intermediate,
    tags: ['Array', 'Two Pointers', 'Sorting'],
    solution: '''def three_sum(nums):
    nums.sort()
    result = []
    for i in range(len(nums) - 2):
        if i > 0 and nums[i] == nums[i-1]:
            continue
        left, right = i + 1, len(nums) - 1
        while left < right:
            total = nums[i] + nums[left] + nums[right]
            if total < 0:
                left += 1
            elif total > 0:
                right -= 1
            else:
                result.append([nums[i], nums[left], nums[right]])
                while left < right and nums[left] == nums[left+1]:
                    left += 1
                while left < right and nums[right] == nums[right-1]:
                    right -= 1
                left += 1
                right -= 1
    return result''',
    timeComplexity: 'O(n^2)',
    spaceComplexity: 'O(1) excluding output',
    explanation: 'Sort the array. For each element, use two pointers to find pairs that sum to the negative of that element.',
    hints: ['Sorting helps avoid duplicates and use two pointers.', 'Skip duplicate values to ensure unique triplets.'],
    examples: [Example(input: 'nums = [-1,0,1,2,-1,-4]', output: '[[-1,-1,2],[-1,0,1]]', explanation: 'Two unique triplets sum to zero')],
  ),
  Problem(
    id: '35',
    title: 'Container With Most Water',
    description: 'Given n non-negative integers representing heights, find two lines that together with x-axis form a container that holds the most water.',
    difficulty: Difficulty.intermediate,
    tags: ['Array', 'Two Pointers'],
    solution: '''def max_area(height):
    left, right = 0, len(height) - 1
    max_water = 0
    while left < right:
        width = right - left
        max_water = max(max_water, min(height[left], height[right]) * width)
        if height[left] < height[right]:
            left += 1
        else:
            right -= 1
    return max_water''',
    timeComplexity: 'O(n)',
    spaceComplexity: 'O(1)',
    explanation: 'Two pointers from both ends. Move the pointer with smaller height because it limits the area.',
    hints: ['Area = width * min(height[left], height[right]).', 'Move the pointer with the smaller height inward.'],
    examples: [Example(input: 'height = [1,8,6,2,5,4,8,3,7]', output: '49', explanation: 'Lines at indices 1 and 8 form the max area of 49')],
  ),
  Problem(
    id: '36',
    title: 'Longest Substring Without Repeating Characters',
    description: 'Given a string s, find the length of the longest substring without repeating characters.',
    difficulty: Difficulty.intermediate,
    tags: ['String', 'Sliding Window', 'Hash Table'],
    solution: '''def length_of_longest_substring(s):
    char_index = {}
    max_len = start = 0
    for i, char in enumerate(s):
        if char in char_index and char_index[char] >= start:
            start = char_index[char] + 1
        max_len = max(max_len, i - start + 1)
        char_index[char] = i
    return max_len''',
    timeComplexity: 'O(n)',
    spaceComplexity: 'O(min(m, n)) where m is charset size',
    explanation: 'Sliding window: expand the window, and when a duplicate is found, shrink from the left.',
    hints: ['Use a sliding window approach.', 'Track the last seen index of each character.'],
    examples: [Example(input: 's = "abcabcbb"', output: '3', explanation: 'The longest substring without repeating characters is "abc"')],
  ),
  Problem(
    id: '37',
    title: 'Find Minimum in Rotated Sorted Array',
    description: 'Given sorted array rotated between 1 and n times, find the minimum element.',
    difficulty: Difficulty.intermediate,
    tags: ['Array', 'Binary Search'],
    solution: '''def find_min(nums):
    left, right = 0, len(nums) - 1
    while left < right:
        mid = (left + right) // 2
        if nums[mid] > nums[right]:
            left = mid + 1
        else:
            right = mid
    return nums[left]''',
    timeComplexity: 'O(log n)',
    spaceComplexity: 'O(1)',
    explanation: 'Modified binary search. If mid element > right element, minimum must be in right half.',
    hints: ['The array is sorted but rotated.', 'Compare middle element with rightmost to determine which half contains minimum.'],
    examples: [Example(input: 'nums = [3,4,5,1,2]', output: '1', explanation: 'The original array was [1,2,3,4,5] rotated 3 times')],
  ),
  Problem(
    id: '38',
    title: 'Search in Rotated Sorted Array',
    description: 'Given rotated sorted array with distinct values, return index of target or -1.',
    difficulty: Difficulty.intermediate,
    tags: ['Array', 'Binary Search'],
    solution: '''def search(nums, target):
    left, right = 0, len(nums) - 1
    while left <= right:
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
    return -1''',
    timeComplexity: 'O(log n)',
    spaceComplexity: 'O(1)',
    explanation: 'Determine which half is sorted, then check if target lies within that sorted half.',
    hints: ['One half is always sorted.', 'Check if target is in the sorted half.'],
    examples: [Example(input: 'nums = [4,5,6,7,0,1,2], target = 0', output: '4', explanation: '0 is found at index 4 in the rotated sorted array')],
  ),
  Problem(
    id: '39',
    title: 'Product of Array Except Self',
    description: 'Given integer array nums, return array answer such that answer[i] is product of all elements except nums[i].',
    difficulty: Difficulty.intermediate,
    tags: ['Array', 'Prefix Sum'],
    solution: '''def product_except_self(nums):
    n = len(nums)
    answer = [1] * n
    prefix = 1
    for i in range(n):
        answer[i] = prefix
        prefix *= nums[i]
    suffix = 1
    for i in range(n - 1, -1, -1):
        answer[i] *= suffix
        suffix *= nums[i]
    return answer''',
    timeComplexity: 'O(n)',
    spaceComplexity: 'O(1) excluding output',
    explanation: 'Compute prefix products in one pass, then suffix products in reverse, multiplying into the result.',
    hints: ['Compute prefix and suffix products.', 'You can do it in O(1) extra space by using the output array.'],
    examples: [Example(input: 'nums = [1,2,3,4]', output: '[24,12,8,6]', explanation: 'answer[i] is the product of all elements except nums[i]')],
  ),
  Problem(
    id: '40',
    title: 'Spiral Matrix',
    description: 'Given an m x n matrix, return all elements in spiral order.',
    difficulty: Difficulty.intermediate,
    tags: ['Array', 'Matrix', 'Simulation'],
    solution: '''def spiral_order(matrix):
    result = []
    while matrix:
        result += matrix.pop(0)
        if matrix and matrix[0]:
            for row in matrix:
                result.append(row.pop())
        if matrix:
            result += matrix.pop()[::-1]
        if matrix and matrix[0]:
            for row in matrix[::-1]:
                result.append(row.pop(0))
    return result''',
    timeComplexity: 'O(m * n)',
    spaceComplexity: 'O(1) excluding output',
    explanation: 'Peel layers from outside to inside: top row, right column, bottom row (reversed), left column (reversed).',
    hints: ['Process the outer layer first, then recurse on inner matrix.', 'Be careful with empty matrix conditions.'],
    examples: [Example(input: 'matrix = [[1,2,3],[4,5,6],[7,8,9]]', output: '[1,2,3,6,9,8,7,4,5]', explanation: 'Elements are returned in spiral order: top row, right col, bottom row, left col')],
  ),
  Problem(
    id: '41',
    title: 'Jump Game',
    description: 'Given array nums where each element represents max jump length, determine if you can reach last index.',
    difficulty: Difficulty.intermediate,
    tags: ['Array', 'Greedy'],
    solution: '''def can_jump(nums):
    max_reach = 0
    for i, num in enumerate(nums):
        if i > max_reach:
            return False
        max_reach = max(max_reach, i + num)
    return True''',
    timeComplexity: 'O(n)',
    spaceComplexity: 'O(1)',
    explanation: 'Track the farthest position reachable. If current index exceeds max_reach, we cannot proceed.',
    hints: ['Track the farthest index you can reach.', 'If current index exceeds max reach, return False.'],
    examples: [Example(input: 'nums = [2,3,1,1,4]', output: 'true', explanation: 'From index 0, jump to 1; from 1, jump to 4; reach the end')],
  ),
  Problem(
    id: '42',
    title: 'Merge Intervals',
    description: 'Given array of intervals, merge all overlapping intervals.',
    difficulty: Difficulty.intermediate,
    tags: ['Array', 'Sorting'],
    solution: '''def merge(intervals):
    if not intervals:
        return []
    intervals.sort(key=lambda x: x[0])
    merged = [intervals[0]]
    for current in intervals[1:]:
        last = merged[-1]
        if current[0] <= last[1]:
            last[1] = max(last[1], current[1])
        else:
            merged.append(current)
    return merged''',
    timeComplexity: 'O(n log n)',
    spaceComplexity: 'O(n)',
    explanation: 'Sort by start time. If current interval overlaps with last merged, extend the end; otherwise add new.',
    hints: ['Sort intervals by start time.', 'Check if current interval overlaps with the last merged one.'],
    examples: [Example(input: 'intervals = [[1,3],[2,6],[8,10],[15,18]]', output: '[[1,6],[8,10],[15,18]]', explanation: '[1,3] and [2,6] overlap and merge into [1,6]')],
  ),
  Problem(
    id: '43',
    title: 'Insert Interval',
    description: 'Given non-overlapping intervals and a new interval, insert and merge if necessary.',
    difficulty: Difficulty.intermediate,
    tags: ['Array', 'Sorting'],
    solution: '''def insert(intervals, newInterval):
    result = []
    i = 0
    while i < len(intervals) and intervals[i][1] < newInterval[0]:
        result.append(intervals[i])
        i += 1
    while i < len(intervals) and intervals[i][0] <= newInterval[1]:
        newInterval[0] = min(newInterval[0], intervals[i][0])
        newInterval[1] = max(newInterval[1], intervals[i][1])
        i += 1
    result.append(newInterval)
    while i < len(intervals):
        result.append(intervals[i])
        i += 1
    return result''',
    timeComplexity: 'O(n)',
    spaceComplexity: 'O(n)',
    explanation: 'Add all intervals before the new one, merge overlapping ones, then add the rest.',
    hints: ['Split into three parts: before, overlapping, and after.', 'Merge all overlapping intervals into one.'],
    examples: [Example(input: 'intervals = [[1,3],[6,9]], newInterval = [2,5]', output: '[[1,5],[6,9]]', explanation: '[2,5] overlaps with [1,3] and merges into [1,5]')],
  ),
  Problem(
    id: '44',
    title: 'Non-overlapping Intervals',
    description: 'Given array of intervals, return minimum number of intervals to remove to make rest non-overlapping.',
    difficulty: Difficulty.intermediate,
    tags: ['Array', 'Greedy', 'Sorting'],
    solution: '''def erase_overlap_intervals(intervals):
    if not intervals:
        return 0
    intervals.sort(key=lambda x: x[1])
    count = 0
    end = float('-inf')
    for interval in intervals:
        if interval[0] >= end:
            end = interval[1]
        else:
            count += 1
    return count''',
    timeComplexity: 'O(n log n)',
    spaceComplexity: 'O(1)',
    explanation: 'Greedy: sort by end time and always keep the interval that ends earliest to maximize remaining space.',
    hints: ['Sort by end time.', 'Greedily keep intervals that end earliest.'],
    examples: [Example(input: 'intervals = [[1,2],[2,3],[3,4],[1,3]]', output: '1', explanation: 'Remove [1,3] so the rest are non-overlapping')],
  ),
  Problem(
    id: '45',
    title: 'Group Anagrams',
    description: 'Given array of strings, group anagrams together.',
    difficulty: Difficulty.intermediate,
    tags: ['String', 'Hash Table'],
    solution: '''def group_anagrams(strs):
    from collections import defaultdict
    groups = defaultdict(list)
    for s in strs:
        key = ''.join(sorted(s))
        groups[key].append(s)
    return list(groups.values())''',
    timeComplexity: 'O(n * k log k) where k is max string length',
    spaceComplexity: 'O(n * k)',
    explanation: 'Use sorted string as key. All anagrams sort to the same string and fall into the same bucket.',
    hints: ['Anagrams have the same sorted characters.', 'Use sorted string as a hash key.'],
    examples: [Example(input: 'strs = ["eat","tea","tan","ate","nat","bat"]', output: '[["bat"],["nat","tan"],["ate","eat","tea"]]', explanation: 'Anagrams are grouped together regardless of order')],
  ),
  Problem(
    id: '46',
    title: 'Top K Frequent Elements',
    description: 'Given integer array nums and integer k, return the k most frequent elements.',
    difficulty: Difficulty.intermediate,
    tags: ['Array', 'Hash Table', 'Heap'],
    solution: '''def top_k_frequent(nums, k):
    from collections import Counter
    import heapq
    count = Counter(nums)
    return heapq.nlargest(k, count.keys(), key=count.get)''',
    timeComplexity: 'O(n log k)',
    spaceComplexity: 'O(n)',
    explanation: 'Count frequencies, then use a heap to get the k elements with highest counts.',
    hints: ['Count frequency with Counter.', 'Use heapq.nlargest for efficient top-k selection.'],
    examples: [Example(input: 'nums = [1,1,1,2,2,3], k = 2', output: '[1,2]', explanation: '1 appears 3 times, 2 appears 2 times; they are the top 2 frequent elements')],
  ),
  Problem(
    id: '47',
    title: 'Longest Consecutive Sequence',
    description: 'Given unsorted array of integers nums, return length of longest consecutive elements sequence.',
    difficulty: Difficulty.intermediate,
    tags: ['Array', 'Hash Table'],
    solution: '''def longest_consecutive(nums):
    num_set = set(nums)
    longest = 0
    for num in num_set:
        if num - 1 not in num_set:
            current_num = num
            current_streak = 1
            while current_num + 1 in num_set:
                current_num += 1
                current_streak += 1
            longest = max(longest, current_streak)
    return longest''',
    timeComplexity: 'O(n)',
    spaceComplexity: 'O(n)',
    explanation: 'Use a set for O(1) lookups. Only start counting from numbers that are the beginning of a sequence.',
    hints: ['Use a set for O(1) membership checks.', 'Only start counting when num-1 is not in the set.'],
    examples: [Example(input: 'nums = [100,4,200,1,3,2]', output: '4', explanation: 'The longest consecutive sequence is [1,2,3,4] with length 4')],
  ),
  Problem(
    id: '48',
    title: 'Word Break',
    description: 'Given string s and dictionary of strings wordDict, return true if s can be segmented into space-separated sequence of one or more dictionary words.',
    difficulty: Difficulty.intermediate,
    tags: ['String', 'Dynamic Programming'],
    solution: '''def word_break(s, wordDict):
    word_set = set(wordDict)
    dp = [False] * (len(s) + 1)
    dp[0] = True
    for i in range(1, len(s) + 1):
        for j in range(i):
            if dp[j] and s[j:i] in word_set:
                dp[i] = True
                break
    return dp[len(s)]''',
    timeComplexity: 'O(n^2 * m) where m is max word length',
    spaceComplexity: 'O(n)',
    explanation: 'DP: dp[i] is true if s[:i] can be segmented. For each i, check all possible previous breaks.',
    hints: ['dp[i] represents whether s[0:i] can be segmented.', 'Check all substrings ending at i.'],
    examples: [Example(input: 's = "leetcode", wordDict = ["leet","code"]', output: 'true', explanation: 'The string can be segmented as "leet code"')],
  ),
  Problem(
    id: '49',
    title: 'Decode Ways',
    description: 'Given encoded message containing digits, determine total number of ways to decode it (A=1, B=2, ..., Z=26).',
    difficulty: Difficulty.intermediate,
    tags: ['String', 'Dynamic Programming'],
    solution: '''def num_decodings(s):
    if not s or s[0] == '0':
        return 0
    n = len(s)
    dp = [0] * (n + 1)
    dp[0] = 1
    dp[1] = 1
    for i in range(2, n + 1):
        one_digit = int(s[i-1])
        two_digits = int(s[i-2:i])
        if 1 <= one_digit <= 9:
            dp[i] += dp[i-1]
        if 10 <= two_digits <= 26:
            dp[i] += dp[i-2]
    return dp[n]''',
    timeComplexity: 'O(n)',
    spaceComplexity: 'O(n) - can optimize to O(1)',
    explanation: 'DP: each digit can be decoded alone (if not 0), and each pair can be decoded if between 10-26.',
    hints: ['A single digit can be decoded if it is 1-9.', 'Two digits can be decoded if they form 10-26.'],
    examples: [Example(input: 's = "226"', output: '3', explanation: '"226" can be decoded as "BZ" (2 26), "VF" (22 6), or "BBF" (2 2 6)')],
  ),
  Problem(
    id: '50',
    title: 'House Robber',
    description: 'Given array nums representing money in each house, determine max money you can rob without alerting police (cannot rob adjacent houses).',
    difficulty: Difficulty.intermediate,
    tags: ['Dynamic Programming'],
    solution: '''def rob(nums):
    prev2 = 0
    prev1 = 0
    for num in nums:
        current = max(prev1, prev2 + num)
        prev2 = prev1
        prev1 = current
    return prev1''',
    timeComplexity: 'O(n)',
    spaceComplexity: 'O(1)',
    explanation: 'DP with space optimization: at each house, choose to rob it (prev2 + current) or skip it (prev1).',
    hints: ['At each house, the max is max(rob current + max from 2 ago, max from 1 ago).', 'Use two variables to track previous states.'],
    examples: [Example(input: 'nums = [2,7,9,3,1]', output: '12', explanation: 'Rob houses 0, 2, and 4 for a total of 2+9+1=12')],
  ),
  Problem(
    id: '51',
    title: 'Coin Change',
    description: 'Given coins of different denominations and amount, compute fewest number of coins needed to make up that amount.',
    difficulty: Difficulty.intermediate,
    tags: ['Dynamic Programming'],
    solution: '''def coin_change(coins, amount):
    dp = [float('inf')] * (amount + 1)
    dp[0] = 0
    for coin in coins:
        for x in range(coin, amount + 1):
            dp[x] = min(dp[x], dp[x - coin] + 1)
    return dp[amount] if dp[amount] != float('inf') else -1''',
    timeComplexity: 'O(amount * coins)',
    spaceComplexity: 'O(amount)',
    explanation: 'DP: dp[i] is the minimum coins to make amount i. For each coin, update all reachable amounts.',
    hints: ['dp[i] = minimum coins to make amount i.', 'For each coin, update all amounts from coin to target.'],
    examples: [Example(input: 'coins = [1,2,5], amount = 11', output: '3', explanation: '11 = 5 + 5 + 1, so 3 coins are needed')],
  ),
  Problem(
    id: '52',
    title: 'Longest Increasing Subsequence',
    description: 'Given integer array nums, return length of longest strictly increasing subsequence.',
    difficulty: Difficulty.intermediate,
    tags: ['Dynamic Programming', 'Binary Search'],
    solution: '''def length_of_lis(nums):
    import bisect
    tails = []
    for num in nums:
        idx = bisect.bisect_left(tails, num)
        if idx == len(tails):
            tails.append(num)
        else:
            tails[idx] = num
    return len(tails)''',
    timeComplexity: 'O(n log n)',
    spaceComplexity: 'O(n)',
    explanation: 'Patience sorting: maintain smallest tail for each length. Use binary search to find insertion point.',
    hints: ['tails[i] is the smallest tail of all increasing subsequences of length i+1.', 'Use binary search to find the correct position.'],
    examples: [Example(input: 'nums = [10,9,2,5,3,7,101,18]', output: '4', explanation: 'The longest increasing subsequence is [2,3,7,101] with length 4')],
  ),
  Problem(
    id: '53',
    title: 'Partition Equal Subset Sum',
    description: 'Given non-empty array containing only positive integers, determine if array can be partitioned into two subsets with equal sum.',
    difficulty: Difficulty.intermediate,
    tags: ['Dynamic Programming'],
    solution: '''def can_partition(nums):
    total = sum(nums)
    if total % 2 != 0:
        return False
    target = total // 2
    dp = [False] * (target + 1)
    dp[0] = True
    for num in nums:
        for i in range(target, num - 1, -1):
            dp[i] = dp[i] or dp[i - num]
    return dp[target]''',
    timeComplexity: 'O(n * target)',
    spaceComplexity: 'O(target)',
    explanation: 'Subset sum problem: check if there exists a subset that sums to total/2. 1D DP with reverse iteration.',
    hints: ['If total sum is odd, impossible to partition equally.', 'This is a 0/1 knapsack variant.'],
    examples: [Example(input: 'nums = [1,5,11,5]', output: 'true', explanation: 'The array can be partitioned into [1,5,5] and [11], both summing to 11')],
  ),
  Problem(
    id: '54',
    title: 'Number of Islands',
    description: 'Given m x n 2D binary grid representing map of 1s (land) and 0s (water), return number of islands.',
    difficulty: Difficulty.intermediate,
    tags: ['Graph', 'Depth-First Search', 'Breadth-First Search'],
    solution: '''def num_islands(grid):
    if not grid:
        return 0
    count = 0
    rows, cols = len(grid), len(grid[0])
    def dfs(r, c):
        if r < 0 or c < 0 or r >= rows or c >= cols or grid[r][c] == '0':
            return
        grid[r][c] = '0'
        dfs(r+1, c)
        dfs(r-1, c)
        dfs(r, c+1)
        dfs(r, c-1)
    for r in range(rows):
        for c in range(cols):
            if grid[r][c] == '1':
                count += 1
                dfs(r, c)
    return count''',
    timeComplexity: 'O(m * n)',
    spaceComplexity: 'O(m * n) - recursion stack',
    explanation: 'DFS/BFS from each unvisited land cell. Mark all connected land as visited. Count the number of DFS initiations.',
    hints: ['Traverse the grid and start DFS/BFS whenever you find unvisited land.', 'Mark visited cells to avoid double counting.'],
    examples: [Example(input: 'grid = [["1","1","0","0","0"],["1","1","0","0","0"],["0","0","1","0","0"],["0","0","0","1","1"]]', output: '3', explanation: 'There are three separate islands in the grid')],
  ),
  Problem(
    id: '55',
    title: 'Clone Graph',
    description: 'Given reference of a node in connected undirected graph, return deep copy of the graph.',
    difficulty: Difficulty.intermediate,
    tags: ['Graph', 'Depth-First Search', 'Breadth-First Search'],
    solution: '''class Node:
    def __init__(self, val=0, neighbors=None):
        self.val = val
        self.neighbors = neighbors if neighbors else []

def clone_graph(node):
    if not node:
        return None
    old_to_new = {}
    def clone(n):
        if n in old_to_new:
            return old_to_new[n]
        copy = Node(n.val)
        old_to_new[n] = copy
        for neighbor in n.neighbors:
            copy.neighbors.append(clone(neighbor))
        return copy
    return clone(node)''',
    timeComplexity: 'O(V + E)',
    spaceComplexity: 'O(V)',
    explanation: 'DFS with hash map to track cloned nodes. If node already cloned, return the clone; otherwise create and recursively clone neighbors.',
    hints: ['Use a hash map to track original node to clone mapping.', 'Recursively clone all neighbors.'],
    examples: [Example(input: 'adjList = [[2,4],[1,3],[2,4],[1,3]]', output: '[[2,4],[1,3],[2,4],[1,3]]', explanation: 'A deep copy of the connected undirected graph is returned')],
  ),
  Problem(
    id: '56',
    title: 'Course Schedule',
    description: 'Given numCourses and prerequisites, return true if you can finish all courses.',
    difficulty: Difficulty.intermediate,
    tags: ['Graph', 'Topological Sort'],
    solution: '''def can_finish(numCourses, prerequisites):
    from collections import defaultdict, deque
    graph = defaultdict(list)
    in_degree = [0] * numCourses
    for course, prereq in prerequisites:
        graph[prereq].append(course)
        in_degree[course] += 1
    queue = deque([i for i in range(numCourses) if in_degree[i] == 0])
    processed = 0
    while queue:
        course = queue.popleft()
        processed += 1
        for neighbor in graph[course]:
            in_degree[neighbor] -= 1
            if in_degree[neighbor] == 0:
                queue.append(neighbor)
    return processed == numCourses''',
    timeComplexity: 'O(V + E)',
    spaceComplexity: 'O(V + E)',
    explanation: 'Kahn\'s algorithm for topological sort. Process courses with no prerequisites, then reduce in-degrees of dependent courses.',
    hints: ['This is a cycle detection problem in a directed graph.', 'Use Kahn\'s algorithm (BFS topological sort).'],
    examples: [Example(input: 'numCourses = 2, prerequisites = [[1,0]]', output: 'true', explanation: 'Course 0 must be taken before course 1, so it is possible to finish all courses')],
  ),
  Problem(
    id: '57',
    title: 'Pacific Atlantic Water Flow',
    description: 'Given m x n matrix of non-negative integers representing heights, find coordinates where water can flow to both Pacific and Atlantic.',
    difficulty: Difficulty.intermediate,
    tags: ['Graph', 'Depth-First Search'],
    solution: '''def pacific_atlantic(heights):
    if not heights:
        return []
    rows, cols = len(heights), len(heights[0])
    pacific = [[False] * cols for _ in range(rows)]
    atlantic = [[False] * cols for _ in range(rows)]
    def dfs(r, c, visited, prev_height):
        if r < 0 or c < 0 or r >= rows or c >= cols or visited[r][c] or heights[r][c] < prev_height:
            return
        visited[r][c] = True
        dfs(r+1, c, visited, heights[r][c])
        dfs(r-1, c, visited, heights[r][c])
        dfs(r, c+1, visited, heights[r][c])
        dfs(r, c-1, visited, heights[r][c])
    for c in range(cols):
        dfs(0, c, pacific, 0)
        dfs(rows-1, c, atlantic, 0)
    for r in range(rows):
        dfs(r, 0, pacific, 0)
        dfs(r, cols-1, atlantic, 0)
    return [[r, c] for r in range(rows) for c in range(cols) if pacific[r][c] and atlantic[r][c]]''',
    timeComplexity: 'O(m * n)',
    spaceComplexity: 'O(m * n)',
    explanation: 'DFS from ocean borders inward. A cell can flow to an ocean if there is a path of non-increasing heights to that ocean.',
    hints: ['Start DFS from the ocean borders instead of from each cell.', 'A cell can flow to Pacific/Atlantic if there is a path from the ocean to it with non-decreasing heights.'],
    examples: [Example(input: 'heights = [[1,2,2,3,5],[3,2,3,4,4],[2,4,5,3,1],[6,7,1,4,5],[5,1,1,2,4]]', output: '[[0,4],[1,3],[1,4],[2,2],[3,0],[3,1],[4,0]]', explanation: 'Water from these cells can reach both the Pacific and Atlantic oceans')],
  ),
  Problem(
    id: '58',
    title: 'Rotting Oranges',
    description: 'Given m x n grid where each cell can be empty, fresh orange, or rotten orange, return minimum minutes until no fresh oranges remain.',
    difficulty: Difficulty.intermediate,
    tags: ['Graph', 'Breadth-First Search'],
    solution: '''def oranges_rotting(grid):
    from collections import deque
    rows, cols = len(grid), len(grid[0])
    queue = deque()
    fresh = 0
    for r in range(rows):
        for c in range(cols):
            if grid[r][c] == 2:
                queue.append((r, c))
            elif grid[r][c] == 1:
                fresh += 1
    minutes = 0
    directions = [(0,1), (0,-1), (1,0), (-1,0)]
    while queue and fresh > 0:
        minutes += 1
        for _ in range(len(queue)):
            r, c = queue.popleft()
            for dr, dc in directions:
                nr, nc = r + dr, c + dc
                if 0 <= nr < rows and 0 <= nc < cols and grid[nr][nc] == 1:
                    grid[nr][nc] = 2
                    fresh -= 1
                    queue.append((nr, nc))
    return minutes if fresh == 0 else -1''',
    timeComplexity: 'O(m * n)',
    spaceComplexity: 'O(m * n)',
    explanation: 'Multi-source BFS. Start from all rotten oranges simultaneously and spread minute by minute.',
    hints: ['Use BFS starting from all rotten oranges simultaneously.', 'Track the number of fresh oranges to determine if all can be rotted.'],
    examples: [Example(input: 'grid = [[2,1,1],[1,1,0],[0,1,1]]', output: '4', explanation: 'All fresh oranges become rotten in 4 minutes')],
  ),
  Problem(
    id: '59',
    title: 'Time Based Key-Value Store',
    description: 'Design time-based key-value store that can return value at a specified timestamp.',
    difficulty: Difficulty.intermediate,
    tags: ['Design', 'Binary Search', 'Hash Table'],
    solution: '''from collections import defaultdict
import bisect

class TimeMap:
    def __init__(self):
        self.store = defaultdict(list)

    def set(self, key, value, timestamp):
        self.store[key].append((timestamp, value))

    def get(self, key, timestamp):
        arr = self.store[key]
        if not arr or arr[0][0] > timestamp:
            return ""
        idx = bisect.bisect_right(arr, (timestamp, chr(127))) - 1
        return arr[idx][1]''',
    timeComplexity: 'O(1) for set, O(log n) for get',
    spaceComplexity: 'O(n)',
    explanation: 'Store values sorted by timestamp. Use binary search to find the largest timestamp <= given timestamp.',
    hints: ['Values are set in non-decreasing timestamp order.', 'Use bisect_right to find the latest valid timestamp.'],
    examples: [Example(input: 'set("foo","bar",1), get("foo",1)', output: '"bar"', explanation: 'The value set at timestamp 1 is returned for timestamp 1')],
  ),
  Problem(
    id: '60',
    title: 'LRU Cache',
    description: 'Design data structure that follows constraints of Least Recently Used (LRU) cache.',
    difficulty: Difficulty.intermediate,
    tags: ['Design', 'Hash Table', 'Linked List'],
    solution: '''from collections import OrderedDict

class LRUCache:
    def __init__(self, capacity):
        self.capacity = capacity
        self.cache = OrderedDict()

    def get(self, key):
        if key not in self.cache:
            return -1
        self.cache.move_to_end(key)
        return self.cache[key]

    def put(self, key, value):
        if key in self.cache:
            self.cache.move_to_end(key)
        self.cache[key] = value
        if len(self.cache) > self.capacity:
            self.cache.popitem(last=False)''',
    timeComplexity: 'O(1) for get and put',
    spaceComplexity: 'O(capacity)',
    explanation: 'OrderedDict maintains insertion order. Move accessed items to end. Evict from the beginning when over capacity.',
    hints: ['OrderedDict provides O(1) move_to_end and popitem.', 'Move accessed items to the end to mark as recently used.'],
    examples: [Example(input: 'LRUCache(2), put(1,1), put(2,2), get(1), put(3,3), get(2)', output: '1, -1', explanation: 'get(1) returns 1; after put(3,3), key 2 is evicted, so get(2) returns -1')],
  ),
  Problem(
    id: '61',
    title: 'Binary Tree Right Side View',
    description: 'Given root of binary tree, imagine standing on right side of it, return values of nodes you can see ordered from top to bottom.',
    difficulty: Difficulty.intermediate,
    tags: ['Tree', 'Breadth-First Search', 'Depth-First Search'],
    solution: '''def right_side_view(root):
    if not root:
        return []
    result = []
    from collections import deque
    queue = deque([root])
    while queue:
        level_size = len(queue)
        for i in range(level_size):
            node = queue.popleft()
            if i == level_size - 1:
                result.append(node.val)
            if node.left:
                queue.append(node.left)
            if node.right:
                queue.append(node.right)
    return result''',
    timeComplexity: 'O(n)',
    spaceComplexity: 'O(w)',
    explanation: 'BFS level by level. The last node of each level is visible from the right side.',
    hints: ['Do level-order traversal.', 'The last node in each level is visible from the right.'],
    examples: [Example(input: 'root = [1,2,3,null,5,null,4]', output: '[1,3,4]', explanation: 'The rightmost nodes at each level are 1, 3, and 4')],
  ),
  Problem(
    id: '62',
    title: 'Lowest Common Ancestor of BST',
    description: 'Given root of binary search tree and two nodes p and q, find lowest common ancestor (LCA).',
    difficulty: Difficulty.intermediate,
    tags: ['Tree', 'Binary Search Tree'],
    solution: '''def lowest_common_ancestor(root, p, q):
    while root:
        if p.val < root.val and q.val < root.val:
            root = root.left
        elif p.val > root.val and q.val > root.val:
            root = root.right
        else:
            return root''',
    timeComplexity: 'O(h) where h is tree height',
    spaceComplexity: 'O(1)',
    explanation: 'In BST, LCA is the first node where p and q diverge (one is on left, other on right, or one is the node itself).',
    hints: ['In BST, all left descendants are smaller and right are larger.', 'The LCA is where the paths to p and q diverge.'],
    examples: [Example(input: 'root = [6,2,8,0,4,7,9], p = 2, q = 8', output: '6', explanation: 'The LCA of nodes 2 and 8 is 6')],
  ),
  Problem(
    id: '63',
    title: 'Kth Smallest Element in BST',
    description: 'Given root of BST and integer k, return kth smallest element (1-indexed).',
    difficulty: Difficulty.intermediate,
    tags: ['Tree', 'Binary Search Tree'],
    solution: '''def kth_smallest(root, k):
    stack = []
    current = root
    while True:
        while current:
            stack.append(current)
            current = current.left
        current = stack.pop()
        k -= 1
        if k == 0:
            return current.val
        current = current.right''',
    timeComplexity: 'O(h + k) where h is height',
    spaceComplexity: 'O(h)',
    explanation: 'In-order traversal of BST yields sorted order. Do iterative in-order and stop at the kth element.',
    hints: ['In-order traversal of BST gives sorted sequence.', 'Use iterative in-order and stop when you reach the kth element.'],
    examples: [Example(input: 'root = [3,1,4,null,2], k = 1', output: '1', explanation: 'The 1st smallest element in the BST is 1')],
  ),
  Problem(
    id: '64',
    title: 'Construct Binary Tree from Preorder and Inorder',
    description: 'Given preorder and inorder traversal of tree, construct the binary tree.',
    difficulty: Difficulty.intermediate,
    tags: ['Tree', 'Array', 'Hash Table'],
    solution: '''def build_tree(preorder, inorder):
    if not preorder or not inorder:
        return None
    inorder_index = {val: idx for idx, val in enumerate(inorder)}
    preorder_iter = iter(preorder)
    def helper(left, right):
        if left > right:
            return None
        root_val = next(preorder_iter)
        root = TreeNode(root_val)
        index = inorder_index[root_val]
        root.left = helper(left, index - 1)
        root.right = helper(index + 1, right)
        return root
    return helper(0, len(inorder) - 1)''',
    timeComplexity: 'O(n)',
    spaceComplexity: 'O(n)',
    explanation: 'First element in preorder is root. Find it in inorder to split left and right subtrees. Recurse.',
    hints: ['First element of preorder is the root.', 'Find root in inorder to determine left and right subtree sizes.'],
    examples: [Example(input: 'preorder = [3,9,20,15,7], inorder = [9,3,15,20,7]', output: '[3,9,20,null,null,15,7]', explanation: 'The tree is reconstructed using preorder and inorder traversal rules')],
  ),
  Problem(
    id: '65',
    title: 'Serialize and Deserialize Binary Tree',
    description: 'Design algorithm to serialize and deserialize binary tree to/from string.',
    difficulty: Difficulty.intermediate,
    tags: ['Tree', 'Design', 'Depth-First Search'],
    solution: '''class Codec:
    def serialize(self, root):
        def encode(node):
            if not node:
                return "N,"
            return str(node.val) + "," + encode(node.left) + encode(node.right)
        return encode(root)

    def deserialize(self, data):
        def decode():
            val = next(values)
            if val == "N":
                return None
            node = TreeNode(int(val))
            node.left = decode()
            node.right = decode()
            return node
        values = iter(data.split(","))
        return decode()''',
    timeComplexity: 'O(n)',
    spaceComplexity: 'O(n)',
    explanation: 'Pre-order traversal with null markers. Use iterator during deserialization to consume values in order.',
    hints: ['Use pre-order traversal and mark null nodes.', 'Use an iterator to consume values sequentially during deserialization.'],
    examples: [Example(input: 'root = [1,2,3,null,null,4,5]', output: '"1,2,3,N,N,4,5,N,N,N,N"', explanation: 'The tree is serialized to a string and can be deserialized back to the same tree')],
  ),
  Problem(
    id: '66',
    title: 'Find Median from Data Stream',
    description: 'Implement MedianFinder class that continuously finds median of a growing integer stream.',
    difficulty: Difficulty.intermediate,
    tags: ['Design', 'Heap'],
    solution: '''import heapq

class MedianFinder:
    def __init__(self):
        self.small = []  # max heap (negated values)
        self.large = []  # min heap

    def addNum(self, num):
        heapq.heappush(self.small, -num)
        heapq.heappush(self.large, -heapq.heappop(self.small))
        if len(self.small) < len(self.large):
            heapq.heappush(self.small, -heapq.heappop(self.large))

    def findMedian(self):
        if len(self.small) > len(self.large):
            return -self.small[0]
        return (-self.small[0] + self.large[0]) / 2''',
    timeComplexity: 'O(log n) for addNum, O(1) for findMedian',
    spaceComplexity: 'O(n)',
    explanation: 'Two heaps: max heap for lower half, min heap for upper half. Balance them so their sizes differ by at most 1.',
    hints: ['Use a max heap for the lower half and min heap for the upper half.', 'Balance the heaps after each insertion.'],
    examples: [Example(input: 'addNum(1), addNum(2), findMedian(), addNum(3), findMedian()', output: '1.5, 2.0', explanation: 'After [1,2] median is (1+2)/2 = 1.5; after [1,2,3] median is 2')],
  ),

  // ==================== ADVANCED (67-100) ====================
  Problem(
    id: '67',
    title: 'Trapping Rain Water',
    description: 'Given n non-negative integers representing elevation map, compute how much water it can trap after raining.',
    difficulty: Difficulty.advanced,
    tags: ['Array', 'Two Pointers', 'Dynamic Programming'],
    solution: '''def trap(height):
    left, right = 0, len(height) - 1
    left_max = right_max = water = 0
    while left < right:
        if height[left] < height[right]:
            left_max = max(left_max, height[left])
            water += left_max - height[left]
            left += 1
        else:
            right_max = max(right_max, height[right])
            water += right_max - height[right]
            right -= 1
    return water''',
    timeComplexity: 'O(n)',
    spaceComplexity: 'O(1)',
    explanation: 'Two pointers: water trapped at a position is determined by the shorter of max left and max right heights.',
    hints: ['Water level at any point is determined by the minimum of max left and max right.', 'Use two pointers from both ends.'],
    examples: [Example(input: 'height = [0,1,0,2,1,0,1,3,2,1,2,1]', output: '6', explanation: 'The elevation map traps 6 units of water')],
  ),
  Problem(
    id: '68',
    title: 'First Missing Positive',
    description: 'Given unsorted integer array nums, return smallest missing positive integer in O(n) time and O(1) space.',
    difficulty: Difficulty.advanced,
    tags: ['Array', 'Cyclic Sort'],
    solution: '''def first_missing_positive(nums):
    n = len(nums)
    for i in range(n):
        while 1 <= nums[i] <= n and nums[nums[i] - 1] != nums[i]:
            nums[nums[i] - 1], nums[i] = nums[i], nums[nums[i] - 1]
    for i in range(n):
        if nums[i] != i + 1:
            return i + 1
    return n + 1''',
    timeComplexity: 'O(n)',
    spaceComplexity: 'O(1)',
    explanation: 'Cyclic sort: place each number x at index x-1. The first index i where nums[i] != i+1 gives the answer.',
    hints: ['The answer must be in range [1, n+1].', 'Try to place each number at its correct index.'],
    examples: [Example(input: 'nums = [3,4,-1,1]', output: '2', explanation: 'The smallest missing positive integer is 2')],
  ),
  Problem(
    id: '69',
    title: 'Sliding Window Maximum',
    description: 'Given array nums and integer k, return maximum value in each contiguous subarray of size k.',
    difficulty: Difficulty.advanced,
    tags: ['Array', 'Deque', 'Sliding Window'],
    solution: '''from collections import deque

def max_sliding_window(nums, k):
    result = []
    dq = deque()
    for i, num in enumerate(nums):
        while dq and dq[0] <= i - k:
            dq.popleft()
        while dq and nums[dq[-1]] <= num:
            dq.pop()
        dq.append(i)
        if i >= k - 1:
            result.append(nums[dq[0]])
    return result''',
    timeComplexity: 'O(n)',
    spaceComplexity: 'O(k)',
    explanation: 'Monotonic deque: maintain indices in decreasing order of values. Front is always the max of current window.',
    hints: ['Use a deque to maintain indices of elements in decreasing order.', 'Remove elements that are out of the window or smaller than current.'],
    examples: [Example(input: 'nums = [1,3,-1,-3,5,3,6,7], k = 3', output: '[3,3,5,5,6,7]', explanation: 'The maximum in each window of size 3 is shown')],
  ),
  Problem(
    id: '70',
    title: 'Minimum Window Substring',
    description: 'Given strings s and t, return minimum window in s which will contain all characters in t.',
    difficulty: Difficulty.advanced,
    tags: ['String', 'Sliding Window', 'Hash Table'],
    solution: '''from collections import Counter

def min_window(s, t):
    need = Counter(t)
    missing = len(t)
    left = start = end = 0
    for right, char in enumerate(s, 1):
        if need[char] > 0:
            missing -= 1
        need[char] -= 1
        if missing == 0:
            while left < right and need[s[left]] < 0:
                need[s[left]] += 1
                left += 1
            if not end or right - left < end - start:
                start, end = left, right
    return s[start:end]''',
    timeComplexity: 'O(|s| + |t|)',
    spaceComplexity: 'O(|t|)',
    explanation: 'Expand window until all characters are found, then shrink from left to find minimum valid window.',
    hints: ['Expand the window until it contains all required characters.', 'Then shrink from the left as much as possible while still valid.'],
    examples: [Example(input: 's = "ADOBECODEBANC", t = "ABC"', output: '"BANC"', explanation: '"BANC" is the minimum window substring containing A, B, and C')],
  ),
  Problem(
    id: '71',
    title: 'Word Search II',
    description: 'Given m x n board of characters and array of strings words, find all words on the board.',
    difficulty: Difficulty.advanced,
    tags: ['Trie', 'Backtracking'],
    solution: '''class TrieNode:
    def __init__(self):
        self.children = {}
        self.word = None

class Solution:
    def findWords(self, board, words):
        root = TrieNode()
        for word in words:
            node = root
            for char in word:
                node = node.children.setdefault(char, TrieNode())
            node.word = word

        result = []
        rows, cols = len(board), len(board[0])

        def dfs(r, c, node):
            char = board[r][c]
            if char not in node.children:
                return
            next_node = node.children[char]
            if next_node.word:
                result.append(next_node.word)
                next_node.word = None
            board[r][c] = '#'
            for dr, dc in [(0,1), (0,-1), (1,0), (-1,0)]:
                nr, nc = r + dr, c + dc
                if 0 <= nr < rows and 0 <= nc < cols and board[nr][nc] != '#':
                    dfs(nr, nc, next_node)
            board[r][c] = char
            if not next_node.children:
                node.children.pop(char)

        for r in range(rows):
            for c in range(cols):
                dfs(r, c, root)
        return result''',
    timeComplexity: 'O(m * n * 4^L) where L is max word length',
    spaceComplexity: 'O(total characters in words)',
    explanation: 'Build a trie from words, then DFS from each cell. Prune trie nodes when words are found to reduce redundant work.',
    hints: ['Build a Trie from the word list for efficient prefix matching.', 'Prune found words from the trie to avoid duplicates.'],
    examples: [Example(input: 'board = [["o","a","a","n"],["e","t","a","e"],["i","h","k","r"],["i","f","l","v"]], words = ["oath","pea","eat","rain"]', output: '["eat","oath"]', explanation: 'The words "eat" and "oath" can be found on the board')],
  ),
  Problem(
    id: '72',
    title: 'Edit Distance',
    description: 'Given two strings word1 and word2, return minimum number of operations to convert word1 to word2.',
    difficulty: Difficulty.advanced,
    tags: ['String', 'Dynamic Programming'],
    solution: '''def min_distance(word1, word2):
    m, n = len(word1), len(word2)
    dp = [[0] * (n + 1) for _ in range(m + 1)]
    for i in range(m + 1):
        dp[i][0] = i
    for j in range(n + 1):
        dp[0][j] = j
    for i in range(1, m + 1):
        for j in range(1, n + 1):
            if word1[i-1] == word2[j-1]:
                dp[i][j] = dp[i-1][j-1]
            else:
                dp[i][j] = 1 + min(dp[i-1][j], dp[i][j-1], dp[i-1][j-1])
    return dp[m][n]''',
    timeComplexity: 'O(m * n)',
    spaceComplexity: 'O(m * n)',
    explanation: 'DP: dp[i][j] is the edit distance between first i chars of word1 and first j chars of word2. Three operations: delete, insert, replace.',
    hints: ['dp[i][j] represents edit distance between prefixes.', 'If characters match, no cost. Otherwise, 1 + min(insert, delete, replace).'],
    examples: [Example(input: 'word1 = "horse", word2 = "ros"', output: '3', explanation: 'horse -> rorse (replace h with r) -> rose (remove r) -> ros (remove e)')],
  ),
  Problem(
    id: '73',
    title: 'Regular Expression Matching',
    description: 'Implement regular expression matching with support for . and *.',
    difficulty: Difficulty.advanced,
    tags: ['String', 'Dynamic Programming', 'Recursion'],
    solution: '''def is_match(s, p):
    memo = {}
    def dp(i, j):
        if (i, j) in memo:
            return memo[(i, j)]
        if j == len(p):
            return i == len(s)
        first_match = i < len(s) and p[j] in {s[i], '.'}
        if j + 1 < len(p) and p[j+1] == '*':
            result = dp(i, j+2) or (first_match and dp(i+1, j))
        else:
            result = first_match and dp(i+1, j+1)
        memo[(i, j)] = result
        return result
    return dp(0, 0)''',
    timeComplexity: 'O(m * n)',
    spaceComplexity: 'O(m * n)',
    explanation: 'DP with memoization. Handle * by choosing to skip the pattern or consume one matching character from s.',
    hints: ['* can match zero or more of the preceding element.', 'Use memoization to avoid recomputing states.'],
    examples: [Example(input: 's = "aa", p = "a*"', output: 'true', explanation: '* matches zero or more of the preceding a, so "a*" matches "aa"')],
  ),
  Problem(
    id: '74',
    title: 'Wildcard Matching',
    description: 'Given input string s and pattern p, implement wildcard matching with support for ? and *.',
    difficulty: Difficulty.advanced,
    tags: ['String', 'Dynamic Programming', 'Greedy'],
    solution: '''def is_match(s, p):
    s_len, p_len = len(s), len(p)
    s_idx = p_idx = 0
    star_idx = s_tmp_idx = -1
    while s_idx < s_len:
        if p_idx < p_len and p[p_idx] in ['?', s[s_idx]]:
            s_idx += 1
            p_idx += 1
        elif p_idx < p_len and p[p_idx] == '*':
            star_idx = p_idx
            s_tmp_idx = s_idx
            p_idx += 1
        elif star_idx == -1:
            return False
        else:
            p_idx = star_idx + 1
            s_tmp_idx += 1
            s_idx = s_tmp_idx
    return all(x == '*' for x in p[p_idx:])''',
    timeComplexity: 'O(s * p) worst case, O(s + p) average',
    spaceComplexity: 'O(1)',
    explanation: 'Greedy: track the last star position. When mismatch occurs, backtrack to last star and consume one more character.',
    hints: ['* can match any sequence including empty.', 'Track last star position to backtrack when mismatches occur.'],
    examples: [Example(input: 's = "aa", p = "*"', output: 'true', explanation: '* matches any sequence, so it matches "aa"')],
  ),
  Problem(
    id: '75',
    title: 'Distinct Subsequences',
    description: 'Given strings s and t, return number of distinct subsequences of s which equals t.',
    difficulty: Difficulty.advanced,
    tags: ['String', 'Dynamic Programming'],
    solution: '''def num_distinct(s, t):
    m, n = len(s), len(t)
    dp = [0] * (n + 1)
    dp[0] = 1
    for i in range(1, m + 1):
        for j in range(n, 0, -1):
            if s[i-1] == t[j-1]:
                dp[j] += dp[j-1]
    return dp[n]''',
    timeComplexity: 'O(m * n)',
    spaceComplexity: 'O(n)',
    explanation: 'DP: dp[j] is the number of ways to form t[:j] from s[:i]. If characters match, add ways without using current char.',
    hints: ['dp[j] = number of ways to form first j characters of t.', 'If s[i] == t[j], dp[j] += dp[j-1].'],
    examples: [Example(input: 's = "rabbbit", t = "rabbit"', output: '3', explanation: 'There are 3 ways to delete one b to form "rabbit"')],
  ),
  Problem(
    id: '76',
    title: 'Burst Balloons',
    description: 'Given n balloons with nums painted on them, burst balloons to collect maximum coins.',
    difficulty: Difficulty.advanced,
    tags: ['Dynamic Programming'],
    solution: '''def max_coins(nums):
    nums = [1] + nums + [1]
    n = len(nums)
    dp = [[0] * n for _ in range(n)]
    for length in range(2, n):
        for left in range(n - length):
            right = left + length
            for i in range(left + 1, right):
                dp[left][right] = max(dp[left][right],
                    nums[left] * nums[i] * nums[right] + dp[left][i] + dp[i][right])
    return dp[0][n - 1]''',
    timeComplexity: 'O(n^3)',
    spaceComplexity: 'O(n^2)',
    explanation: 'DP: think backwards - which balloon to burst last in range [left, right]. Add padding of 1 at boundaries.',
    hints: ['Think about which balloon is burst LAST in a range.', 'Add virtual balloons with value 1 at both ends.'],
    examples: [Example(input: 'nums = [3,1,5,8]', output: '167', explanation: 'The maximum coins collected by bursting balloons optimally is 167')],
  ),
  Problem(
    id: '77',
    title: 'Longest Valid Parentheses',
    description: 'Given string containing just ( and ), find length of longest valid well-formed parentheses substring.',
    difficulty: Difficulty.advanced,
    tags: ['String', 'Dynamic Programming', 'Stack'],
    solution: '''def longest_valid_parentheses(s):
    stack = [-1]
    max_len = 0
    for i, char in enumerate(s):
        if char == '(':
            stack.append(i)
        else:
            stack.pop()
            if not stack:
                stack.append(i)
            else:
                max_len = max(max_len, i - stack[-1])
    return max_len''',
    timeComplexity: 'O(n)',
    spaceComplexity: 'O(n)',
    explanation: 'Stack stores indices. Push for (, pop for ). Calculate length using current index and new stack top after pop.',
    hints: ['Use a stack to track indices of unmatched parentheses.', 'Calculate length when a match is found.'],
    examples: [Example(input: 's = "(()"', output: '2', explanation: 'The longest valid parentheses substring is "()" with length 2')],
  ),
  Problem(
    id: '78',
    title: 'Interleaving String',
    description: 'Given strings s1, s2, and s3, determine if s3 is formed by interleaving s1 and s2.',
    difficulty: Difficulty.advanced,
    tags: ['String', 'Dynamic Programming'],
    solution: '''def is_interleave(s1, s2, s3):
    if len(s1) + len(s2) != len(s3):
        return False
    dp = [False] * (len(s2) + 1)
    dp[0] = True
    for j in range(1, len(s2) + 1):
        dp[j] = dp[j-1] and s2[j-1] == s3[j-1]
    for i in range(1, len(s1) + 1):
        dp[0] = dp[0] and s1[i-1] == s3[i-1]
        for j in range(1, len(s2) + 1):
            dp[j] = (dp[j] and s1[i-1] == s3[i+j-1]) or (dp[j-1] and s2[j-1] == s3[i+j-1])
    return dp[len(s2)]''',
    timeComplexity: 'O(m * n)',
    spaceComplexity: 'O(n)',
    explanation: 'DP: dp[j] means s1[:i] and s2[:j] can form s3[:i+j]. Update row by row with 1D array.',
    hints: ['dp[i][j] represents whether s3[:i+j] can be formed.', 'Check if current character matches either s1[i-1] or s2[j-1].'],
    examples: [Example(input: 's1 = "aabcc", s2 = "dbbca", s3 = "aadbbcbcac"', output: 'true', explanation: 's3 is formed by interleaving s1 and s2')],
  ),
  Problem(
    id: '79',
    title: 'Scramble String',
    description: 'Given strings s1 and s2 of same length, determine if s2 is a scrambled string of s1.',
    difficulty: Difficulty.advanced,
    tags: ['String', 'Dynamic Programming', 'Recursion'],
    solution: '''def is_scramble(s1, s2):
    if len(s1) != len(s2):
        return False
    n = len(s1)
    dp = [[[False] * (n + 1) for _ in range(n)] for _ in range(n)]
    for i in range(n):
        for j in range(n):
            dp[i][j][1] = s1[i] == s2[j]
    for length in range(2, n + 1):
        for i in range(n - length + 1):
            for j in range(n - length + 1):
                for k in range(1, length):
                    if (dp[i][j][k] and dp[i+k][j+k][length-k]) or \
                       (dp[i][j+length-k][k] and dp[i+k][j][length-k]):
                        dp[i][j][length] = True
                        break
    return dp[0][0][n]''',
    timeComplexity: 'O(n^4)',
    spaceComplexity: 'O(n^3)',
    explanation: '3D DP: dp[i][j][len] means s1[i:i+len] and s2[j:j+len] are scrambles. Try all split points and both orientations.',
    hints: ['A string can be split at any point and the two halves can be swapped.', 'Use 3D DP to track all substrings.'],
    examples: [Example(input: 's1 = "great", s2 = "rgeat"', output: 'true', explanation: '"rgeat" is a scrambled string of "great"')],
  ),
  Problem(
    id: '80',
    title: 'Best Time to Buy and Sell Stock IV',
    description: 'Given integer k and array prices, find max profit with at most k transactions.',
    difficulty: Difficulty.advanced,
    tags: ['Dynamic Programming'],
    solution: '''def max_profit_k(k, prices):
    n = len(prices)
    if k >= n // 2:
        profit = 0
        for i in range(1, n):
            if prices[i] > prices[i-1]:
                profit += prices[i] - prices[i-1]
        return profit
    dp = [[0] * n for _ in range(k + 1)]
    for t in range(1, k + 1):
        max_diff = -prices[0]
        for d in range(1, n):
            dp[t][d] = max(dp[t][d-1], prices[d] + max_diff)
            max_diff = max(max_diff, dp[t-1][d] - prices[d])
    return dp[k][n-1]''',
    timeComplexity: 'O(k * n)',
    spaceComplexity: 'O(k * n)',
    explanation: 'DP optimized with max_diff. If k >= n/2, treat as unlimited transactions. Otherwise, optimize inner loop.',
    hints: ['If k >= n/2, it is equivalent to unlimited transactions.', 'Use max_diff to optimize the DP transition.'],
    examples: [Example(input: 'k = 2, prices = [3,2,6,5,0,3]', output: '7', explanation: 'Buy at 2, sell at 6 (profit 4); buy at 0, sell at 3 (profit 3); total 7')],
  ),
  Problem(
    id: '81',
    title: 'Palindrome Partitioning II',
    description: 'Given string s, partition s such that every substring is a palindrome. Return minimum cuts needed.',
    difficulty: Difficulty.advanced,
    tags: ['String', 'Dynamic Programming'],
    solution: '''def min_cut(s):
    n = len(s)
    dp = [i - 1 for i in range(n + 1)]
    for center in range(n):
        # Odd length
        left = right = center
        while left >= 0 and right < n and s[left] == s[right]:
            dp[right + 1] = min(dp[right + 1], dp[left] + 1)
            left -= 1
            right += 1
        # Even length
        left, right = center, center + 1
        while left >= 0 and right < n and s[left] == s[right]:
            dp[right + 1] = min(dp[right + 1], dp[left] + 1)
            left -= 1
            right += 1
    return dp[n]''',
    timeComplexity: 'O(n^2)',
    spaceComplexity: 'O(n)',
    explanation: 'Expand around centers to find all palindromes. Update DP: dp[i] = min cuts for s[:i].',
    hints: ['Expand around center to find all palindromic substrings.', 'dp[i] = minimum cuts for prefix of length i.'],
    examples: [Example(input: 's = "aab"', output: '1', explanation: 'The palindrome partitioning ["aa","b"] needs only 1 cut')],
  ),
  Problem(
    id: '82',
    title: 'Word Ladder',
    description: 'Given beginWord, endWord, and wordList, return length of shortest transformation sequence from beginWord to endWord.',
    difficulty: Difficulty.advanced,
    tags: ['Graph', 'Breadth-First Search'],
    solution: '''from collections import deque, defaultdict

def ladder_length(beginWord, endWord, wordList):
    if endWord not in wordList:
        return 0
    word_set = set(wordList)
    queue = deque([(beginWord, 1)])
    while queue:
        word, length = queue.popleft()
        if word == endWord:
            return length
        for i in range(len(word)):
            for c in 'abcdefghijklmnopqrstuvwxyz':
                next_word = word[:i] + c + word[i+1:]
                if next_word in word_set:
                    word_set.remove(next_word)
                    queue.append((next_word, length + 1))
    return 0''',
    timeComplexity: 'O(m^2 * n) where m is word length, n is wordList size',
    spaceComplexity: 'O(m * n)',
    explanation: 'BFS on word transformation graph. Try changing each character to a-z and check if the new word exists in the dictionary.',
    hints: ['Treat each word as a node; edges exist if words differ by one character.', 'BFS guarantees shortest path.'],
    examples: [Example(input: 'beginWord = "hit", endWord = "cog", wordList = ["hot","dot","dog","lot","log","cog"]', output: '5', explanation: 'The shortest sequence is "hit" -> "hot" -> "dot" -> "dog" -> "cog"')],
  ),
  Problem(
    id: '83',
    title: 'Word Ladder II',
    description: 'Return all shortest transformation sequences from beginWord to endWord.',
    difficulty: Difficulty.advanced,
    tags: ['Graph', 'Breadth-First Search', 'Backtracking'],
    solution: '''from collections import deque, defaultdict

def find_ladders(beginWord, endWord, wordList):
    word_set = set(wordList)
    if endWord not in word_set:
        return []
    # BFS to build graph
    graph = defaultdict(list)
    visited = set([beginWord])
    queue = deque([beginWord])
    found = False
    while queue and not found:
        local_visited = set()
        for _ in range(len(queue)):
            word = queue.popleft()
            for i in range(len(word)):
                for c in 'abcdefghijklmnopqrstuvwxyz':
                    next_word = word[:i] + c + word[i+1:]
                    if next_word in word_set and next_word not in visited:
                        graph[word].append(next_word)
                        local_visited.add(next_word)
                        if next_word == endWord:
                            found = True
        for word in local_visited:
            visited.add(word)
            queue.append(word)
    # DFS to find all paths
    result = []
    def dfs(word, path):
        if word == endWord:
            result.append(path[:])
            return
        for next_word in graph[word]:
            path.append(next_word)
            dfs(next_word, path)
            path.pop()
    dfs(beginWord, [beginWord])
    return result''',
    timeComplexity: 'O(n * m^2 + p) where p is number of paths',
    spaceComplexity: 'O(n * m^2)',
    explanation: 'Two-phase: BFS to build the shortest path DAG, then DFS to enumerate all shortest paths.',
    hints: ['First BFS to find shortest distances and build DAG.', 'Then DFS to enumerate all shortest paths.'],
    examples: [Example(input: 'beginWord = "hit", endWord = "cog", wordList = ["hot","dot","dog","lot","log","cog"]', output: '[["hit","hot","dot","dog","cog"],["hit","hot","lot","log","cog"]]', explanation: 'There are two shortest transformation sequences')],
  ),
  Problem(
    id: '84',
    title: 'Alien Dictionary',
    description: 'Given list of words from alien language sorted lexicographically, derive order of letters.',
    difficulty: Difficulty.advanced,
    tags: ['Graph', 'Topological Sort'],
    solution: '''from collections import defaultdict, deque

def alien_order(words):
    graph = defaultdict(set)
    in_degree = {c: 0 for word in words for c in word}
    for i in range(len(words) - 1):
        w1, w2 = words[i], words[i+1]
        min_len = min(len(w1), len(w2))
        if len(w1) > len(w2) and w1[:min_len] == w2[:min_len]:
            return ""
        for j in range(min_len):
            if w1[j] != w2[j]:
                if w2[j] not in graph[w1[j]]:
                    graph[w1[j]].add(w2[j])
                    in_degree[w2[j]] += 1
                break
    queue = deque([c for c in in_degree if in_degree[c] == 0])
    result = []
    while queue:
        c = queue.popleft()
        result.append(c)
        for neighbor in graph[c]:
            in_degree[neighbor] -= 1
            if in_degree[neighbor] == 0:
                queue.append(neighbor)
    return "".join(result) if len(result) == len(in_degree) else ""''',
    timeComplexity: 'O(C) where C is total characters',
    spaceComplexity: 'O(1) - 26 letters max',
    explanation: 'Build graph by comparing adjacent words. Topological sort to determine letter ordering. Detect cycles.',
    hints: ['Compare adjacent words to find character ordering.', 'Use topological sort (Kahn\'s algorithm).'],
    examples: [Example(input: 'words = ["wrt","wrf","er","ett","rftt"]', output: '"wertf"', explanation: 'The derived order from the sorted dictionary is wertf')],
  ),
  Problem(
    id: '85',
    title: 'Cheapest Flights Within K Stops',
    description: 'There are n cities connected by flights. Find cheapest price from src to dst with at most k stops.',
    difficulty: Difficulty.advanced,
    tags: ['Graph', 'Dynamic Programming', 'Shortest Path'],
    solution: '''def find_cheapest_price(n, flights, src, dst, k):
    prices = [float('inf')] * n
    prices[src] = 0
    for _ in range(k + 1):
        temp = prices[:]
        for u, v, w in flights:
            if prices[u] != float('inf') and prices[u] + w < temp[v]:
                temp[v] = prices[u] + w
        prices = temp
    return prices[dst] if prices[dst] != float('inf') else -1''',
    timeComplexity: 'O(k * E) where E is number of flights',
    spaceComplexity: 'O(n)',
    explanation: 'Bellman-Ford variant: relax all edges k+1 times. Use temp array to ensure stops constraint is respected.',
    hints: ['This is a shortest path with constraint on number of edges.', 'Use Bellman-Ford with exactly k+1 relaxation passes.'],
    examples: [Example(input: 'n = 4, flights = [[0,1,100],[1,2,100],[2,0,100],[1,3,600],[2,3,200]], src = 0, dst = 3, k = 1', output: '700', explanation: 'Cheapest path is 0 -> 1 -> 3 with cost 700 and at most 1 stop')],
  ),
  Problem(
    id: '86',
    title: 'Network Delay Time',
    description: 'Given times[i] = (ui, vi, wi), time for signal to travel from ui to vi. Return time for all nodes to receive signal.',
    difficulty: Difficulty.advanced,
    tags: ['Graph', 'Dijkstra', 'Shortest Path'],
    solution: '''import heapq
from collections import defaultdict

def network_delay_time(times, n, k):
    graph = defaultdict(list)
    for u, v, w in times:
        graph[u].append((v, w))
    dist = {i: float('inf') for i in range(1, n + 1)}
    dist[k] = 0
    pq = [(0, k)]
    while pq:
        d, node = heapq.heappop(pq)
        if d > dist[node]:
            continue
        for neighbor, weight in graph[node]:
            new_dist = d + weight
            if new_dist < dist[neighbor]:
                dist[neighbor] = new_dist
                heapq.heappush(pq, (new_dist, neighbor))
    max_dist = max(dist.values())
    return max_dist if max_dist != float('inf') else -1''',
    timeComplexity: 'O(E log V)',
    spaceComplexity: 'O(V + E)',
    explanation: 'Dijkstra\'s algorithm from source k. The answer is the maximum distance among all nodes.',
    hints: ['Use Dijkstra to find shortest path from source to all nodes.', 'Return the maximum of all shortest distances.'],
    examples: [Example(input: 'times = [[2,1,1],[2,3,1],[3,4,1]], n = 4, k = 2', output: '2', explanation: 'The signal takes 2 time units to reach all nodes from node 2')],
  ),
  Problem(
    id: '87',
    title: 'Swim in Rising Water',
    description: 'In n x n grid, each square has elevation. Rain falls and at time t, depth everywhere is t. Find least time to reach bottom right.',
    difficulty: Difficulty.advanced,
    tags: ['Graph', 'Dijkstra', 'Heap'],
    solution: '''import heapq

def swim_in_water(grid):
    n = len(grid)
    visited = [[False] * n for _ in range(n)]
    pq = [(grid[0][0], 0, 0)]
    directions = [(0,1), (0,-1), (1,0), (-1,0)]
    while pq:
        t, r, c = heapq.heappop(pq)
        if r == n - 1 and c == n - 1:
            return t
        if visited[r][c]:
            continue
        visited[r][c] = True
        for dr, dc in directions:
            nr, nc = r + dr, c + dc
            if 0 <= nr < n and 0 <= nc < n and not visited[nr][nc]:
                heapq.heappush(pq, (max(t, grid[nr][nc]), nr, nc))
    return -1''',
    timeComplexity: 'O(n^2 log n)',
    spaceComplexity: 'O(n^2)',
    explanation: 'Dijkstra on grid: cost to enter cell is max(current_time, cell_elevation). Find minimum max elevation along any path.',
    hints: ['The cost to reach a cell is the maximum elevation encountered so far.', 'Use Dijkstra\'s algorithm with this modified cost.'],
    examples: [Example(input: 'grid = [[0,2],[1,3]]', output: '3', explanation: 'At time 3, the water depth allows reaching the bottom-right cell')],
  ),
  Problem(
    id: '88',
    title: 'Making A Large Island',
    description: 'In n x n binary grid, you can change at most one 0 to 1. Return size of largest island.',
    difficulty: Difficulty.advanced,
    tags: ['Graph', 'Depth-First Search'],
    solution: '''def largest_island(grid):
    n = len(grid)
    island_id = 2
    sizes = {0: 0}
    def dfs(r, c, id):
        if r < 0 or c < 0 or r >= n or c >= n or grid[r][c] != 1:
            return 0
        grid[r][c] = id
        return 1 + dfs(r+1, c, id) + dfs(r-1, c, id) + dfs(r, c+1, id) + dfs(r, c-1, id)
    for r in range(n):
        for c in range(n):
            if grid[r][c] == 1:
                sizes[island_id] = dfs(r, c, island_id)
                island_id += 1
    max_size = max(sizes.values())
    for r in range(n):
        for c in range(n):
            if grid[r][c] == 0:
                neighbor_ids = set()
                for dr, dc in [(0,1), (0,-1), (1,0), (-1,0)]:
                    nr, nc = r + dr, c + dc
                    if 0 <= nr < n and 0 <= nc < n:
                        neighbor_ids.add(grid[nr][nc])
                max_size = max(max_size, 1 + sum(sizes[id] for id in neighbor_ids))
    return max_size''',
    timeComplexity: 'O(n^2)',
    spaceComplexity: 'O(n^2)',
    explanation: 'Label each island with unique ID and record sizes. For each 0, check neighboring islands and calculate potential size.',
    hints: ['First, label all islands and record their sizes.', 'For each 0, sum sizes of all unique neighboring islands plus 1.'],
    examples: [Example(input: 'grid = [[1,0],[0,1]]', output: '3', explanation: 'Changing one 0 to 1 connects two islands into one of size 3')],
  ),
  Problem(
    id: '89',
    title: 'Shortest Path in a Grid with Obstacles Elimination',
    description: 'Given m x n grid, each cell is 0 (empty) or 1 (obstacle). You can eliminate at most k obstacles. Find shortest path.',
    difficulty: Difficulty.advanced,
    tags: ['Graph', 'Breadth-First Search'],
    solution: '''from collections import deque

def shortest_path(grid, k):
    m, n = len(grid), len(grid[0])
    if k >= m + n - 2:
        return m + n - 2
    visited = [[[False] * (k + 1) for _ in range(n)] for _ in range(m)]
    queue = deque([(0, 0, 0, 0)])
    visited[0][0][0] = True
    directions = [(0,1), (0,-1), (1,0), (-1,0)]
    while queue:
        r, c, eliminated, steps = queue.popleft()
        if r == m - 1 and c == n - 1:
            return steps
        for dr, dc in directions:
            nr, nc = r + dr, c + dc
            if 0 <= nr < m and 0 <= nc < n:
                new_eliminated = eliminated + grid[nr][nc]
                if new_eliminated <= k and not visited[nr][nc][new_eliminated]:
                    visited[nr][nc][new_eliminated] = True
                    queue.append((nr, nc, new_eliminated, steps + 1))
    return -1''',
    timeComplexity: 'O(m * n * k)',
    spaceComplexity: 'O(m * n * k)',
    explanation: 'BFS with state (row, col, obstacles_eliminated). Track visited for each elimination count separately.',
    hints: ['State includes position and number of obstacles eliminated.', 'BFS naturally finds shortest path.'],
    examples: [Example(input: 'grid = [[0,0,0],[1,1,0],[0,0,0],[0,1,1],[0,0,0]], k = 1', output: '6', explanation: 'The shortest path with at most 1 obstacle eliminated has length 6')],
  ),
  Problem(
    id: '90',
    title: 'Design In-Memory File System',
    description: 'Design an in-memory file system to create paths, and associate values with them.',
    difficulty: Difficulty.advanced,
    tags: ['Design', 'Trie', 'Hash Table'],
    solution: '''class FileSystem:
    def __init__(self):
        self.paths = {}
        self.files = {}

    def ls(self, path):
        if path in self.files:
            return [path.split('/')[-1]]
        dirs = sorted([p[len(path):].split('/')[0] for p in self.paths if p.startswith(path + '/') and p != path])
        return dirs if dirs else []

    def mkdir(self, path):
        self.paths[path] = True
        parts = path.split('/')
        for i in range(2, len(parts) + 1):
            self.paths['/'.join(parts[:i])] = True

    def addContentToFile(self, filePath, content):
        self.mkdir(filePath)
        self.files[filePath] = self.files.get(filePath, "") + content

    def readContentFromFile(self, filePath):
        return self.files[filePath]''',
    timeComplexity: 'O(paths) for mkdir, O(1) for read/write',
    spaceComplexity: 'O(total content + paths)',
    explanation: 'Use dictionaries to track valid paths and file contents. Auto-create parent directories on mkdir.',
    hints: ['Store valid paths and file contents separately.', 'Auto-create all parent directories when mkdir is called.'],
    examples: [Example(input: 'mkdir("/a/b/c"), addContentToFile("/a/b/c/d","hello"), readContentFromFile("/a/b/c/d")', output: '"hello"', explanation: 'Content written to the file is read back correctly')],
  ),
  Problem(
    id: '91',
    title: 'LFU Cache',
    description: 'Design and implement LFU (Least Frequently Used) cache.',
    difficulty: Difficulty.advanced,
    tags: ['Design', 'Hash Table', 'Linked List'],
    solution: '''from collections import defaultdict

class LFUCache:
    def __init__(self, capacity):
        self.capacity = capacity
        self.min_freq = 0
        self.key_to_val_freq = {}
        self.freq_to_keys = defaultdict(dict)
        self.key_order = {}

    def get(self, key):
        if key not in self.key_to_val_freq:
            return -1
        val, freq = self.key_to_val_freq[key]
        del self.freq_to_keys[freq][key]
        if not self.freq_to_keys[freq]:
            del self.freq_to_keys[freq]
            if self.min_freq == freq:
                self.min_freq += 1
        self.key_to_val_freq[key] = (val, freq + 1)
        self.freq_to_keys[freq + 1][key] = True
        return val

    def put(self, key, value):
        if self.capacity <= 0:
            return
        if key in self.key_to_val_freq:
            self.key_to_val_freq[key] = (value, self.key_to_val_freq[key][1])
            self.get(key)
            self.key_to_val_freq[key] = (value, self.key_to_val_freq[key][1])
            return
        if len(self.key_to_val_freq) >= self.capacity:
            evict = next(iter(self.freq_to_keys[self.min_freq]))
            del self.freq_to_keys[self.min_freq][evict]
            del self.key_to_val_freq[evict]
        self.key_to_val_freq[key] = (value, 1)
        self.freq_to_keys[1][key] = True
        self.min_freq = 1''',
    timeComplexity: 'O(1) for get and put',
    spaceComplexity: 'O(capacity)',
    explanation: 'Track frequency of each key. Evict the least frequently used key; if tie, evict the oldest among them.',
    hints: ['Track key frequencies with a hash map.', 'Evict the key with minimum frequency when capacity is exceeded.'],
    examples: [Example(input: 'LFUCache(2), put(1,1), put(2,2), get(1), put(3,3), get(2), get(3)', output: '1, -1, 3', explanation: 'get(1) returns 1; put(3,3) evicts key 2; get(2) returns -1; get(3) returns 3')],
  ),
  Problem(
    id: '92',
    title: 'Design Search Autocomplete System',
    description: 'Design search autocomplete system for sentences based on historical hot degrees.',
    difficulty: Difficulty.advanced,
    tags: ['Design', 'Trie', 'Heap'],
    solution: '''class TrieNode:
    def __init__(self):
        self.children = {}
        self.sentences = {}

class AutocompleteSystem:
    def __init__(self, sentences, times):
        self.root = TrieNode()
        self.search_term = ""
        for s, t in zip(sentences, times):
            self._add(s, t)

    def _add(self, sentence, times):
        node = self.root
        for char in sentence:
            if char not in node.children:
                node.children[char] = TrieNode()
            node = node.children[char]
            node.sentences[sentence] = node.sentences.get(sentence, 0) + times

    def input(self, c):
        if c == '#':
            self._add(self.search_term, 1)
            self.search_term = ""
            return []
        self.search_term += c
        node = self.root
        for char in self.search_term:
            if char not in node.children:
                return []
            node = node.children[char]
        result = sorted(node.sentences.items(), key=lambda x: (-x[1], x[0]))
        return [s for s, _ in result[:3]]''',
    timeComplexity: 'O(n) for input where n is length of sentence',
    spaceComplexity: 'O(total characters)',
    explanation: 'Trie where each node stores sentence frequencies. On input, traverse trie and return top 3 by hot degree then lexicographical order.',
    hints: ['Use a Trie to store sentences.', 'At each node, store the frequency of all sentences passing through it.'],
    examples: [Example(input: 'sentences = ["i love you","island","ironman","i love leetcode"], times = [5,3,2,2], input("i ")', output: '["i love you","i love leetcode","island"]', explanation: 'Top 3 sentences matching prefix "i " sorted by frequency')],
  ),
  Problem(
    id: '93',
    title: 'Stream of Characters',
    description: 'Design algorithm which receives stream of characters and checks if suffix forms any word in words.',
    difficulty: Difficulty.advanced,
    tags: ['Design', 'Trie', 'String'],
    solution: '''class StreamChecker:
    def __init__(self, words):
        self.trie = {}
        self.stream = []
        for word in words:
            node = self.trie
            for char in reversed(word):
                if char not in node:
                    node[char] = {}
                node = node[char]
            node['#'] = True

    def query(self, letter):
        self.stream.append(letter)
        node = self.trie
        for char in reversed(self.stream):
            if char not in node:
                return False
            node = node[char]
            if '#' in node:
                return True
        return False''',
    timeComplexity: 'O(m) per query where m is max word length',
    spaceComplexity: 'O(total characters)',
    explanation: 'Build reversed trie. On query, check reversed stream against trie. Return true if any word suffix matches.',
    hints: ['Build the trie with reversed words.', 'Check the reversed stream against the trie.'],
    examples: [Example(input: 'words = ["cd","f","kl"], query("a"), query("b"), query("c"), query("d")', output: 'false, false, false, true', explanation: 'Suffix "d" matches word "cd"')],
  ),
  Problem(
    id: '94',
    title: 'Design Excel Sum Formula',
    description: 'Design basic Excel with cells that can contain integers or sum formulas referencing other cells.',
    difficulty: Difficulty.advanced,
    tags: ['Design', 'Graph'],
    solution: '''class Excel:
    def __init__(self, height, width):
        self.sheet = [[0] * (ord(width) - ord('A') + 1) for _ in range(height)]
        self.formulas = {}

    def set(self, row, column, val):
        self.formulas.pop((row, column), None)
        self.sheet[row-1][ord(column) - ord('A')] = val

    def get(self, row, column):
        if (row, column) in self.formulas:
            return self.sum(row, column, self.formulas[(row, column)])
        return self.sheet[row-1][ord(column) - ord('A')]

    def sum(self, row, column, numbers):
        total = 0
        for num in numbers:
            if ':' in num:
                start, end = num.split(':')
                for r in range(int(start[1:]), int(end[1:]) + 1):
                    for c in range(ord(start[0]) - ord('A'), ord(end[0]) - ord('A') + 1):
                        total += self.get(r, chr(c + ord('A')))
            else:
                total += self.get(int(num[1:]), num[0])
        self.formulas[(row, column)] = numbers
        return total''',
    timeComplexity: 'O(range) for sum',
    spaceComplexity: 'O(cells + formulas)',
    explanation: 'Store values in 2D array and formulas separately. On get, evaluate formula if one exists.',
    hints: ['Store raw values and formulas separately.', 'Evaluate formulas recursively when getting a cell value.'],
    examples: [Example(input: 'set(1,"A",5), set(1,"B",10), sum(1,"C",["A1:A1","B1:B1"]), get(1,"C")', output: '15', explanation: 'Cell C1 contains the sum of A1 (5) and B1 (10) which equals 15')],
  ),
  Problem(
    id: '95',
    title: 'Design Log Storage System',
    description: 'Design log storage system to store logs with ids and timestamps, and retrieve logs within a given range.',
    difficulty: Difficulty.advanced,
    tags: ['Design', 'String', 'Binary Search'],
    solution: '''class LogSystem:
    def __init__(self):
        self.logs = []
        self.granularity_map = {
            "Year": 4, "Month": 7, "Day": 10,
            "Hour": 13, "Minute": 16, "Second": 19
        }

    def put(self, id, timestamp):
        self.logs.append((timestamp, id))

    def retrieve(self, start, end, granularity):
        index = self.granularity_map[granularity]
        start_prefix = start[:index]
        end_prefix = end[:index]
        return [id for ts, id in self.logs if start_prefix <= ts[:index] <= end_prefix]''',
    timeComplexity: 'O(n) for retrieve',
    spaceComplexity: 'O(n)',
    explanation: 'Store logs with timestamp and id. For retrieval, truncate timestamps based on granularity and compare prefixes.',
    hints: ['Truncate timestamps according to the specified granularity.', 'Compare truncated prefixes for range queries.'],
    examples: [Example(input: 'put(1,"2017:01:01:23:59:59"), retrieve("2017:01:01:00:00:00","2017:01:01:23:59:59","Day")', output: '[1]', explanation: 'Log 1 is within the same day range')],
  ),
  Problem(
    id: '96',
    title: 'Concatenated Words',
    description: 'Given array of strings words, return all concatenated words in given list of words.',
    difficulty: Difficulty.advanced,
    tags: ['String', 'Dynamic Programming', 'Trie'],
    solution: '''def find_all_concatenated_words(words):
    word_set = set(words)
    def can_form(word):
        if not word:
            return False
        dp = [False] * (len(word) + 1)
        dp[0] = True
        for i in range(1, len(word) + 1):
            for j in range(i):
                if dp[j] and word[j:i] in word_set and word[j:i] != word:
                    dp[i] = True
                    break
        return dp[len(word)]
    return [word for word in words if can_form(word)]''',
    timeComplexity: 'O(n * L^2) where L is max word length',
    spaceComplexity: 'O(n * L)',
    explanation: 'For each word, use DP to check if it can be formed by concatenating other words from the dictionary.',
    hints: ['Use word break DP for each word.', 'Ensure the substring used is not the word itself.'],
    examples: [Example(input: 'words = ["cat","cats","catsdogcats","dog","dogcatsdog","hippopotamuses","rat","ratcatdogcat"]', output: '["catsdogcats","dogcatsdog","ratcatdogcat"]', explanation: 'These words can be formed by concatenating other words from the list')],
  ),
  Problem(
    id: '97',
    title: 'Remove Invalid Parentheses',
    description: 'Given string s containing parentheses and letters, remove minimum number of invalid parentheses to make input string valid.',
    difficulty: Difficulty.advanced,
    tags: ['String', 'Breadth-First Search', 'Backtracking'],
    solution: '''from collections import deque

def remove_invalid_parentheses(s):
    def is_valid(string):
        count = 0
        for char in string:
            if char == '(':
                count += 1
            elif char == ')':
                count -= 1
            if count < 0:
                return False
        return count == 0

    result = []
    visited = set([s])
    queue = deque([s])
    found = False
    while queue:
        current = queue.popleft()
        if is_valid(current):
            result.append(current)
            found = True
        if found:
            continue
        for i in range(len(current)):
            if current[i] in ('(', ')'):
                next_str = current[:i] + current[i+1:]
                if next_str not in visited:
                    visited.add(next_str)
                    queue.append(next_str)
    return result''',
    timeComplexity: 'O(n * 2^n) worst case',
    spaceComplexity: 'O(n * 2^n)',
    explanation: 'BFS by removing one parenthesis at a time. Stop at the level where first valid strings are found to ensure minimum removal.',
    hints: ['Use BFS to explore strings with one fewer parenthesis.', 'Stop when you find the first valid strings at a level.'],
    examples: [Example(input: 's = "()())()"', output: '["(())()","()()()"]', explanation: 'Removing one parenthesis yields valid strings')],
  ),
  Problem(
    id: '98',
    title: 'Integer to English Words',
    description: 'Convert non-negative integer num to its English words representation.',
    difficulty: Difficulty.advanced,
    tags: ['Math', 'String', 'Recursion'],
    solution: '''def number_to_words(num):
    if num == 0:
        return "Zero"
    less_20 = ["", "One", "Two", "Three", "Four", "Five", "Six", "Seven",
               "Eight", "Nine", "Ten", "Eleven", "Twelve", "Thirteen",
               "Fourteen", "Fifteen", "Sixteen", "Seventeen", "Eighteen",
               "Nineteen"]
    tens = ["", "", "Twenty", "Thirty", "Forty", "Fifty",
            "Sixty", "Seventy", "Eighty", "Ninety"]
    thousands = ["", "Thousand", "Million", "Billion"]

    def helper(n):
        if n == 0:
            return ""
        elif n < 20:
            return less_20[n] + " "
        elif n < 100:
            return tens[n // 10] + " " + helper(n % 10)
        else:
            return less_20[n // 100] + " Hundred " + helper(n % 100)

    result = ""
    for i, unit in enumerate(thousands):
        if num % 1000 != 0:
            result = helper(num % 1000) + unit + " " + result
        num //= 1000
    return result.strip()''',
    timeComplexity: 'O(1) - at most 4 chunks',
    spaceComplexity: 'O(1)',
    explanation: 'Break number into chunks of thousands. Recursively convert each chunk (0-999) and append the scale (Thousand, Million, Billion).',
    hints: ['Process the number in chunks of thousands.', 'Handle numbers 1-19, 20-99, and 100-999 separately.'],
    examples: [Example(input: 'num = 123', output: '"One Hundred Twenty Three"', explanation: '123 is expressed in English words')],
  ),
  Problem(
    id: '99',
    title: 'Data Stream as Disjoint Intervals',
    description: 'Given data stream, return summary of current set of disjoint intervals.',
    difficulty: Difficulty.advanced,
    tags: ['Design', 'Ordered Set', 'Interval'],
    solution: '''from sortedcontainers import SortedDict

class SummaryRanges:
    def __init__(self):
        self.tree = SortedDict()

    def addNum(self, val):
        if val in self.tree:
            return
        lower = self.tree.peekitem(self.tree.bisect_right(val) - 1) if self.tree else None
        higher = self.tree.peekitem(self.tree.bisect_right(val)) if self.tree else None
        if lower and higher and lower[1] == val - 1 and higher[0] == val + 1:
            self.tree[lower[0]] = higher[1]
            del self.tree[higher[0]]
        elif lower and lower[1] >= val - 1:
            self.tree[lower[0]] = max(lower[1], val)
        elif higher and higher[0] == val + 1:
            self.tree[val] = higher[1]
            del self.tree[higher[0]]
        else:
            self.tree[val] = val

    def getIntervals(self):
        return list(self.tree.items())''',
    timeComplexity: 'O(log n) for addNum',
    spaceComplexity: 'O(n)',
    explanation: 'Use sorted dict to maintain disjoint intervals. On add, merge with adjacent intervals if overlapping or contiguous.',
    hints: ['Use an ordered map to maintain intervals.', 'Merge with neighboring intervals when adding a new value.'],
    examples: [Example(input: 'addNum(1), addNum(3), addNum(7), getIntervals()', output: '[[1,1],[3,3],[7,7]]', explanation: 'Initially each number forms its own disjoint interval')],
  ),
  Problem(
    id: '100',
    title: 'Design Skiplist',
    description: 'Design skiplist with O(log n) search, add, and erase operations.',
    difficulty: Difficulty.advanced,
    tags: ['Design', 'Linked List'],
    solution: '''import random

class Skiplist:
    def __init__(self):
        self.head = [None] * 16
        self.max_level = 16

    def _iter(self, target):
        current = self.head
        for level in range(self.max_level - 1, -1, -1):
            while current[level] and current[level][0] < target:
                current = current[level]
            yield current, level

    def search(self, target):
        for current, level in self._iter(target):
            if current[level] and current[level][0] == target:
                return True
        return False

    def add(self, num):
        level = min(self.max_level, 1 + int(-random.random() * self.max_level))
        node = [num] + [None] * level
        for current, lvl in self._iter(num):
            if lvl < level:
                node[lvl + 1] = current[lvl]
                current[lvl] = node

    def erase(self, num):
        removed = False
        for current, level in self._iter(num):
            if current[level] and current[level][0] == num:
                current[level] = current[level][level + 1]
                removed = True
        return removed''',
    timeComplexity: 'O(log n) expected for all operations',
    spaceComplexity: 'O(n) expected',
    explanation: 'Probabilistic data structure with multiple levels. Each node has random height. Search starts from top level and descends.',
    hints: ['Each node has a random level.', 'Search from the top level, going down when the next node exceeds the target.'],
    examples: [Example(input: 'add(1), add(2), add(3), search(0), search(1)', output: 'false, true', explanation: '0 is not in the skiplist; 1 is present')],
  ),
];
