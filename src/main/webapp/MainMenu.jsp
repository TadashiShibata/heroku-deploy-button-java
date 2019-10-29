<!doctype html>
<html lang="ja">

<head>
    <meta charset="utf-8" />
    <meta name="viewport"
        content="width=device-width, intial-scale=1, mininum-scale=1, maximum-scale=1, user-scalable=no, shrink-to-fit=no" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />

    <style>
        .qrbtn {
            background-color: red;
            color: #fff;
            margin: 3em auto;
            width: 100%;
            height: 2em;
            padding: 20px;
            border-radius: 9px;
        }

    </style>
</head>

<body>
    <h1>QRコード読み取りデモ</h1>
    <div>
        <button style="font-size:x-large" type="button" id="changeCamera">前面／背面 切り替え</button>
    </div>

    <div id="video-input">
        <div style="text-align: center">
            <video id="video" style="width: 80%; height: 50%;" autoplay playsinline></video>
        </div>
        <img id="img" />
        <div style="display: none">
            <canvas id="canvas"></canvas>
        </div>

        <div style="margin-top: 3em">
            <p style="font-weight: bold; margin-bottom: 5px">アクティブなカメラ</p>
            <p id="active-camera" style="margin-top: 5px"></p>
        </div>
    </div>

    <div id="photo-input" style="display: none">
        <div style="text-align: center">
            <label for="input-qr" class="qrbtn">QRコードを読み取る</label>
            <input type="file" id="input-qr" accept="image/*" capture="environment" tabindex="-1" style="display: none"
                onchange="openQRCamera(this);">
        </div>
    </div>

    <div style="margin-top: 3em">
        <label for="qr">読み取ったQRコード<br></label>
        <input type="text" id="qr"   value="" style="width:100%">
				<input type="text" id="qrqr" value="" style="width:100%">
    </div>
    <div style="margin-top: 3em">
        <button type="button" id="toCamera">通常カメラでの読み取りに切り替え</button>
        <button type="button" id="toMovie" style="display: none">ビデオカメラでの読み取りに切り替え</button>
    </div>
</body>

