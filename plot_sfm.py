#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Jul 14 11:05:14 2021

@author: guime
"""

import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns

#%% Parameters

# Time horizon
tmax = 10
step = 0.1
time = np.arange(0, tmax, step)
# X risks per century
deltas = np.arange(0, 0.0020, 0.0005)
# Interest rate
r = 0.05
# Budget in percent
B = 100
# Diminishing returns
eta = 2
# Flux of future funders in Budget %
phi = 0.1

#%% Single funder model
time = np.arange(0, tmax, step)
for delta in deltas:
    x = B * (delta - r*(1 - eta))/eta * np.exp((r - delta)/eta * time)
    plt.plot(time, x)

#%% Plot results
sns.set_theme(font_scale=2)

f, ax = plt.subplots(3,2) 
tmax = 10
step = 0.1
time = np.arange(0, tmax, step)

# Look at influence of delta
deltas = np.arange(0, 0.0090, 0.0005)
eta = 2
r = 0.05
for delta in deltas:
    x = B * (delta - r*(1 - eta))/eta * np.exp((r - delta)/eta * time)
    ax[0,0].plot(time, x)
    ax[0,0].set_ylim((0, 6))
    ax[0,0].set_title(r" $\delta \in [0, 0.0020]$ per year")
    # for major ticks
    ax[0,0].set_xticks([])
# Look at influence of Eta
etas = np.arange(1.5, 10, 0.5)
r = 0.05
delta = 0.0020
for eta in etas:
    x = B * (delta - r*(1 - eta))/eta * np.exp((r - delta)/eta * time)
    ax[1,0].plot(time, x)
    ax[1,0].set_ylim((0, 6))
    ax[1,0].set_title(r" $\eta \in [1.5, 10]$")
    ax[1,0].set_ylabel("Optimal % of budget to spend")
    ax[1,0].set_xticks([])
# Influence of r
interest_rate = np.arange(0.005, 0.08, 0.005)
delta = 0.0020
eta = 2
for r in interest_rate:
    x = B * (delta - r*(1 - eta))/eta * np.exp((r - delta)/eta * time)
    ax[2,0].plot(time, x)
    ax[2,0].set_ylim((0, 6))
    ax[2,0].set_title(r" $r \in [0.005, 0.08]$ per year")
    ax[2,0].set_xlabel("Time (years)")
# Look over a 100 years
tmax = 100
step = 0.1
time = np.arange(0, tmax, step)
# Look at influence of delta
deltas = np.arange(0, 0.0020, 0.0005)
eta = 2
r = 0.05
for delta in deltas:
    x = B * (delta - r*(1 - eta))/eta * np.exp((r - delta)/eta * time)
    ax[0,1].plot(time, x)
    ax[0,1].set_ylim((0, 150))
    ax[0,1].set_xticks([])

# Look at influence of Eta
etas = np.arange(1.5, 10, 0.5)
r = 0.05
delta = 0.0020
for eta in etas:
    x = B * (delta - r*(1 - eta))/eta * np.exp((r - delta)/eta * time)
    ax[1,1].plot(time, x)
    ax[1,1].set_ylim((0, 150))
    ax[1,1].set_xticks([])

# Influence of r
interest_rate = np.arange(0.005, 0.08, 0.005)
delta = 0.0020
eta = 2
for r in interest_rate:
    x = B * (delta - r*(1 - eta))/eta * np.exp((r - delta)/eta * time)
    ax[2,1].plot(time, x)
    ax[2,1].set_ylim((0, 150))
    ax[2,1].set_xlabel("Time (years)")
#%% Plot extended SFM
# Time horizon
tmax = 10
step = 0.1
r = 0.05
eta = 2
delta = 0.002
time = np.arange(0, tmax, step)
# Flux of fraction of budget B added each year.
phis = np.arange(0,0.1, 0.01)
for phi in phis:
    x = 100 * (1 + phi/r) * (delta - r*(1 - eta))/eta * np.exp((r - delta)/eta * time)
    plt.plot(time, x)
plt.xlabel("Time (years)")
plt.ylabel("Optimal % of budget to spend")