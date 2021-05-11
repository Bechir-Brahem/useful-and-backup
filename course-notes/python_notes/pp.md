# Python Notes

[toc]

## I. variables

**python is dynamically typed:** variable types are checked during runtime so no need to mention their types this can be achieved because every python variable is a reference to an object

```python
a =4**0.5
a = " degla " # no errors
print a # a is " degla "
```

**Python is strong typed:** in expressions variables are bound to their specific type

```python
temp = 'Hello World !'
# temp = temp + 10; program terminates
# TypeError : cannot concatenate str and int objects
```

' and " are treated the same

```python
" hello " , " 'abc " , 'abc'# are allowed
# " hello ’ is not allowed
```

## II. Arithmetic Expressions

```python
a =1/4 # ( a is 0.25)
a =1//4 # ( a is 0)
a =5.0//2 # ( a is 2.0)
a =9.0//3.1 # ( a is 2.0)
```

// for integer division and / for real division

```python
a =2**5 # ( a is 32)
a = 4**0.5 # ( a is 2.0)
```

## III. Strings

There are several ways to format strings in Python to interpolate variables. The new way (new in Python 3.6+) **F-Strings**

```python
x =10
formatted = f " i have { x } bbbananas " 
# formatted = " i have 10 bbbananas "
```

the way of python2 and older than 3.5

```python
x =10
formatted = " i have {} bbbananas ".format(10)
```

## IV. Slices

**\[start (included) : end (excluded) : step]**

```python
x=[1 ,2 ,3 ,4 ,5 ,6 ,7]
x[-1] # 7
x[1:3]=[ ’a ’ , ’b ’ , ’c ’] 
# [1 , ’ a ’,’b ’,’c ’ ,4 ,5]
x=[1 ,2 ,3 ,4 ,5]
x[::2] # [1 ,3 ,5 ,7]
x[:: -1] # [7 ,6 ,5 ,4 ,3 ,2 ,1]
```

## V. List Comprehension

```python
[ num*10 for num in range (1 ,6) ]
 # [10 ,20 ,30 ,40 ,50]
[ bool ( val ) for val in [0 , [] , ’ ’ ]] 
# [ False , False , False ]
items =[ " aaa " , " nnn " , " qqqq " ]
[ item [0]+ item [1:] for item in items ]
numbers = [1 ,2 ,3 ,4 ,5 ,6]
evens =[ x for x in numbers if x %2==0]
odds =[ x for x in numbers if x %2==1]
[ x *2 if x %2==0 else x /2 for x in numbers ]
#[0.5 , 4 , 1.5 , 8 , 2.5 , 12]
```

## VI. Data Types

### Dictionnaries

Dictionary in Python is an unordered collection of data values, used to store data values like a map, which unlike other Data Types that hold only single value as an element, Dictionary holds key:value pairictionary in Python is an unordered collection of data values,  **keys can’t be repeated and must be immutable.**

```python
tmp_dictionnary = dict( key = 'value') 
# { ’key’: ’value’}
Dict = {1: 'Geeks' , 2: 'For' , 3: 'Geeks'}
Dict [1] # " Geeks "

Dict = { 'Name': 'Geeks', 1: [1 , 2 , 3 , 4]}
Dict [1] # [1 ,2 ,3 ,4]
d=dict()
d[1]="aa" # d is {1,"aa"}
d [(1 ,2) ]={ " key " : " oop " } 
# d is {1:" aa " , (1 ,2) :{" key " ," oop "}}
d [(1 ,2) ]=2 # d is {1:" aa " , (1 ,2) :2}
```

#### accessing values and keys

```python
for value in Dict.values () :
	print ( value ) # " Geeks " ,[1 ,2 ,3 ,4]

for key in Dict.keys () :
	print ( key )# " Name " , 1

x ={(1 , 2) : [1 , 2 , 3] , 1: ’ ax ’ , ’ alala ’: 12}
for key , value in x.items () :
	print ( key , value )
#(1, 2) [1, 2, 3]
#1 ax
#alala 12
```

#### checking existence

```python
x ={1: " pp " , " name " :69}
1 in x # True
69 in x # False
```

##### copy

```python
d = dict ( a =1 , b =2 , c =3)
c = d . copy ()
c is d # False
c == d # True
```

#### get

retrieves a key in an object and return None instead of a KeyError if the key doesn’t exist

```python
d = dict ( a =1 , b =2 , c =3)
d['a'] # 1
d.get ( 'a') # 1
d[" pp " ] # KeyError
d.get ( " pp " ) # None
```

#### fromkeys

Creates key-value pairs from comma seperated values and it has no effect on an already created dict:

