<%--
  Created by IntelliJ IDEA.
  User: ZYW
  Date: 2014/10/11
  Time: 10:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<!-- Mirrored from thevectorlab.net/flatlab/blank.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 08 Oct 2014 05:30:10 GMT -->
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Mosaddek">
    <meta name="keyword" content="FlatLab, Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
    <link rel="shortcut icon" href="img/favicon.html">

    <title>首页</title>

    <!-- Bootstrap core CSS -->
    <link href="<c:url value="/r/css/bootstrap.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/r/css/bootstrap-reset.css"/>" rel="stylesheet">
    <!--external css-->
    <link href="<c:url value="/r/css/font-awesome/css/font-awesome.css"/>" rel="stylesheet" />

    <!--right slidebar-->
    <link href="<c:url value="/r/css/slidebars.css"/>" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="<c:url value="/r/css/style.css"/>" rel="stylesheet">
    <link href="<c:url value="/r/css/style-responsive.css"/>" rel="stylesheet" />

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 tooltipss and media queries -->
    <!--[if lt IE 9]>
    <script src="<c:url value='/r/js/html5shiv.js'/>"></script>
    <script src="<c:url value='/r/js/respond.min.js'/>"></script>
    <![endif]-->
</head>

<body>

<section id="container" class="">
<!--header start-->
<header class="header white-bg">
<div class="sidebar-toggle-box">
    <div data-original-title="Toggle Navigation" data-placement="right" class="fa fa-bars tooltips"></div>
</div>
<!--logo start-->
<a href="index.html" class="logo" >Flat<span>lab</span></a>
<!--logo end-->
<div class="nav notify-row" id="top_menu">
<!--  notification start -->
<ul class="nav top-menu">
<!-- settings start -->
<li class="dropdown">
    <a data-toggle="dropdown" class="dropdown-toggle" href="#">
        <i class="fa fa-tasks"></i>
        <span class="badge bg-success">6</span>
    </a>
    <ul class="dropdown-menu extended tasks-bar">
        <div class="notify-arrow notify-arrow-green"></div>
        <li>
            <p class="green">You have 6 pending tasks</p>
        </li>
        <li>
            <a href="#">
                <div class="task-info">
                    <div class="desc">Dashboard v1.3</div>
                    <div class="percent">40%</div>
                </div>
                <div class="progress progress-striped">
                    <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                        <span class="sr-only">40% Complete (success)</span>
                    </div>
                </div>
            </a>
        </li>
        <li>
            <a href="#">
                <div class="task-info">
                    <div class="desc">Database Update</div>
                    <div class="percent">60%</div>
                </div>
                <div class="progress progress-striped">
                    <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                        <span class="sr-only">60% Complete (warning)</span>
                    </div>
                </div>
            </a>
        </li>
        <li>
            <a href="#">
                <div class="task-info">
                    <div class="desc">Iphone Development</div>
                    <div class="percent">87%</div>
                </div>
                <div class="progress progress-striped">
                    <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 87%">
                        <span class="sr-only">87% Complete</span>
                    </div>
                </div>
            </a>
        </li>
        <li>
            <a href="#">
                <div class="task-info">
                    <div class="desc">Mobile App</div>
                    <div class="percent">33%</div>
                </div>
                <div class="progress progress-striped">
                    <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 33%">
                        <span class="sr-only">33% Complete (danger)</span>
                    </div>
                </div>
            </a>
        </li>
        <li>
            <a href="#">
                <div class="task-info">
                    <div class="desc">Dashboard v1.3</div>
                    <div class="percent">45%</div>
                </div>
                <div class="progress progress-striped active">
                    <div class="progress-bar"  role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width: 45%">
                        <span class="sr-only">45% Complete</span>
                    </div>
                </div>

            </a>
        </li>
        <li class="external">
            <a href="#">See All Tasks</a>
        </li>
    </ul>
