// Given the array of events, sort them by the month that they occur in and return the sorted array.
// Each object in the events array will have properties event and month just like in the example shown above.

const mon = ["JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG","SEP", "OCT", "NOV","DEC"];
const arr = 
 [{ event: 'dance', month: 'MAR' },
 { event: 'farmers market', month: 'JUN' },
 { event: 'parade', month: 'JAN' }];
 
let a = arr.sort(function(x,y){
    return (mon.indexOf(x.month)-mon.indexOf(y.month));
});

console.log(a);
