<cfcomponent>
	<cfset this.name = "FaceDetector">

	<cfset THIS.javaSettings = {LoadPaths = [".\lib\opencv.jar", ".\lib\opencv-windows-x86_64.jar", ".\lib\javacpp.jar"], loadColdFusionClassPath = true, reloadOnChange = false}>

</cfcomponent>