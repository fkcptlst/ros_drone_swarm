#!/bin/bash
###
 # @Author: lcf
 # @Date: 2022-02-04 23:18:26
 # @LastEditors: lcf
 # @LastEditTime: 2022-02-05 17:35:51
 # @FilePath: /swarm_ws2/src/swarm_control/scripts/launchfileGen.sh
 # @Description: generate launch file sitl_experiment.launch
 # 
### 

swarm_number=4
outfile="sitl_experiment"
initHalfSeparation=3

echo "<launch>" > ${outfile}.launch;

##process begin.template.xml
sed 's!<arg name="swarm_num_uav" default="4"/>!<arg name="swarm_num_uav" default="'${swarm_number}'"/>\n!g' template/begin.template.xml >> ${outfile}.launch


##process uav_id
echo "<!-- 无人机uav_id -->" >> ${outfile}.launch;
for i in $(seq 1 $swarm_number)
do
    sed 's!<arg name="uav1_id" default="1"/>!<arg name="uav'${i}'_id" default="'${i}'"/>!g' template/uav_id.template.xml >> ${outfile}.launch;
done

##process uav init pos
echo "<!-- 无人机初始位置 -->" >> ${outfile}.launch;

sqrtSwarmNum=$(echo "scale=0; sqrt($swarm_number)" | bc)
sqrtSwarmNum=$((sqrtSwarmNum*sqrtSwarmNum<swarm_number?(sqrtSwarmNum+1):sqrtSwarmNum))
#echo $sqrtSwarmNum
for i in $(seq 1 $swarm_number)
do
  rowNum=$(((i+sqrtSwarmNum-1)/sqrtSwarmNum))
  #echo $rowNum
    sed -e 's!<arg name="uav1_init_x" default="1.5"/>!<arg name="uav'${i}'_init_x" default="'$(((i%sqrtSwarmNum)*2*initHalfSeparation - initHalfSeparation*(sqrtSwarmNum-1)))'"/>!g' \
        -e 's!<arg name="uav1_init_y" default="0.0"/>!<arg name="uav'${i}'_init_y" default="'$((rowNum*2*initHalfSeparation - initHalfSeparation*(sqrtSwarmNum)))'"/>\n!g' \
        template/initial_pos.template.xml >> ${outfile}.launch;
done

##process params
echo "<!-- 全局变量 -->" >> ${outfile}.launch;
cat template/params.template.xml >> ${outfile}.launch;

##启动SITL
echo "<!-- 启动SITL -->" >> ${outfile}.launch;
for i in $(seq 1 $swarm_number)
do
    sed -e 's!1号!'"${i}"'号!g' \
        -e 's!uav1!uav'"${i}"'!g' \
        template/sitl.template.xml >> ${outfile}.launch;
done

##启动estimator
echo "<!-- 启动estimator -->" >> ${outfile}.launch;
for i in $(seq 1 $swarm_number)
do
    sed -e 's!1号!'"${i}"'号!g' \
        -e 's!uav1!uav'"${i}"'!g' \
        template/estimator.template.xml >> ${outfile}.launch;
done

##启动controller
echo "<!-- 启动controller -->" >> ${outfile}.launch;
for i in $(seq 1 $swarm_number)
do
    sed -e 's!1号!'"${i}"'号!g' \
        -e 's!uav1!uav'"${i}"'!g' \
        template/controller.template.xml >> ${outfile}.launch;
done

##启动planner
echo "<!-- 启动planner -->" >> ${outfile}.launch;
for i in $(seq 1 $swarm_number)
do
    sed -e 's!1号!'"${i}"'号!g' \
        -e 's!uav1!uav'"${i}"'!g' \
        template/planner.template.xml >> ${outfile}.launch;
done

##启动virtual_sensor
echo "<!-- 启动virtual_sensor -->" >> ${outfile}.launch;
for i in $(seq 1 $swarm_number)
do
    sed -e 's!1号!'"${i}"'号!g' \
        -e 's!uav1!uav'"${i}"'!g' \
        template/virtual_sensor.template.xml >> ${outfile}.launch;
done

##generate end
cat template/end.template.xml >> ${outfile}.launch;
echo "</launch>" >> ${outfile}.launch;

