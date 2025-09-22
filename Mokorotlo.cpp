#include <iostream>
#include <iomanip>
using namespace std;

int main() {
    int n;
    cout << "Enter height of the Mokorotlo: ";
    cin >> n;

    for (int i = 0; i < n; i++) {
        // Print leading spaces
        for (int j = 0; j < n - i - 1; j++) {
            cout << " ";
        }

        // Print stars in Pascal's triangle style
        for (int j = 0; j <= i; j++) {
            cout << "* ";
        }
        cout << endl;
    }

    return 0;
}

