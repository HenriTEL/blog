# Strange Behaviors with Python

Today I learned a few things about how numbers are treated in python so here is a quick quizz.
For each of the following statements, what does the python interpreter returns?

```python
isinstance(True, int)
True + True
True + 2.3
True is 1
int(True) is 1
2 == 2.0
True == 1.0
isinstance(2.0, int)
True and "str"
True and ""
```

<details>
  <summary>Answers</summary>
  <pre>
    isinstance(True, int) # True
    True + True # 2
    True + 2.3 # 3.3
    True is 1 # False
    int(True) is 1 # True
    2 == 2.0 # True
    True == 1.0 # True
    isinstance(2.0, int) # False
    True and "str" # "str"
    True and "" # ""
  </pre>
</details>
