catkin_make --source src/common/msgs --build build/msgs
catkin_make --source src/Utils --build build/Utils
catkin_make --source src/swarm_control --build build/swarm_control
catkin_make --source src/ground_station --build build/ground_station
catkin_make --source src/gazebo_simulator --build build/prometheus_gazebo

cd ./src/swarm_control/scripts
./launchfileGen.sh