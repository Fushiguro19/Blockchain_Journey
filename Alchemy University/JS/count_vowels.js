function countVowels(str) {
    let count = 0;
    let vowels = ["a", "e", "i", "o", "u"];
    for(let i = 0; i < str.length; i++){
        let s = str.toLowerCase();
        if(vowels.includes(s[i])){
            count += 1;
        }else{
            console.log("Not a Vowel");
        }
    }
    return count;
}
