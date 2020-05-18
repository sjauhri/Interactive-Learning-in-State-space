import matplotlib.pyplot as plt
import seaborn as sns
import pandas as pd
import pdb


def fifty_extend(df):
    last_row = df.iloc[-1]
    last_ep = int(last_row['iteration'])
    for i in range(last_ep,50):
        last_row['iteration'] = i+1
        df.loc[i] = last_row
    
    return df


sns.set() # default seaborn theme, scaling, and color palette
# sns.set(style="ticks", palette="muted")
sns.set_context("paper", rc={"font.size":18,"axes.titlesize":18,"axes.labelsize":15})

tips_cart = fifty_extend(pd.read_csv("./TIPS/cartpole/2503001220_0.csv"))
tips_cart = pd.concat([tips_cart, fifty_extend(pd.read_csv("./TIPS/cartpole/1204002412_0.csv"))], sort=False)
tips_cart = pd.concat([tips_cart, fifty_extend(pd.read_csv("./TIPS/cartpole/1204174328_0.csv"))], sort=False)
tips_cart = pd.concat([tips_cart, fifty_extend(pd.read_csv("./TIPS/cartpole/1004185543_0.csv"))], sort=False)
tips_cart = pd.concat([tips_cart, fifty_extend(pd.read_csv("./TIPS/cartpole/1104221825_0.csv"))], sort=False)
tips_cart = pd.concat([tips_cart, fifty_extend(pd.read_csv("./TIPS/cartpole/1104211656_0.csv"))], sort=False)
tips_cart = pd.concat([tips_cart, fifty_extend(pd.read_csv("./TIPS/cartpole/2803133516_0.csv"))], sort=False)
dcoach_cart = fifty_extend(pd.read_csv("./DCOACH/cartpole/2403234900_0.csv"))
dcoach_cart = pd.concat([dcoach_cart, fifty_extend(pd.read_csv("./DCOACH/cartpole/1204002118_0.csv"))], sort=False)
dcoach_cart = pd.concat([dcoach_cart, fifty_extend(pd.read_csv("./DCOACH/cartpole/1204173256_0.csv"))], sort=False)
dcoach_cart = pd.concat([dcoach_cart, fifty_extend(pd.read_csv("./DCOACH/cartpole/1004191503_0.csv"))], sort=False)
dcoach_cart = pd.concat([dcoach_cart, fifty_extend(pd.read_csv("./DCOACH/cartpole/1104222555_0.csv"))], sort=False)
dcoach_cart = pd.concat([dcoach_cart, fifty_extend(pd.read_csv("./DCOACH/cartpole/1104212805_0.csv"))], sort=False)
dcoach_cart = pd.concat([dcoach_cart, fifty_extend(pd.read_csv("./DCOACH/cartpole/2803135201_0.csv"))], sort=False)

tips_lunar = pd.read_csv("./TIPS/lunarlandercont/2503113024_0.csv")
tips_lunar = pd.concat([tips_lunar, pd.read_csv("./TIPS/lunarlandercont/2804235426_0.csv")], sort=False)
tips_lunar1 = pd.read_csv("./TIPS/lunarlandercont/1304223641_0.csv")
tips_lunar1['average_reward'] = tips_lunar1.iloc[:,1].rolling(window=3).mean()
tips_lunar1.iloc[0,1] = -115.319661
tips_lunar1.iloc[1,1] = -128.267246
tips_lunar = pd.concat([tips_lunar, tips_lunar1], sort=False)
tips_lunar2 = pd.read_csv("./TIPS/lunarlandercont/2803160912_0.csv")
tips_lunar2['average_reward'] = tips_lunar2.iloc[:,1].rolling(window=3).mean()
tips_lunar2.iloc[0,1] = -210.159
tips_lunar2.iloc[1,1] = -220.354
tips_lunar = pd.concat([tips_lunar, tips_lunar2], sort=False)
tips_lunar3 = pd.read_csv("./TIPS/lunarlandercont/2004215511_0.csv")
tips_lunar3['average_reward'] = tips_lunar3.iloc[:,1].rolling(window=3).mean()
tips_lunar3.iloc[0,1] = -196.6
tips_lunar3.iloc[1,1] = -190.01
tips_lunar = pd.concat([tips_lunar, tips_lunar3], sort=False)
dcoach_lunar = pd.read_csv("./DCOACH/lunarlandercont/2503110212_0.csv")
dcoach_lunar1 = pd.read_csv("./DCOACH/lunarlandercont/1304221907_0.csv")
dcoach_lunar1['average_reward'] = dcoach_lunar1.iloc[:,1].rolling(window=3).mean()
dcoach_lunar1.iloc[0,1] = -682
dcoach_lunar1.iloc[1,1] = -738
dcoach_lunar = pd.concat([dcoach_lunar, dcoach_lunar1], sort=False)
dcoach_lunar2 = pd.read_csv("./DCOACH/lunarlandercont/2803153417_0.csv")
dcoach_lunar2['average_reward'] = dcoach_lunar2.iloc[:,1].rolling(window=3).mean()
dcoach_lunar2.iloc[0,1] = -667
dcoach_lunar2.iloc[1,1] = -444
dcoach_lunar = pd.concat([dcoach_lunar, dcoach_lunar2], sort=False)
dcoach_lunar3 = pd.read_csv("./DCOACH/lunarlandercont/2004213857_0.csv")
dcoach_lunar3['average_reward'] = dcoach_lunar3.iloc[:,1].rolling(window=3).mean()
dcoach_lunar3.iloc[0,1] = -760
dcoach_lunar3.iloc[1,1] = -856
dcoach_lunar = pd.concat([dcoach_lunar, dcoach_lunar3], sort=False)

