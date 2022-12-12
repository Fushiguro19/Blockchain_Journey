//ascending order
console.log([5,8,10,3].sort((a,b) => b-a)); //descending order
console.log([5,8,10,3].sort((a,b) => a-b)); //ascending order

//https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/sort

//for strings in descending order 
function sortStringsDown(array) {
    return array.sort((a,b) => b.localeCompare(a));
}

console.log(sortStringsDown(['b', 'z', 'd']));



// Given an array of students, sort first by graduated then by grade like in the example above.
// Each object in the students array will have properties id, graduated and grade just like in the example shown above.

const students = [
    { id: 1, graduated: true, grade: 86 },
    { id: 2, graduated: false, grade: 96 },
    { id: 3, graduated: false, grade: 78 },
    { id: 4, graduated: true, grade: 96 },
];
let a = students.sort(function(x,y){
    if(x.graduated && !y.graduated){
        return -1;
    }else if(!x.graduated && y.graduated){
        return 1;
    }if(x.graduated == y.graduated){
        return y.grade-x.grade;
    }
});

console.log(a);
