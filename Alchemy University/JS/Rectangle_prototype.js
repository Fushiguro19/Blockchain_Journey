//Create a function flip on the rectangle prototype! This function will switch the height and width dimensions of the rectangle. It will take no arguments.

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

function Rectangle(x, y, height, width) {
    Shape.call(this,x,y);
    this.height = height;
    this.width = width;
}
Rectangle.prototype = Object.create(Shape.prototype);
Rectangle.prototype.flip = function() {
    let a = this.height;
    let b = this.width;
    this.height = b;
    this.width = a;
    return([this.height,this.width]);
}

//flips the value of rectangle.height and rectangle.width
