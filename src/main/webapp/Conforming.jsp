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
		<style>
			@media screen and (mini-width:480px){
				#content{margin-right:200px;}
			}
		</style>
    <title>QR_code verification</title>
	</head>

	<body>
		<<  QR_code verification >>
		<br><br>
		<div style="font-size: 300px;"@color: white; background: lime>OK</div>
		<div style="font-size:large"@color: black; background: white>[success]</div>
		<a href="./MainMenuh>START</a><br>
		<input type="submit" name="processType" value="START" onClick="return menu()"/><br>
		<div aligin = center><button style="font-size:xx-large">START</button></div>

		<audio autoplay id = "audio">
  		<source  src="/media/se_maoudamashii_chime13.wav" type="audio/wav">
		</audio>
		<iframe src="https://raw.githubusercontent.com/anars/blank-audio/master/500-milliseconds-of-silence.mp3" allow="autoplay" id="audio" style="display:none">
		</iframe>
	</body>
</html>