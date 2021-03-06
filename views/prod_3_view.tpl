<!DOCTYPE html>
<head>
<!-- 对jquery的引用必须放在head中-->
  <script type="text/javascript" src="/static/js/jquery-2.1.3.min.js"></script>
  <script type="text/javascript" src="/static/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="/static/js/jquery.tablesorter.js"></script>
  <link type="text/css" href="/static/css/bootstrap.min.css" rel="stylesheet" />
<style type="text/css">
h3 {line-height: 150%;
  /*color: #DC143C;#000000*/
  color:#FFFFFF;
  background: #4682B4;/*#fff*/
  margin: 10;
  padding: 10;
  font-family: Georgia, Palatino, serif;
  }
</style>

</head>
<body>
<!-- <div class="navbar navba-default navbar-fixed-top">
</div> -->

<div class="container-fill">
  <!-- 这里添加项目目录树显示 -->
  <h3> <font size="5">{{.CategoryPhase.Title}}</font>
    <font size="4"> » {{.CategorySpec.Title}} » </font>
    <font size="5">{{.Category.Title}}</font>
  </h3>
  <h2>成果列表</h2>

<!--    <a href="/topic/add?id={{.Category.Id}}&mid=2" class="btn btn-primary">添加成果(一对一模式)</a> 
  <a href="/topic/add?id={{.Category.Id}}&mid=1" class="btn btn-default">添加成果(一对多(附件)模式)</a> -->

  <!-- <button id="directNextpage" onclick="window.location.reload('/topic/add?id={{.Category.Id}}&mid=1')">Direct Next Page</button> 这个方法跳不出去iframe
  onclick="window.open('/topic/add?id={{.Category.Id}}&mid=1')"新标签页中打开
  onclick="parent.location.href='/topic/add?id={{.Category.Id}}&mid=2'跳出iframe重新打开-->
<div class="col-lg-5">
<!--     <button id="directNextpage" class="btn btn-default" onclick="window.open('/topic/add?id={{.Category.Id}}&mid=1')">添加成果(一对一模式)</button>
    <button id="directNextpage" class="btn btn-default" onclick="parent.location.href='/topic/add?id={{.Category.Id}}&mid=2'">添加成果(一对多(附件)模式)</button> -->
    <button id="directNextpage" class="btn btn-default" onclick="window.open('/topic/add?id={{.Category.Id}}&mid=4')">添加成果(一对一模式)</button>
    <button id="directNextpage" class="btn btn-default" onclick="window.open('/topic/add?id={{.Category.Id}}&mid=5')">添加成果(一对多(附件)模式)</button>

  <input type="button" id="print" value="打印" onclick="print()" class="btn btn-default">
  </div>

 
      <!-- <button class="btn btn-primary" id="export">导出excel</button>  -->
<!-- 上面这个因为用ajax传值，所以不能成功下载。ajax不能重定向？
<a href="/topic/ExportToExcel?id={{.Category.Id}}" class="btn btn-primary">导出下载</a> -->


<table class="table table-striped">
  <thead>
    <tr>
      <th style="cursor: pointer"><input type="checkbox" name="checkall" onclick="CheckAll();" />全选#{{.Length}}</th>
      <th style="cursor: pointer">成果编号</th>
      <th style="cursor: pointer">成果名称</th>
      <th style="cursor: pointer">最后更新</th>
      <th style="cursor: pointer">浏览</th>
      <th style="cursor: pointer">回复数</th>
      <th>操作</th>
    </tr>
  </thead>
  <tbody>
    {{range $index,$elem:=.Chengguo}}
    <tr>
      <th><input type="checkbox" id="jd" name="checkbox" value="{{.Id}}"/>{{$index}}</th>
      <th><a href="/topic/view_b/{{.Id}}" title={{.Title}} target="_blank">{{substr .Tnumber 0 8}}</a></th>
      <th><a href="/topic/view_b/{{.Id}}" title={{.Title}} target="_blank">{{substr .Title 0 18}}</a></th>
      <th>{{dateformat .Updated "2006-01-02"}}</th>
      <th>{{.Views}}</th>
      <th>{{.ReplyCount}}</th>
      <th><a href="/topic/view_b/{{.Id}}" title={{.Title}} target="_blank">下载</a>
      <a href="/topic/modify?tid={{.Id}}" target="_blank">修改</a>
      <a href="/topic/delete?tid={{.Id}}">删除</a></th>
      <!--<th>
        <a href="/topic?op=del&id={{.Id}}">删除</a>
      </th>-->
    </tr>
    {{end}}
  </tbody>
<div class="col-md-1" role="group" aria‐label="...">

<form style="float:left" method="post" action="/topic/deleteall" enctype="multipart/form-data">
 <input type="hidden" id="tempstring" name="tempstring"/>
 <input type="hidden" id="cid" name="cid" value="{{.Category.Id}}" />
 <button type="submit" type="button" class="btn btn-default" onclick="return deleteall();">删除选中</button>
 </form>

 </div>
 <div class="col-md-1">

 <form method="post" action="/topic/downloadall" enctype="multipart/form-data">
 <input type="hidden" id="tempstring1" name="tempstring1"/>
 <input type="hidden" id="cid" name="cid" value="{{.Category.Id}}" />
 <button type="submit" type="button" class="btn btn-default" onclick="return downloadall();">下载选中</button>
  </form>

  </div>
  </table>
 
  </div>

<script>
    function CheckAll()
    {
    var a = document.getElementsByTagName('input');
    var b = document.getElementsByName('checkall');
    var n = a.length;  
    var allchecked = true;
         var bb = "";  
         var temp = "";
    if(b[0].checked)
    allchecked = true;
    else
    allchecked = false;
    for(var i=0;i<n;i++)
    {
    if(allchecked)
    a[i].checked = true;
    else
    a[i].checked = false;
    }
   }

   function deleteall()
   {
     var bb = "";  
     var temp = ""; 
     var a = document.getElementsByName("checkbox");
     for ( var i = 0; i<a.length; i++) {  
     if (a[i].checked) {  
     temp = a[i].value;  
     bb = bb + "," +temp;  
     }  
     } 
     document.getElementById("tempString").value = bb
      .substring(1, bb.length); 
    return true;  //这个return必须放最后，前面的值才能传到后台    
   }

   function downloadall()
   {
     var bb = "";  
     var temp = ""; 
     var a = document.getElementsByName("checkbox");
     for ( var i = 0; i<a.length; i++) {  
     if (a[i].checked) {  
     temp = a[i].value;  
     bb = bb + "," +temp;  
     }  
     } 
     document.getElementById("tempstring1").value = bb
             .substring(1, bb.length); 
    return true;  //这个return必须放最后，前面的值才能传到后台    
   }
</script>
<script type="text/javascript">
  $(document).ready(function() {
  $("table").tablesorter();
  // $("#ajax-append").click(function() {
  //    $.get("assets/ajax-content.html", function(html) {
  //     // append the "ajax'd" data to the table body
  //     $("table tbody").append(html);
  //     // let the plugin know that we made a update
  //     $("table").trigger("update");
  //     // set sorting column and direction, this will sort on the first and third column
  //     var sorting = [[2,1],[0,0]];
  //     // sort on the first column
  //     $("table").trigger("sorton",[sorting]);
  //   });
  //   return false;
  // });
});
</script>
</body>
</html>