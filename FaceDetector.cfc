<cfcomponent>
	<cffunction name="init" access="public" returntype="FaceDetector">
		<cfreturn this>
	</cffunction>

	<cffunction name="detectFace" access="public">
		<cfargument name="filePath" type="string">
		<cfargument name="outputFilePath" type="string">

		<cfset var classifier = CreateObject("java", "org.bytedeco.javacpp.opencv_objdetect$CascadeClassifier")>
		<cfset classifier.init(#expandPath(".")# & "\haarcascade_frontalface_alt.xml")>

		<cfset var faceDetections = CreateObject("java", "org.bytedeco.javacpp.opencv_core$Rect").init()>
		<cfset var imageUtil = createObject("java", "org.bytedeco.javacpp.opencv_highgui")>
		<cfset var image = imageUtil.imread(#filePath#)>

		<cfset classifier.detectMultiScale(image, faceDetections)>

		<cfset var core = createObject("java", "org.bytedeco.javacpp.opencv_core")>

		<cfset var rectStart = createObject("java", "org.bytedeco.javacpp.opencv_core$Point").init(faceDetections.x(), faceDetections.y())>
		<cfset var rectEnd = createObject("java", "org.bytedeco.javacpp.opencv_core$Point").init(faceDetections.x() + faceDetections.width(),
						faceDetections.y() + faceDetections.height())>

		<cfset var scalar = createObject("java", "org.bytedeco.javacpp.opencv_core$Scalar").init()>

		<cfset core.rectangle(image, rectStart, rectEnd, scalar)>

		<cfset imageUtil.imwrite(#outputFilePath#, image)>
	</cffunction>
</cfcomponent>