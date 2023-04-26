function titleize(nameArr, cb) {
    const titles = nameArr.map(function(ele, i) {
        return `Mx. ${ele} "Mr. Grips" Burnette` ;
    });

    titles.forEach(function(ele) {
        console.log(ele)
    });
}

titleize(["Stefan", "Flatlander"])

function Elephant() {
    this.hi = function() {
        console.log("hi")
    }
}

let kek = Elephant();
kek.hi();