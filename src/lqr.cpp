#include "lqr.h"
#include <eigen3/Eigen/src/Core/Matrix.h>
#include <eigen3/Eigen/Core>
#include <eigen3/Eigen/src/Eigenvalues/ComplexEigenSolver.h>
#include <eigen3/Eigen/src/Eigenvalues/EigenSolver.h>

lqr::lqr(lss &system_, std::vector<double> Q_, std::vector<double> R_){

	this->NumofStates= int(std::pow(Q_.size(),0.5));
	this->NumInputs= int(std::pow(R_.size(),0.5));

	this->A= Eigen::MatrixXd(NumofStates, NumofStates);
	A=system_.A;

	this->B= Eigen::MatrixXd(NumofStates, NumInputs);
	B=system_.B;

	this->Q= Eigen::MatrixXd(NumofStates,NumofStates);

	for(int i=0; i<NumofStates; i++){
		for(int j=0; j<NumofStates;j++){
			Q(i, j)=Q_[i*NumofStates+j];
		}
	}

	this->R= Eigen::MatrixXd(NumInputs,NumInputs);

	for(int i=0; i<NumInputs; i++){
		for(int j=0; j<NumInputs;j++){
			R(i,j)=R_[i*NumInputs+j]; 
		}
	}

	this->updateK(system_);

}


void lqr::updateK(lss &system_){

	Eigen::MatrixXd Ham(2*NumofStates,2*NumofStates);


	Ham<<A, -B*R.inverse()*B.transpose(),-Q, -A.transpose();

	Eigen::EigenSolver<Eigen::MatrixXd>es(Ham);

	Eigen::MatrixXcd ev= Eigen::MatrixXcd::Zero(2*NumofStates, NumofStates);
	 int j=0;

	 for(int i=0; i<2*NumofStates; ++i){

	 	if(es.eigenvalues()[i].real()<0.){
	 		ev.col(j)=es.eigenvectors().block(0,i,2*NumofStates, 1);
	 		++j;
	 	}


	 }

	 Eigen::MatrixXcd u1,u2;
	 u1=ev.block(0,0,NumofStates, NumofStates);
	 u2=ev.block(NumofStates,0,NumofStates, NumofStates);

	 auto P=(u2*u1.inverse()).real();

	 auto k= R.inverse()*B.transpose()*P;
	 system_.K= Eigen::MatrixXd(NumInputs, NumofStates);

	 system_.K= k;


	 	}
	
