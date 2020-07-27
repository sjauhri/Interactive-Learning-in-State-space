# Interactive Imitation Learning in State-Space
This repository contains the implementation of a novel interactive learning method: TIPS (Teaching Imitative Policies in State-space).

The code runs simulations in OpenAI Gym environments where an agent performs control tasks. A demonstrator can provide feedback (using arrow keys on a keyboard) to teach the task to the agent. The training is online and thus the agents' learnt behavior can be directly observed during the training process.

Besides the method TIPS, we also provide an implementation of D-COACH, a comparative method that is in the same family but uses feedback in the action-space of the agent.

## Installation

The code is implemented in **python** and uses the Tensorflow library for training neural networks.

To use the code, it is necessary to first install the OpenAI gym toolkit (release v0.10.5): https://github.com/openai/gym

Then, the files in the `gym_modifications` directory of this repository should be replaced/added in the installed gym directory on your PC. There are three gym environments used: **CartPole**, **LunarLanderContinuous** and **Reacher**. The Reacher environment uses the MuJoCo physics engine and thus also requires a MuJoCo license and the installation of mujoco-py (https://github.com/openai/mujoco-py).

### Requirements
- pygame
- box2d-py
- gym==0.10.5
- mujoco-py==1.50.1.56
- tensorflow==1.14.0
- numpy
- pyglet==1.3.2
- pandas==0.22

## Usage

1. To run the programs, navigate to the correspoding method directory (TIPS or DCOACH). Bash scripts are provided in the `scripts` directory and follow the nomenclature: `run/test` _ `<method>` _ `<environment>`.
For eg. to train an agent for the CartPole task using TIPS, type (in the TIPS directory):

```bash 
./scripts/run_tips_cartpole.sh
```

2. To give feedback to the agent, arrow keys on the keyboard can be used. For the CartPole task, the feedback is in the form of leftward/rightward movement of the tip of the pole (in state-space: TIPS) or a left/right force on the cart (in action-space). Note that to capture keyboard input the environment rendering window must be selected/clicked. In the case of the Reacher task, along with the rendered environment, a small white window should appear when running the code which needs to be selected/clicked.

3. The agents' learnt behavior can be observed during the training process (online) and performance is measured and saved in the `results` directory. Moreover, the training session is saved at the end of every episode and thus the agents' policy can be re-tested by copying the session into the `prev_sessions` directory.

## Comments

This code has been tested in `Ubuntu 18.04` and `python >= 3.5`.

## Troubleshooting

If you run into problems of any kind, don't hesitate to open an issue on this repository. It is quite possible that you have run into some bug we are not aware of.