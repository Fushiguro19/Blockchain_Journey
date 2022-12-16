//LinkedList : List of linked nodes which have reference to the next node
//First step is to create nodes...here we create nodes as an instance of Node
//Add a constructor function that takes one argument, data. Store data on the node instance.
//Also, in the constructor, add a property next to the node instance. For now, set this property to null.

class Node {
    constructor(data){
        this.data = data;
        this.next = null;
    }
}


// "Head" is the first node in the linkedlist
// Add a constructor function to the LinkedList in the new file LinkedList.js.
// The linked list should have a head property that is set to null by default.

class LinkedList {
    constructor(){
        this.head = null;
    }
}






