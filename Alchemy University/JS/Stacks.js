//Push and Pop
// In our Stack class, you can see we already have a constructor with an items array.
// In the push function, let's add a new item to our items.
// In the pop function, let's remove the last item from items and return it.

class Stack {
    constructor() {
        this.items = [];
    }
    push(item) {
        this.items.push(item);
    }
    pop() {
        return this.items.pop();
    }
    isEmpty() {
        
    }
    peek() {
        
    }
}

//Overflow and Underflow
/*Ok, let's throw errors for stack overflows and underflows within our Stack class.

If executing push will exceed the MAX_STACK_SIZE, throw an Error.
MAX_STACK_SIZE is a number value. The number of elements in the items array cannot exceed this number.

If a pop is attempted on a stack with zero elements, throw an Error.
To throw an Error, you can throw new Error("any error message"). For more on errors, you can refer back to the Exceptions lesson or the MDN documentation. */

const { MAX_STACK_SIZE } = require('./config');

class Stack {
    constructor() {
        this.items = [];
    }
    push(item) {
        if(this.items.length >= MAX_STACK_SIZE){
            throw new Error("Array size exceeded!!");
        }else{
            this.items.push(item);
        }
    }
    pop() {
        if(this.items.length<=0){
            throw new Error("Empty array : Underflow!!");
        }else{
            return this.items.pop();
        }
    }
    isEmpty() {
        
    }
    peek() {
        
    }
}





//isEmpty and Peek
// Implement isEmpty to return a boolean if items is empty.
// For bonus points, use this method in pop to check for underflow!
// Implement peek to return the top element in items without changing the array.

const { MAX_STACK_SIZE } = require('./config');

class Stack {
    constructor() {
        this.items = [];
    }
    push(item) {
        if(this.items.length >= MAX_STACK_SIZE){
            throw new Error("Array size exceeded!!");
        }else{
            this.items.push(item);
        }
    }
    pop() {
        if(this.isEmpty()){
            throw new Error("Empty array : Underflow!!");
        }else{
            return this.items.pop();
        }
    }
    isEmpty() {
        if(this.items.length == 0){
            return true;
        }return false;
    }
    peek() {
        return this.items[this.items.length - 1];
    }
}



//Let's add two stacks to our OperationsManager constructor: operations and undos.
// You'll notice the Stack file has already been imported for you in OperationsManager.js. To create a new stack you can simply invoke it after the new operator 
// new Stack().

const Stack = require('./Stack');
class OperationManager {
    constructor() {
        this.operations = new Stack();
        this.undos = new Stack();
    }

    addOperation(operation) {
        this.operations.push(operation);
    }

    undo() {
        
    }

    redo() {
        
    }

    redoAll() {
        
    }
}


//Undo and Redo
// For each undo, we'll want to take an operation off our operations stack and add it to the top of the undos stack.
// For each redo, we'll want to take an operation off our undos stack and add it to the top of the operations stack.

const Stack = require('./Stack');
class OperationManager {
    constructor() {
        this.operations = new Stack();
        this.undos = new Stack();
    }

    addOperation(operation) {
        this.operations.push(operation);
    }

    undo() {
        let a = this.operations.pop();
        this.undos.push(a);
    }

    redo() {
        let b = this.undos.pop();
        this.operations.push(b);
    }

    redoAll() {
        
    }
}







//RedoALL
// Let's say we wanted to redo all of our undos.
// We could just keep redo-ing all of undo operations until we had to stop. At what point would we stop? When the undos stack is empty.

const Stack = require('./Stack');
class OperationManager {
    constructor() {
        this.operations = new Stack();
        this.undos = new Stack();
    }

    addOperation(operation) {
        this.operations.push(operation);
    }

    undo() {
        let a = this.operations.pop();
        this.undos.push(a);
    }

    redo() {
        let b = this.undos.pop();
        this.operations.push(b);
    }

    redoAll() {
        while(!this.undos.isEmpty()){
            this.redo();
        }
    }
}













