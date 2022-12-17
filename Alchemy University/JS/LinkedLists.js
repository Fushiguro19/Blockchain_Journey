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


//Write a method called addFirst on LinkedList. This method will take a node and add it to the front of the linked list.
class LinkedList {
    constructor(){
        this.head = null;
    }

    addFirst(node){
        let a = this.head;
        this.head = node;
        node.next = a;
    }
}




//to add one node to the back of the list.
//If there is no existing head node, this actually works just the same as the addFirst logic.
//if there is an existing head node : We need to start at the head and continue down the list until 
//we reach a point in the list where there is no next node. Once we reach this point, we set the next to our new node.
//Create a method addLast on LinkedList which takes a node and adds it to the end of our linked list.

class LinkedList {
    constructor(){
        this.head = null;
    }

    addFirst(node){
        let a = this.head;
        this.head = node;
        node.next = a;
    }

    addLast(node){
        if(this.head == null){
            this.addFirst(node);
        }else{
            let a = this.head;
            while(a.next){
                a = a.next;
            }
            a.next =  node;
        }
        
    }
}




//Let's write an indexOf method like a regular array! It will be zero-based so the head will be 0 and every following index will be incremented by 1
// Write a method indexOf on LinkedList which takes node and returns a number index that indicates where the node is in the list.
// To determine if a node is equal to another node you can simply compare them with (node1 === node2). This will evaluate to true if they are the same node.

//indexOf method inside above mentioned class itself
indexOf(node){
        let count = 0;
        let a = this.head;
        while(node !== a){
            a = a.next;
            count += 1;
        }
        return count
    }




// We will need to remove a node from the list and then stitch the node before it to the node it was pointing to!
// If we're removing the node at index 0 (the head node), we can simply set the new head node to the next node that the original head node was pointing to.
// If we're removing a node in between other nodes, we will need to connect the previous node to the next node

removeAt(index){
        if(index == 0){
            this.head = this.head.next;
        }else{
            let a = 0;
            let curr = this.head;
            while(a < (index-1)){
                curr = curr.next;
                a++;
            }
            curr.next = curr.next.next;
        }
    }





// Given an object that has an arbitrary nesting level, find the value!
// Each object will only contain 1 key prop and the associated value will either be an object or a primary value (string, boolean or number). If the value is an object, 
// it will contain a prop attribute.
// This will continue until eventually the prop attribute for a nested object will contain a string, boolean, or a number.

function deepRetrieval(obj) {
    if(typeof(obj.prop) !== 'object'){
        return obj.prop;
    }return deepRetrieval(obj.prop);
}

