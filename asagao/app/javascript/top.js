function sleep(waitMSec, callbackFunc) {
    // 経過時間（秒）
    var spanedSec = 0;
    // 1秒間隔で無名関数を実行
    var id = setInterval(function () {
        spanedSec++;
        // 経過時間 >= 待機時間の場合、待機終了。
        if (spanedSec >= waitMSec) {
            // タイマー停止
            clearInterval(id);
            // 完了時、コールバック関数を実行
            callbackFunc();
        }
    }, 1000);
}

const button = document.getElementById('button');
const d = document.getElementById('d');
const d1 = document.getElementById('d1');
const d2 = document.getElementById('d2');
const d3 = document.getElementById('d3');

function roll(){
    document.getElementById("d").style.display ="none";
    document.getElementById("d1").style.display ="none";
    document.getElementById("d2").style.display ="none";
    document.getElementById("d3").style.display ="none";
    document.getElementById("button").style.display ="none";
    stun(1);
    sleep(3,fd);
}

function fd(){
    d.style.display = "block";
    sleep(1,fd1);
}
function fd1(){
    d1.style.display = "block";
    sleep(1,fd2);
}
function fd2(){
    d2.style.display = "block";
    sleep(1,fd3);
}
function fd3(){
    d3.style.display = "block";
    sleep(1,fbutton);
}
function fbutton(){
    button.style.display = "block";
}

function stun(time){
    document.getElementById('droll').innerHTML = "ダイスを振っています.";
    var id = setInterval(function () {
        document.getElementById('droll').innerHTML = "ダイスを振っています..";
        var id = setInterval(function () {
            document.getElementById('droll').innerHTML = "ダイスを振っています...";
        }, 1000);
    }, 1000);
}

roll();