```python
{}.fromkeys ( " a " ," b " ) # { ’ a ’: ’ b ’}
{}.fromkeys ([ " email " ] , " unknown " ) 
# { ’ email ’: ’ unknown ’}
{}.fromkeys ( " a " ,[1 ,2 ,3 ,4 ,5])
 # {" a ":[1 ,2 ,3 ,4 ,5]}
a ={1: " pp " }
a.fromkeys (1 , " po " ) # a is still {1:" pp "}
```

#### pop

takes a single argument corresponding to a key and removes the key:value pair. returns the value associated
with the key.

```python
d ={1: " q " : " b " :3}
d.pop ( " b " ) # 3 d is {1:" q "}
d.pop () # TypeError
d.pop ( " o " ) # KeyError
```

#### update

keys and values in a dict with another dict

```python
first = dict( a =1 , b =2 , c =3)
second ={1: " alfred big " }
second.update( first )
second 
# {" a ":1 , " b ":2 , " c ":3 , 1:" alfred big "}
```

#### Dict comprehension.

```python
samir=dict(first=1,second=2,third=3)
squared={key:value**2 for key,value in samir.items()}
#{'first': 1, 'second': 4, 'third': 9}
{num:num**2 for num in [1,2,3,4,5)}
str1="abc"
str2="123"
combo={str1[i]:str2[i] for i in range(0,3)}
#{'a':1,'b':2,'c':3}
nums=[1,2,3,7,4,7,9,5,2]
{num:("even" if i%2==0 else "odd")for i in nums}
```

### 2. Tuples

```python
a=(1,2,3,4,5,6)
a[-1] # 6
a[::2] # (1,3,6)
a=(1,2,3,4)
a.count(2) # 1
a.index(3) # 2
```

#### 3. Sets

```python
s=set({1,2,3,6,6,6,6}) # {1,2,3,6}
s=({1,2,3}) 
s={1,2,3}#both are the same
4 in s # false
2 in s # true
s=[1,2,2,3,3,4]
sets=set(s) # {1,2,3,4}
sets.add(5) # {1,2,3,4,5}
a=sets.copy()
a # {1,2,3,4,5}
a is sets # False
sets.remove(3) # {1,2,4,5}
sets.remove(3) # KeyError .discard() can be used to handle error
```

`|` and `&` operator can act as intersection and union of sets\
`{1,2,3} | {2,3,4} # {1,2,3,4}`

#### Set comprehension

```python
{x%2 for x in range(50)} # {1,0}
```

## VII. Funtions

### default paramaters

```python
def add(a=10,b=20):
	return a+b
def math(a,b,f=add):
	return f(a,b)
def sub(a,b):
	return a-b

add() # 30
add(1) # 21
add(0,2) # 2
math(0,2) # 2
math(69,69,sub) # 0 paramaters can be anything
```

### keyword arguments

is when you specify the variable name when calling the function

```python
def f(a="ahmed",b="rojla")
	print(a,"is", "b")

f() # ahmed is rojla
f("samir","moudir") # samir is moudir
f(b="moudir") # ahmed is moudir
```

### global keyword

it means that the variable is global\
if it is not used `variable=0` would create a local variable to the scope of the function

```python
total=0
def f():
	global total
	return total+1
```

nested functions

```python
#python can have nested functions
def f():
	def g(a):
		print(a)
	g(123)
	g(4)
```

### nonlocal keyword

The nonlocal keyword is used to work with variables inside nested functions, where the variable should not belong to the inner function.

```python
def myfunc1():
	x = "John"
	def myfunc2():
		nonlocal x
		x = "hello"
	myfunc2()
	return x

print(myfunc1()) 
```

functions are documented with ` """ DOCUMENTATION HERE """   ` just after the function signature\\

### \*args and \*\*kwargs

when calling functions there is non keyword arguemnts and keyword arguments

1.  #### \*args

    this is best described with an example

    ```python
    def f(*argv):                                                   
    	print(argv)
                                                                                            	
    f(1,"samir",[1,2],{1:69}) # (1, 'samir', [1, 2], {1: 69}) 
    ```

    a tuple is printed out. what \*argv does is that it takes a variable length number of argument
    and argv contains all the non-keyword arguments in a tuple. it can also be name \*ANY_NAME but it is
    better to write it as \*argv

    ```python
    def myFun(arg1, *argv): 
    	print ("First argument :", arg1) 
        for arg in argv: 
    	    print("Next argument through *argv :", arg) 
                                                                                            	                      
    myFun('Hello', 'Welcome', 'to', 'GeeksforGeeks') 
                                                                                            	
    #First argument : Hello
    #Next argument through *argv : Welcome
    #Next argument through *argv : to
    #Next argument through *argv : GeeksforGeeks
                                                                                            	
    ```

