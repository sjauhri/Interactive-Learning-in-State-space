import matplotlib.pyplot as plt
import seaborn as sns
import pandas as pd
import numpy as np


sns.set() # default seaborn theme, scaling, and color palette
# sns.set(style="ticks", palette="muted")

# CartPole
cart_dict = [{'Method': 'Tele-Op (A)', 'Return': 100.7},
              {'Method': 'Tele-Op (S)', 'Return': 147.7},
              {'Method': 'BC*', 'Return': 164.9},
              {'Method': 'GAIL*', 'Return': 167.0},
              {'Method': 'TIPS', 'Return': 199.0},
            #   {'Method': 'D-COACH', 'Return': 200.0},
             {'Method': 'Tele-Op (A)', 'Return': 56.7},
              {'Method': 'Tele-Op (S)', 'Return': 120.8},
              {'Method': 'BC*', 'Return': 169.0},
              {'Method': 'GAIL*', 'Return': 178.0},
              {'Method': 'TIPS', 'Return': 200.0},
            #   {'Method': 'D-COACH', 'Return': 200.0},
             {'Method': 'Tele-Op (A)', 'Return': 88.2},
              {'Method': 'Tele-Op (S)', 'Return': 115.1},
              {'Method': 'BC*', 'Return': 160.0},
              {'Method': 'GAIL*', 'Return': 165.6},
              {'Method': 'TIPS', 'Return': 200.0},
            #   {'Method': 'D-COACH', 'Return': 200.0},
             {'Method': 'Tele-Op (A)', 'Return': 108.4},
              {'Method': 'Tele-Op (S)', 'Return': 92.3},
              {'Method': 'BC*', 'Return': 157.1},
              {'Method': 'GAIL*', 'Return': 190.0},
              {'Method': 'TIPS', 'Return': 200.0},
            #   {'Method': 'D-COACH', 'Return': 200.0},
             {'Method': 'Tele-Op (A)', 'Return': 60.6},
              {'Method': 'Tele-Op (S)', 'Return': 112.9},
              {'Method': 'BC*', 'Return':  112.9},
              {'Method': 'GAIL*', 'Return': 138.8},
              {'Method': 'TIPS', 'Return': 200.0},
            #   {'Method': 'D-COACH', 'Return': 200.0},
             {'Method': 'Tele-Op (A)', 'Return': 84.1},
              {'Method': 'Tele-Op (S)', 'Return': 110.1},
              {'Method': 'BC*', 'Return':  126.6},
              {'Method': 'GAIL*', 'Return': 157.0},
              {'Method': 'TIPS', 'Return': 200.0},
            #   {'Method': 'D-COACH', 'Return': 200.0},
             {'Method': 'Tele-Op (A)', 'Return': 55.4},
              {'Method': 'Tele-Op (S)', 'Return': 90.4},
              {'Method': 'BC*', 'Return':  135.2},
              {'Method': 'GAIL*', 'Return': 140.0},
              {'Method': 'TIPS', 'Return': 200.0},
            #   {'Method': 'D-COACH', 'Return': 200.0},
              ]
cart = pd.DataFrame(cart_dict)

# Reacher
reach_dict = [{'Method': 'Tele-Op (A)', 'Return': -48.9},
              {'Method': 'Tele-Op (S)', 'Return': -53.8},
              {'Method': 'BC*', 'Return': -40.5},
              {'Method': 'GAIL*', 'Return': -60.5},
              {'Method': 'TIPS', 'Return': -19.82},
            #   {'Method': 'D-COACH', 'Return': -44.67},
             {'Method': 'Tele-Op (A)', 'Return': -61.3}, 
              {'Method': 'Tele-Op (S)', 'Return': -78.7},
              {'Method': 'BC*', 'Return': -61.1},
              {'Method': 'GAIL*', 'Return': -74.5},
              {'Method': 'TIPS', 'Return': -15.85},
            #   {'Method': 'D-COACH', 'Return': -45.89},
             {'Method': 'Tele-Op (A)', 'Return': -61.0},
              {'Method': 'Tele-Op (S)', 'Return': -65.7},
              {'Method': 'BC*', 'Return': -47.3},
              {'Method': 'GAIL*', 'Return': -67.5},
              {'Method': 'TIPS', 'Return': -10.48},
            #   {'Method': 'D-COACH', 'Return': -14.68},
             {'Method': 'Tele-Op (A)', 'Return': -50.9},
              {'Method': 'Tele-Op (S)', 'Return': -57.5},
              {'Method': 'BC*', 'Return': -56.7},
              {'Method': 'GAIL*', 'Return': -74.9},
              {'Method': 'TIPS', 'Return': -47.48},
            #   {'Method': 'D-COACH', 'Return': -23.1},
             {'Method': 'Tele-Op (A)', 'Return': -50.2},
              {'Method': 'Tele-Op (S)', 'Return': -75.7},
              {'Method': 'BC*', 'Return': -54.9},
              {'Method': 'GAIL*', 'Return': -77.65},
              {'Method': 'TIPS', 'Return': -18.8},
            #   {'Method': 'D-COACH', 'Return': -41.5},
             {'Method': 'Tele-Op (A)', 'Return': -49.8},
              {'Method': 'Tele-Op (S)', 'Return': -53.8},
              {'Method': 'BC*', 'Return': -73.3},
              {'Method': 'GAIL*', 'Return': -91.65},
              {'Method': 'TIPS', 'Return': -21.45},
            #   {'Method': 'D-COACH', 'Return': -40.39},
             {'Method': 'Tele-Op (A)', 'Return': -56.3},
              {'Method': 'Tele-Op (S)', 'Return': -46.1},
              {'Method': 'BC*', 'Return': -55.83},
              {'Method': 'GAIL*', 'Return': -84.15},
              {'Method': 'TIPS', 'Return': -10.01},
            #   {'Method': 'D-COACH', 'Return': -19.19},
              ]
