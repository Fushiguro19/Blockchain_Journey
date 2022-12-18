//https://javascript.info/promise-basics


//Asynchronous code : We tell JavaScript where to pick up after something has occurred. We can do this by passing a callback function as an argument to a function.
//Let's take a look at an example:

runAnimation(function() {
    // do something after the animation is complete
});
//When the function() will execute and return a value, only then runAnimation will start getting executed.

...................................................................................................XXXX.................................................................

//Promises give us an alternate way to configure our callback functions:

const animationPromise = runAnimation();

animationPromise.then(() => {
    // do something after the animation is complete
});

...................................................................................................XXXX.................................................................

const promise = getServerData();

// similar to using a callback function argument,
// except we wire up the callback using .then 
promise.then(function(data) {
    // this function is called asynchronously
    // once the server has responded with data
    console.log('got data', data);
});
// Here getServerData returns a promise.
// We can call .then and provide a function that is invoked once the server data is resolved.


...................................................................................................XXXX.................................................................

// We need to make some food! 
// When the customer asks for food, the request function will be invoked. This function should call the function makeFood which takes food as its only argument. 
// The function makeFood will return a promise.
// Add a callback function to the .then of the makeFood promise. Once it is called the food is ready! At that point set the order isReady is true.

const { makeFood } = require('./Kitchen');

class Order {
    constructor() {
        this.isReady = false;
    }
    request(food) {
        const promise = makeFood(food);
        promise.then(()=>{
            this.isReady = true;
        });
    }
}

...................................................................................................XXXX.................................................................

//Catching an error
const { makeFood } = require('./Kitchen');

class Order {
    constructor() {
        this.isReady = false;
    }
    request(food) {
        const promise = makeFood(food);
        promise.then(()=>{
            this.isReady = true;
        })
        .catch((error) => {
            this.error = error;
        });
    }
}

...................................................................................................XXXX.................................................................

//Async and Await
async function test() {
    await getServerData();

    return 3;
}
//We won't return 3 until after the promise returned from getServerData resolves.


...................................................................................................XXXX.................................................................








