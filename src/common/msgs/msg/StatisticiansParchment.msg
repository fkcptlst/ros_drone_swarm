#this message is for the statistician node to transmit processed data to the statisticians_scribble node
std_msgs/Header header

int32 total_functional_uav
int32 Sx #num of committed to current best
int32 Sy #committed to prev best
int32 Sz #polling
int32 Sw #others

int32[20] S_site #record number of uavs committed to each site,max num = 20
