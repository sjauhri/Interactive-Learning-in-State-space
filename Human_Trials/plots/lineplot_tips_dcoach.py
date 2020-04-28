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

tips_cart = fifty_extend(pd.read_csv("./TIPS/cartpole/2503001220_0.csv"))
tips_cart = pd.concat([tips_cart, fifty_extend(pd.read_csv("./TIPS/cartpole/1204002412_0.csv"))], sort=False)
dcoach_cart = fifty_extend(pd.read_csv("./DCOACH/cartpole/2403234900_0.csv"))
# dcoach_cart = pd.concat([dcoach_cart, fifty_extend(pd.read_csv("./TIPS/cartpole/1204002412_0.csv"))], sort=False)

tips_lunar = pd.read_csv("./TIPS/lunarlandercont/2503113024_0.csv")
# tips_lunar = pd.concat([tips_lunar, pd.read_csv("./TIPS/lunarlandercont/1204002412_0.csv")], sort=False)
dcoach_lunar = pd.read_csv("./DCOACH/lunarlandercont/2503110212_0.csv")
# dcoach_lunar = pd.concat([dcoach_lunar, pd.read_csv("./TIPS/lunarlandercont/1204002412_0.csv")], sort=False)

tips_reacher = pd.read_csv("./TIPS/reacher/2503145306_0.csv")
# tips_reacher = pd.concat([tips_reacher, pd.read_csv("./TIPS/reacher/1204002412_0.csv")], sort=False)
dcoach_reacher = pd.read_csv("./DCOACH/reacher/0803122755_0.csv")
# dcoach_reacher = pd.concat([dcoach_reacher, pd.read_csv("./TIPS/reacher/1204002412_0.csv")], sort=False)

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
f, axes = plt.subplots(3, 1, sharex=True, figsize=(8, 8))
sns.lineplot(x="Episodes", y="Return", hue="Method", style="Method", data=cart, ax=axes[0])
axes[0].set_title("CartPole", fontweight='bold')
sns.lineplot(x="Episodes", y="Return", hue="Method", style="Method", data=reach, ax=axes[1])
axes[1].set_title("Reacher", fontweight='bold')
sns.lineplot(x="Episodes", y="Return", hue="Method", style="Method", data=lunar, ax=axes[2])
axes[2].set_title("LunarLanderContinuous", fontweight='bold')

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
