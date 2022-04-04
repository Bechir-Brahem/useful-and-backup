## loop invariant proof:
this is used to prove the correctness of an algorithm
**Initialization:** It is true prior to the first iteration of the loop.

**Maintenance:** If it is true before an iteration of the loop, it remains true before the
next iteration.

**Termination**: When the loop terminates, the invariant gives us a useful property
that helps show that the algorithm is correct.

for example for insertion sort the invariant can be that the array from 0..i is sorted
and use induction over i
## growth of function

### big Oh

asymptotic upper bound.
$$O(g(n))=\{f(n)\ :\exists\  c\ge 0,n_0\ge 0\ such\ that\ \ 
0\leq f(n) \leq cg(n)\ \forall n\ge n_0\}$$

### big Omega 

asymptotic lower bound

$$\Omega (g(n))=\{f(n)\ :\exists\  c\ge 0,n_0\ge 0\ such\ that\ 
 cg(n)\leq f(n)\ \forall n\ge n_0\}$$



### theta 

asymptotic upper and lower bound
$$\Theta (g(n))=\{f(n)\ :\exists\  c_1,c_2,n_0\ge 0\ such\ that\ 
 c_1g(n)\leq f(n)\leq c_2g(n)\ \forall n\ge n_0\}$$
 we can use $f=\Theta (g(n))$ instead of $f \in \Theta (g(n))$

$$f= \Theta (g(n)) \iff f=O(g(n))\ and\ f=\Omega (g(n))$$



## divide and conquer complexiy

let T(n) be the time to finish an input of size n
for some constant c T(n < c) is O(1)
we divide the array to a subproblems each with size n/b
D(n) the time to divide into a subproblems
M(n) the time to merge the solutions
$$
T(n)=
\begin{cases}
    \Theta(1)\ &if\ n\leq c\\ 
    aT(n/b)+D(n)+C(n) &otherwise
\end{cases}
$$

## Master Theorem

Let $a\ge 1$ and $b\gt 1$ be constants, let $f(n)$ be a function and let T(n) be defined on the nonnegative integers by the recurrence
$$T(n)=aT(n/b)+f(n)$$
where we interpret n/b to mean either $\lceil n/b \rceil$ or $\lfloor{n/b}\rfloor$:
- **Case 1:** If $f(n)=O(n^{ log_b(a)-\epsilon})$ for some $\epsilon\gt 0$, then $T(n) =\Theta(n^{log_b(a)})$
- **Case 2:** If $f(n)=O(n^{log_b(a)})$ then $T(n)=\Theta (n^{log_b(a)}lg(n))$
- **Case 3:** If $f(n)= \Omega (n^{log_b(a)+\epsilon})$ for some $\epsilon\lt 1$, and also $af(n/b)\le cf(n)$ and all sufficiently large n, then 
$T(n)=\Theta (f(n))$

in simple terms find $n^{log_b(a)}$ and compare it to $f(n)$ if $f(n)$ is polynomially bigger than $n^{log_b(a)}$ (meaning that there exists an epsilon such that $f(n)=O(n^{log_b(a)-\epsilon})$)
then it's case 1. if it is polynomially smaller then it's case 3. otherwise it's case 2

there's a more advanced method called akra-bazzi method

