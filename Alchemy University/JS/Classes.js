// Add a method takeDamage to the hero class. This method should take one number argument representing the damage. 
// This number should be directly subtracted from the hero's health.
// For example:
// const hero = new Hero();
// console.log(hero.health); // 50
// hero.takeDamage(5);
// console.log(hero.health); // 45

class Hero {
    constructor() {
        this.health = 50;
    }

    takeDamage(damage){
        this.health -= damage;
    }
}

//Extennding Hero to its subclass Warrior
/* class Warrior extends Hero{
   }*/

//Use of super() to invoke Hero's constructor first before anything else

// class Warrior extends Hero {
//     constructor(){
//         super();
//         this.rage=0;
//     }
// }
