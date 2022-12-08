// First approach
let arr = [1,2,3,1,4,5];
for(let i = 0; i < arr.length; i++){
    if(arr[i] === 1){
        let s = arr.splice(i,1);
        console.log(s);
        console.log(arr);
        i--;
    }else{
        console.log(arr[i]);
    }
}
console.log(arr);



//second approach

function removeOccurrences(array, num) {
    for(let i = array.length - 1; i>=0; i--){
        if(array[i] === num){
            array.splice(i,1);
        }
    }
}

module.exports = removeOccurrences;
