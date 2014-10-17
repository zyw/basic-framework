<%--
  Created by IntelliJ IDEA.
  User: ZYW
  Date: 2014/10/13
  Time: 13:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<script src="<c:url value='/r/js/jquery.treetable.js'/>" type="text/javascript"></script>
<script src="<c:url value='/r/js/chosen.jquery.min.js'/>" type="text/javascript"></script>
<script src="<c:url value='/r/js/jquery.form.js'/>" type="text/javascript"></script>
<script src="<c:url value='/r/js/toastr.min.js'/>" type="text/javascript"></script>
<script src="<c:url value='/r/js/jquery.validate.min.js'/>" type="text/javascript"></script>
<script src="<c:url value='/r/js/jquery.multi-select.js'/>" type="text/javascript"></script>
<script src="<c:url value='/r/js/jquery.ztree.core-3.5.min.js'/>" type="text/javascript"></script>
<script src="<c:url value='/r/js/respond.min.js'/>" ></script>

<!--common script for all pages-->
<script src="<c:url value='/r/js/common-scripts.js'/>"></script>
<script src="<c:url value='/r/js/app.js'/>"></script>



</body>

<!-- Mirrored from thevectorlab.net/flatlab/blank.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 08 Oct 2014 05:30:10 GMT -->
</html>
