import matplotlib.pyplot as plt
import seaborn as sns
import pandas as pd
import numpy as np
import pdb

# sns.set() # default seaborn theme, scaling, and color palette
sns.set(style="ticks", palette="muted")

tips_cart = pd.read_csv("./TIPS/cartpole/2503001220_0.csv")

# Rename columns
tips_cart = tips_cart.rename(columns={'iteration': 'Episode', 'average_reward': 'Return'})
# Extend to 50 episodes (when reward maxes out)
last_row = tips_cart.iloc[-1]
last_ep = int(last_row['Episode'])
for i in range(last_ep,50):
    last_row['Episode'] = i+1
    tips_cart.loc[i] = last_row

f, axes = plt.subplots(2, 1, sharey=True, figsize=(8, 4))
x = np.arange(1, 11, 0.1)
y1 = np.arange(2, 12, 0.1)
sns.barplot(x=x, y=y1)

plt.show()