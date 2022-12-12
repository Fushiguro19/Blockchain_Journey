//add one to each element of an array
console.log([1,2,3].map((x) => x+1));

//Using a built-in function
console.log([4,9,16].map(Math.sqrt)); //be careful if the function takes in multiple arguments

//square a number
//Math.pow(n,2); //n : the number to be squared....... 2 : power to which n has to be raised
function squared(n) {
    return Math.pow(n,2);
}

function squaredMap(arr) {
    return arr.map(squared);
}
