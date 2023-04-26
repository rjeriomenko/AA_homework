function mysteryScoping1() {
    var x = 'out of block';
    if (true) {
        var x = 'in block';
        console.log(x);
    }
    console.log(x);
}

//mysteryScoping1()


function mysteryScoping2() {
    const x = 'out of block';
    if (true) {
        const x = 'in block';
        console.log(x);
    }
    console.log(x);
}

//mysteryScoping2()

// function mysteryScoping3() {
//     const x = 'out of block';
//     if (true) {
//         var x = 'in block';  //error here, var affects const's block scope for reassignment
//         console.log(x);
//     }
//     console.log(x);
// }

function mysteryScoping3() {
    const x = 'out of block';
    if (true) {
        let x = 'in block';  //one fix is to use block-scope assignment
        console.log(x);
    }
    console.log(x);
}

// mysteryScoping3()

function mysteryScoping4() {
    let x = 'out of block';
    if (true) {
        let x = 'in block';
        console.log(x);
    }
    console.log(x);
}

// mysteryScoping4()

// function mysteryScoping5() {
//     let x = 'out of block';
//     if (true) {
//         let x = 'in block';
//         console.log(x);
//     }
//     let x = 'out of block again';  //this throws an error because you also cannot reassign let on same variable twice within a block
//     console.log(x);
// }

function mysteryScoping5() {
    let x = 'out of block';
    if (true) {
        let x = 'in block';
        console.log(x);
    }
    x = 'out of block again';  //global var "fix"?
    console.log(x);
}

// mysteryScoping5();

function madLib(verb, adj, noun) {
    console.log(`We shall ${verb.toUpperCase()} the ${adj.toUpperCase()} ${noun.toUpperCase()}.`);
}

madLib("slam", "silly", "mushroom kingdom");

function printSplitStrings(StringOne, StringTwo) {
    console.log(
        StringOne = StringOne.split(""),
        StringTwo = StringTwo.split("")
    );
}

printSplitStrings("one", "two");

const isSubString = function(searchString, subString) {
    let searchArray = searchString.split("");
    let subArray = subString.split("");
    let i = 0;
    let outArray = [];
    while (i + subArray.length <= searchArray.length) {
        j = 0;
        if (searchArray[j] = subArray[j]) {
            ++j;
        };
        ++i;
    };
    return outArray
}

console.log(isSubString("length", "no"))