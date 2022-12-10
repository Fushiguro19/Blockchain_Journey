//Write a function fizzBuzz that takes an array of numbers and replaces any number divisible by three with the word "fizz" and any number divisible by five with the 
//word "buzz". If a number is divisible by both three and five, replace it with "fizzbuzz"

//Once the appropriate numbers are replaced, return a concatenated string with only the words "fizz" or "buzz" included.

//const numbers = [1, 3, 5, 9, 11, 12, 20];

//fizzBuzz(numbers); // returns "fizzbuzzfizzfizzbuzz"



function fizzBuzz(numbers) {
    let s = "";
    for(let i = 0; i < numbers.length; i++){
        if(numbers[i]%3==0 && numbers[i]%5==0){
            numbers[i] = "fizzbuzz";
            console.log(numbers[i]);
            s += "fizzbuzz";
            console.log(s);
        }else if(numbers[i]%5==0){
            numbers[i] = "buzz";
            console.log(numbers[i]);
            s += "buzz";
            console.log(s);
        }else if(numbers[i]%3==0){
            numbers[i] = "fizz";
            console.log(numbers[i]);
            s += "fizz";
            console.log(s);
        }else{
            console.log("Not divisible by either 3 or 5");
        }
    }
    return s;

}
console.log(fizzBuzz([1,3,5,9,11,12,20]));