</li>
<!-- settings end -->
<!-- inbox dropdown start-->
<li id="header_inbox_bar" class="dropdown">
    <a data-toggle="dropdown" class="dropdown-toggle" href="#">
        <i class="fa fa-envelope-o"></i>
        <span class="badge bg-important">5</span>
    </a>
    <ul class="dropdown-menu extended inbox">
        <div class="notify-arrow notify-arrow-red"></div>
        <li>
            <p class="red">You have 5 new messages</p>
        </li>
        <li>
            <a href="#">
                <span class="photo"><img alt="avatar" src="<c:url value="/r/images/avatar-mini.jpg"/>"></span>
                                    <span class="subject">
                                    <span class="from">Jonathan Smith</span>
                                    <span class="time">Just now</span>
                                    </span>
                                    <span class="message">
                                        Hello, this is an example msg.
                                    </span>
            </a>
        </li>
        <li>
            <a href="#">
                <span class="photo"><img alt="avatar" src="<c:url value="/r/images/avatar-mini2.jpg"/>"></span>
                                    <span class="subject">
                                    <span class="from">Jhon Doe</span>
                                    <span class="time">10 mins</span>
                                    </span>
                                    <span class="message">
                                     Hi, Jhon Doe Bhai how are you ?
                                    </span>
            </a>
        </li>
        <li>
            <a href="#">
                <span class="photo"><img alt="avatar" src="<c:url value="/r/images/avatar-mini3.jpg"/>"></span>
                                    <span class="subject">
                                    <span class="from">Jason Stathum</span>
                                    <span class="time">3 hrs</span>
                                    </span>
                                    <span class="message">
                                        This is awesome dashboard.
                                    </span>
            </a>
        </li>
        <li>
            <a href="#">
                <span class="photo"><img alt="avatar" src="<c:url value="/r/images/avatar-mini4.jpg"/>"></span>
                                    <span class="subject">
                                    <span class="from">Jondi Rose</span>
                                    <span class="time">Just now</span>
                                    </span>
                                    <span class="message">
                                        Hello, this is metrolab
                                    </span>
            </a>
        </li>
        <li>
            <a href="#">See all messages</a>
        </li>
    </ul>
</li>
<!-- inbox dropdown end -->
<!-- notification dropdown start-->
<li id="header_notification_bar" class="dropdown">
    <a data-toggle="dropdown" class="dropdown-toggle" href="#">

        <i class="fa fa-bell-o"></i>
        <span class="badge bg-warning">7</span>
    </a>
    <ul class="dropdown-menu extended notification">
        <div class="notify-arrow notify-arrow-yellow"></div>
        <li>
            <p class="yellow">You have 7 new notifications</p>
        </li>
        <li>
            <a href="#">
                <span class="label label-danger"><i class="fa fa-bolt"></i></span>
                Server #3 overloaded.
                <span class="small italic">34 mins</span>
            </a>
        </li>
        <li>
            <a href="#">
                <span class="label label-warning"><i class="fa fa-bell"></i></span>
                Server #10 not respoding.
                <span class="small italic">1 Hours</span>
            </a>
        </li>
        <li>
            <a href="#">
                <span class="label label-danger"><i class="fa fa-bolt"></i></span>
                Database overloaded 24%.
                <span class="small italic">4 hrs</span>
            </a>
        </li>
        <li>
            <a href="#">
                <span class="label label-success"><i class="fa fa-plus"></i></span>
                New user registered.
                <span class="small italic">Just now</span>
            </a>
        </li>
        <li>
            <a href="#">
                <span class="label label-info"><i class="fa fa-bullhorn"></i></span>
                Application error.
                <span class="small italic">10 mins</span>
            </a>
        </li>
        <li>
            <a href="#">See all notifications</a>
        </li>
    </ul>
