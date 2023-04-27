document.addEventListener("DOMContentLoaded", function(){
});


const canvas = document.getElementById("mycanvas");
const ctx = canvas.getContext("2d");

//Drawing window of canvas
ctx.strokeStyle = "blue"
ctx.strokeRect(0, 0, 500, 500);

//Drawing rectangle
ctx.fillStyle = "red"
ctx.fillRect(1, 499, 40, -200);


//Drawing circle
ctx.beginPath();
ctx.arc(150, 150, 100, 0, 90);
ctx.strokeStyle = "purple";
ctx.lineWidth = 5;
ctx.fillStyle = "orange";
ctx.fill();
ctx.stroke();


function drawRectangle(x) {
    ctx.clearRect(1, 499, 494, -200);
    ctx.fillStyle = "red"
    ctx.fillRect(x, 499, 40, -200);
}

function animateRectangle() {
    let rectX = 1;
    let direction = "right";
    setInterval(function() {
        if (rectX < 449 && direction === "right") {
            rectX += 10;
            drawRectangle(rectX);
        } else if (rectX === 451) {
            direction = "left";
            rectX -= 10;
            drawRectangle(rectX);
        } else if (rectX > 1 && direction === "left") {
            rectX -= 10;
            drawRectangle(rectX);
        } else {
            direction = "right";
            rectX += 10;
            drawRectangle(rectX);
        }
        console.log(rectX)
    }, 28)
};

animateRectangle()