reach = pd.DataFrame(reach_dict)

# LunarLander
lunar_dict = [{'Method': 'Tele-Op (A)', 'Return': -30.7},
              {'Method': 'Tele-Op (S)', 'Return': -117.7},
              {'Method': 'BC*', 'Return': -161.0},
              {'Method': 'GAIL*', 'Return': -39.0},
              {'Method': 'TIPS', 'Return': -57.86},
            #   {'Method': 'D-COACH', 'Return': -44.57},
             {'Method': 'Tele-Op (A)', 'Return': -103.8},
              {'Method': 'Tele-Op (S)', 'Return': -72.1},
              {'Method': 'BC*', 'Return': -55.5},
              {'Method': 'GAIL*', 'Return': -100.8},
              {'Method': 'TIPS', 'Return': -50.2},
            #   {'Method': 'D-COACH', 'Return': 63.4},
             {'Method': 'Tele-Op (A)', 'Return': -90.3},
              {'Method': 'Tele-Op (S)', 'Return': -91.2},
              {'Method': 'BC*', 'Return': -80.9},
              {'Method': 'GAIL*', 'Return': -111.8},
              {'Method': 'TIPS', 'Return': -69.7},
            #   {'Method': 'D-COACH', 'Return': -102.5},
             {'Method': 'Tele-Op (A)', 'Return': 9.5},
              {'Method': 'Tele-Op (S)', 'Return': 5.4},
              {'Method': 'BC*', 'Return': -79.35},
              {'Method': 'GAIL*', 'Return': -114.5},
              {'Method': 'TIPS', 'Return': 157.39},
              # {'Method': 'D-COACH', 'Return': 201.9},
              ]
lunar = pd.DataFrame(lunar_dict)

# Optional: Normalize return
cart['Return'] = cart['Return'].div(200) # normalize return
# Reacher
reach['Return'] = (reach['Return'].div(100)+1) # normalize return
# LunarLander
lunar['Return'] = (lunar['Return']+300).div(550) # normalize return

# Plot using subplots
figure, axes = plt.subplots(3, 1, sharey=True, figsize=(6.5, 9))
plt.subplots_adjust(
    # left    =  0.19,
    # bottom  =  bottom, 
    # right   =  right, 
    # top     =  top, 
    # wspace  =  wspace, 
    hspace  =  0.5
)

axes[0].set_title("CartPole", fontweight='bold')
bar1 = sns.barplot(x="Method", y="Return", hue="Method", data=cart, ax=axes[0], dodge = False)
axes[0].get_legend().remove()
axes[0].set_xlabel('')

axes[1].set_title("Reacher", fontweight='bold')
bar2 = sns.barplot(x="Method", y="Return", hue="Method", data=reach, ax=axes[1], dodge = False)
axes[1].get_legend().remove()
axes[1].set_xlabel('')

axes[2].set_title("LunarLanderContinuous", fontweight='bold')
bar3 = sns.barplot(x="Method", y="Return", hue="Method", data=lunar, ax=axes[2], dodge = False)
axes[2].get_legend().remove()

# Plot using figure function
# Combine datasets
# cart['Env'] = 'CartPole'
# reach['Env'] = 'Reacher'
# lunar['Env'] = 'LunarLanderContinuous'
# il_agents = pd.concat([cart, reach, lunar], sort=False)
# # Plot
# sns.catplot(x="Method", y="Return", hue="Method",
#             row="Env",
#             kind = "bar", data=il_agents)

# Save figure
plt.savefig('IL_agents.pdf', dpi=300)

plt.show()
