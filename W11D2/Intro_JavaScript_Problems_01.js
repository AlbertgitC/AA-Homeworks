function mysteryScoping1() {
  var x = 'out of block';
  if (true) {
    var x = 'in block';
    console.log(x);
  }
  console.log(x);
}

function mysteryScoping2() {
  const x = 'out of block';
  if (true) {
    const x = 'in block';
    console.log(x);
  }
  console.log(x);
}

function mysteryScoping3() {
  const x = 'out of block';
  if (true) {
    var x = 'in block';
    console.log(x);
  }
  console.log(x);
}

function mysteryScoping4() {
  let x = 'out of block';
  if (true) {
    let x = 'in block';
    console.log(x);
  }
  console.log(x);
}

function mysteryScoping5() {
  let x = 'out of block';
  if (true) {
    let x = 'in block';
    console.log(x);
  }
  let x = 'out of block again';
  console.log(x);
}

// madLib('make', 'best', 'guac');
// "We shall MAKE the BEST GUAC."
function madLib(ver, adj, target) {
  const sent = `We shall ${ver.toUpperCase()} the ${adj.toUpperCase()} ${target.toUpperCase()}`;
  console.log(sent);
}

// isSubstring
// isSubstring("time to program", "time")
// true
// isSubstring("Jump for joy", "joys")
// false
function isSubstring(searchString, subString) {
  if ( searchString.includes(subString) ) {
    return true;
  } return false;
}

// fizzBuzz(array)
function fizzBuzz(arr) {
  const newArr = [];
  for ( let i = 0; i < arr.length; i++ ) {
    if (  ) {
        
    }
  }
}