</li>
<!-- notification dropdown end -->
</ul>
</div>
<div class="top-nav ">
    <ul class="nav pull-right top-menu">
        <li>
            <input type="text" class="form-control search" placeholder="Search">
        </li>
        <!-- user login dropdown start-->
        <li class="dropdown">
            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                <img alt="" src="<c:url value="/r/images/avatar1_small.jpg"/>">
                <span class="username">Jhon Doue</span>
                <b class="caret"></b>
            </a>
            <ul class="dropdown-menu extended logout">
                <div class="log-arrow-up"></div>
                <li><a href="#"><i class=" fa fa-suitcase"></i>Profile</a></li>
                <li><a href="#"><i class="fa fa-cog"></i> Settings</a></li>
                <li><a href="#"><i class="fa fa-bell-o"></i> Notification</a></li>
                <li><a href="login.html"><i class="fa fa-key"></i> Log Out</a></li>
            </ul>
        </li>

        <!-- user login dropdown end -->
        <li class="sb-toggle-right">
            <i class="fa  fa-align-right"></i>
        </li>
    </ul>
</div>
</header>
<!--header end-->

<!--sidebar start-->
<aside>
    <div id="sidebar"  class="nav-collapse ">
        <!-- sidebar menu start-->
        <ul class="sidebar-menu" id="nav-accordion">
            <li>
                <a href="index.html">
                    <i class="fa fa-dashboard"></i>
                    <span>仪表盘</span>
                </a>
            </li>

            <li class="sub-menu">
                <a href="javascript:;">
                    <i class="fa fa-cogs"></i>
                    <span>系统管理</span>
                </a>
                <ul class="sub">
                    <li><a  href="boxed_page.html">资源管理</a></li>
                    <li><a  href="horizontal_menu.html">角色管理</a></li>
                    <li><a  href="language_switch_bar.html">用户管理</a></li>
                    <li><a  href="email_template.html" target="_blank">日志管理</a></li>
                </ul>
            </li>

            <li class="sub-menu">
                <a href="javascript:;">
                    <i class="fa fa-book"></i>
                    <span>UI Elements</span>
                </a>
                <ul class="sub">
                    <li><a  href="general.html">General</a></li>
                    <li><a  href="buttons.html">Buttons</a></li>
                    <li><a  href="widget.html">Widget</a></li>
                    <li><a  href="slider.html">Slider</a></li>
                    <li><a  href="nestable.html">Nestable</a></li>
                    <li><a  href="tree.html">Tree View</a></li>
                    <li><a  href="font_awesome.html">Font Awesome</a></li>
                </ul>
            </li>

            <li class="sub-menu">
                <a href="javascript:;">
                    <i class="fa fa-laptop"></i>
                    <span>Components</span>
                </a>
                <ul class="sub">
                    <li><a  href="grids.html">Grids</a></li>
                    <li><a  href="calendar.html">Calendar</a></li>
                    <li><a  href="gallery.html">Gallery</a></li>
                    <li><a  href="todo_list.html">Todo List</a></li>
                    <li><a  href="draggable_portlet.html">Draggable Portlet</a></li>
                </ul>
            </li>
            <li class="sub-menu">
                <a href="javascript:;" >
                    <i class="fa fa-tasks"></i>
                    <span>Form Stuff</span>
                </a>
                <ul class="sub">
                    <li><a  href="form_component.html">Form Components</a></li>
                    <li><a  href="advanced_form_components.html">Advanced Components</a></li>
                    <li><a  href="form_wizard.html">Form Wizard</a></li>
                    <li><a  href="form_validation.html">Form Validation</a></li>
                    <li><a  href="dropzone.html">Dropzone File Upload</a></li>
                    <li><a  href="inline_editor.html">Inline Editor</a></li>
                    <li><a  href="image_cropping.html">Image Cropping</a></li>
                    <li><a  href="file_upload.html">Multiple File Upload</a></li>
                </ul>
            </li>
            <li class="sub-menu">
                <a href="javascript:;">
                    <i class="fa fa-th"></i>
                    <span>Data Tables</span>
                </a>
                <ul class="sub">
                    <li><a  href="basic_table.html">Basic Table</a></li>
                    <li><a  href="responsive_table.html">Responsive Table</a></li>
                    <li><a  href="dynamic_table.html">Dynamic Table</a></li>
                    <li><a  href="editable_table.html">Editable Table</a></li>
                </ul>
            </li>
            <li class="sub-menu">
                <a href="javascript:;" >
                    <i class=" fa fa-envelope"></i>
                    <span>Mail</span>
                </a>
                <ul class="sub">
                    <li><a  href="inbox.html">Inbox</a></li>
                    <li><a  href="inbox_details.html">Inbox Details</a></li>
                </ul>
            </li>
            <li class="sub-menu">
                <a href="javascript:;">
                    <i class=" fa fa-bar-chart-o"></i>
                    <span>Charts</span>
                </a>
                <ul class="sub">
                    <li><a  href="morris.html">Morris</a></li>
                    <li><a  href="chartjs.html">Chartjs</a></li>
                    <li><a  href="flot_chart.html">Flot Charts</a></li>
                    <li><a  href="xchart.html">xChart</a></li>
                </ul>
            </li>
            <li class="sub-menu">
                <a href="javascript:;">
                    <i class="fa fa-shopping-cart"></i>
                    <span>Shop</span>
                </a>
                <ul class="sub">
                    <li><a  href="product_list.html">List View</a></li>
                    <li><a  href="product_details.html">Details View</a></li>
                </ul>
            </li>
            <li>
                <a href="google_maps.html" >
                    <i class="fa fa-map-marker"></i>
                    <span>Google Maps </span>
                </a>
            </li>
            <li class="sub-menu">
                <a href="javascript:;">
                    <i class="fa fa-comments-o"></i>
                    <span>Chat Room</span>
                </a>
                <ul class="sub">
                    <li><a  href="lobby.html">Lobby</a></li>
                    <li><a  href="chat_room.html"> Chat Room</a></li>
                </ul>
            </li>
            <li class="sub-menu">
                <a href="javascript:;" class="active" >
                    <i class="fa fa-glass"></i>
                    <span>Extra</span>
                </a>
                <ul class="sub">
                    <li class="active"><a  href="blank.html">Blank Page</a></li>
                    <li><a  href="sidebar_closed.html">Sidebar Closed</a></li>
                    <li><a  href="people_directory.html">People Directory</a></li>
                    <li><a  href="coming_soon.html">Coming Soon</a></li>
                    <li><a  href="lock_screen.html">Lock Screen</a></li>
                    <li><a  href="profile.html">Profile</a></li>
                    <li><a  href="invoice.html">Invoice</a></li>
                    <li><a  href="search_result.html">Search Result</a></li>
                    <li><a  href="pricing_table.html">Pricing Table</a></li>
                    <li><a  href="faq.html">FAQ</a></li>
                    <li><a  href="fb_wall.html">FB Wall</a></li>
                    <li><a  href="404.html">404 Error</a></li>
                    <li><a  href="500.html">500 Error</a></li>
                </ul>
            </li>
            <li>
                <a  href="login.html">
                    <i class="fa fa-user"></i>
                    <span>Login Page</span>
                </a>
            </li>

            <!--multi level menu start-->
            <li class="sub-menu">
                <a href="javascript:;" >
                    <i class="fa fa-sitemap"></i>
                    <span>Multi level Menu</span>
                </a>
                <ul class="sub">
                    <li><a  href="javascript:;">Menu Item 1</a></li>
                    <li class="sub-menu">
                        <a  href="boxed_page.html">Menu Item 2</a>
                        <ul class="sub">
                            <li><a  href="javascript:;">Menu Item 2.1</a></li>
                            <li class="sub-menu">
                                <a  href="javascript:;">Menu Item 3</a>
                                <ul class="sub">
                                    <li><a  href="javascript:;">Menu Item 3.1</a></li>
                                    <li><a  href="javascript:;">Menu Item 3.2</a></li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                </ul>
            </li>
            <!--multi level menu end-->

        </ul>
        <!-- sidebar menu end-->
    </div>
