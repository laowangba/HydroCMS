<!DOCTYPE html>
{{template "header"}}
<title>项目&目录 - 水利设计CMS系统</title>
<style>
i#delete
{
color:#DC143C;
}
</style>
</head>

<body>
<div class="navbar navba-default navbar-fixed-top">
  <div class="container-fill">{{template "navbar" .}}</div>
</div>

<div class="col-lg-12">
  <h1>项目列表</h1>
    <a href="/category/add" class="btn btn-default" title="一旦添加，不可更改名称和目录！">添加项目</a>
    <a href="/category/add_b" class="btn btn-default">添加自定义主题</a>
    <!-- <a href="/category/add_b" class="btn btn-default">添加标准成果</a> -->
    <button class="btn btn-success" onclick="parent.location.href='/topic/add?mid=7'" title="文件名必须符合规定：SL1999AT-100-99某某布置图.dwg">快捷上传</button>
      <table class="table table-striped">
       <thead>
         <tr>
           <th style="cursor: pointer">#{{.Length}}</th>
           <th style="cursor: pointer">项目编号</th>
           <th style="cursor: pointer">项目名称</th>
           <th style="cursor: pointer">项目类型</th>
           <th style="cursor: pointer">负责人</th>
           <th style="cursor: pointer">成果数量</th>
           <th style="cursor: pointer">建立时间</th>
           <!-- <th style="cursor: pointer">修改时间</th> -->
           <th>操作</th>
         </tr>
       </thead>

       <tbody>
   
         {{range $index, $elem :=.Category}}
         <tr>
         <input type="hidden" id="categoryid" name="{{.Id}}" value="{{.Id}}" />
          <th> {{indexaddone $index}}</th><!--{{printf "%d" $index}} -->
          <th><a href="/category?op=view&id={{.Id}}" id="number">{{.Number}}</a></th>
         <th><a href="/category?op=view&id={{.Id}}" id="name"><i class="glyphicon glyphicon-plane"></i>{{.Title}}</a></th>
         <th>
          {{range $k1,$v1 :=$.Label}}
          {{if eq $elem.Id $v1.Category.Id}}
          <a href="/category?op=viewlabel&label={{.Title}}" ><span class="label label-info">{{.Title}}</span></a>
          {{end}}
          {{end}}

         </th>
         <th>{{.Author}}</th>
         <th>{{.TopicCount}}</th>
         <th>{{dateformat .Created "2006-01-02 "}}</th>
         <!-- <th>{{dateformat .Updated "2006-01-02 "}}</th>          -->
       <th>
         <!-- <a href="/category?op=view&id={{.Id}}">显示</a> -->
         <a href="/category/modify?cid={{.Id}}"><i class="glyphicon glyphicon-edit"></i>修改</a>
         <!-- <a href="/category?op=del&id={{.Id}}"><i id="delete" class="glyphicon glyphicon-remove-sign"></i>删除</a> -->
         <a href="" id="{{.Id}}" onclick="deletecategory('{{.Id}}')"><i id="delete" class="glyphicon glyphicon-remove-sign"></i>删除</a>
       </th>
     </tr>
     {{end}}
   
     </tbody>
     </table>

<!-- float: right;调整位置 -->
  <div style="text-align:center;padding-left: 100px;margin-top: -24px;float: right;" class="pagination">
    {{if .paginator}}
        {{if gt .paginator.PageNums 1}}
    <ul class="pagination pagination-sm">
      {{if .paginator.HasPrev}}
      <li>
        <a href="{{.paginator.PageLinkFirst}}">首页</a>
      </li>
      <li>
        <a href="{{.paginator.PageLinkPrev}}">上一页</a>
      </li>
      {{else}}
      <li class="disabled">
        <a>首页</a>
      </li>
      <li class="disabled">
        <a>上一页</a>
      </li>
      {{end}}
            {{range $index, $page := .paginator.Pages}}
      <li{{if $.paginator.IsActive .}} class="active"{{end}}>
        <a href="{{$.paginator.PageLink $page}}">{{$page}}</a>
      </li>
      {{end}}
            {{if .paginator.HasNext}}
      <li>
        <a href="{{.paginator.PageLinkNext}}">下一页</a>
      </li>
      <li>
        <a href="{{.paginator.PageLinkLast}}">末页</a>
      </li>
      {{else}}
      <li class="disabled">
        <a>下一页</a>
      </li>
      <li class="disabled">
        <a>末页</a>
      </li>
      {{end}}
      <li class="disabled">
        <a>
          共{{.paginator.Nums }}条数据 每页{{.paginator.PerPageNums}}条 当前{{.paginator.Page}}/{{.paginator.PageNums}}页
        </a>
      </li>
      <li>
        <input type="text" type="submit" id="p" name="p" placeholder="跳转页" style="width: 47px;height: 30px;border: 1px solid #dddddd;border-left: 0px;border-radius: 0px 4px 4px 0px;text-align: center;"/>
      </li>
    </ul>
    {{end}} 
  {{end}}
  </div>

     
  </div>

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

 function deletecategory(id) {
    if(confirm("确定删除吗？")){
 $.ajax({
                type:"post",
                url:"/category/delete",
                data: {cid:id,url:window.location.href},//父级id
                success:function(data,status){
                  alert("删除“"+data+"”成功！(status:"+status+".)");
                  // window.location=window.location
                 }
            });
 // window.location.reload();这句可有可无？
// window.location.href='findAllFoods.action';

}else{
return false;
}
}
// alert(window.location.href);

//保持页面滚动条位置
window.onbeforeunload = function () { 
var scrollPos; 
if (typeof window.pageYOffset != 'undefined') { 
scrollPos = window.pageYOffset; 
} 
else if (typeof document.compatMode != 'undefined' && 
document.compatMode != 'BackCompat') { 
scrollPos = document.documentElement.scrollTop; 
} 
else if (typeof document.body != 'undefined') { 
scrollPos = document.body.scrollTop; 
} 
document.cookie = "scrollTop=" + scrollPos; //存储滚动条位置到cookies中 
} 

window.onload = function () { 
if (document.cookie.match(/scrollTop=([^;]+)(;|$)/) != null) { 
var arr = document.cookie.match(/scrollTop=([^;]+)(;|$)/); //cookies中不为空，则读取滚动条位置 
document.documentElement.scrollTop = parseInt(arr[1]); 
document.body.scrollTop = parseInt(arr[1]); 
} 
}

</script>
</body>
</html>