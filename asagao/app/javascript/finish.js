function finish(){
    const p = document.getElementById("p");
    const c = document.getElementById("c");
    const winner = document.getElementById("winner");
    const retry = document.getElementById("retry");

    p.style.display = "none";
    c.style.display = "none";
    winner.style.display = "none";
    retry.style.display = "none";

    var id = setInterval(function () {
        p.style.display = "block";
        var id = setInterval(function () {
            c.style.display = "block";
            var id = setInterval(function () {
                winner.style.display = "block";
                var id = setInterval(function () {
                    retry.style.display = "block"
                },1000);
            },1000);
        },1000);
    },1000);
}

finish();
