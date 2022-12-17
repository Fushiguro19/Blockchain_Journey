//create a new file index.js
const myName = "Fushiguro";

const message = `Hello, ${myName}!`;

console.log(message);

//execute with command : node index



//Omit myName : 
const message = `Hello, ${process.argv[2}!`;

console.log(message); //executing command : node index Fushiguro
//process.argv[0] and process.argv[1] are reserved for the path of node and the current script. Hence the value is stored at index 2.




//For npm, open any folder/project in the editor -> type "npm init" in the terminal -> enter till package.json is not formed





