#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sun Oct 25 17:47:01 2020

@author: tianyun
"""

import numpy as np
                                              
alpha = 0.01                                  
eps = 1e-6                                    
                                              
x = [1., 2., 3., 4., 5., 6., 7., 8., 9.]      
y = [3., 5., 7., 9., 11., 13., 15., 17., 19.] 

#最普通的loadtxt
A = np.loadtxt('data.txt')
Y = np.loadtxt('lable.txt')

def solve_by_gradient():
    # m is sample num
    m = len(Y)
    a, b= 0, 0
    sse, sse_new = 0, 0
    grad_a, grad_b = 0, 0
    count = 0
    for step in range(100000):
        count += 1
        for i in range(m):
            base = a * x[i] + b - y[i]
            grad_a += x[i] * base
            grad_b += base

            grad_a = grad_a / m
            grad_b = grad_b / m

            a -= alpha * grad_a
            b -= alpha * grad_b

            # loss function: Mean Squared Error, MSE
            # because 2m is a const, so 1/2m can be ignored
            for j in range(m):
                sse_new += (a * x[j] + b - y[j]) ** 2

        if abs(sse_new - sse) < eps:
            break
        else:
            sse = sse_new
    print('{0} * x + {1}'.format(a, b))
    print ("count is: " , count)

solve_by_gradient()