<script src="./js/qr/qr_packed.js" charset="UTF-8"></script>
<script type="text/javascript">
    var localStream = null;
    var ios = /iPad|iPhone|iPod|Mac OS X/.test(navigator.userAgent);
    var devices;
    var activeIndex;
    var iosRear = 'user';
    var postCount = 0;

    function decodeImageFromBase64(data, callback) {
        qrcode.callback = callback;
        qrcode.decode(data);
    }

    function decode() {
        if (localStream) {
            var canvas = document.getElementById('canvas');
            var ctx = canvas.getContext('2d');
            var h;
            var w;

            w = video.videoWidth;
            h = video.videoHeight;

            canvas.setAttribute('width', w);
            canvas.setAttribute('height', h);
            ctx.drawImage(video, 0, 0, w, h);

            decodeImageFromBase64(canvas.toDataURL('image/png'), function (decodeInformation) {
                var input = document.getElementById('qr');
                if (!(decodeInformation instanceof Error)) {
                    input.value = decodeInformation;
										if(input.value === 'A08030329_92515'){				
											qrqr.value = '正しいQRコードです !';
											location.href = 'https://protected-cove-81704.herokuapp.com/Conforming.jsp';
										}else{
											qrqr.value = '誤ったQRコードです !';
											location.href = 'https://protected-cove-81704.herokuapp.com/Discrepancy.jsp';
										}
                }
            });
        }
    }

    function openQRCamera(node) {
        var reader = new FileReader();
        reader.onload = function () {
            node.value = '';
            qrcode.callback = function (res) {
                if (res instanceof Error) {
                    alert('QRコードが見つかりませんでした。QRコードがカメラのフレーム内に収まるよう、再度撮影してください。');
                } else {
                    var qr = document.getElementById('qr');
                    qr.value = res;
										if(qr.value === 'A08030329_92515'){
											qrqr.value = '正しいQRコードです !';
											location.href = 'https://protected-cove-81704.herokuapp.com/Conforming.jsp';
										}else{
											qrqr.value = '誤ったQRコードです !';
											location.href = 'https://protected-cove-81704.herokuapp.com/Discrepancy.jsp';
										}
                }
            };

            qrcode.decode(reader.result);
        };

        reader.readAsDataURL(node.files[0]);
    }

    window.onload = function () {
        var modeChange = function (mode) {
            if (mode === 'camera') {
                document.getElementById('video-input').style.display = 'none';
                document.getElementById('photo-input').style.display = 'block';
                document.getElementById('toCamera').style.display = 'none';
                document.getElementById('toMovie').style.display = 'block';
            } else {
                document.getElementById('video-input').style.display = 'block';
                document.getElementById('photo-input').style.display = 'none';
                document.getElementById('toCamera').style.display = 'block';
                document.getElementById('toMovie').style.display = 'none';
            }
        };

        navigator.mediaDevices = navigator.mediaDevices || ((navigator.mozGetUserMedia || navigator.webkitGetUserMedia) ? {
            getUserMedia: function (c) {
                return new Promise(function (y, n) {
                    (navigator.mozGetUserMedia || navigator.webkitGetUserMedia).call(navigator, c, y, n);
                });
            }
        } : null);

        if (!navigator.mediaDevices) {
            modeChange('camera');
            return;
        }

        var videoOptions;

        if (ios) {
            videoOptions = {
                facingMode: 'user',
                width: 1280,
                height: 720,
                frameRate: 15
            };
        } else {
            videoOptions = {
                facingMode: 'user',
                minWidth: 1280,
                maxWidth: 720
            };
        }

        navigator.mediaDevices.getUserMedia({
            audio: false,
            video: videoOptions
        })
            .then(function (stream) {
                localStream = stream;

                navigator.mediaDevices.enumerateDevices()
                    .then(function (cameras) {
                        var camCount = 0;

                        cameras.forEach(function (device) {
                            if (device.kind === 'videoinput') {
                                camCount++;
                            }
                        });

                        if (camCount === 0) {
                            alert('カメラが見つかりません');
                        } else {
                            changeCamera();
                        }
                    })
                    .catch(function (err) {
                        alert('ビデオカメラの読み取りでエラーが発生しました');
                    });
            });

        var video = document.getElementById('video');

        var startReadQR = function () {
            setInterval('decode();', 500);
        };

        var changeCamera = function () {
            if (localStream) {
                localStream.getVideoTracks()[0].stop();
            }

            var p = document.getElementById('active-camera');
            p.innerHTML = iosRear === 'user' ? '前面カメラ' : '背面カメラ';
            setCamera();
        };

        var setCamera = function () {
            window.URL = window.URL || window.webkitURL;

            // var videoOptions;

            if (ios) {
                videoOptions = {
                    facingMode: iosRear,
                    width: 1280,
                    height: 720,
                    frameRate: 15
                };
            } else {
                videoOptions = {
                    facingMode: iosRear,
                    width: 1280,
                    height: 720
                };
            }

            navigator.mediaDevices.getUserMedia({
                audio: false,
                video: videoOptions
            })
                .then(function (stream) {
                    localStream = stream;
                    video.srcObject = stream;
                    startReadQR();
                })
                .fail(function (err) {
                    alert('ビデオの読み取りに失敗しました。');
                });
        };

        document.getElementById('toCamera').addEventListener('click', function () {
            modeChange('camera');
        });

        document.getElementById('toMovie').addEventListener('click', function () {
            modeChange('video');
        });

        document.getElementById('changeCamera').addEventListener('click', function () {
            if (iosRear === 'environment') {
                iosRear = 'user';
            } else {
                iosRear = 'environment';
            }

            changeCamera();
        }, false);
    };
</script>

</html>
