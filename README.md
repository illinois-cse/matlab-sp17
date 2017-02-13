## MATLAB Workshops
**[Computational Science and Engineering](http://cse.illinois.edu/)**

### Foreword

MATLAB is a powerhouse language ubiquitous in engineering applications in academia and industry.  This workshop series will introduce you to basic and advanced MATLAB modules and concepts, including a focus on data processing and data analytics workflows.

The EWS Linux machines have everything we need for the workshop.  If you plan to use your personal laptop, you'll need to install a version of MATLAB from MathWorks.


### Location

All workshops will be held in the EWS computer laboratory, [1001](http://ada.fs.illinois.edu/0029Plan1.html) [Mechanical Engineering Laboratory](http://ada.fs.illinois.edu/0029.html).

**There is no sign-up for this series—walk-ins are welcome and encouraged!**


### Topics

#### MATLAB Basics

**Feb. 22, 1:00 p.m.–3:00 p.m.**

We will conduct a hands-on walkthrough of what MATLAB has to offer as a foundation for later tutorials throughout the semester. We will cover the following topics:

1. Introduction - MATLAB, programming

2. Variables(scalar, vector, matrices) and Operators

3. Functions

4. Basic numerical examples & matrix solutions

5. Control flow & matrix definitions

Example: Area of a circle & volume of a sphere (functions)
    
    function [A] = areaOfCircle(r)
    A = pi * r^2;

Example: Fahrenheit/Celsius (functions) 


    function Tf = TempC2F(Tc)
    Tf = Tc .* (180/100) + 32;
    end

Example: Falling ballistic object (vectorization, functions) 
    
    a=-9.8; %m/s^2
    v=2520; %m/s
    x0=0;
    t=1;
    y=a*t^2+v*t+x0;
     
    t=linspace(0,5,101) 
     
Example: Truss forces (Elementwise & matrix operators)

![](https://raw.github.com/uiuc-cse/matlab-fa13/master/lessons/truss.png)
![](https://raw.githubusercontent.com/uiuc-cse/matlab-fa14/gh-pages/lessons/img/truss-matrix.png)

    x = inv(T)*f
    x = T \ f;

Example: Control Flow, Define Matrix
    
    % Preallocate a matrix
      nrows = 10;
      ncols = 10;
      myData = ones(nrows, ncols);
    % Loop through the matrix
      for r = 1:nrows
         for c = 1:ncols
            if r == c
               myData(r,c) = 2;
            elseif abs(r - c) == 1
               myData(r,c) = -1;
            else
               myData(r,c) = 0;
            end
          end      
      end

#### MATLAB Numerics, Part I

**Mar. 1, 1:00 p.m.–3:00 p.m.**

#### MATLAB Numerics, Part II

**Mar. 8, 1:00 p.m.–3:00 p.m.**

#### Data Analytics with MATLAB

**Mar. 15, 1:00 p.m.–3:00 p.m.**

Topics before and after the break to include:  machine learning, clustering, data mining, data cleaning, and other key steps in learning from large data sets.
