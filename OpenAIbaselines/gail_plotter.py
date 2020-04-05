from baselines.common import plot_util as pu
import matplotlib.pyplot as plt
import numpy as np

results = pu.load_results('./baselines/gail/log')
r = results[0]

# Plot reward average vs time
# plt.plot(np.cumsum(r.monitor.l), pu.smooth(r.monitor.r, radius=9))

# Plot true reward 40 mean vs iterations
P = plt.plot(np.arange(len(r.progress.EpTrueRewMean)), r.progress.EpTrueRewMean)

plt.xlabel("Iterations")
plt.ylabel("Average Reward")
plt.show()