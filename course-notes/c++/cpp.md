<h1>C++ by dissection.</h1>

[toc]

## classes

structs by default are public.
classes by default are private
The scope resolution operator, the highest-precedence operator in the language, comes
in two forms. The unary form is used to uncover or to access a name that has external
scope and has been hidden by local or class scope. The binary form places the class
or namespace identifier before the operator and the identifier after the operator.
::i // unary - refers to external scops
point::x // binary - refers to class scope
std::cout // binary - refers to namespace scope

```cpp
int count = 0; // global count
void how_many(double w[], double x, int& count)
{
for (int i = 0; i < N; ++i)
count += (w[i] == x); // local count
++::count; // global count tracks calls
}
```

### this pointer

The keyword this denotes an implicitly declared self-referential pointer that can be
used in a nonstatic member function.

```cpp
point inverse() { x = -x; y = -y; return (*this);}
```
### static Members
Using the modifier static when declaring a data member
means that the data member is independent of any given class variable. The data mem-
ber is part of the class but separate from any single class
difference between static and nonstatic members is that static members cannot use
the this pointer.
Since a static member is independent of a particular instance, it can be accessed in the
form
```cpp
class-name :: identifier
```
```cpp
class point {
public:
static int how_many;
·····
};// declaration
int point::how_many = 0;// initialization
·····
++point::how_many; // use independent of any instance
```
Note the use of the scope resolution operator. A static member of a global class must be
explicitly declared and defined in file scope.
The preferred style for accessing static members is to use
scope resolution. Pointer and dot operator access are misleading and give no indication
that the member is static.

### const

A data member declared with the const modifier cannot be modified after initializa-
tion. A nonstatic member function can also have the const modifier.
const member function is not allowed to modify any of its implicit arguments.
Also allowed in C++ is static const initialization within a class declaration.
```cpp
class salary {
·····
private:
const static int
·····
};
all_bonus = 1000; // initializer
const int salary::all_bonus;// declaration required
```

The keyword mutable allows data members of class variables that have been declared
const to remain modifiable. It also allows const member functions to modify that data
member. This reduces the need to cast away constness using const\_cast<>. 
### Class Design
The style of public first is becoming the norm. It follows the rule that the widest audi-
ence needs to see the public members. More specialized information is placed later in
the class declaration.
Data members should in general be private. This is an important coding heuristic. Gen-
erally, data are part of an implementation choice and should be accessed through pub-
lic member functions. Such member functions are called accessor functions when they
do not change, or mutate, the data. This is not necessarily inefficient because simple
accessor member functions can be inline.
### other topics
page 191 c++ by dissection
pointer to a class member
unions
bit fields

## Ctors, Dtors and operator overloading

### Constructors
The simplest use of a constructor is for initialization. 
The member function counter::counter(int) is a constructor. It
does not have a return type. This constructor is invoked when objects
of type counter are declared.When invoked, the constructor requires an expression that is assignment-
compatible with its int parameter. It then creates and initializes the
declared variable. Notice we have placed the definition of the con-
structor outside the class braces. We can then define it by using the
scope resolution operator :: . **Methods defined inside the class
brackets are automatically inlined.**  When providing an inline
function definition outside of the class brackets, you must include it
in any file with code that uses it.
```cpp
class counter {
public:
counter(int i);// ctor declaration
void reset() { value = 0; }
int get() const { return value; }
void print() const { cout << value << '\t'; }
void click() { value = (value + 1) % 100; }
private:
int value;// 0 to 99
};
// Constructor definition
inline counter::counter(int i) { value = i % 100; }
```

this initialization can also be used.
```cpp
counter a(0);// a.value = 0;
counter b(1);// b.value = 1;
```
#### The Default Constructor

