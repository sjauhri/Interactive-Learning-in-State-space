## Rerun last command with sudo
sudo !!

## Quick open editor to run something
Ctrl + X + E

## Edit previous command
fc

## Close terminal but keep tasks running
disown -a exit

## SSH keygen
ssh-keygen -t rsa -b 4096 -C "s.jauhri@student.tudelft.nl"

## Start SSH agent
eval "$(ssh-agent -s)"

## Add key to SSH agent
ssh-add ~/.ssh/id_rsa

## Remove remote branch
git push <remote_name> --delete <branch_name>

## Remove local branch
git branch -d branch_name

## Remove cache changes for ignore
git rm --cached <file> -r

## Revert a commit
git revert <hash-or-ref>

## Modify a commit
git commit --amend

## Push and set tracking
git push --set-upstream origin sj

## Create new local branch
git checkout -b "name"

## Clean
git clean -n
git clean -f

mkdir -p
chmod +x "name"

## Copy pwd to clipboard
pwd | xclip -selection clipboard

Ctrl+U: cut everything befor cursor

## Edit bash rc
nano ~/.bashrc
alias xyz='command' 

# Python

## Start python3.6 virtualenvironment
virtualenv --python=/usr/local/bin/python3.6 py36env
source py36env/bin/activate

## Show details about package
pip show <pkg_name>

## Pip reinstall
pip install 'pyglet==1.3.2' --force-reinstall

# Docker

## Docker run
docker run --gpus all -it tensorflow/tensorflow:devel-gpu [optional command]

## Docker stop unused images
docker container prune

## Docker remove images
docker rmi [Image] [Image]

