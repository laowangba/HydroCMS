<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>CSS3垂直手风琴折叠菜单DEMO演示</title>
  <link href="/static/Font-Awesome-4.4.0/css/font-awesome.min.css" rel="stylesheet">
  <link rel="stylesheet" href="/static/css/celanstyle.css">
<script type="text/javascript" src="/static/js/jquery-2.1.3.min.js"></script>
 <link rel="stylesheet" href="/static/css/cebianlan.css" media="screen" type="text/css" />
 <script type="text/javascript" src="/static/js/bootstrap.min.js"></script>
 <script src="/static/js/bootstrap-treeview.js"></script>
<link rel="stylesheet" type="text/css" href="/static/css/bootstrap.min.css"/>
</head>
<!-- <link href="bootstrap.css" rel="stylesheet"> -->
<!-- Required Javascript -->
<!-- <script src="jquery.js"></script> -->
<!-- <link rel="stylesheet" href="/static/editor.md/css/editormd.css" /> -->
<div id="treeview" class="col-xs-2"></div>
<script type="text/javascript">
$(function() {
        var defaultData = [
          {
            text: 'Parent 1',
            // icon: "glyphicon glyphicon-stop",
            // selectedIcon: "glyphicon glyphicon-heart",
            href: '#parent1',
            tags: ['4'],
            state: {
            checked: true,
            disabled: false,
            expanded: false,
            selected: true
            },
            tags: ['available'],
            nodes: [
              {
                text: 'Child 1',
                // icon: "glyphicon glyphicon-stop",
                // selectedIcon: "glyphicon glyphicon-heart",                
                href: '#child1',
                tags: ['2'],
                nodes: [
                  {
                    text: 'Grandchild 1',
                    href: '#grandchild1',
                    tags: ['0']
                  },
                  {
                    text: 'Grandchild 2',
                    href: '#grandchild2',
                    tags: ['0']
                  }
                ]
              },
              {
                text: 'Child 2',
                href: '#child2',
                tags: ['0']
              }
            ]
          },
          {
            text: 'Parent 2',
            href: '#parent2',
            tags: ['0'],
            nodes: [
              {
                text: 'Child 1',
                href: '#child1',
                tags: ['2'],
                nodes: [
                  {
                    text: 'Grandchild 1',
                    href: '#grandchild1',
                    tags: ['0']
                  },
                  {
                    text: 'Grandchild 2',
                    href: '#grandchild2',
                    tags: ['0']
                  }
                ]
              },
              {
                text: 'Child 2',
                href: '#child2',
                tags: ['0']
              }
            ]
          },
          {
            text: 'Parent 3',
            href: '#parent3',
             tags: ['0']
          },
          {
            text: 'Parent 4',
            href: '#parent4',
            tags: ['0']
          },
          {
            text: 'Parent 5',
            href: '#parent5'  ,
            tags: ['0']
          }
        ];

        var alternateData = [
          {
            text: 'Parent 1',
            tags: ['2'],
            nodes: [
              {
                text: 'Child 1',
                tags: ['3'],
                nodes: [
                  {
                    text: 'Grandchild 1',
                    tags: ['6']
                  },
                  {
                    text: 'Grandchild 2',
                    tags: ['3']
                  }
                ]
              },
              {
                text: 'Child 2',
                tags: ['3']
              }
            ]
          },
          {
            text: 'Parent 2',
            tags: ['7']
          },
          {
            text: 'Parent 3',
            icon: 'glyphicon glyphicon-earphone',
            href: '#demo',
            tags: ['11']
          },
          {
            text: 'Parent 4',
            icon: 'glyphicon glyphicon-cloud-download',
            href: '/demo.html',
            tags: ['19'],
            selected: true
          },
          {
            text: 'Parent 5',
            icon: 'glyphicon glyphicon-certificate',
            color: 'pink',
            backColor: 'red',
            href: 'http://www.tesco.com',
            tags: ['available','0']
          }
        ];
          // $('#treeview').treeview('collapseAll', { silent: true });
          $('#treeview').treeview({
          data: defaultData,
          collapseIcon:"glyphicon glyphicon-chevron-up",
          expandIcon:"glyphicon glyphicon-chevron-down",
          
        });
});





