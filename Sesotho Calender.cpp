#include <iostream>
using namespace std;

int main() {
    int day;
    cout << "Enter a number (1-7) for the day of the week: ";
    cin >> day;

    string days[7] = {"Sontaha", "Mantaha", "Labobeli", "Laboraro", "Labone", "Labohlano", "Moqebelo"};

    if (day >= 1 && day <= 7) {
        cout << "Sesotho day: " << days[day - 1] << endl;
    } else {
        cout << "Error: Invalid day number!" << endl;
    }

    return 0;
}

