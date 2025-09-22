#include <iostream>
using namespace std;

int main() {
    int litres;
    cout << "Enter quantity of grains (in litres): ";
    cin >> litres;

    int makopokopo = litres / 20;
    int remainder = litres % 20;

    cout << "Makopokopo (20L containers): " << makopokopo << endl;
    cout << "Remaining litres: " << remainder << endl;

    return 0;
}

