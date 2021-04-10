# D7012E
In this repository you can find my code/solutions for the different lab assignments given in the course **D7012E** *Declarative Languages* at LTU University.

## Haskell
First half of the course is programming in **Haskell**. This part has three lab assignments, all quite fun and challenging.

### **H1**: *Smallest k sets*
In this lab the assignment was to write a program in **Haskell** that, given an integer k > 0 <br>
and a list containing n integers, computes and prints a *smallest* *k* set of *l* defined: <br>
> A smallest *k* set of *l* is a set {*l*<sub>*1*</sub>,*l*<sub>*2*</sub>,...,*l*<sub>*k*</sub>} of k different non-empty sublists of *l* such that <br>
for all other sets {*l'*<sub>*1*</sub>,*l'*<sub>*2*</sub>,...,*l'*<sub>*k*</sub>} of k different non-empty sublists of *l*, <br>
<img src="https://latex.codecogs.com/gif.latex?\sum_{i=!}^k\sigma(l_i)\leq\sum_{i=1}^k\sigma(l'_i)." title="\sum_{i=!}^k\sigma(l_i)\leq\sum_{i=1}^k\sigma(l'_i)." />


Run the program with *smallestKSets*, as following example:
```
ghci> smallestKSets [-1,2,-3,4,-5] 3
Entire list: [-1,2,-3,4,-5]

size    i       j       size
-5      5       5       [-5]
-4      3       5       [-3,4,-5]     
-3      1       5       [-1,2,-3,4,-5]
```
It works for all non-empty integer lists and with k>0.


### **H2**: *Abstract syntax trees, symbolic derivation, and numerical equation solving*
Placeholder

### **H3**: *Parser Operators with Haskell*
Placeholder

## Prolog
The second half of the course is programming in **Prolog**, this part also has 3 lab assignments. 

### **P1** : *Package delivery*
Placeholder

### **P2** : *Smallest k sets revisited*
Placeholder

### **P3** : *Low play in Othello*
Placeholder

## Author
All code is written by me, David Söderberg.
