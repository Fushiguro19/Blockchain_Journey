// In JavaScript, functions are first-class objects. This means, just like objects, functions can be stored in variables, returned from functions, and passed into other 
// functions as arguments.
// With callback functions, we will be passing functions into other functions to be called at a very specific time.

function simpleFunction(fn) {
    // invoke the callback function
    fn();
}

simpleFunction(function callbackFunction() {
    console.log('hi');
});

//In the above example, callbackFunction is passed to simpleFunction as an argument and then invoked immediately. The result is that 'hi' is logged once to the console.

.....................................................................................XXXXX........................................................................


//Complete the function runCallback to invoke callbackFunction immediately.
function runCallback(callbackFunction) {
    setTimeout(() => {
        callbackFunction();
    }, 1000);
}

....................................................................................XXXX..............................................................................

//A simple example for asynchronous code is to use the web API setTimeout which will run code after a set amount of time:

setTimeout(function callback() {
    // the code to run after 1000 milliseconds
}, 1000);

// In setTimeout, we give it a callback to run after a period of time (in milliseconds). The first argument to the function is the callback and the second argument is the
// number of milliseconds to wait before running the callback function.

.....................................................................................XXXXX........................................................................

// Let's modify runCallback to make callbackFunction run asynchronously.
// Just like the example above, use setTimeout and invoke callbackFunction 1000 milliseconds (1 second) after runCallback has been called.

function runCallback(callbackFunction) {
    setTimeout(() => {
        callbackFunction();
    }, 1000);
}

.....................................................................................XXXXX........................................................................

// We're going to write two functions for our dialog component:
// onClose - This method will take a callback function as an argument and store it on our Dialog instance.
// close - This function will be used to close the dialog. When we close the dialog, we'll want to call the callbackFunction.
// add the ability to wire up multiple callback functions.
// Each time onClose is called, we'll need to store an additional callback function on our dialog class. Once close is called, we'll invoke all of those callback 
// functions.

class Dialog {
    constructor(){
        this.callbackarr = [];
        
    }

    onClose(callbackFunction) {
        // store the callback
        this.callbackfn = callbackFunction;
        this.callbackarr.push(this.callbackfn());
    }

    close() {
        // invoke the callback
        for(let i = 0; i < this.callbackarr.length; i++){
            this.callbackarr[i];
        }
    }
}

.....................................................................................XXXXX........................................................................

//Create our own MAP function
//Map each element in the array to its new value returned by the callback function.

function map(arr, callback) {
    let newarr = [];
    for(let i = 0; i < arr.length; i++){
        newarr.push(callback(arr[i]));
    }
    return newarr;
}









