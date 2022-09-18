# Smart Heal Project
By Ayush Ghosh for HTN 2022

Source code for a cheap, portable wearable device that acts as your virtual physiotherapist!

## Running project for the First Time:
Ensure ROS is installed on both RPi and Ubuntu desktop.

Clone this repo on both RPi and Ubuntu Desktop.

### On Rpi: 
Run the command `roslaunch ~/htn_ws/src/smart_heal/launch/imu_demo.launch` followed by `python ~/htn_ws/src/smart_heal/scripts/marker_pub.py`. Follow the instructions [here](https://smallbusiness.chron.com/run-command-startup-linux-27796.html) to get the previous 2 commands to run on startup.

### On Desktop:
Move the file `SmartHeal.desktop` and place it in `/usr/local/share/applications/` to allow for the app to show up in the app launcher.
Otherwise run `rosrun rviz rviz -d ~/htn_ws/src/smart_heal/rviz_config.rviz` to open the augemented 3D space.