2.  #### \*\*kwargs
    \*\*kwargs is the same as \*args but for keyword arguments.and it will
    contain a dictionnary with keyword as keys and the passed values and values
    ```python
    def f(**kwargs):
    	print(kwargs)

    f(a=2,b=-1,c="aa") # {'a': 2, 'b': -1, 'c': 'aa'}
    ```

3.  #### unpacking with \*\*kwargs and \*args

    ```python
    num=(1,2,3)
    def f(a,b,c):
        return a+b+c
                                                                                            	            	
    f(*num) # 6
    ```

    ```python
    def f(a,b):
        print(a,"is",b)
                                                                                            	            	
    tmp=dict(b="rojla",a="ahmed")
    f(**tmp) # ahmed is rojla
    ```

### lambda

lambda are interpreted as functions and their main utility is when they are passed
as paramaters to functions

```python
add_values = lambda x, y: x+y
multiply= lambda x,y: x*y
add_values(10,20) # 30
multiply(1,69) # 69
```

### Useful Functions

```python
x =[1 ,2 ,3 ,4]
x.insert (2 , " hi " ) # [1 ,2 ," hi " ,3 ,4]
x.append (8) # [1 ,2 ," hi " ,3 ,4 ,8]
x,y =[1 ,2] , [3 ,4]
x.append ( y ) # x =[1 ,2 ,[3 ,4]]
x,y =[1 ,2] , [3 ,4]
x.extend ( y ) # x =[1 ,2 ,3 ,4]
x.clear () # x =[] removes all items from the list
x=[1 ,2 ,3 ,4]
x.reverse () # x =[4 ,3 ,2 ,1]
x.sort () # x =[1 ,2 ,3 ,4]
x=[1 ,2 ,3 ,4 ,3 ,2 ,1 ,4 ,10 ,2]
x.count (2) # 3
x.count (69) # 0
x=[ " hi " ," my " ," name " ," is " ," Alfred " ]
" ".join ( x ) # " my name is Alfred "
```

#### pop()

*   removes the item at the given position in the list and return it
*   if no index is specified, removes the last item

#### remove()

*   removes the first occurence of the given value (value not index )
*   throws ValueError if such value doesn't exist

#### index()

*   returns the first index of the speicified value
*   throws ValueError if such value doesn't exist

#### map()

*   takes two arguments first one is a function next one is an iterable
    ```python
    l=[1,2,3,4]
    doubles = list(map(lambda x: x*2, 1))
    # [2,4,6,8]
    ```

#### filter()

*   there's a lambda for each value in the iterable
*   returns filter object which can be converted into other iterables
*   the object contains only values that return true to the function
    ```python
    l=[1,2,3,4]
    evens = list(filter(lambda x: x%2==0,l))
    # [2,4]
    ```

#### map + filter

example:

```python
names=["Lassie", "Colt", "Rusty"]
list(map(lambda x: f"your instructor is {x}",filter(lambda x: len(x)<5,names)))
# ["your instructor is Colt"]
```

can be done with list comprehension.

#### all

return true if all the elements of the iterable are truthy
return True if iterable is empty

```python
all([1,2,3,4]) # True
all([x**2-x for x in (1,2,3,4)]) # False
```

#### any

returns true if there's one element in the iterable is truthy
if iterable is empty returns False

```python
any([]) # False
any([0,"",[],{}]) # False
any([0,"",[],{},1]) # True
```

#### sorted

returns a new sorted list from the items in iterable

```python
num=[1,2,3,4,3,2,1]
sorted(num) # [1,1,2,2,3,3,4]
num # [1,2,3,4,3,2,1]
```

```python
l=["abcbcb","aka","a","","aakkakakakk"]
sorted(l,key=lambda x: len(x))
# ['', 'a', 'aka', 'abcbcb', 'aakkakakakk']
sorted(l,key=lambda x: len(x),reverse=1)
# ['aakkakakakk', 'abcbcb', 'aka', 'a', '']
```

#### max

return the largest item in the iterable (or in two or more args)

```python
max("awesome") # "w"
max({1:"a",2:"b",3:"d"}) # 3
```

#### zip

*   make an iterator that aggregates elements from each of the iterables
*   returns an iterator of tuples, where the i-th tuple contains the i-th element
    from each of the argument sequences or iterables
*   the iterator stops when the sortest input is exhausted

```python
tmp=zip([1,2,3],[4,5,6])
list(tmp) # [(1,4),(2,5),(3,6)]
dict(tmp) # {1: 4, 2: 5, 3: 6}

samir=[(0,1),(1,2),(2,3),(3,4),(4,5)]
list(zip(*samir))
# [(0,1,2,3,4),(1,2,3,4,5)] 
```

### Generators

