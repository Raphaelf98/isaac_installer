
## Install Isaacsim & Isaaclab

From home directory run


```
git clone https://github.com/Raphaelf98/isaac_installer.git
```
```
chmod +x isaac_installer/IsaacLabSetup.sh 
sudo ./isaac_installer/IsaacLabSetup.sh

```
Open new terminal 
```
conda acitvate env_isaaclab
cd IssacLab # found in home dir
./isaaclab.sh --install 

```
Finally validate installation 
```
./isaaclab.sh -p scripts/tutorials/00_sim/create_empty.py

```