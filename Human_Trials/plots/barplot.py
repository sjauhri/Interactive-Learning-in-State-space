import matplotlib.pyplot as plt
import seaborn as sns
import pandas as pd
import numpy as np

# default seaborn theme, scaling, and color palette
sns.set()

tips_cart = pd.read_csv("./TIPS/cartpole/2503001220_0.csv")

# Category bar plot
tips = sns.load_dataset("tips")
sns.catplot(x="day", y="total_bill", hue="smoker",
            kind="bar", data=tips)

plt.show()