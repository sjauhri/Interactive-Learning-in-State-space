# from stable_baselines.results_plotter import load_results
import matplotlib.pyplot as plt
import pandas as pd
import numpy as np

# results = load_results('./log/CartPole/')
# r = results[0]
r = pd.read_csv("./log/LunarLanderContinuous/progress.csv")

# Plot reward average vs time
# plt.plot(np.cumsum(r.monitor.l), pu.smooth(r.monitor.r, radius=9))

# Plot true reward 40 mean vs iterations
P = plt.plot(np.arange(len(r.EpTrueRewMean)), r.EpTrueRewMean)

plt.xlabel("Iterations")
plt.ylabel("Average Reward")
plt.show()