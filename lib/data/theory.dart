import '../models/theory_topic.dart';

final List<TheoryTopic> allTheoryTopics = [
  // ========================================================================
  // 1. HISTORY OF PYTHON
  // ========================================================================
  TheoryTopic(
    id: '1',
    title: 'History of Python',
    category: 'Getting Started',
    description: 'The story of how Python was created, evolved, and became one of the most popular programming languages in the world.',
    sections: [
      const TheorySection(
        heading: 'Origins (1989–1991)',
        body: 'Python was created by Guido van Rossum, a Dutch programmer working at the Centrum Wiskunde & Informatica (CWI) in the Netherlands. He began developing Python over the Christmas holiday in 1989 as a hobby project.\n\nGuido wanted a new scripting language that would appeal to Unix/C hackers while being simple and readable. He based it on the ABC programming language, which he had helped create at CWI, but wanted to fix its flaws and add extensibility.\n\nThe first public release, Python 0.9.0, came out in February 1991.',
      ),
      const TheorySection(
        heading: 'Why the Name "Python"?',
        body: 'Contrary to popular belief, the name does NOT come from the snake. Guido van Rossum was a big fan of the British comedy troupe Monty Python. He wanted a name that was "short, unique, and slightly mysterious." The Monty Python references still appear in Python culture today — the official documentation and tutorials often use spam and eggs instead of the traditional foo and bar.',
      ),
      const TheorySection(
        heading: 'Python 1.x (1994–2000)',
        body: 'Python 1.0 was released in January 1994. It introduced major features like lambda, map, filter, and reduce — functional programming tools borrowed from Lisp.\n\nPython 1.5 (1997) and 1.6 (2000) continued to refine the language. During this era, Python began gaining traction in web development, scientific computing, and system administration. The first Python web framework, Zope, appeared in 1998.',
      ),
      const TheorySection(
        heading: 'Python 2.0 (2000) — A Major Leap',
        body: 'Released in October 2000, Python 2.0 was a watershed moment. It introduced two of Python\'s most beloved features:\n\n• List Comprehensions: [x*2 for x in range(10)]\n• Full Cycle-Detecting Garbage Collector: automatic memory management became robust.\n\nPython 2 also unified Python and the C implementations, creating the CPython interpreter we still use today. Python 2.2 (2001) introduced true object-orientation for built-in types.',
      ),
      const TheorySection(
        heading: 'Python 3.0 (2008) — The Great Cleanup',
        body: 'Python 3.0 ("Py3k") was released in December 2008. It was a deliberate, backwards-incompatible release designed to fix fundamental design flaws in Python 2.\n\nKey changes included:\n\n• print became a function: print("hello") instead of print "hello"\n• Unicode strings by default (str is Unicode, bytes is separate)\n• Integer division: 5 / 2 now returns 2.5, not 2\n• range() replaces xrange(); dictionaries and lists have new methods\n• Reduced redundancy and greater consistency throughout the standard library\n\nThe transition was painful for the community. Many libraries were slow to migrate, and Python 2 remained widely used for over a decade.',
      ),
      const TheorySection(
        heading: 'Python 2 End-of-Life (2020)',
        body: 'After years of coexistence, Python 2.7 reached its official end-of-life on January 1, 2020. It no longer receives security patches, bug fixes, or improvements. This forced the remaining holdouts to migrate to Python 3.\n\nToday, Python 3 is the only supported version, and every major library and framework requires it.',
      ),
      const TheorySection(
        heading: 'Modern Python (3.6–3.12+)',
        body: 'Python 3 has seen remarkable innovation since 3.0:\n\n• Python 3.6 (2016): f-strings, async/await improvements\n• Python 3.7 (2018): Data Classes, guaranteed dictionary ordering\n• Python 3.8 (2019): Walrus operator (:=), positional-only parameters\n• Python 3.9 (2020): Dictionary merge operators (|), type hinting generics\n• Python 3.10 (2021): Structural Pattern Matching (match/case)\n• Python 3.11 (2022): 10–60% performance boost, exception groups\n• Python 3.12 (2023): Improved f-string parsing, type parameter syntax\n\nThe language is now faster, more expressive, and more type-safe than ever.',
      ),
      const TheorySection(
        heading: 'Python Today',
        body: 'Python consistently ranks in the top 3 most popular programming languages worldwide (TIOBE, Stack Overflow, GitHub rankings). It dominates in:\n\n• Data Science & AI (NumPy, Pandas, PyTorch, TensorFlow)\n• Web Development (Django, Flask, FastAPI)\n• Automation & Scripting (DevOps, testing, CI/CD)\n• Scientific Computing (SciPy, Jupyter, Matplotlib)\n• Education (it is the #1 language taught to beginners)\n\nThe Python Software Foundation (PSF), a non-profit formed in 2001, governs the language. In 2019, Guido van Rossum stepped down as "Benevolent Dictator For Life" (BDFL) and a five-person Steering Council now guides Python\'s evolution.',
      ),
    ],
  ),

  // ========================================================================
  // 2. WHAT IS PYTHON?
  // ========================================================================
  TheoryTopic(
    id: '2',
    title: 'What is Python?',
    category: 'Getting Started',
    description: 'Understand what makes Python unique, where it shines, and how it compares to other languages.',
    sections: [
      const TheorySection(
        heading: 'A High-Level Language',
        body: 'Python is a high-level, general-purpose programming language. "High-level" means it abstracts away the complex details of computer hardware. You write code that is close to human language, and Python handles memory management, CPU instructions, and system calls for you.\n\nThis makes Python ideal for beginners: you can focus on logic and problem-solving instead of memory addresses and pointer arithmetic.',
      ),
      const TheorySection(
        heading: 'Interpreted, Not Compiled',
        body: 'Python is an interpreted language. When you run a Python program, an interpreter reads your source code line by line and executes it immediately. There is no separate compilation step (like C or Java require).\n\nTrade-offs:\n\n• Pros: Fast development cycle, easy debugging, platform-independent (write once, run anywhere).\n• Cons: Slower execution speed than compiled languages.',
        code: '# You can run this directly — no compilation needed\nprint("Hello, World!")',
      ),
      const TheorySection(
        heading: 'Dynamically Typed',
        body: 'In Python, you do not declare variable types. The interpreter figures out the type at runtime based on the value you assign.\n\nThis makes Python very flexible and concise, but it also means type errors are only caught when the code runs, not beforehand. (Python 3.5+ added optional type hints to help with this.)',
        code: 'x = 10       # x is an int\nx = "hello"  # now x is a str — perfectly legal',
      ),
      const TheorySection(
        heading: 'Whitespace Matters',
        body: 'Python uses indentation (spaces or tabs) to define code blocks instead of braces {} or begin/end keywords. This is one of Python\'s most distinctive features.\n\nThe standard is 4 spaces per indentation level. Consistent indentation is not just style — it is syntax. If your indentation is wrong, the program will fail or behave unexpectedly.',
        code: 'if True:\n    print("This is indented with 4 spaces")\n    print("Same block")\nprint("This is outside the if block")',
      ),
      const TheorySection(
        heading: 'Batteries Included',
        body: 'Python has a rich standard library. Many tasks that require external libraries in other languages are built into Python:\n\n• File I/O, JSON, CSV, XML handling\n• Regular expressions (re)\n• Networking (http, socket, urllib)\n• Threading and multiprocessing\n• SQLite database support\n• Date/time handling\n• Unit testing (unittest, doctest)\n\nThis philosophy — "batteries included" — means you can accomplish a lot before ever installing a third-party package.',
      ),
      const TheorySection(
        heading: 'Where Python Shines',
        body: 'Python is a general-purpose language, but it dominates in specific domains:\n\n1. Data Science & Machine Learning\n   Libraries like NumPy, Pandas, Matplotlib, Scikit-learn, PyTorch, and TensorFlow make Python the lingua franca of AI.\n\n2. Web Development\n   Frameworks like Django, Flask, and FastAPI allow rapid, secure web application development.\n\n3. Automation & Scripting\n   Python is perfect for writing small scripts that automate repetitive tasks, scrape websites, or manage servers.\n\n4. Education\n   Python\'s readability makes it the most popular first language taught in universities and coding bootcamps.\n\n5. Scientific Computing\n   Researchers use Python for simulations, data analysis, and visualization.',
      ),
    ],
  ),

  // ========================================================================
  // 3. VARIABLES & DATA TYPES
  // ========================================================================
  TheoryTopic(
    id: '3',
    title: 'Variables & Data Types',
    category: 'Fundamentals',
    description: 'Learn how Python stores information in variables and the core data types every programmer must know.',
    sections: [
      const TheorySection(
        heading: 'What is a Variable?',
        body: 'A variable is a name that refers to a value stored in memory. In Python, you create a variable by assigning a value with the = operator.\n\nUnlike many languages, Python variables do not have fixed types — they are simply names bound to objects.',
        code: 'name = "Alice"\nage = 30\npi = 3.14159\nis_student = False',
      ),
      const TheorySection(
        heading: 'Variable Naming Rules',
        body: 'Rules:\n\n• Must start with a letter (a-z, A-Z) or underscore (_)\n• Can contain letters, digits (0-9), and underscores\n• Case-sensitive (name and Name are different)\n• Cannot use reserved keywords (if, for, class, def, etc.)\n\nConventions (PEP 8):\n\n• snake_case for variables and functions: user_name\n• UPPER_CASE for constants: MAX_SIZE\n• Descriptive names: total_price is better than tp',
      ),
      const TheorySection(
        heading: 'Integers (int)',
        body: 'Integers are whole numbers without a decimal point. Python\'s int type has unlimited precision — it can grow as large as your memory allows.',
        code: 'x = 42\ny = -10\nbig = 123456789012345678901234567890  # no overflow!\n\n# Common operations\nprint(x + y)   # 32\nprint(x - y)   # 52\nprint(x * y)   # -420\nprint(x // 5)  # 8 (floor division)\nprint(x % 5)   # 2 (modulo)\nprint(x ** 2)  # 1764 (power)',
      ),
      const TheorySection(
        heading: 'Floating-Point Numbers (float)',
        body: 'Floats represent real numbers with decimal points. They follow the IEEE 754 double-precision standard. Be careful: floating-point arithmetic can have tiny precision errors.',
        code: 'pi = 3.14159\ntemperature = -5.5\n\nprint(0.1 + 0.2)  # 0.30000000000000004 — not exactly 0.3!\n\n# For exact decimal arithmetic, use the Decimal module\nfrom decimal import Decimal\nprint(Decimal("0.1") + Decimal("0.2"))  # 0.3',
      ),
      const TheorySection(
        heading: 'Strings (str)',
        body: 'Strings are sequences of characters. They can be enclosed in single quotes, double quotes, or triple quotes for multi-line text.\n\nStrings are immutable — once created, you cannot change individual characters.',
        code: 'single = \'Hello\'\ndouble = "World"\nmulti = """This is\na multi-line\nstring."""\n\n# String methods\ntext = "  Python is Fun  "\nprint(text.lower())      # "  python is fun  "\nprint(text.upper())      # "  PYTHON IS FUN  "\nprint(text.strip())      # "Python is Fun"\nprint(text.replace("Fun", "Powerful"))\nprint(len(text))         # 17\n\n# Indexing and slicing\nprint(text[2])           # "y"\nprint(text[2:8])         # "ython "',
      ),
      const TheorySection(
        heading: 'Booleans (bool)',
        body: 'Booleans represent True or False. They are the result of comparisons and logical operations.\n\nIn numeric contexts, True is 1 and False is 0.',
        code: 'is_ready = True\nis_empty = False\n\nprint(5 > 3)        # True\nprint("a" == "b")   # False\nprint(True + True)  # 2',
      ),
      const TheorySection(
        heading: 'NoneType (None)',
        body: 'None represents the absence of a value. It is similar to null in other languages. Functions that do not explicitly return a value return None.',
        code: 'result = None\n\ndef greet(name):\n    print(f"Hello, {name}!")\n\nvalue = greet("Alice")  # value is None',
      ),
      const TheorySection(
        heading: 'Type Checking & Conversion',
        body: 'You can check a variable\'s type with type() and convert between types with built-in functions.',
        code: 'x = 42\nprint(type(x))  # <class \'int\'>\n\n# Conversions\nprint(int("10"))      # 10\nprint(float("3.14"))  # 3.14\nprint(str(42))        # "42"\nprint(bool(1))        # True\nprint(bool(0))        # False\nprint(bool(""))       # False — empty string is falsy',
      ),
    ],
  ),

  // ========================================================================
  // 4. OPERATORS
  // ========================================================================
  TheoryTopic(
    id: '4',
    title: 'Operators',
    category: 'Fundamentals',
    description: 'Master the symbols that perform calculations, comparisons, and logical operations in Python.',
    sections: [
      const TheorySection(
        heading: 'Arithmetic Operators',
        body: 'These perform mathematical calculations.',
        code: 'a = 17\nb = 5\n\nprint(a + b)   # 22  (Addition)\nprint(a - b)   # 12  (Subtraction)\nprint(a * b)   # 85  (Multiplication)\nprint(a / b)   # 3.4 (Division — always returns float)\nprint(a // b)  # 3   (Floor Division)\nprint(a % b)   # 2   (Modulo / Remainder)\nprint(a ** b)  # 1419857 (Exponentiation)',
      ),
      const TheorySection(
        heading: 'Comparison Operators',
        body: 'These compare values and return True or False.',
        code: 'x = 10\ny = 20\n\nprint(x == y)  # False (Equal to)\nprint(x != y)  # True  (Not equal to)\nprint(x > y)   # False (Greater than)\nprint(x < y)   # True  (Less than)\nprint(x >= 10) # True  (Greater than or equal)\nprint(x <= 9)  # False (Less than or equal)\n\n# Chain comparisons naturally\nprint(5 < x < 20)  # True',
      ),
      const TheorySection(
        heading: 'Logical Operators',
        body: 'Combine boolean expressions.\n\n• and: True if both are true\n• or: True if at least one is true\n• not: Inverts the boolean value',
        code: 'age = 25\nincome = 50000\n\nprint(age > 18 and income > 30000)  # True\nprint(age > 30 or income > 30000)   # True\nprint(not age > 18)                 # False\n\n# Short-circuit behavior\n# For "and", if the first is False, the second is never evaluated\n# For "or", if the first is True, the second is never evaluated',
      ),
      const TheorySection(
        heading: 'Assignment Operators',
        body: 'Shorthand for updating a variable\'s value.',
        code: 'x = 10\nx += 5   # x = x + 5  → 15\nx -= 3   # x = x - 3  → 12\nx *= 2   # x = x * 2  → 24\nx /= 4   # x = x / 4  → 6.0\nx //= 2  # x = x // 2 → 3.0\nx **= 2  # x = x ** 2 → 9.0',
      ),
      const TheorySection(
        heading: 'Membership Operators',
        body: 'Test whether a value is inside a sequence (string, list, tuple, set, dict).',
        code: 'fruits = ["apple", "banana", "cherry"]\n\nprint("apple" in fruits)      # True\nprint("grape" not in fruits)  # True\n\ntext = "Hello, World!"\nprint("World" in text)        # True',
      ),
      const TheorySection(
        heading: 'Identity Operators',
        body: 'Check if two variables refer to the same object in memory (is) or different objects (is not).\n\nDo not use is for value comparisons — use == for that. Use is mainly for None checks and singletons.',
        code: 'a = [1, 2, 3]\nb = [1, 2, 3]\nc = a\n\nprint(a == b)  # True — same values\nprint(a is b)  # False — different objects\nprint(a is c)  # True — same object\n\n# The standard way to check None\nx = None\nprint(x is None)  # True',
      ),
      const TheorySection(
        heading: 'Bitwise Operators',
        body: 'Operate on integers at the binary bit level.',
        code: 'a = 5   # 101 in binary\nb = 3   # 011 in binary\n\nprint(a & b)   # 1  (AND)\nprint(a | b)   # 7  (OR)\nprint(a ^ b)   # 6  (XOR)\nprint(~a)      # -6 (NOT)\nprint(a << 1)  # 10 (Left shift)\nprint(a >> 1)  # 2  (Right shift)',
      ),
      const TheorySection(
        heading: 'Operator Precedence',
        body: 'When multiple operators appear in one expression, Python follows this order (highest to lowest):\n\n1. Parentheses ()\n2. Exponentiation **\n3. Unary +, -, ~\n4. Multiplication *, /, //, %\n5. Addition +, -\n6. Bitwise shifts <<, >>\n7. Bitwise AND &\n8. Bitwise XOR ^\n9. Bitwise OR |\n10. Comparisons, membership, identity\n11. Logical not\n12. Logical and\n13. Logical or\n\nWhen in doubt, use parentheses to make your intent explicit.',
      ),
    ],
  ),

  // ========================================================================
  // 5. CONTROL FLOW
  // ========================================================================
  TheoryTopic(
    id: '5',
    title: 'Control Flow',
    category: 'Fundamentals',
    description: 'Learn how to make decisions, repeat actions, and control the execution path of your programs.',
    sections: [
      const TheorySection(
        heading: 'if / elif / else',
        body: 'Conditional statements let your program make decisions. Python evaluates conditions top-down and executes the first matching block.\n\nThe elif (else if) clause lets you check multiple conditions. The else clause catches everything that did not match.',
        code: 'score = 85\n\nif score >= 90:\n    grade = "A"\nelif score >= 80:\n    grade = "B"\nelif score >= 70:\n    grade = "C"\nelse:\n    grade = "F"\n\nprint(f"Grade: {grade}")',
      ),
      const TheorySection(
        heading: 'Ternary Conditional Expression',
        body: 'A compact way to write a simple if/else.',
        code: 'age = 20\nstatus = "adult" if age >= 18 else "minor"\nprint(status)  # adult',
      ),
      const TheorySection(
        heading: 'for Loops',
        body: 'Python\'s for loop iterates over items in a sequence (list, string, range, etc.). It does not work like C-style for loops — you do not manually increment a counter.\n\nThe range() function generates a sequence of numbers, making it easy to loop a specific number of times.',
        code: '# Iterate over a list\nfruits = ["apple", "banana", "cherry"]\nfor fruit in fruits:\n    print(fruit)\n\n# Iterate with range\nfor i in range(5):\n    print(i)  # 0, 1, 2, 3, 4\n\n# range(start, stop, step)\nfor i in range(10, 0, -2):\n    print(i)  # 10, 8, 6, 4, 2\n\n# Iterate with index\nfor index, fruit in enumerate(fruits):\n    print(f"{index}: {fruit}")',
      ),
      const TheorySection(
        heading: 'while Loops',
        body: 'A while loop repeats as long as its condition is True. Be careful to update the condition inside the loop, or it will run forever.',
        code: 'count = 0\nwhile count < 5:\n    print(count)\n    count += 1\n\n# Infinite loop with break\nwhile True:\n    user_input = input("Type \'quit\' to exit: ")\n    if user_input == "quit":\n        break',
      ),
      const TheorySection(
        heading: 'break, continue, pass',
        body: '• break: Immediately exits the loop entirely.\n• continue: Skips the rest of the current iteration and moves to the next one.\n• pass: Does nothing. Used as a placeholder where syntax requires a statement.',
        code: 'for num in range(10):\n    if num == 3:\n        continue      # Skip 3\n    if num == 7:\n        break         # Stop at 7\n    print(num)\n# Output: 0, 1, 2, 4, 5, 6\n\n# pass as placeholder\ndef future_function():\n    pass  # TODO: implement later',
      ),
      const TheorySection(
        heading: 'else with Loops',
        body: 'Python allows an else clause on loops. It runs ONLY if the loop completed normally (did not encounter a break). This is useful for search loops.',
        code: 'items = [1, 2, 3, 4, 5]\ntarget = 10\n\nfor item in items:\n    if item == target:\n        print("Found!")\n        break\nelse:\n    print("Not found — loop completed without break")',
      ),
      const TheorySection(
        heading: 'match / case (Python 3.10+)',
        body: 'Structural pattern matching allows elegant multi-way branching, similar to switch statements in other languages but much more powerful.',
        code: 'def handle_command(command):\n    match command:\n        case "start":\n            return "Starting engine..."\n        case "stop":\n            return "Stopping engine..."\n        case ["load", filename]:\n            return f"Loading {filename}"\n        case _:\n            return "Unknown command"',
      ),
    ],
  ),

  // ========================================================================
  // 6. DATA STRUCTURES
  // ========================================================================
  TheoryTopic(
    id: '6',
    title: 'Data Structures',
    category: 'Fundamentals',
    description: 'Master Python\'s built-in containers: lists, tuples, dictionaries, and sets.',
    sections: [
      const TheorySection(
        heading: 'Lists',
        body: 'Lists are ordered, mutable collections. They can hold any mix of data types and can grow or shrink dynamically.\n\nLists are the go-to container in Python for sequences of items.',
        code: '# Creating lists\nnumbers = [1, 2, 3, 4, 5]\nmixed = [1, "hello", 3.14, True]\nempty = []\n\n# Accessing items\nprint(numbers[0])     # 1\nprint(numbers[-1])    # 5 (last item)\nprint(numbers[1:4])   # [2, 3, 4]\n\n# Modifying\nnumbers.append(6)\nnumbers.insert(0, 0)\nnumbers.remove(3)\npopped = numbers.pop()\n\n# Sorting\nnums = [3, 1, 4, 1, 5]\nnums.sort()\nprint(nums)           # [1, 1, 3, 4, 5]\n\n# List comprehension\nsquares = [x**2 for x in range(6)]\nprint(squares)        # [0, 1, 4, 9, 16, 25]',
      ),
      const TheorySection(
        heading: 'Tuples',
        body: 'Tuples are ordered, immutable collections. Once created, you cannot add, remove, or change items.\n\nUse tuples for fixed collections of data, especially when the items have different meanings (like coordinates or database records). Tuples are slightly faster and safer than lists.',
        code: 'point = (3, 4)\ncoordinates = (10.5, 20.8, 5.2)\nsingleton = (42,)  # comma required for single-item tuple\n\n# Unpacking\nx, y = point\nprint(x, y)  # 3 4\n\n# Nested tuples\nrecord = ("Alice", 30, ("Engineer", "Senior"))\nname, age, (role, level) = record\nprint(name, role)  # Alice Engineer',
      ),
      const TheorySection(
        heading: 'Dictionaries',
        body: 'Dictionaries store key-value pairs. They are unordered (before 3.7) / insertion-ordered (3.7+), mutable, and indexed by keys, not numbers.\n\nKeys must be immutable (strings, numbers, tuples). Values can be anything.',
        code: 'person = {\n    "name": "Alice",\n    "age": 30,\n    "city": "New York"\n}\n\n# Access\nprint(person["name"])\nprint(person.get("salary", 0))  # 0 (default if missing)\n\n# Modify\nperson["age"] = 31\nperson["job"] = "Engineer"\n\n# Iteration\nfor key, value in person.items():\n    print(f"{key}: {value}")\n\n# Dictionary comprehension\nsquares = {x: x**2 for x in range(5)}\nprint(squares)  # {0: 0, 1: 1, 2: 4, 3: 9, 4: 16}',
      ),
      const TheorySection(
        heading: 'Sets',
        body: 'Sets are unordered collections of unique elements. They are perfect for removing duplicates and performing mathematical set operations (union, intersection, difference).',
        code: 'a = {1, 2, 3, 4}\nb = {3, 4, 5, 6}\n\nprint(a | b)   # {1, 2, 3, 4, 5, 6} (union)\nprint(a & b)   # {3, 4} (intersection)\nprint(a - b)   # {1, 2} (difference)\nprint(a ^ b)   # {1, 2, 5, 6} (symmetric difference)\n\n# Remove duplicates from a list\nitems = [1, 2, 2, 3, 3, 3]\nunique = list(set(items))\nprint(unique)  # [1, 2, 3]',
      ),
      const TheorySection(
        heading: 'Comprehensions Deep Dive',
        body: 'Comprehensions are a concise way to create lists, dictionaries, and sets. They are often faster and more readable than equivalent for loops.',
        code: '# List comprehension\nevens = [x for x in range(20) if x % 2 == 0]\n\n# Nested comprehension\nmatrix = [[i * j for j in range(1, 4)] for i in range(1, 4)]\n# [[1, 2, 3], [2, 4, 6], [3, 6, 9]]\n\n# Set comprehension\nunique_lengths = {len(word) for word in ["apple", "banana", "cherry", "date"]}\n\n# Dict comprehension\nword_map = {word: len(word) for word in ["apple", "banana", "cherry"]}\n# {\'apple\': 5, \'banana\': 6, \'cherry\': 6}',
      ),
    ],
  ),

  // ========================================================================
  // 7. FUNCTIONS
  // ========================================================================
  TheoryTopic(
    id: '7',
    title: 'Functions',
    category: 'Fundamentals',
    description: 'Learn to write reusable blocks of code with parameters, return values, and advanced function techniques.',
    sections: [
      const TheorySection(
        heading: 'Defining Functions',
        body: 'Functions are defined with the def keyword. They can accept inputs (parameters), perform work, and optionally return a result.\n\nA function definition does not execute the function — it merely creates it. You must call the function to run its code.',
        code: 'def greet(name):\n    """Return a greeting string."""\n    return f"Hello, {name}!"\n\nmessage = greet("Alice")\nprint(message)  # Hello, Alice!',
      ),
      const TheorySection(
        heading: 'Parameters vs Arguments',
        body: '• Parameters are the variables in the function definition.\n• Arguments are the actual values passed when calling the function.',
        code: 'def add(a, b):      # a and b are parameters\n    return a + b\n\nresult = add(3, 5)  # 3 and 5 are arguments',
      ),
      const TheorySection(
        heading: 'Default Parameters',
        body: 'You can assign default values to parameters. If the caller omits that argument, the default is used.\n\nWarning: Mutable defaults (like lists or dicts) are shared across calls! Use None as a sentinel instead.',
        code: 'def greet(name, greeting="Hello"):\n    return f"{greeting}, {name}!"\n\nprint(greet("Alice"))              # Hello, Alice!\nprint(greet("Bob", "Good morning"))  # Good morning, Bob!\n\n# Safe mutable default\ndef append_item(item, target=None):\n    if target is None:\n        target = []\n    target.append(item)\n    return target',
      ),
      const TheorySection(
        heading: '*args and **kwargs',
        body: '• *args collects extra positional arguments into a tuple.\n• **kwargs collects extra keyword arguments into a dictionary.\n\nThese let you create flexible functions that accept any number of arguments.',
        code: 'def flexible(*args, **kwargs):\n    print("Positional:", args)\n    print("Keyword:", kwargs)\n\nflexible(1, 2, 3, name="Alice", age=30)\n# Positional: (1, 2, 3)\n# Keyword: {\'name\': \'Alice\', \'age\': 30}\n\n# Unpacking collections\nnums = [1, 2, 3]\ndata = {"x": 10, "y": 20}\nflexible(*nums, **data)',
      ),
      const TheorySection(
        heading: 'Lambda Functions',
        body: 'Lambda functions are small, anonymous functions defined with the lambda keyword. They are limited to a single expression.\n\nThey are commonly used as arguments to functions like sorted(), map(), and filter().',
        code: 'square = lambda x: x ** 2\nprint(square(5))  # 25\n\n# Used with sorted\npeople = [("Alice", 30), ("Bob", 25), ("Charlie", 35)]\npeople_sorted = sorted(people, key=lambda p: p[1])\nprint(people_sorted)  # [(\'Bob\', 25), (\'Alice\', 30), (\'Charlie\', 35)]\n\n# Used with map and filter\nnums = [1, 2, 3, 4, 5]\nsquares = list(map(lambda x: x**2, nums))\nevens = list(filter(lambda x: x % 2 == 0, nums))',
      ),
      const TheorySection(
        heading: 'Variable Scope (LEGB Rule)',
        body: 'Python resolves variable names using the LEGB rule:\n\n• L — Local: inside the current function\n• E — Enclosing: in the enclosing function (for nested functions)\n• G — Global: at the top level of the module\n• B — Built-in: Python\'s built-in names (print, len, etc.)\n\nUse the global keyword to modify a global variable from inside a function. Use nonlocal to modify an enclosing variable.',
        code: 'count = 0  # global\n\ndef increment():\n    global count\n    count += 1\n\nincrement()\nprint(count)  # 1\n\n# Nested functions and nonlocal\ndef outer():\n    x = 10\n    def inner():\n        nonlocal x\n        x += 5\n    inner()\n    return x\n\nprint(outer())  # 15',
      ),
    ],
  ),

  // ========================================================================
  // 8. MODULES & PACKAGES
  // ========================================================================
  TheoryTopic(
    id: '8',
    title: 'Modules & Packages',
    category: 'Intermediate',
    description: 'Organize your code into reusable files and learn to use Python\'s vast ecosystem of third-party libraries.',
    sections: [
      const TheorySection(
        heading: 'What is a Module?',
        body: 'A module is simply a Python file (.py) containing code (functions, classes, variables). You import it into other files to reuse that code.\n\nModules keep your code organized, reusable, and maintainable.',
        code: '# math_utils.py\ndef add(a, b):\n    return a + b\n\nPI = 3.14159\n\n# main.py\nimport math_utils\nprint(math_utils.add(2, 3))\nprint(math_utils.PI)',
      ),
      const TheorySection(
        heading: 'Import Styles',
        body: 'Python offers several ways to import modules, each with trade-offs.',
        code: '# Import the whole module\nimport math\nprint(math.sqrt(16))\n\n# Import specific items\nfrom math import sqrt, pi\nprint(sqrt(16))\n\n# Import with alias\nimport numpy as np\nimport pandas as pd\n\n# Import everything (discouraged — pollutes namespace)\nfrom math import *',
      ),
      const TheorySection(
        heading: 'The Standard Library',
        body: 'Python ships with over 200 built-in modules. Here are the most commonly used:\n\n• os — Operating system interface\n• sys — System-specific parameters\n• json — JSON encoding/decoding\n• re — Regular expressions\n• datetime — Date and time handling\n• collections — Advanced containers (Counter, defaultdict, deque)\n• itertools — Iterator tools\n• functools — Higher-order functions\n• math / random / statistics — Math and randomness\n• urllib — HTTP requests\n• sqlite3 — SQLite database access\n• threading / multiprocessing — Concurrency\n• unittest / doctest — Testing',
        code: 'import json\nimport random\nfrom datetime import datetime\n\ndata = {"name": "Alice", "age": 30}\njson_str = json.dumps(data)\nprint(json_str)\n\nprint(random.randint(1, 100))\nprint(datetime.now())',
      ),
      const TheorySection(
        heading: 'Packages',
        body: 'A package is a directory containing modules and a special __init__.py file. Packages let you organize related modules into namespaces.\n\nModern Python (3.3+) supports implicit namespace packages, so __init__.py is optional, but still recommended for clarity.',
        code: 'my_project/\n    __init__.py\n    math/\n        __init__.py\n        algebra.py\n        calculus.py\n    utils/\n        __init__.py\n        helpers.py\n\n# Usage\nfrom my_project.math.algebra import solve_linear\nfrom my_project.utils.helpers import format_date',
      ),
      const TheorySection(
        heading: 'pip and Virtual Environments',
        body: 'pip is Python\'s package installer. It downloads and manages third-party libraries from PyPI (Python Package Index).\n\nVirtual environments isolate project dependencies so different projects can use different library versions.',
        code: '# Create a virtual environment\npython -m venv myenv\n\n# Activate it\n# Linux/macOS:\nsource myenv/bin/activate\n# Windows:\nmyenv\\Scripts\\activate\n\n# Install packages\npip install requests numpy pandas\n\n# Save dependencies\npip freeze > requirements.txt\n\n# Install from requirements\npip install -r requirements.txt',
      ),
      const TheorySection(
        heading: 'if __name__ == "__main__"',
        body: 'This idiom checks whether a file is being run directly (as a script) or imported as a module. Code under this block only runs when the file is executed directly.',
        code: 'def main():\n    print("Running as script")\n\nif __name__ == "__main__":\n    main()\n\n# When imported, __name__ is the module name\n# When run directly, __name__ is "__main__"',
      ),
    ],
  ),

  // ========================================================================
  // 9. FILE I/O
  // ========================================================================
  TheoryTopic(
    id: '9',
    title: 'File I/O',
    category: 'Intermediate',
    description: 'Read from and write to files, handle different formats, and use context managers for safe resource handling.',
    sections: [
      const TheorySection(
        heading: 'Opening Files',
        body: 'The built-in open() function creates a file object. You specify the mode:\n\n• \'r\' — read (default)\n• \'w\' — write (overwrites existing file)\n• \'a\' — append (adds to end)\n• \'x\' — create (fails if file exists)\n• \'b\' — binary mode\n• \'t\' — text mode (default)',
        code: 'file = open("data.txt", "r")\ncontent = file.read()\nfile.close()\n\n# Always close files to free system resources.\n# Forgetting to close can cause data loss or resource leaks.',
      ),
      const TheorySection(
        heading: 'The with Statement (Context Managers)',
        body: 'The with statement guarantees that the file is closed automatically, even if an error occurs inside the block. This is the recommended way to handle files in Python.',
        code: 'with open("data.txt", "r") as file:\n    content = file.read()\n    # file is automatically closed here\n\n# Reading line by line\nwith open("data.txt", "r") as file:\n    for line in file:\n        print(line.strip())\n\n# Writing\nwith open("output.txt", "w") as file:\n    file.write("Hello, World!\\n")\n    file.write("Second line\\n")',
      ),
      const TheorySection(
        heading: 'Working with JSON',
        body: 'JSON (JavaScript Object Notation) is the standard format for data exchange. Python\'s json module seamlessly converts between Python dicts/lists and JSON strings.',
        code: 'import json\n\ndata = {\n    "name": "Alice",\n    "age": 30,\n    "skills": ["Python", "SQL", "Docker"]\n}\n\n# Python to JSON string\njson_str = json.dumps(data, indent=2)\nprint(json_str)\n\n# JSON string to Python\nparsed = json.loads(json_str)\nprint(parsed["name"])\n\n# Write to file\nwith open("data.json", "w") as f:\n    json.dump(data, f, indent=2)\n\n# Read from file\nwith open("data.json", "r") as f:\n    loaded = json.load(f)',
      ),
      const TheorySection(
        heading: 'Working with CSV',
        body: 'CSV (Comma-Separated Values) is the standard format for tabular data. Python\'s csv module handles parsing and writing correctly, including quoting and escaping.',
        code: 'import csv\n\n# Reading CSV\nwith open("data.csv", "r") as f:\n    reader = csv.DictReader(f)\n    for row in reader:\n        print(row["name"], row["age"])\n\n# Writing CSV\nwith open("output.csv", "w", newline="") as f:\n    writer = csv.writer(f)\n    writer.writerow(["name", "age"])\n    writer.writerow(["Alice", 30])\n    writer.writerow(["Bob", 25])',
      ),
      const TheorySection(
        heading: 'File System Operations (os & pathlib)',
        body: 'The os module provides low-level file system operations. The pathlib module (Python 3.4+) offers an object-oriented, cleaner approach.',
        code: 'import os\nfrom pathlib import Path\n\n# os style\nprint(os.getcwd())\nprint(os.listdir("."))\nos.makedirs("new_folder", exist_ok=True)\n\n# pathlib style (recommended)\npath = Path("data") / "users.json"\nprint(path.exists())\nprint(path.is_file())\nprint(path.parent)\nprint(path.name)\nprint(path.stem)\nprint(path.suffix)',
      ),
    ],
  ),

  // ========================================================================
  // 10. OBJECT-ORIENTED PROGRAMMING
  // ========================================================================
  TheoryTopic(
    id: '10',
    title: 'Object-Oriented Programming',
    category: 'Intermediate',
    description: 'Build programs using classes, objects, inheritance, and encapsulation.',
    sections: [
      const TheorySection(
        heading: 'Classes and Objects',
        body: 'A class is a blueprint for creating objects. An object is an instance of a class, containing data (attributes) and behavior (methods).\n\nPython is fully object-oriented: everything is an object, including numbers, strings, and functions.',
        code: 'class Dog:\n    def __init__(self, name, age):\n        self.name = name\n        self.age = age\n\n    def bark(self):\n        return f"{self.name} says woof!"\n\n# Creating objects (instances)\nbuddy = Dog("Buddy", 3)\nprint(buddy.name)    # Buddy\nprint(buddy.bark())  # Buddy says woof!',
      ),
      const TheorySection(
        heading: 'The __init__ Constructor',
        body: '__init__ is a special method called automatically when an object is created. It initializes the object\'s attributes.\n\nself is a reference to the current instance. It must be the first parameter of every instance method.',
      ),
      const TheorySection(
        heading: 'Instance vs Class Attributes',
        body: 'Instance attributes (set via self) are unique to each object. Class attributes are shared across all instances of the class.',
        code: 'class Dog:\n    species = "Canis familiaris"  # class attribute\n\n    def __init__(self, name):\n        self.name = name              # instance attribute\n\nd1 = Dog("Buddy")\nd2 = Dog("Max")\n\nprint(d1.name)      # Buddy\nprint(d2.name)      # Max\nprint(d1.species)   # Canis familiaris\nprint(d2.species)   # Canis familiaris',
      ),
      const TheorySection(
        heading: 'Inheritance',
        body: 'Inheritance lets a class (child/subclass) acquire attributes and methods from another class (parent/superclass). This promotes code reuse and logical hierarchies.',
        code: 'class Animal:\n    def __init__(self, name):\n        self.name = name\n\n    def speak(self):\n        raise NotImplementedError\n\nclass Dog(Animal):\n    def speak(self):\n        return f"{self.name} says woof!"\n\nclass Cat(Animal):\n    def speak(self):\n        return f"{self.name} says meow!"\n\nanimals = [Dog("Buddy"), Cat("Whiskers")]\nfor animal in animals:\n    print(animal.speak())',
      ),
      const TheorySection(
        heading: 'super()',
        body: 'super() calls a method from the parent class. It is commonly used in __init__ to extend the parent\'s initialization without replacing it entirely.',
        code: 'class Employee:\n    def __init__(self, name, salary):\n        self.name = name\n        self.salary = salary\n\nclass Manager(Employee):\n    def __init__(self, name, salary, department):\n        super().__init__(name, salary)\n        self.department = department\n\nm = Manager("Alice", 90000, "Engineering")\nprint(m.name, m.department)',
      ),
      const TheorySection(
        heading: 'Encapsulation & Private Attributes',
        body: 'Python does not enforce true privacy, but it has conventions:\n\n• Single underscore _name: "internal use" (convention)\n• Double underscore __name: name mangling — harder to access from outside\n\nUse properties (@property decorator) to control access to attributes.',
        code: 'class BankAccount:\n    def __init__(self, balance):\n        self._balance = balance\n\n    @property\n    def balance(self):\n        return self._balance\n\n    def deposit(self, amount):\n        if amount > 0:\n            self._balance += amount\n\n    def withdraw(self, amount):\n        if 0 < amount <= self._balance:\n            self._balance -= amount\n\nacc = BankAccount(100)\nprint(acc.balance)   # 100 (calls getter)\nacc.deposit(50)\nprint(acc.balance)   # 150',
      ),
      const TheorySection(
        heading: 'Dunder (Magic) Methods',
        body: 'Methods starting and ending with double underscores define how objects behave with built-in operations.',
        code: 'class Vector:\n    def __init__(self, x, y):\n        self.x = x\n        self.y = y\n\n    def __repr__(self):\n        return f"Vector({self.x}, {self.y})"\n\n    def __add__(self, other):\n        return Vector(self.x + other.x, self.y + other.y)\n\n    def __len__(self):\n        return int((self.x**2 + self.y**2) ** 0.5)\n\nv1 = Vector(2, 3)\nv2 = Vector(1, 1)\nprint(v1 + v2)   # Vector(3, 4)\nprint(len(v1))   # 3',
      ),
    ],
  ),

  // ========================================================================
  // 11. ERROR HANDLING
  // ========================================================================
  TheoryTopic(
    id: '11',
    title: 'Error Handling',
    category: 'Intermediate',
    description: 'Write robust programs that gracefully handle unexpected situations using exceptions.',
    sections: [
      const TheorySection(
        heading: 'Exceptions 101',
        body: 'An exception is an error that occurs during program execution. If unhandled, it crashes the program with a traceback.\n\nCommon built-in exceptions:\n\n• SyntaxError — invalid Python syntax\n• TypeError — wrong type used\n• ValueError — right type but inappropriate value\n• IndexError — list index out of range\n• KeyError — missing dictionary key\n• ZeroDivisionError — dividing by zero\n• FileNotFoundError — file does not exist\n• AttributeError — missing attribute on object',
      ),
      const TheorySection(
        heading: 'try / except / else / finally',
        body: 'The try block contains code that might fail. If an exception occurs, Python jumps to the matching except block.\n\n• else: runs if NO exception occurred\n• finally: ALWAYS runs, used for cleanup',
        code: 'try:\n    result = 10 / 0\nexcept ZeroDivisionError:\n    print("Cannot divide by zero!")\nelse:\n    print(f"Result: {result}")\nfinally:\n    print("Cleanup done")\n\n# Multiple except blocks\ntry:\n    value = int("not a number")\nexcept ValueError:\n    print("Invalid number")\nexcept TypeError:\n    print("Wrong type")',
      ),
      const TheorySection(
        heading: 'Catching Multiple Exceptions',
        body: 'You can catch multiple exception types in one block, or use a tuple.',
        code: 'try:\n    data = {"a": 1}\n    print(data["b"])\nexcept (KeyError, IndexError) as e:\n    print(f"Missing key or index: {e}")\n\n# Catch any exception (use sparingly)\ntry:\n    risky_operation()\nexcept Exception as e:\n    print(f"Something went wrong: {e}")',
      ),
      const TheorySection(
        heading: 'Raising Exceptions',
        body: 'Use raise to trigger an exception intentionally. This is useful for enforcing preconditions and failing fast.',
        code: 'def divide(a, b):\n    if b == 0:\n        raise ValueError("Denominator cannot be zero")\n    return a / b\n\ndef set_age(age):\n    if age < 0:\n        raise ValueError("Age cannot be negative")\n    if age > 150:\n        raise ValueError("Age seems unrealistic")\n    return age',
      ),
      const TheorySection(
        heading: 'Custom Exceptions',
        body: 'Define your own exception classes by inheriting from Exception or one of its subclasses. This makes your code more descriptive and easier to debug.',
        code: 'class ValidationError(Exception):\n    pass\n\nclass InsufficientFundsError(Exception):\n    def __init__(self, balance, amount):\n        self.balance = balance\n        self.amount = amount\n        super().__init__(f"Balance {balance} is less than {amount}")\n\ndef withdraw(balance, amount):\n    if amount > balance:\n        raise InsufficientFundsError(balance, amount)\n    return balance - amount',
      ),
      const TheorySection(
        heading: 'Best Practices',
        body: '1. Be specific: catch the exact exception you expect, not bare except.\n2. Do not swallow errors silently: log or handle them meaningfully.\n3. Use finally (or context managers) for cleanup.\n4. Fail fast: validate inputs early and raise clear errors.\n5. Custom exceptions improve readability and API design.\n6. Never use bare except: — it catches KeyboardInterrupt and SystemExit too.',
      ),
    ],
  ),

  // ========================================================================
  // 12. ADVANCED CONCEPTS
  // ========================================================================
  TheoryTopic(
    id: '12',
    title: 'Advanced Concepts',
    category: 'Advanced',
    description: 'Generators, iterators, decorators, and other powerful Python features that separate beginners from experts.',
    sections: [
      const TheorySection(
        heading: 'Iterators',
        body: 'An iterator is an object that produces a sequence of values one at a time. It implements two methods:\n\n• __iter__() — returns the iterator object itself\n• __next__() — returns the next value or raises StopIteration\n\nEvery for loop in Python works with iterators under the hood.',
        code: 'class Countdown:\n    def __init__(self, start):\n        self.start = start\n\n    def __iter__(self):\n        return self\n\n    def __next__(self):\n        if self.start <= 0:\n            raise StopIteration\n        self.start -= 1\n        return self.start + 1\n\nfor num in Countdown(5):\n    print(num)  # 5, 4, 3, 2, 1',
      ),
      const TheorySection(
        heading: 'Generators',
        body: 'Generators are a simpler way to create iterators. They use the yield keyword to produce values lazily (one at a time), keeping memory usage minimal.\n\nWhen a generator yields a value, its state is frozen. The next time it is called, execution resumes right where it left off.',
        code: 'def countdown(start):\n    while start > 0:\n        yield start\n        start -= 1\n\nfor num in countdown(5):\n    print(num)  # 5, 4, 3, 2, 1\n\n# Generator expression (lazy list comprehension)\nsquares = (x**2 for x in range(1000000))\nprint(next(squares))  # 0\nprint(next(squares))  # 1\n\n# Memory efficiency: processing huge files line by line\ndef read_large_file(path):\n    with open(path) as f:\n        for line in f:\n            yield line.strip()',
      ),
      const TheorySection(
        heading: 'Decorators',
        body: 'A decorator is a function that takes another function as input, extends its behavior, and returns the modified function. They are marked with the @ syntax.\n\nDecorators are widely used for logging, timing, authentication, caching, and rate limiting.',
        code: 'import functools\nimport time\n\ndef timer(func):\n    @functools.wraps(func)\n    def wrapper(*args, **kwargs):\n        start = time.time()\n        result = func(*args, **kwargs)\n        elapsed = time.time() - start\n        print(f"{func.__name__} took {elapsed:.4f}s")\n        return result\n    return wrapper\n\n@timer\ndef slow_function():\n    time.sleep(1)\n    return "Done"\n\nslow_function()  # slow_function took 1.0012s',
      ),
      const TheorySection(
        heading: 'Closures',
        body: 'A closure is a nested function that remembers the variables from its enclosing scope even after that scope has finished executing.\n\nClosures are the foundation of decorators and factory functions.',
        code: 'def make_multiplier(n):\n    def multiplier(x):\n        return x * n\n    return multiplier\n\ndouble = make_multiplier(2)\ntriple = make_multiplier(3)\n\nprint(double(5))  # 10\nprint(triple(5))  # 15',
      ),
      const TheorySection(
        heading: 'Context Managers (with statement)',
        body: 'Context managers define setup and teardown logic via __enter__ and __exit__. They ensure resources are properly managed, even when errors occur.\n\nYou can write your own context managers using a class or the contextlib module.',
        code: 'from contextlib import contextmanager\n\n@contextmanager\ndef managed_resource(name):\n    print(f"Acquiring {name}")\n    yield name\n    print(f"Releasing {name}")\n\nwith managed_resource("Database") as res:\n    print(f"Using {res}")\n\n# Output:\n# Acquiring Database\n# Using Database\n# Releasing Database',
      ),
      const TheorySection(
        heading: 'Map, Filter, Reduce',
        body: 'Functional programming tools that process sequences without explicit loops.',
        code: 'from functools import reduce\n\nnums = [1, 2, 3, 4, 5]\n\n# map: apply function to every item\nsquares = list(map(lambda x: x**2, nums))\n\n# filter: keep items matching condition\nevens = list(filter(lambda x: x % 2 == 0, nums))\n\n# reduce: accumulate result\ntotal = reduce(lambda acc, x: acc + x, nums)\nprint(total)  # 15\n\n# Note: list comprehensions are often preferred in Python\nsquares = [x**2 for x in nums]  # faster and more readable',
      ),
      const TheorySection(
        heading: 'The Zen of Python',
        body: 'Type import this in any Python interpreter to see the guiding principles of Python design, written by Tim Peters.\n\nKey tenets:\n\n• Beautiful is better than ugly.\n• Explicit is better than implicit.\n• Simple is better than complex.\n• Readability counts.\n• There should be one obvious way to do it.\n• Now is better than never.\n\nThese principles explain why Python feels the way it does and why the community values clean, readable code over clever one-liners.',
        code: 'import this',
      ),
    ],
  ),
];
