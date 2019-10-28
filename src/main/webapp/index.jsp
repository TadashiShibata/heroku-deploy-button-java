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
    <h1>QRコード読み取りデモ</h1>
		<br><br>
		<p>Read the bar code <br>
		<input type="text" name="example2" size="30" maxlength="30" value="BCD"></p>
		<a href="./MainMenu”>START</a><br>
		<input type="submit" name="processType" value="START" onClick="return menu()"/><br>
		<div aligin = center><button style="font-size:xx-large">>START</button></div>
	</body>
	<script src="./js/qr/qr_packed.js" charset="UTF-8"></script>
	<script type="text/javascript">
		function menu(){
		   location.href = "./MainMenu.jsp";
		}
	</script>
</html>