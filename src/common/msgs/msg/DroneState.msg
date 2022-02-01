std_msgs/Header header

## 机载电脑是否连接上飞控，true已连接，false则不是
bool connected
## 是否解锁，true为已解锁，false则不是
bool armed
## 是否降落，true为已降落，false则代表在空中
bool landed
## PX4飞控当前飞行模式
string mode
bool odom_valid

## 系统启动时间
float32 time_from_start             ## [s]

## 无人机状态量：位置、速度、姿态
float32[3] position                 ## [m]
float32  rel_alt                               ## [m] only for outdoor
float32[3] velocity                 ## [m/s]
float32[3] attitude                 ## [rad]
geometry_msgs/Quaternion attitude_q ## 四元数
float32[3] attitude_rate            ## [rad/s]
float32 battery_state               ## 电池状态    #float32

## XXX implemented
int32 uav_id ## 无人机id

bool opinionValidFlg ##由于大部分DroneState.msg都是由estimator发布，不包含观点相关的信息，不能确保观点的可靠性，因此加flg以区分
int32 commitmentState ## 无人机commitment_state
bool voteValidFlg ## 无人机此时的投票是否有效（不是每次广播都代表投票），如果为true才代表此次广播是一次投票
float32[3] sitePos ## L_m
float32 quality ## q_m