// function getTree() {
//   // Some logic to retrieve, or generate tree structure
//   var tree = [
//   {
//     text: "Parent 1",
//     nodes: [
//       {
//         text: "Child 1",
//         nodes: [
//           {
//             text: "Grandchild 1"
//           },
//           {
//             text: "Grandchild 2"
//           }
//         ]
//       },
//       {
//         text: "Child 2"
//       }
//     ]
//   },
//   {
//     text: "Parent 2"
//   },
//   {
//     text: "Parent 3"
//   },
//   {
//     text: "Parent 4"
//   },
//   {
//     text: "Parent 5"
//   }
// ];
//   return data;
// }

// $('#tree').treeview({data: getTree()});
</script>


<!-- <body>
<div style="text-align:center;clear:both">

</div>

  <ul id="accordion" class="accordion">
    <li>
      <div class="link"><i class="fa fa-paint-brush"></i>Diseño web<i class="fa fa-chevron-down"></i></div>
      <ul class="submenu">
        <li><a href="#">Photoshop</a></li>
        <li><a href="#">HTML</a></li>
        <li><a href="#">CSS</a></li>
        <li><a href="#">Maquetacion web</a></li>
      </ul>
    </li>
    <li>
      <div class="link"><i class="fa fa-code"></i>Desarrollo front-end<i class="fa fa-chevron-down"></i></div>
      <ul class="submenu">
        <li><a href="#">Javascript</a></li>
        <li><a href="#">jQuery</a></li>
        <li><a href="#">Frameworks javascript</a></li>
      </ul>
    </li>
    <li>
      <div class="link"><i class="fa fa-mobile"></i>Diseño responsive<i class="fa fa-chevron-down"></i></div>
      <ul class="submenu">
        <li><a href="#">Tablets</a></li>
        <li><a href="#">Dispositivos mobiles</a></li>
        <li><a href="#">Medios de escritorio</a></li>
        <li><a href="#">Otros dispositivos</a></li>
      </ul>
    </li>
    <li><div class="link"><i class="fa fa-globe"></i>Posicionamiento web<i class="fa fa-chevron-down"></i></div>
      <ul class="submenu">
        <li><a href="#">Google</a></li>
        <li><a href="#">Bing</a></li>
        <li><a href="#">Yahoo</a></li>
        <li><a href="#">Otros buscadores</a></li>
      </ul>
    </li>
  </ul>
  <script src="/static/js/cebianlan.js"></script> -->



<!-- <aside class="accordion">
<h1>News</h1>
<div class="opened-for-codepen">
<h2>News Item #1</h2>
<div class="opened-for-codepen">
<h3>News Item #1a</h3>
<div>
<h4>News Subitem 1</h4>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,  quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>

<h4>News Subitem 2</h4>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,  quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>

<h4>News Subitem 3</h4>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,  quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
</div>

<h3>News Item #1b</h3>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,  quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>

<h3>News Item #1c</h3>
<div class="opened-for-codepen">
<h4>News Subitem 1</h4>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,  quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>

<h4>News Subitem 2</h4>
<p class="opened-for-codepen">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </p>
</div>
</div>

<h2>News Item #2</h2>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>

<h2>News Item #3</h2>
<div>
<h3>News Item #3a</h3>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,  quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>

<h3>News Item #3b</h3>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,  quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
</div>
</div>

<h1>Updates</h1>
<div>
<h2>Update #1</h2>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,  quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>

<h2>Update #2</h2>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>

<h2>Update #3</h2>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>

<h2>Update #4</h2>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
</div>

<h1>Miscellaneous</h1>
<div>
<h2>Misc. #1</h2>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,  quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>

<h2>Misc. #2</h2>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>

<h2>Misc. #3</h2>
<div>
<h3>Misc. Item #1a</h3>
<div>
<h4>Misc. Subitem 1</h4>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,  quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>

<h4>Misc. Subitem 2</h4>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,  quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>

<h4>Misc. Subitem 3</h4>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,  quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
</div>
<h3>Misc. Item #2a</h3>
<div>
<h4>Misc. Subitem 1</h4>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,  quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>

<h4>Misc. Subitem 2</h4>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,  quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
</div>
</div>
</div>
</aside>

<script src="/static/js/celan.js"></script> -->
</body>

</html>