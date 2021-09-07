#include <chrono>
#include <functional>
#include <memory>
#include <vector>
#include <iostream>
#include "rclcpp/rclcpp.hpp"
#include "std_msgs/msg/float32.hpp"
#include "std_msgs/msg/float32_multi_array.hpp"
#include "lqr.h"
#include <rclcpp/publisher.hpp>
#include <rclcpp/subscription.hpp>
#include <std_msgs/msg/detail/float32__struct.hpp>
#include <std_msgs/msg/detail/float32_multi_array__struct.hpp>
#include <eigen3/Eigen/src/Core/Matrix.h>
#include <eigen3/Eigen/Core>


//using namespace std::chrono_literals;

class ctrl_node: public rclcpp::Node
{

	public:
	 ctrl_node() : Node("ctrl_node")
	 {
	 	joints.resize(6);

	 	for(int i=0; i<6; i++)
	 	{
	 		joints[i]= this->create_publisher<std_msgs::msg::Float32> ("/joint"+std::to_string(i+1)+"_ctrl", 100);
	 	}

	 	jointStatesub=this->create_subscription<std_msgs::msg::Float32MultiArray> ("StateTopic", 100,std::bind(&ctrl_node::callback, this, std::placeholders::_1));
	 	jointDesiredSub = this->create_subscription<std_msgs::msg::Float32MultiArray>("desState", 100, std::bind(&ctrl_node::descallback, this, std::placeholders::_1));

	 	System.A=Eigen::MatrixXd::Identity(6,6);
	 	System.B=Eigen::MatrixXd::Identity(6,6);

	 	Q.resize(36);
	 	R.resize(36);

	 	for(int i=0; i<6; i++)
	 	{
	 		for (int j = 0; j < 6; j++)
	 		{
	 			Q[6*i+j]=1*(i==j);
	 			R[6*i+j]=20*(i==j); 
	 		}
	 	}

	 	lqr(System, Q, R);

	 	msg_= std::make_shared<std_msgs::msg::Float32MultiArray>();
	 	msg_->data.resize(6);

	 	for (int i = 0; i <6; i++)
	 	{
	 		msg_->data[i]=0;
	 	}


	 }

	 std::vector<rclcpp::Publisher<std_msgs::msg::Float32>::SharedPtr> joints;

	 rclcpp::Subscription<std_msgs::msg::Float32MultiArray>::SharedPtr jointStatesub;
	 rclcpp::Subscription<std_msgs::msg::Float32MultiArray>::SharedPtr jointDesiredSub;

	 std_msgs::msg::Float32MultiArray::SharedPtr msg_;




	

	private:
		void callback(const std_msgs::msg::Float32MultiArray::SharedPtr msg)
		{
			Eigen::MatrixXd E=Eigen::MatrixXd(msg_->data.size(),1);
			Eigen::MatrixXd U=Eigen::MatrixXd(joints.size(),1);

			while(msg_->data.empty()){

				int i=0;
				(void) i;
			}


			for (unsigned long t = 0; t <msg_->data.size(); t++)
			{
				E(t,0)=msg_->data[t]-msg->data[t];
			}

			U = (System.K)*E;

			for(int j=0; j<U.size(); j++)
			{
				std_msgs::msg::Float32 ci;
				ci.data = U(j,0);
				joints[j]->publish(ci);
			}


		}

		void descallback(const std_msgs::msg::Float32MultiArray::SharedPtr msg){
			msg_=msg;
		}





	lss System;
	std::vector<double> Q, R;



};

int main(int argc, char * argv[])
{
	rclcpp::init(argc, argv);
	rclcpp::spin(std::make_shared<ctrl_node>());
	rclcpp::shutdown();
	return 0;
}