</aside>
<!--sidebar end-->
<!--main content start-->
<section id="main-content">
    <section class="wrapper site-min-height">
        <!--state overview start-->
        <div class="row state-overview">
            <div class="col-lg-3 col-sm-6">
                <section class="panel">
                    <div class="symbol terques">
                        <i class="fa fa-user"></i>
                    </div>
                    <div class="value">
                        <h1 class="count">
                            0
                        </h1>
                        <p>New Users</p>
                    </div>
                </section>
            </div>
            <div class="col-lg-3 col-sm-6">
                <section class="panel">
                    <div class="symbol red">
                        <i class="fa fa-tags"></i>
                    </div>
                    <div class="value">
                        <h1 class=" count2">
                            0
                        </h1>
                        <p>Sales</p>
                    </div>
                </section>
            </div>
            <div class="col-lg-3 col-sm-6">
                <section class="panel">
                    <div class="symbol yellow">
                        <i class="fa fa-shopping-cart"></i>
                    </div>
                    <div class="value">
                        <h1 class=" count3">
                            0
                        </h1>
                        <p>New Order</p>
                    </div>
                </section>
            </div>
            <div class="col-lg-3 col-sm-6">
                <section class="panel">
                    <div class="symbol blue">
                        <i class="fa fa-bar-chart-o"></i>
                    </div>
                    <div class="value">
                        <h1 class=" count4">
                            0
                        </h1>
                        <p>Total Profit</p>
                    </div>
                </section>
            </div>
        </div>
        <!--state overview end-->
    </section>
