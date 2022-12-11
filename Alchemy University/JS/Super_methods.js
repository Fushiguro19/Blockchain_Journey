//example from MDN
class Cat {
  constructor(name) {
    this.name = name;
  }

  speak() {
    console.log(`${this.name} makes a noise.`);
  }
}

class Lion extends Cat {
  speak() {
    super.speak();
    console.log(`${this.name} roars.`);
  }
}

const l = new Lion('Fuzzy');
l.speak();
// Fuzzy makes a noise.
// Fuzzy roars.

//OUR TASK
/*Add a method takeDamage to the Warrior class that will increment rage by 1 each time the warrior takes damage.
It should also invoke takeDamage method on Hero which will inflict the damage on the hero's health.
const warrior = new Warrior();
console.log(warrior.health, warrior.rage); // 50, 0
warrior.takeDamage(10);
console.log(warrior.health, warrior.rage); // 40, 1 */

//first case when Warrior doesn't have a method takeDamage of its own but borrows/inherits it from its parent class Hero

class Hero {
    constructor() {
        this.health = 50;
    }

    takeDamage(damage){
        this.health -= damage;
        console.log(`${this.health} is the health`);
    }
}

class Warrior extends Hero {
    constructor(){
        super();
        this.rage=0;
    }

    // takeDamage(damage){
    //     super.takeDamage(damage);
    //     this.rage += 1;
    //     console.log(this.rage);
    // }
}

let warrior = new Warrior();
warrior.takeDamage(5); //45 is the health


//second case : Warrior has its own takeDamage method which increases rage by 1 whenever there is a damage

class Hero {
    constructor() {
        this.health = 50;
    }

    takeDamage(damage){
        this.health -= damage;
        console.log(`${this.health} is the health`);
    }
}

class Warrior extends Hero {
    constructor(){
        super();
        this.rage=0;
    }

    takeDamage(damage){
        super.takeDamage(damage); //if this is removed from here then it will only return rage increase by 1... even the super in constructor won't call the takeDamage function from Hero class now
        this.rage += 1;
        console.log(this.rage);
    }
}

let warrior = new Warrior();
warrior.takeDamage(5);

//Output :  45 is the health        1
//1 .... this is this.rage increased by 1
