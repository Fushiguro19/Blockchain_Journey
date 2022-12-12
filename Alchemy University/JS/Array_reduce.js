//https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/reduce

//adding elements of an array with an initial value of 5
console.log([1,2,3].reduce((x,y) => x+y, 5,));
//x = accumulator (the value from previous calls to the callbackFn...... its value if initialValue(5) if specified, otherwise its arr[0]
//y = current Value which is arr[0] if initialValue is mentioned(here, 5) and if not, then it is arr[1]


//find the largest no in an array

console.log([6,8,3].reduce((x,y) => x > y ? x :y));
//since no initialValue is mentioned here, accumulator i.e. x becomes arr[0] = 6 and y = currentValue becomes 8
//then comparison occurs if 6 > 8 return x or else return 8 .... returns 8, then 8>3 returns 8 .... hence the array is reduced to a single no 8


//remove duplicates from an array
// numbers is an array full of numbers
// let's remove any duplicates and return it
// i.e. [2,2,3,5,1,3,4] => [2,3,5,1,4]
function removeDuplicates(numbers) {
    return numbers.reduce((accumulator, currentValue) => {
        // TODO: reduce logic
        if(accumulator.indexOf(currentValue) < 0){
            accumulator.push(currentValue);
            return accumulator; //returning the accumulator so that it can be carried over for next element is imp (I was missing this hence program wasn't working)
        }
        return accumulator; //returning accumulator for next element
    },[]);
}


// food is an array full of food objects
// let's group them by "type" and return them
/*let foods =
    [
    { food: 'apple', type: 'fruit' }, 
    { food: 'orange', type: 'fruit' }, 
    { food: 'carrot', type: 'vegetable' }
]

turned into an object  :
{ 
     fruit: ['orange', 'apple'], 
     vegetable: ['carrot'] 
} */

function group(foods) {
    return foods.reduce((accumulator, currentValue) => {
        // TODO: reduce logic
        let a = currentValue.type;
        let b = currentValue.food;
        if(a in accumulator){
            accumulator[a].push(b);
            return accumulator;
        }else{
            accumulator[a] = [b];
            return accumulator;
        }

    }, {}/* TODO: add initial value */ );
}
