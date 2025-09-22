#include <iostream>
using namespace std;

int main() {
    int cattle;
    int desired_num;
    cout<<"Enter the desired number of cattle for mahali to be possible: ";
    cin>>desired_num;
    cout << "Enter number of cattle offerd: ";
    cin >> cattle;

    if (cattle < desired_num) {
    	cout<<"The cattle you are proposing to give are not enough for my daughter."<<endl;
    }
    else{
    	cout<<"You may marry my daughter.";
	}

    return 0;
}

