#include <iostream>
using namespace std;

struct Node {
	int data;		// Value of the Node
	Node* next;		// Next link of the Node
};

class LinkedList {
private:
	int sz;	// size of the list
	Node* head;
	Node* tail;
public:
	LinkedList() : head{nullptr}, tail{nullptr}, sz{0}	{
		cout << "LinkedList created\n";
	}
	void print() {
		cout << "LinkedList Printed\n";
	}
	~LinkedList() {
		cout << "destroyed LinkedList.\n";
	}
};

int main (int argc, char *argv[]) {
	std::cout << "This is a message.\n";

	LinkedList myList;
	myList.print();
	return 0;
}

