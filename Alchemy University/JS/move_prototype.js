// Create a function move that will be added to the Shape.prototype. This function should take two arguments: x and y.
// It should move the shape's position by adding the corresponding arguments value:
// const shape = new Shape(1, 1);
// shape.move(1, 4);
// console.log( shape.position.x ); // 2
// console.log( shape.position.y ); // 5


function Shape(x, y) {
    // store x and y in this.position
    this.position = {x : x, y: y};
}
Shape.prototype.move = function(x,y){
    let a = this.position.x + x;
    let b = this.position.y + y;
    return (this.position = { x: a, y: b });
}
let shape = new Shape(5,10);
console.log(shape.move(2,3));