A constructor requiring no arguments is called the default constructor.
It is often convenient to overload the constructor with several function 
declarations.
the following constructor could serve as both a general initial-
izer and a default constructor:
```cpp
inline counter::counter(int i = 0) { value = i % 100 }
```
```cpp
inline counter::counter(int i = 0) :
x(0), y(0), value(i % 100) { }
```
#### Constructors for Conversions
```cpp
someClass c;
int i=0;
c=i; 
```
here the third line is equivalent to `c=static_cast<someClass>(i);`
and the constructor is called with i as an argument

The **keyword explicit** is used with a constructor of one argument.
Normally, this would be a conversion constructor, but the keyword
explicit disables this feature.

#### The Copy Constructor

```cpp
someClass a;
someClass b;
...
a=b;//this here requires a copy contructor
```

c++ provides a default copy constructor for classes and it works well for classes
with native data types but the problem rises when copying arrays the copy constructor
copies the value of the pointer not the content of the array (shallow copy) and this can cause
serious problems. so for this we need to define our copy constructor to do deep copying  
copy contructors have this form
```cpp
class_name::class_name(const class_name&);
```

```cpp 
ch_stack::ch_stack(const ch_stack& stk) :
max_len(stk.max_len), top(stk.top)
{
    s = new char[stk.max_len];
    assert(s != 0);
    memcpy(s, stk.s, max_len);
}
```
In constructors, initialization is preferred to assignment:
```cpp

ch_stack::ch_stack(int size)
{ s = new char[size]; assert(s != 0);
max_len = size; top = EMPTY; }
```
is better written as
```cpp
ch_stack::ch_stack(int size) : max_len(size), top(EMPTY)
{ s = new char[size]; assert(s != 0); }
```
The compiler is often more efficient about initialization. Initialization order follows
declaration order inside the class and not the ordering of the initializer list.
### Destructors

A destructor is a member function whose name is the class name preceded by a tilde, ~.
Destructors are almost always called implicitly, usually at the exit of the block in which
the object was declared. They are also invoked when a delete operator is called on a
pointer to an object having a destructor or where needed to destroy a subobject of an
object being deleted.

### Friend Functions

The keyword **friend** is a function specifier that gives a **nonmember** function access to
the hidden members of the class and provides a method of escaping the data-hiding
restrictions of C++.  
One reason for using friend functions is that some functions need privileged access to
more than one class.  
In order to specify that all member functions of one class are friend functions of a second class, write
```cpp
friend class class-name.
```


```cpp
void alice()
{
    // use some private stuff from tweedledee
    ·····
    cout << "Have some more tea.\n";
}
class tweedledee {
    ·····
    friend void alice();// friend function
    int cheshire();// member function
    ·····
};

n
class tweedledum {
    ·····
    friend int tweedledee::cheshire();// friend member function
    ·····
};
class tweedledumber {
    ·····
    // all member functions of tweedledee have access
    friend class tweedledee;
    ·····
};

```

### Overloading and Signature Matching

Overloaded functions are an important polymorphic mechanism in C++. The overloaded
meaning is selected by matching the argument list of the function call to the argument
list of the function declaration. When an overloaded function is invoked, the compiler
must have a selection algorithm with which to pick the appropriate function.

__Basic Signature Matching Algorithm__

1. Use an exact match if found.
2. Try standard type promotions.
3. Try standard type conversions.
4. Try user-defined conversions.
5. Use a match to ellipsis if found.

Standard promotions—conversions from float to double and from bool, char, short,
or enum to int—are better than other standard conversions. Standard conversions also
include pointer conversions.
```cpp
class rational {
    public:
    friend bool operator>(rational w, rational z);
    private:
    int a,q;
};
bool operator>(rational w, rational z)
{
    return (static_cast<double>(w.a) / w.q >
    static_cast<double>(z.a) / z.q);
}
```

<p>
Although meanings can be added to operators, their associativity and precedence remain the same. For example, the multiplication operator 
remains of higher precedence than the addition operator. Almost all operators can be overloaded. The exceptions are the member operator
., the member object selector .*, the ternary conditional expression operator ? :, the sizeof operator, and the scope resolution operator ::.
</p>

