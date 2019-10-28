<!DOCTYPE html>
<html>
	<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>QR_code verification</title>
		<script type="text/javascript">
				function menu(){
		        location.href = "./MainMenu.jsp";
		    }
		</script>
	</head>
	<body>
		<<  QR_code verification >>
		<br><br>
		<p>Read the bar code <br>
		<input type="text" name="example2" size="30" maxlength="30" value="BCD"></p>
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