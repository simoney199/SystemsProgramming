// Online C++ compiler to run C++ program online
#include <iostream>
using namespace std;



int main() {
    double res = 1;
    double temp = 0;
    for (double i = 1; i < 2049; i++)
    {
        temp = ((2048 - i) / 2048);
        res *= temp;
        if (res < 0.25)
        {
            cout << i << endl;
            return 0;
        }
    }

    return 0;
}