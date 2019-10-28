<!doctype html>
<html lang="ja">

<head>
    <meta charset="utf-8" />
    <title>QR_code verification</title>
		<script type="text/javascript">
				function menu(){
		        location.href = "./MainMenu.jsp";
		    }
		</script>
		<style>
				.note {
						background-color: lime;
  					color: Black;
    				width: 500px;
    				height:500px;
				}
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
		<<  QR_code verification >>
		<br><br>
		<div class="note" style="font-size:xx-large"@color: white; background: lime>OK</div>
		<div style="font-size:large"@color: black; background: white>[success]</div>
		<a href="./MainMenuh>START</a><br>
		<input type="submit" name="processType" value="START" onClick="return menu()"/><br>
		<button>START</button><br>
		<audio autoplay id = "audio">
  		<source  src="/media/se_maoudamashii_chime13.wav" type="audio/wav">
		</audio>
		<iframe src="https://raw.githubusercontent.com/anars/blank-audio/master/500-milliseconds-of-silence.mp3" allow="autoplay" id="audio" style="display:none">
		</iframe>
	</body>
</html>