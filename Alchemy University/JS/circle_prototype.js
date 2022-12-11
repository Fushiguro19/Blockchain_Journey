//Circle will be similar to Shape. The only addition is a new radius property. Since these prototypes will be so similar, we'll invoke Shape in our Circle function.

// Our Shape "Constructor"
// function Shape(x, y) {
//     // store x and y in this.position
//     this.position = {x : x, y: y};
// }
// Shape.prototype.move = function(x,y){
//     let a = this.position.x + x;
//     let b = this.position.y + y;
//     return (this.position = { x: a, y: b });
// }

const Shape = require('./Shape');

function Circle(x, y, radius) {
    Shape.call(this,x,y);
    // store radius on this
    this.radius = radius;
}

//Shape.call(this,5,10) : this keyword points to the instance of the Circle 
//what this does is the instance of Circle(5,10,15), say circle, will be carried over to the Shape prototype which will create circle.position = {x:5, y:10}
//this.radius will create circle.radius
