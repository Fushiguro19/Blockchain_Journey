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


// Given an array of players, add 10 to their score. Return a new array with these additional points.
// Each player will be an object with the following two properties:
// id - a number uniquely identifying the player
// score - a number representing the player's points


function addScore(players) {
    return players.map(function(x){
        return {
            id : x.id,
            score : x.score+10
        }
    });
}


//Accessing elements index using map
[1,2,3].map(function(x,i){
    console.log(i);});


//Add 10 to score of players with id less than 3
const players = [{id : 0, score : 10},
{id : 1, score : 20}, {id : 2, score : 5}, {id : 3, score : 15}];

console.log(players.map(function(x,y){
    if(y<3){
        return {
            id : x.id,
            score : x.score+10
        };
    }else{
        return{
            id : x.id,
            score : x.score
        };
    }
}));
