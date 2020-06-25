import matplotlib.pyplot as plt
import seaborn as sns
import pandas as pd
import pdb


sns.set() # default seaborn theme, scaling, and color palette
# sns.set(style="ticks", palette="muted")

# Fishing task:
tips_kuka = pd.read_csv("./KUKA_true_policy1/0405151622_0.csv")

# Throw last row
tips_kuka = tips_kuka.iloc[:-1,:]

tips_kuka['reward'] = tips_kuka.iloc[:,1].rolling(window=10).mean()
# tips_kuka.iloc[0,1] = -27.425
# tips_kuka.iloc[1,1] = -27.56
tips_kuka['feedback_rate(/sec)'] = tips_kuka.iloc[:,2].rolling(window=10).mean()
# tips_kuka.iloc[0,2] = 0.4789
# tips_kuka.iloc[1,2] = 0.49
# Throw NaN rows
tips_kuka = tips_kuka.iloc[9:,:]
# decrement iterations
tips_kuka['iteration'] = tips_kuka['iteration'] - 9

# Laser task:
tips_laser1 = pd.read_csv("./laser/0906153135_0.csv")
tips_laser1['reward'] = tips_laser1.iloc[:,1].rolling(window=10).mean()
tips_laser1['feedback_rate(/sec)'] = tips_laser1.iloc[:,2].rolling(window=10).mean()
tips_laser1 = tips_laser1.iloc[9:,:] # Throw NaN rows
tips_laser2 = pd.read_csv("./laser/1006105937_0.csv")
tips_laser2['reward'] = tips_laser2.iloc[:,1].rolling(window=10).mean()
tips_laser2['feedback_rate(/sec)'] = tips_laser2.iloc[:,2].rolling(window=10).mean()
tips_laser2 = tips_laser2.iloc[9:,:] # Throw NaN rows
tips_laser3 = pd.read_csv("./laser/1006121528_0.csv")
tips_laser3['reward'] = tips_laser3.iloc[:,1].rolling(window=10).mean()
tips_laser3['feedback_rate(/sec)'] = tips_laser3.iloc[:,2].rolling(window=10).mean()
tips_laser3 = tips_laser3.iloc[9:,:] # Throw NaN rows

tips_laser = pd.concat([tips_laser1, tips_laser2, tips_laser3], sort=False)
# decrement iterations
tips_laser['iteration'] = tips_laser['iteration'] - 9

# Rename columns
tips_kuka = tips_kuka.rename(columns={'iteration': 'Episodes', 'reward': 'Return', 'feedback_rate(/sec)': 'Feedback Rate (/sec)'})
tips_laser = tips_laser.rename(columns={'iteration': 'Episodes', 'reward': 'Return', 'feedback_rate(/sec)': 'Feedback Rate (/sec)'})



# # Plot fishing using subplots
# f, axes = plt.subplots(2, 1, sharex=True, figsize=(8, 6.5))
# # f.suptitle("Fishing task", fontweight='bold', fontsize=16)
# sns.lineplot(x="Episodes", y="Return", data=tips_kuka, ax=axes[0])
# axes[0].set_title("Fishing task", fontweight='bold', fontsize=17)
# axes[0].set_xticks(range(0,100,20))
# sns.lineplot(x="Episodes", y="Feedback Rate (/sec)", color="maroon", data=tips_kuka, ax=axes[1])
# #axes[1].set_title("Reacher", fontweight='bold')
# #axes[1].set(ylim=(-110, 0))

# # Save figure
# plt.savefig('TIPSKUKA.pdf', dpi=300)

# Plot laser using subplots
f, axes = plt.subplots(2, 1, sharex=True, figsize=(8, 6.5))
# f.suptitle("Laser Drawing task", fontweight='bold', fontsize=16)
sns.lineplot(x="Episodes", y="Return", data=tips_laser, ax=axes[0], ci=None)
axes[0].set_title("Laser Drawing task", fontweight='bold', fontsize=17)
axes[0].set_xticks(range(0,100,20))
sns.lineplot(x="Episodes", y="Feedback Rate (/sec)", color="maroon", data=tips_laser, ax=axes[1], ci=None)
#axes[1].set_title("Reacher", fontweight='bold')
#axes[1].set(ylim=(-110, 0))

# Save figure
plt.savefig('TIPSLASER.pdf', dpi=300)

plt.show()
