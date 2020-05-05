import matplotlib.pyplot as plt
import seaborn as sns
import pandas as pd
import pdb


sns.set() # default seaborn theme, scaling, and color palette
# sns.set(style="ticks", palette="muted")

tips_kuka = pd.read_csv("./KUKA_true_policy1/0405151622_0.csv")

# Throw last row
tips_kuka = tips_kuka.iloc[:-1,:]

tips_kuka['reward'] = tips_kuka.iloc[:,1].rolling(window=10).mean()
tips_kuka.iloc[0,1] = -27.425
tips_kuka.iloc[1,1] = -27.56
tips_kuka['feedback_rate(/sec)'] = tips_kuka.iloc[:,2].rolling(window=10).mean()
tips_kuka.iloc[0,2] = 0.4789
tips_kuka.iloc[1,2] = 0.49

# Rename columns
tips_kuka = tips_kuka.rename(columns={'iteration': 'Episodes', 'reward': 'Return', 'feedback_rate(/sec)': 'Feedback Rate (/sec)'})

# pdb.set_trace()
# Plot using subplots
f, axes = plt.subplots(2, 1, sharex=True, figsize=(8, 8))
# f.suptitle("Fishing task: Performance, feedback rate", fontweight='bold')
sns.lineplot(x="Episodes", y="Return", data=tips_kuka, ax=axes[0])
# axes[0].set_title("Fishing task: Performance, Feedback rate", fontweight='bold')
sns.lineplot(x="Episodes", y="Feedback Rate (/sec)", color="maroon", data=tips_kuka, ax=axes[1])
#axes[1].set_title("Reacher", fontweight='bold')
#axes[1].set(ylim=(-110, 0))

# Plot using figure function
# Combine datasets
# cart['Env'] = 'CartPole'
# reach['Env'] = 'Reacher'
# lunar['Env'] = 'LunarLanderContinuous'
# tipsdcoach = pd.concat([cart, reach, lunar], sort=False)
# # Plot
# sns.relplot(x="Episodes", y="Return", hue="Method",
#             style="Method", row="Env",
#             kind="line", data=tipsdcoach)

# Save figure
plt.savefig('TIPSKUKA.pdf', dpi=300)

plt.show()