<p>
Available operators include all of the arithmetic, logical, comparison, equality, assignment, and bit operators. Furthermore, the increment
and decrement operators, ++ and -, can have distinct prefix and postfix meanings. The subscript or index operator [] and the function call ()
can also be overloaded. The structure pointer operator -> and the member pointer selector operator ->* can be overloaded. It is also possible
to overload new and delete. The assignment, function call, subscripting, and class pointer operators can be overloaded only by nonstatic member
functions.
</p>

### operator overloading

```cpp
returnType operator symbol (arguments)
```

#### unary operator overloading

```cpp
class my_clock {
public:
    my_clock(unsigned long i = 0);// ctor & conversion
    my_clock set(unsigned long i = 0);
    void print() const;    // formatted printout
    void tick();   // add one second
    my_clock operator++() { tick(); return *this; }
private:
    unsigned long tot_secs, secs, mins, hours, days;
};
```
**Note that operator ++() always denotes the prefix version.**
and 

#### Binary Operator Overloading

When a binary operator is overloaded using a member func-
tion, it has as its first argument the implicitly passed class variable and as its second
argument the lone argument-list parameter. Friend functions and ordinary functions
have both arguments specified in the parameter list.

```cpp
class my_clock {
·····
friend my_clock operator+(my_clock c1,my_clock c2);
};
my_clock operator+(my_clock c1, my_clock c2)
{  return (c1.tot_secs + c2.tot_secs);}
```
The int return expression is implicitly converted to a `my_clock` by the conversion con-
structor` my_clock::my_clock(unsigned long)`.

it is normal for symmetric binary operators to be overloaded by friend func-
tions.In contrast, let us overload binary minus with a member function:
```cpp
class my_clock {
·····
    my_clock operator-(my_clock c);
};
my_clock my_clock::operator-(my_clock c)
{return (tot_secs - c.tot_secs);}
```

We define a multiplication operation as a binary operation, with one argument an
unsigned long and the second a my_clock variable. The operation requires the use of
a friend function. It cannot be done with a member function because, as was already
stated, member functions have as their implicit first argument the this pointer.
```cpp
my_clock operator*(unsigned long m, my_clock c)
{
    return (m * c.tot_secs);
}
```
This requirement forces the multiplication to have a fixed ordering that is type-depen-
dent. In order to avoid this, it is common practice to write a second overloaded func-
tion. The second function is defined in terms of the first, as follows:
```cpp
my_clock operator*(my_clock c, unsigned long m)
{
    return (m * c);
}
```
Defining the second implementation in terms of the first implementation reduces code
redundancy and maintains consistency.

#### overloading assignment

As a rule of thumb, anytime a class needs an explicit copy constructor
defined, it also needs an assignment operator defined.

```cpp
my_string& my_string::operator=(const my_string& str)
{
    ... // deep copy
    return *this;
}
```

```cpp
a, b("do "), c("do not "), d;
a= b;//a is now "do "
d= b = c;//these are "do not "
c= "do not but";//invoke conversion ctor
d= c.assign(b);//illegal-assign() returns void
d+=c;//illegal even if + exists
```
#### Overloading the Subscript Operator

```cpp
element-type& operator[](integral type);
```

#### Overloading Operator () for Indexing

for example to return a substring

```cpp
my_string my_string::operator()(int from, int to)
```

#### Overloading << and >>

```cpp
ostream& operator<<(ostream& out, const rational& x)
{
    return (out << x.a << " / " << x.q << '\t');
}
```

```cpp
istream& operator>>(istream& in, rational& x)
{
    return (in >> x.a >> x.q);
}
```

## Inheritance

### A Derived Class

A class can be derived from an existing class by using the form

```cpp
class class-name : (public|protected|private) opt base-name
{
member declarations
};
```
The keywords public, protected, and private are used
after the colon to specify how the base-class members are to be accessible to the
derived class. The keyword protected is introduced to allow data hiding for members
that must be available in derived classes but that otherwise act like private members. It
is an intermediate form of access between public and private.
