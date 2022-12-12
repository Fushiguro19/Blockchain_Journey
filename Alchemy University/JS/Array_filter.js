//find elements with value less than 5

function lessThanFive(array) {
    return array.filter((x) => x<5);
}


//Given an array of strings, keep only the strings whose length is at most 3.

function shortStrings(array) {
    return array.filter((x) => x.length<=3);    
}


//Find students whose score is at least 90.
const students = [
    { name: 'David', grade: 90 }, 
    { name: 'Daisy', grade: 100 },
    { name: 'Darcie', grade: 80 }
];

function topStudents(array) {
    return array.filter((student) => student.grade>=90);
}


//Given an array of elements, keep only the first 3 elements.
//Return an array with only these three elements included.

function firstThree(array) {
    return array.filter((x,y) => y<3);
}


//Given an array of values, return an array of unique values.
function unique(array) {
    return array.filter((element,index) => array.indexOf(element)===index);
}
//here, array.indexOf(element) will return the first index it encounters related to that element while the term "index" refers to the current index filter is checking






