#include <iostream>
#include <vector>
#include <math.h>
#include <boost/tuple/tuple.hpp>
#include "spline.h"
#include "gnuplot-iostream.h"

using namespace std;

typedef vector<boost::tuple<double, double> > points;

points getData(tk::spline f, int samples);
tk::spline gaitCycle(double T);

const double DT = 0.01;
const double DY = 0.01;

int main(int argc, char **argv) {
   Gnuplot gp;
   gp << "set xrange [0:1]\nset yrange [0:1]\n";
   gp << "plot '-' title 'T = 0.8', "
      <<      "'-' title 'T = 1',"
      <<      "'-' title 'T = 1.2'\n";
   gp.send1d(getData(gaitCycle(0.8), 100));
   gp.send1d(getData(gaitCycle(1), 100));
   gp.send1d(getData(gaitCycle(1.2), 100));
   return EXIT_SUCCESS;
}


tk::spline gaitCycle(double T) {
   vector<double> X(10), Y(10);
   X[0]=T*0.0; Y[0]=0.0; X[1]=T*0.01; Y[2]=0.0;
   X[2]=T*0.3; Y[2]=0.2; X[3]=T*0.31; Y[3]=0.2;
   X[4]=T*0.6; Y[4]=0.0; X[5]=T*0.61; Y[5]=0.0;
   X[6]=T*0.8; Y[6]=0.7; X[7]=T*0.81; Y[7]=0.7;
   X[8]=T*1.0; Y[8]=0.0; X[9]=T*1.01; Y[9]=0.0;

   tk::spline cycle;
   cycle.set_points(X,Y);
   return cycle;
}

points getData(tk::spline f, int samples) {
   points data;
   for(int i = 0; i < samples; i++) {
      data.push_back(boost::make_tuple(
               i*DT,
               f(i*DT)
               ));
   }
   return data;
}

/* void printCsv(vector<double> fs) { */
/*    for(int i = 0; i < fs.size(); i++) { */
/*       cout << DT*i << ", " << fs[i] << endl; */
/*    } */
/* } */

