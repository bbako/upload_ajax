<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form id="f1">
  <table>
    <tr>
      <td colspan="2">File Upload</td>
    </tr>
    <tr>
      <th>Select File </th>
      <td><input id="upfile" name="file" type="file" multiple/></td>
    </tr>
    <tr>
      <td colspan="2">
        
      </td>
    </tr>
  </table>
</form>
<button id="btn">upload </button>
<ul id="show">

</ul>



	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(e) {
			var str ='';

			 $("#btn").click(function(evt){	 
			      evt.preventDefault();
			      console.log("upload start");
			      var formData = new FormData();
			      console.log($("#upfile")[0].files.length);
			      console.log($("#upfile"));
			      
			      for(var i=0; i<$("#upfile")[0].files.length; i++) {
			    	  formData.append("file",$("#upfile")[0].files[i]);
			    	  console.log($("#upfile")[0].files[i].name);
			    	}
			   
			   $.ajax({
			       url: '/upload',
			       type: 'POST',
			       data: formData,
			       contentType: false,
			       dataType : "text",
			       processData: false,
			       success: function (data) {
			       alert(data);
			       for(var i=0; i<$("#upfile")[0].files.length; i++) {
			    	   str += '<li><img src="/display?fName=test_'+$("#upfile")[0].files[i].name+'"></li>'; 
				    	}
			         console.log(str);
			         $("#show").html(str);
			         
			       }
			   });
			   return false;
			 });

		})
	</script>

</body>
</html>