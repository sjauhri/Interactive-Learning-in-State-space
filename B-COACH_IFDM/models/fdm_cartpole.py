"""
Classic cart-pole system implemented by Rich Sutton et al.
Copied from http://incompleteideas.net/sutton/book/code/pole.c
permalink: https://perma.cc/C9ZM-652R
"""

import math
import numpy as np

def fdm_cart(state, action):
    # valid actions are 0 (left) and 1 (right)
    x, x_dot, theta, theta_dot = state
    force = 0
    if action==1:
        force = 10.0
    else:
        force = -10.0
    costheta = math.cos(theta)
    sintheta = math.sin(theta)
    temp = (force + 0.05 * theta_dot * theta_dot * sintheta) / 1.1
    thetaacc = (9.8 * sintheta - costheta* temp) / (0.5 * (4.0/3.0 - 0.1 * costheta * costheta / 1.1))
    xacc  = temp - 0.05 * thetaacc * costheta / 1.1
    x  = x + 0.02 * x_dot
    x_dot = x_dot + 0.02 * xacc
    theta = theta + 0.02 * theta_dot
    theta_dot = theta_dot + 0.02 * thetaacc        
    
    state = (x,x_dot,theta,theta_dot)

    return np.array(state)
