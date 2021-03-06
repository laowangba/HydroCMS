<!DOCTYPE html>
{{template "header"}}
<title>检索 - 水利设计CMS系统</title>
</head>

<body>
<div class="navbar navba-default navbar-fixed-top">
  <div class="container-fill">{{template "navbar" .}}</div>
</div>

<div class="col-lg-12">
  <h1>检索成果列表</h1>
<table class="table table-striped">
  <thead>
    <tr>
      <th><span style="cursor: pointer">#{{.Length}}</span></th>
      <th><span style="cursor: pointer">成果编号</span></th>
      <th><span style="cursor: pointer">成果名称</span></th>
      <th><span style="cursor: pointer">成果类型</span></th>
      <th><span style="cursor: pointer">最后更新</span></th>
      <th><span style="cursor: pointer">浏览</span></th>
      <th><span style="cursor: pointer">回复数</span></th>
      <th><span style="cursor: pointer">最后回复</span></th>
      <th>操作</th>
    </tr>
  </thead>
  <tbody>
  <!-- <ol> -->
   {{range $index, $elem :=.Searchs}}
    <tr><!--tr表格的行，td定义一个单元格，<th> 标签定义表格内的表头单元格-->
      <th>{{$index}}</th>
      <th><a href="/topic/view_b/{{.Id}}">{{substr .Tnumber 0 15}}</a></th>
      <th><a href="/topic/view_b/{{.Id}}" title={{.Title}}><i class="glyphicon glyphicon-fire"></i>{{substr .Title 0 15}}</a></th>
      <th>{{.Category}}</th><!-- {{.Attachment}} -->
      <th>{{dateformat .Updated "2006-01-02"}}</th>
      <th>{{.Views}}</th>
      <th>{{.ReplyCount}}</th>
      <th>{{dateformat .ReplyTime "2006-01-02"}}</th>
      <th><a href="/topic/view_b/{{.Id}}">下载</a>
      <a href="/topic/modify?tid={{.Id}}">修改</a>
      <a href="/topic/delete?tid={{.Id}}">删除</a></th>
    </tr>
    {{end}}
    <!-- </ol> -->
  </tbody>
 </table>

  </div>
<script type="text/javascript">
  $(document).ready(function() {
  $("table").tablesorter();
  $("#ajax-append").click(function() {
     $.get("assets/ajax-content.html", function(html) {
      // append the "ajax'd" data to the table body
      $("table tbody").append(html);
      // let the plugin know that we made a update
      $("table").trigger("update");
      // set sorting column and direction, this will sort on the first and third column
      var sorting = [[2,1],[0,0]];
      // sort on the first column
      $("table").trigger("sorton",[sorting]);
    });
    return false;
  });
});
</script>

</body>
</html>
