import matplotlib.pyplot as plt
import seaborn as sns
import pandas as pd
import numpy as np


sns.set() # default seaborn theme, scaling, and color palette
# sns.set(style="ticks", palette="muted")

# CartPole
cart_dict = [{'Method': 'Tele-Op (A)', 'Return': 55.4}, 
              {'Method': 'Tele-Op (S)', 'Return': 70.4},
              {'Method': 'Behavior Cloning', 'Return': 138.2},
              {'Method': 'TIPS', 'Return': 200.0},
            #   {'Method': 'D-COACH', 'Return': 200.0},
              ]
cart = pd.DataFrame(cart_dict)

# Reacher
reach_dict = [{'Method': 'Tele-Op (A)', 'Return': -56.3}, 
              {'Method': 'Tele-Op (S)', 'Return': -36.1},
              {'Method': 'Behavior Cloning', 'Return': -30.95},
              {'Method': 'TIPS', 'Return': -9.98},
            #   {'Method': 'D-COACH', 'Return': -19.2},
              ]
reach = pd.DataFrame(reach_dict)

# LunarLander
lunar_dict = [{'Method': 'Tele-Op (A)', 'Return': 5.4},
              {'Method': 'Tele-Op (S)', 'Return': 20.4},#90.4},
              {'Method': 'Behavior Cloning', 'Return': -131.28},
              {'Method': 'TIPS', 'Return': 182.95},
            #   {'Method': 'D-COACH', 'Return': 205.58},
              ]
lunar = pd.DataFrame(lunar_dict)

# Optional: Normalize return
cart['Return'] = cart['Return'].div(200) # normalize return
# Reacher
reach['Return'] = (reach['Return'].div(100)+1) # normalize return
# LunarLander
lunar['Return'] = (lunar['Return']+250).div(500) # normalize return

# Plot using subplots
figure, axes = plt.subplots(3, 1, sharey=True, figsize=(6.5, 9))
plt.subplots_adjust(
    left    =  0.19,
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
