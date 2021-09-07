function sysCall_init()
    -- Take a few handles from the scene:
    simBase=sim.getObjectHandle(sim.handle_self)
    joint1handle= sim.getObjectHandle("IRB140_joint1")
    joint2handle= sim.getObjectHandle("IRB140_joint2")
    joint3handle= sim.getObjectHandle("IRB140_joint3")
    joint4handle= sim.getObjectHandle("IRB140_joint4")
    joint5handle= sim.getObjectHandle("IRB140_joint5")
    joint6handle= sim.getObjectHandle("IRB140_joint6")
    
    if simROS2 then
        sim.addLog(sim.verbosity_scriptinfos,'ROS2 found banzai')
        
        joint1topic="joint1_ctrl"
        joint2topic="joint2_ctrl"
        joint3topic="joint3_ctrl"
        joint4topic="joint4_ctrl"
        joint5topic="joint5_ctrl"
        joint6topic="joint6_ctrl"
        stateTopic="StateTopic"
        
        simtimePub= simROS2.createPublisher('/'..'simTime', 'std_msgs/msg/Float32')
        statePub= simROS2.createPublisher('/'..stateTopic, 'std_msgs/msg/Float32MultiArray')
        
        joint1sub=simROS2.createSubscription('/'..joint1topic, 'std_msgs/msg/Float32', 'update_joint1')
        joint2sub=simROS2.createSubscription('/'..joint2topic, 'std_msgs/msg/Float32', 'update_joint2')
        joint3sub=simROS2.createSubscription('/'..joint3topic, 'std_msgs/msg/Float32', 'update_joint3')
        joint4sub=simROS2.createSubscription('/'..joint4topic, 'std_msgs/msg/Float32', 'update_joint4')
        joint5sub=simROS2.createSubscription('/'..joint5topic, 'std_msgs/msg/Float32', 'update_joint5')
        joint6sub=simROS2.createSubscription('/'..joint6topic, 'std_msgs/msg/Float32', 'update_joint6')
    
    else 
        sim.addLog(sim.verbosity_scriptinfos, 'ROS2 not found uwu ')
    end
end
        
function getjointstates()
    j1=sim.getJointPosition(joint1handle)
    j2=sim.getJointPosition(joint2handle)
    j3=sim.getJointPosition(joint3handle)
    j4=sim.getJointPosition(joint4handle)
    j5=sim.getJointPosition(joint5handle)
    j6=sim.getJointPosition(joint6handle)
    
    out={j1, j2, j3, j4, j5, j6}
    msg={}
    msg.data=out
    return msg
end
        
function update_joint1(msg)
    sim.setJointTargetVelocity(joint1handle, msg.data)
end
function update_joint2(msg)
    sim.setJointTargetVelocity(joint2handle, msg.data)
end
function update_joint3(msg)
    sim.setJointTargetVelocity(joint3handle, msg.data)
end
function update_joint4(msg)
    sim.setJointTargetVelocity(joint4handle, msg.data)
end
function update_joint5(msg)
    sim.setJointTargetVelocity(joint5handle, msg.data)
end
function update_joint6(msg)
    sim.setJointTargetVelocity(joint6handle, msg.data)
end        
function sysCall_actuation()
    if simROS2 then
        simROS2.publish(simtimePub, {data= sim.getSimulationTime()})
        simROS2.publish(statePub, getjointstates())
    end
end

--function sysCall_cleanup()
  --  if simROS2 then
    --    simROS2.shutdownPublisher(simtimePub)
      --  simROS2.shutdownSubscription(joint1sub)
        --simROS2.shutdownSubscription(joint2sub)
       -- simROS2.shutdownSubscription(joint3sub)
       -- simROS2.shutdownSubscription(joint4sub)
       -- simROS2.shutdownSubscription(joint5sub)
        --simROS2.shutdownSubscription(joint6sub)
    --end
--end