</section>
<!--main content end-->

<!-- Right Slidebar start -->
<div class="sb-slidebar sb-right sb-style-overlay">
    <h5 class="side-title">Online Customers</h5>
    <ul class="quick-chat-list">
        <li class="online">
            <div class="media">
                <a href="#" class="pull-left media-thumb">
                    <img alt="" src="<c:url value="/r/images/chat-avatar2.jpg"/>" class="media-object">
                </a>
                <div class="media-body">
                    <strong>John Doe</strong>
                    <small>Dream Land, AU</small>
                </div>
            </div><!-- media -->
        </li>
        <li class="online">
            <div class="media">
                <a href="#" class="pull-left media-thumb">
                    <img alt="" src="<c:url value="/r/images/chat-avatar.jpg"/>" class="media-object">
                </a>
                <div class="media-body">
                    <div class="media-status">
                        <span class=" badge bg-important">3</span>
                    </div>
                    <strong>Jonathan Smith</strong>
                    <small>United States</small>
                </div>
            </div><!-- media -->
        </li>

        <li class="online">
            <div class="media">
                <a href="#" class="pull-left media-thumb">
                    <img alt="" src="<c:url value="/r/images/pro-ac-1.png"/>" class="media-object">
                </a>
                <div class="media-body">
                    <div class="media-status">
                        <span class=" badge bg-success">5</span>
                    </div>
                    <strong>Jane Doe</strong>
                    <small>ABC, USA</small>
                </div>
            </div><!-- media -->
        </li>
        <li class="online">
            <div class="media">
                <a href="#" class="pull-left media-thumb">
                    <img alt="" src="<c:url value="/r/images/avatar1.jpg"/>" class="media-object">
                </a>
                <div class="media-body">
                    <strong>Anjelina Joli</strong>
                    <small>Fockland, UK</small>
                </div>
            </div><!-- media -->
        </li>
        <li class="online">
            <div class="media">
                <a href="#" class="pull-left media-thumb">
                    <img alt="" src="<c:url value="/r/images/mail-avatar.jpg"/>" class="media-object">
                </a>
                <div class="media-body">
                    <div class="media-status">
                        <span class=" badge bg-warning">7</span>
                    </div>
                    <strong>Mr Tasi</strong>
                    <small>Dream Land, USA</small>
                </div>
            </div><!-- media -->
        </li>
    </ul>
    <h5 class="side-title"> pending Task</h5>
    <ul class="p-task tasks-bar">
        <li>
            <a href="#">
                <div class="task-info">
                    <div class="desc">Dashboard v1.3</div>
                    <div class="percent">40%</div>
                </div>
                <div class="progress progress-striped">
                    <div style="width: 40%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="40" role="progressbar" class="progress-bar progress-bar-success">
                        <span class="sr-only">40% Complete (success)</span>
                    </div>
                </div>
            </a>
        </li>
        <li>
            <a href="#">
                <div class="task-info">
                    <div class="desc">Database Update</div>
                    <div class="percent">60%</div>
                </div>
                <div class="progress progress-striped">
                    <div style="width: 60%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="60" role="progressbar" class="progress-bar progress-bar-warning">
                        <span class="sr-only">60% Complete (warning)</span>
                    </div>
                </div>
            </a>
        </li>
        <li>
            <a href="#">
                <div class="task-info">
                    <div class="desc">Iphone Development</div>
                    <div class="percent">87%</div>
                </div>
                <div class="progress progress-striped">
                    <div style="width: 87%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="20" role="progressbar" class="progress-bar progress-bar-info">
                        <span class="sr-only">87% Complete</span>
                    </div>
                </div>
            </a>
        </li>
        <li>
            <a href="#">
                <div class="task-info">
                    <div class="desc">Mobile App</div>
                    <div class="percent">33%</div>
                </div>
                <div class="progress progress-striped">
                    <div style="width: 33%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="80" role="progressbar" class="progress-bar progress-bar-danger">
                        <span class="sr-only">33% Complete (danger)</span>
                    </div>
                </div>
            </a>
        </li>
        <li>
            <a href="#">
                <div class="task-info">
                    <div class="desc">Dashboard v1.3</div>
                    <div class="percent">45%</div>
                </div>
                <div class="progress progress-striped active">
                    <div style="width: 45%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="45" role="progressbar" class="progress-bar">
                        <span class="sr-only">45% Complete</span>
                    </div>
                </div>

            </a>
        </li>
        <li class="external">
            <a href="#">See All Tasks</a>
        </li>
    </ul>
