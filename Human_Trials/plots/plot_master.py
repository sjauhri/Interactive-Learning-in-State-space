import matplotlib.pyplot as plt
import seaborn as sns
import pandas as pd
import numpy as np

# Interactive mode
# plt.ion()

# sns.set() # default seaborn theme, scaling, and color palette
# sns.set(style="ticks", palette="muted")
sns.set(palette="muted")

# tips_cart = pd.read_csv("./TIPS/cartpole/2503001220_0.csv")

#### Figure level functions: ####
# relationship plot
# tips = sns.load_dataset("tips")
# sns.relplot(x="total_bill", y="tip", col="time",
#             hue="smoker", style="smoker", size="size",
#             data=tips)

# relationship plot across time
# dots = sns.load_dataset("dots")
# sns.relplot(x="time", y="firing_rate", col="align",
#             hue="choice", size="coherence", style="choice",
#             facet_kws=dict(sharex=False),
#             kind="line", legend="full", data=dots)

# relationship plot with error margins
# fmri = sns.load_dataset("fmri")
# sns.relplot(x="timepoint", y="signal", col="region",
#             hue="event", style="event",
#             kind="line", data=fmri)

# Category bar plot
tips = sns.load_dataset("tips")
p1 = sns.catplot(x="day", y="total_bill", hue="smoker",
            kind="bar", data=tips)

# Data bar plot
# x = np.arange(1, 11, 0.1)
# y1 = np.arange(2, 12, 0.1)
# sns.barplot(x=x, y=y1, palette="rocket")

# Set size using:
# height=4.5, aspect=2 / 3,


#### Axes level functions ####
# f, axes = plt.subplots(1, 2, sharey=True, figsize=(6, 4))

# plt.subplots_adjust(
    # left    =  left, 
    # bottom  =  bottom, 
    # right   =  right, 
    # top     =  top, 
    # wspace  =  wspace, 
    # hspace  =  0.5
# )

# sns.boxplot(x="day", y="tip", data=tips, ax=axes[0])
# sns.scatterplot(x="total_bill", y="tip", hue="day", data=tips, ax=axes[1])

# Hatches (Patterns) in barplot
# Define some hatches
# hatches = ['-', '+', 'x', '\\', '*', 'o','-', '+', 'x', '\\', '*', 'o','-', '+', 'x', '\\', '*', 'o','-', '+', 'x', '\\', '*', 'o']

# # Loop over the bars
# for i,thisbar in enumerate(bar1.patches):
#     # Set a different hatch for each bar
#     thisbar.set_hatch(hatches[i])
# for i,thisbar in enumerate(bar2.patches):
#     # Set a different hatch for each bar
#     thisbar.set_hatch(hatches[i])
# for i,thisbar in enumerate(bar3.patches):
#     # Set a different hatch for each bar
#     thisbar.set_hatch(hatches[i])


# plt.show(block=False)
plt.show()