**Generator-Function** : A generator-function is defined like a normal function,
but whenever it needs to generate a value, it does so with the yield keyword
rather than return. If the body of a def contains yield, the function
automatically becomes a generator function.

```python
def simpleGeneratorFun(): 
    yield 1            
    yield 2            
    yield 3            
   
for value in simpleGeneratorFun():  
    print(value) 
#1
#2
#3
```

**Generator-Object** : Generator functions return a generator object. Generator
objects are used either by calling the next method on the generator object or
using the generator object in a “for in” loop (as shown in the above program)

```python
def simpleGeneratorFun(): 
    yield 1
    yield 2
    yield 3
   
# x is a generator object 
x = simpleGeneratorFun() 
  
# Iterating over the generator object using next 
print(x.next()) # In Python 3, __next__() 
print(x.next()) 
print(x.next()) 
#same output
```

```python
def fibanocci(limit): 
    a, b = 0, 1
    while a < limit: 
        yield a 
        a, b = b, a + b 
  
x = fibanocci(5) 
for i in fib(5):  
    print(i) 
```

<u>**generators are space efficient**</u>

```python
import sys
print(sys.getsizeof([x*10 for x in range (10000)]))
print(sys.getsizeof(x*10 for x in range (10000)))
# 87616 
# 112
```

|yield   |return   |
|---|---|
|It replace the return of a function to suspend its execution without destroying local variables.	|It exits from a function and handing back a value to its caller.	|
|   It is used when the generator returns an intermediate result to the caller.|It is used when a function is ready to send a value.	|
|   Code written after yield statement execute in next function call.|while, code written after return statement wont execute.   |
|Yield statement function is executed from the last state from where the function get paused. | Every function calls run the function from the start.|

## VIII. Errors

### Types of errors

**IndexError** is thrown when trying to access an item at an invalid index.\
**ModuleNotFoundError** is thrown when a module could not be found.\
**KeyError** is thrown when a key is not found\
**ImportError** is thrown when a specified function can not be found\
**StopIteration** is thrown when the next() function goes beyond the iterator items\
**TypeError** is thrown when an operation or function is applied to an object of an inappropriate type.\
**ValueError** is thrown when a function's argument is of an inappropriate type\
**NameError** is thrown when an object could not be found.\
**KeyboardInterrupt** is thrown when the user hits the interrupt key (normally Control-C) during the execution of the program\
**RuntimeError** Raised when an error does not fall under any other category.

### Raising exceptions

```python
raise ValueError("invalid value")
```

### Handle Errors

in python it is strongly encouraged to use try/except

```python
try:
	foobar()
except NameError as err:
	print(err) # err is the error
```

if no error is specified it catches all errors this is highly discouraged\
because we dont know the type of error

```python
try:
	foobar()
execpt:
	print("samir")
```

**else keyword** is used to define  a block of code to be executed if no errors were raised\
**finally keyword**  if specified,its block  will be executed regardless if the try block raises an error or not.

```python
try:
	foobar()
except ZeroDivisionError:
	do()
else:
	do2()
finally:
	do3()
```

this example will explain utility of finally

```python
def f():
    try:
        1/1
    except ZeroDivisionError as err:
        print(err)
    else:
		print("else")
        return 
    finally:
        print("here")

f()
#output here is:
# else
#here
```

even if the else block has return finally runs

## X. Modules

ways to import modules:

### built in modules

```python
import random

random.choice(["apple","abnana","juice"])
random.shuffle(["samir","ahmed","xin wung un"])
```

```python
import random as rn

rn.choice(["apple","abnana","juice"])
rn.shuffle(["samir","ahmed","xin wung un"])
```

### importing parts of a module

the **from keyword** lets you import from the module specific parts

```python
from random import choice,randint
# from random import choice as choix, randint as rand
# from random import *
choice(["apple","tofe7a","pomme"])
ranint(1,30)
```

### \__name\_\_ variable

\__name\_\_ variable is made to show in what file the code is executing\
if we run script.py then that script is the called the main file and if \__name\_\_ is called from scripts imported by main\
it will return the name of that file

file1.py

```python
def f():
    print(__name__)
```

file2.py

```python
import file1
print(__name__) # __main__
file1.f() # file1
```

## IX. HTTP

### request

```python
import requests
response = requests.get(
	"http://www.google.com",
	headers={
		"Accept": "text/plain" # or application/json
	}
		)
# or response = requests.get("http://www.google.com")
```

### Query String

```python
import requests
response = requests.get("http://www.example.com?key1=value1&key2=value2")
```

or




```python
import requests
url="http://www.example.com"
response = requests.get(url,params={
	"key1":"value1"
	"key2":"value2"
		})
response.json()
```