</div>
<!-- Right Slidebar end -->

<!--footer start-->
<footer class="site-footer">
    <div class="text-center">
        2013 &copy; FlatLab by VectorLab.
        <a href="#" class="go-top">
            <i class="fa fa-angle-up"></i>
        </a>
    </div>
</footer>
<!--footer end-->
</section>

<!-- js placed at the end of the document so the pages load faster -->
<script src="<c:url value='/r/js/jquery.js'/>"></script>
<script src="<c:url value='/r/js/bootstrap.min.js'/>"></script>
<script class="include" type="text/javascript" src="<c:url value='/r/js/jquery.dcjqaccordion.2.7.js'/>"></script>
<script src="<c:url value='/r/js/jquery.scrollTo.min.js'/>"></script>
<script src="<c:url value='/r/js/slidebars.min.js'/>"></script>
<script src="<c:url value='/r/js/jquery.nicescroll.js'/>" type="text/javascript"></script>
<script src="<c:url value='/r/js/respond.min.js'/>" ></script>

<!--common script for all pages-->
<script src="<c:url value='/r/js/common-scripts.js'/>"></script>
<script src="<c:url value='/r/js/app.js'/>"></script>



</body>

<!-- Mirrored from thevectorlab.net/flatlab/blank.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 08 Oct 2014 05:30:10 GMT -->
</html>
