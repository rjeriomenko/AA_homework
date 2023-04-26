function titleize(nameArr, cb) {
    const titles = nameArr.map(function (ele, i) {
        return `Mx. ${ele} "Mr. Grips" Burnette` ;
    });

    titles.forEach(function (ele) {
        console.log(ele)
    });
}

titleize(["Stefan", "Flatlander"])

function Elephant(name, height, tricks) {
    this.name = name;
    this.height = height;
    this.tricks = tricks;
}

Elephant.prototype.trumpet = function () {
    console.log(`${this.name} the giraffe goes "kekekekekekekek"`);
}

Elephant.prototype.grow = function () {
    this.height += 12;
}

Elephant.prototype.addTrick = function (trick) {
    this.tricks.push(trick);
}

Elephant.prototype.play = function () {
    console.log(this.tricks[Math.floor(Math.random() * this.tricks.length)])
}

let kek = new Elephant("Chungus", 9000, ["doing a flip"]);
kek.trumpet();
kek.grow();
console.log(kek.height);
kek.addTrick("standing on hooves")
console.log(kek.tricks)
kek.play()