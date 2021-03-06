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
d1.innerHTML = "<img src="/1.png" alt="1">";
const d2 = document.getElementById('d2');
d2.innerHTML = "<img src="/2.png" alt="2">";
const d3 = document.getElementById('d3');
d3.innerHTML = "<img src="/3.png" alt="3">";
const d4 = document.getElementById('d4');
d4.innerHTML = "<img src="/4.png" alt="4">";
const d5 = document.getElementById('d5');
d5.innerHTML = "<img src="/5.png" alt="5">";
const d6 = document.getElementById('d6');
d6.innerHTML = "<img src="/6.png" alt="6">";

function roll(){
    d.style.display ="none";
    d1.style.display ="none";
    d2.style.display ="none";
    d3.style.display ="none";
    d4.style.display ="none";
    d5.style.display ="none";
    d6.style.display ="none";
    button.style.display ="none";
    stun();
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
    d1.innerHTML = d1.textContent + d2.textContent;
    sleep(1,fd3);
}
function fd3(){
    d1.innerHTML = d1.textContent + d3.textContent;
    sleep(1,fbutton);
}
function fbutton(){
    button.style.display = "block";
}

function stun(){
    let droll = document.getElementById('droll');
    droll.innerHTML = "ダイスを振っています.";
    var id = setInterval(function () {
        droll.innerHTML = "ダイスを振っています..";
        var id = setInterval(function () {
            droll.innerHTML = "ダイスを振っています...";
            var id = setInterval(function () {
                droll.style.display = "none";
            }, 1000);
        }, 1000);
    }, 1000);
}

roll();