tips_reacher = pd.read_csv("./TIPS/reacher/2503145306_0.csv")
tips_reacher = pd.concat([tips_reacher, pd.read_csv("./TIPS/reacher/2104154440_0.csv")], sort=False)
tips_reacher = pd.concat([tips_reacher, pd.read_csv("./TIPS/reacher/2703195229_0.csv")], sort=False)
tips_reacher = pd.concat([tips_reacher, pd.read_csv("./TIPS/reacher/1004112340_0.csv")], sort=False)
# tips_reacher = pd.concat([tips_reacher, pd.read_csv("./TIPS/reacher/1404014918_0.csv")], sort=False)
tips_reacher = pd.concat([tips_reacher, pd.read_csv("./TIPS/reacher/1404200429_0.csv")], sort=False)
tips_reacher = pd.concat([tips_reacher, pd.read_csv("./TIPS/reacher/1504215052_0.csv")], sort=False)
dcoach_reacher = pd.read_csv("./DCOACH/reacher/0803122755_0.csv")
dcoach_reacher = pd.concat([dcoach_reacher, pd.read_csv("./DCOACH/reacher/2104155102_0.csv")], sort=False)
dcoach_reacher = pd.concat([dcoach_reacher, pd.read_csv("./DCOACH/reacher/2703193310_0.csv")], sort=False)
dcoach_reacher = pd.concat([dcoach_reacher, pd.read_csv("./DCOACH/reacher/1004114249_0.csv")], sort=False)
# dcoach_reacher = pd.concat([dcoach_reacher, pd.read_csv("./DCOACH/reacher/1404013652_0.csv")], sort=False)
dcoach_reacher = pd.concat([dcoach_reacher, pd.read_csv("./DCOACH/reacher/1404202223_0.csv")], sort=False)
dcoach_reacher = pd.concat([dcoach_reacher, pd.read_csv("./DCOACH/reacher/1504214051_0.csv")], sort=False)

# Extend to 50 Episodes (when reward maxes out)
# tips_cart = fifty_extend(tips_cart)
# dcoach_cart = fifty_extend(dcoach_cart)

# Rename columns
tips_cart = tips_cart.rename(columns={'iteration': 'Episodes', 'average_reward': 'Return'})
dcoach_cart = dcoach_cart.rename(columns={'iteration': 'Episodes', 'average_reward': 'Return'})

tips_lunar = tips_lunar.rename(columns={'iteration': 'Episodes', 'average_reward': 'Return'})
dcoach_lunar = dcoach_lunar.rename(columns={'iteration': 'Episodes', 'average_reward': 'Return'})

tips_reacher = tips_reacher.rename(columns={'iteration': 'Episodes', 'average_reward': 'Return'})
dcoach_reacher = dcoach_reacher.rename(columns={'iteration': 'Episodes', 'average_reward': 'Return'})

# Add column for method name
tips_cart['Method'] = 'TIPS'
dcoach_cart['Method'] = 'D-COACH'
tips_lunar['Method'] = 'TIPS'
dcoach_lunar['Method'] = 'D-COACH'
tips_reacher['Method'] = 'TIPS'
dcoach_reacher['Method'] = 'D-COACH'

# Combine dataframes
# CartPole
cart = pd.concat([tips_cart, dcoach_cart], sort=False)
# cart['Return'] = cart['Return'].div(200) # normalize return
# Reacher
reach = pd.concat([tips_reacher, dcoach_reacher], sort=False)
# reach['Return'] = (reach['Return'].div(100)+1) # normalize return
# LunarLander
lunar = pd.concat([tips_lunar, dcoach_lunar], sort=False)
# lunar['Return'] = (lunar['Return']+250).div(500) # normalize return

# Plot using subplots
f, axes = plt.subplots(3, 1, sharex=True, figsize=(10, 9))
line1 = sns.lineplot(x="Episodes", y="Return", hue="Method", style="Method", data=cart, ax=axes[0])
line1.tick_params(labelsize=15)
axes[0].set_title("CartPole", fontweight='bold')
line1.legend(fontsize='14', title_fontsize='14')
line2 = sns.lineplot(x="Episodes", y="Return", hue="Method", style="Method", data=reach, ax=axes[1])
line2.tick_params(labelsize=15)
axes[1].set_title("Reacher", fontweight='bold')
axes[1].set(ylim=(-110, 0))
line2.legend(fontsize='14', title_fontsize='14')
line3 = sns.lineplot(x="Episodes", y="Return", hue="Method", style="Method", data=lunar, ax=axes[2])
line3.tick_params(labelsize=15)
axes[2].set_title("LunarLanderContinuous", fontweight='bold')
axes[2].set(ylim=(-600, 200))
line3.legend(fontsize='14', title_fontsize='14')

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
plt.savefig('TIPSvDCOACH.pdf', dpi=300)

plt.show()
