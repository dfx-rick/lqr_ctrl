#ifndef LQR_H
#define LQR_H
#include <eigen3/Eigen/Core>
#include <eigen3/Eigen/src/Core/Matrix.h>
#include <iostream>
#include <memory>
#include "eigen3/Eigen/Eigenvalues"
#include <vector>

struct lss
{
	Eigen::MatrixXd A;
	Eigen::MatrixXd B;
	Eigen::MatrixXd K;

};

typedef struct lss lss;

class lqr{

public:
	lqr(lss &system_, std::vector<double>Q_, std::vector<double>R_);

private:
	Eigen::MatrixXd A,B,Q,R;
	int NumofStates, NumInputs;

public:
	void updateK(lss &system_);	


};

#endif