<%--
  Created by IntelliJ IDEA.
  User: 17395
  Date: 11/3/2019
  Time: 10:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    pageContext.setAttribute("ContextPath",request.getContextPath());
%>
<html>
<head>
    <title>Ajax</title>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

    <script type="text/javascript" src="${ContextPath}/jQuery/jquery-3.1.1.min.js"></script>
    <link rel="stylesheet" href="${ContextPath}/css/bootstrap.min.css"/>
<%--    <script src="${ContextPath}/JS/bootstrap.min.js"></script>--%>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

</head>
<body>

    <!-- Modal -->
    <div id="user_Modal" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Add employee</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="name">name:</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="name" name="name" placeholder="Enter name">
                                <span class="help-block"></span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label  class="control-label col-sm-2" for="gender">gender:</label>
                            <div class="col-sm-10">
                                <input  class="control-label col-sm-offset-2" type="radio" name="gender" value="male" id="gender"> male
                                &nbsp;&nbsp;&nbsp;
                                <input type="radio" value="female" name="gender">female
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-sm-2" for="mail">mail:</label>
                            <div class="col-sm-10">
                                <input type="email" class="form-control" id="mail" name="email" placeholder="Enter your email">
                                <span class="help-block"></span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label  class="control-label col-sm-2" for="add_dep">department:</label>
                            <div class="col-sm-4">
                                <select class="form-control" id="add_dep" name="depName">
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <button type="button" class="btn btn-default" id="table_submit">Submit</button>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal update-->
    <div id="user_Modal_update" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Update employee</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="upd_name">name:</label>
                            <div class="col-sm-10">
                                <p class="form-control-static" id="upd_name" name="name"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label  class="control-label col-sm-2" for="upd_gender_m">gender:</label>
                            <div class="col-sm-10">
                                <input  class="control-label col-sm-offset-2" type="radio" name="gender" value="male" id="upd_gender_m"> male
                                &nbsp;&nbsp;&nbsp;
                                <input type="radio" value="female" name="gender"  id="upd_gender_f">female
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-sm-2" for="upd_mail">mail:</label>
                            <div class="col-sm-10">
                                <input type="email" class="form-control" id="upd_mail" name="email" placeholder="Enter your email">
                                <span class="help-block"></span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label  class="control-label col-sm-2" for="upd_dep">department:</label>
                            <div class="col-sm-4">
                                <select class="form-control" id="upd_dep" name="depName">
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <button type="button" class="btn btn-default" id="table_update">Update</button>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>


    <div class="container">

        <div class="jumbotron text-center">
            <h1>My First Bootstrap Page</h1>
            <p>Resize this responsive page to see the effect!</p>
        </div>

        <div class="row">
            <div class="col-lg-12"><h1>Employee Table</h1></div>
        </div>

        <div class="row">
            <div class="col-lg-4 col-lg-offset-8">
                <button class="btn btn-info" id="add_user">ADD</button>
                <button class="btn btn-danger" id="delete_user">DELETE</button>
            </div>
        </div>

        <div class="table-responsive">
            <table class="table" id="Table">
                <thead>
                <tr>
                    <th><input type="checkbox" id="check_all"/></th>
                    <th>id</th>
                    <th>name</th>
                    <th>gender</th>
                    <th>email</th>
                    <th>department</th>
                    <th>operation</th>
                </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
        </div>

        <div class="row">
            <div class="col-lg-4" id="pages_info_area">
            </div>

            <div class="col-lg-offset-6" id="pin">
<%--                <nav class="Page navigation">--%>
<%--                    <ul class="pagination">--%>
<%--                        <li class="page-item"><a class="page-link" href="#">Previous</a></li>--%>
<%--                        <li class="page-item"><a class="page-link" href="#">1</a></li>--%>
<%--                        <li class="page-item"><a class="page-link" href="#">2</a></li>--%>
<%--                        <li class="page-item"><a class="page-link" href="#">3</a></li>--%>
<%--                        <li class="page-item"><a class="page-link" href="#">Next</a></li>--%>
<%--                    </ul>--%>
<%--                </nav>--%>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        var totalPage,totalRecord,currentPage;

       $(function(){
           //go to page1 when browser first load network
          to_page(1)
       });

       //page transfer
       function to_page(pn){
           currentPage = pn;
           $("#check_all").prop("checked",false);
           $.ajax({
               url:"${ContextPath}/employee/findAll",
               data:"PN="+pn,
               type:"GET",
               success:function(result){
                   // console.log(result);
                   //1.解析并显示员工数据
                   build_table(result);

                   //2.1 解析并显示分页信息
                   build_pages_info(result);
                   //2.2 显示分页目录
                   build_pages_nav(result);
               }
           });
       }

       //1. 建立表格
       function build_table(result){
           //clear data, avoid to old data remind after new ajax require was sent.
           $("#Table tbody").empty()

            var employee = result.map.pageInfo.list;
       //    JQuery 遍历函数:$.each(遍历元素, 回量函数(索引, 当前对象){...})
           $.each(employee, function(index,item){
               // window.alert(item.name);
               // 用JQuery创建一个td元素并在其中添加内容；
               var checkItem = $("<td></td>").append($("<input type='checkbox'/>").addClass("check_item"));
               var empIdTD = $("<td></td>").append(item.id);
               var empNameTD = $("<td></td>").append(item.name);
               var empGenderTD = $("<td></td>").append(item.gender);
               var empemailTD = $("<td></td>").append(item.email);
               var empDepartmentTD = $("<td></td>").append(item.department.depName);
               // var button = $("<td>" +
               //     "<button class=\"btn btn-primary\" value=\"UPDATE\">" +
               //     "<span class=\"glyphicon glyphicon-pencil\" aria-hidden=\"true\"/>&nbsp;UPDATE" +
               //     "</button>" +"&nbsp;"+
               //     "<button class=\"btn btn-danger\" value=\"DELETE\">" +
               //     "<span class=\"glyphicon glyphicon-trash\" aria-hidden=\"true\"/>&nbsp;DELETE" +
               //     "</button>" +
               //     "</td>");
               var button =$("<td></td>").append($("<button></button>").attr("class","btn btn-primary edit_btn").attr("value","UPDATE").attr("empId",item.id)
                                                .append($("<span></span>").attr("class","glyphicon glyphicon-pencil").attr("aria-hidden","true")
                                                       .append("&nbsp;UPDATE")))
                                         .append("&nbsp;")
                                         .append($("<button></button>").attr("class","btn btn-danger delete_btn").attr("value","DELETE").attr("empId",item.id)
                                                .append($("<span></span>").attr("class","glyphicon glyphicon-trash").attr("aria-hidden","true")
                                                        .append("&nbsp;DELETE")))

               $("<tr></tr>").append(checkItem)
                   .append(empIdTD)
                   .append(empNameTD)
                   .append(empGenderTD)
                   .append(empemailTD)
                   .append(empDepartmentTD)
                   .append(button)
                   .appendTo("#Table tbody");
           })
       }
       //2. 获取page信息
       function build_pages_info(result){
           //clear data, avoid to old data remind after new ajax require was sent.
           $("#pages_info_area").empty()

           $("#pages_info_area").append("<b>rowCount: "+result.map.pageInfo.total+"</b>");
           totalPage = result.map.pageInfo.pageSize+1;
           totalRecord = result.map.pageInfo.total;
       }

       function build_pages_nav(result){
           //clear data, avoid to old data remind after new ajax require was sent.
           $("#pin").empty()

           var ul = $("<ul></ul>").addClass("pagination")
           var firstPage = $("<il></il>").addClass("page-item").append($("<a></a>").attr("href","#").attr("class","page-link").append("initiate"));
           var prePage = $("<il></il>").addClass("page-item").append($("<a></a>").attr("href","#").attr("class","page-link").append("&laquo;"));
           if(!result.map.pageInfo.hasPreviousPage){
               firstPage.addClass("disabled");
               prePage.addClass("disabled");
           }else{
               firstPage.click(function(){
                   to_page(1)
               })
               prePage.click(function(){
                   to_page(result.map.pageInfo.pageNum-1)
               })
           }

           var subPage = $("<il></il>").addClass("page-item").append($("<a></a>").attr("href","#").attr("class","page-link").append("&raquo;"));
           var LastPage = $("<il></il>").addClass("page-item").append($("<a></a>").attr("href","#").attr("class","page-link").append("ultimate"));
           if (!result.map.pageInfo.hasNextPage){
               subPage.addClass("disabled");
               LastPage.addClass("disabled");
           }else{
               subPage.click(function(){
                   to_page(result.map.pageInfo.pageNum+1)
               })
               LastPage.click(function(){
                   to_page(result.map.pageInfo.pages)
               })
           }

           //将起始页和上一页按钮添加到ul中
           ul.append(firstPage).append(prePage);
           //以此添加要显示的页码按钮
           $.each(result.map.pageInfo.navigatepageNums, function(index,item){
               var page = $("<il></il>").attr("class","page-item").append($("<a></a>").attr("href","#").attr("class","page-link").append(item));
               page.click(function(){
                   to_page(item)
               })
               if(result.map.pageInfo.pageNum == item){
                   page = page.addClass("active");
               }
               ul.append(page);
           });
           //将末页和下一页按钮添加到ul中
           ul.append(subPage).append(LastPage);

           //将ul添加到<nav>中
           var navEl = $("<nav></nav>").append(ul).addClass("Page navigation");
           //将<nav>添加到对应的id区域中(注意要在id前加‘#’)
           navEl.appendTo("#pin");
       }


        function form_reset(elem){
            // $(elem)[0].reset();
            $(elem).find("*").removeClass("has-error has-success");
            $(elem).find(".help-block").text("");
            $(elem+" form")[0].reset();

        }
       $("#add_user").click(function(){
           //reset form
           form_reset("#user_Modal");

           get_depts("#add_dep");

           $('#user_Modal').modal({
               backdrop:"static"
           });
       });

       function get_depts(Modal_name){
           $.ajax({
               url:"${ContextPath}/depts",
               type:"GET",
               success:function (result) {
                   $(Modal_name).empty();
                   // console.log(result);
                   var departments = result.map.Dept_Info;
                   $(Modal_name).append("<option></option>").addClass("form-control").attr("value","")
                   $.each(departments, function(index,item){
                       $(Modal_name).append($("<option></option>").append(item.depName).addClass("form-control").attr("value",item.depName)).attr("name","depName")
                   })
               }
           })
       }

       //function to check data in the table
        function validate_add_form(){
            //remove
            $("#name").parent().removeClass("has-error has-success")
            $("#name").next("span").text("").removeClass("glyphicon glyphicon-ok")
           //1.1 name
            var name = $("#name").val()
            //1.22 regular expression name   mean: username support characters a-z,A-Z,0-9,_,- and length of 3-16 OR Chinese.
            var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]+$)/
            if(!regName.test(name)){
                //alert("username must be characters with a-z,A-Z,0-9,_,- and length of 3-16");
                //confer a class to the parent class of #name
                $("#name").parent().addClass("has-error")
                //text the span tag which next to the #name
                $("#name").next("span").text("username must be characters with a-z,A-Z,0-9,_,- and length of 3-16")
                return false;
            }else{
                //confer a class to the parent class of #name
                $("#name").parent().addClass("has-success")
                //text the span tag which next to the #name
                $("#name").next("span").addClass("glyphicon glyphicon-ok").attr("aria-hidden","true")
            }

            //remove
            $("#mail").parent().removeClass("has-error has-success")
            $("#mail").next("span").text("").removeClass("glyphicon glyphicon-ok")
            //2.1 mail
            var mail = $("#mail").val()
            //2.2 regular expression mail   mean: email support characters (a-z,A-Z,0-9,_,.,-)@(a-z,A-Z).(a-z and length of 2-6).
            var regMail = /^([a-zA-Z0-9_\.-]+)@([\da-zA-Z\.-]+)\.([a-z\.]{2,6})$/
            if(!regMail.test(mail)){
                //alert("email formation is wrong")
                //confer a class to the parent class of #mail
                $("#mail").parent().addClass("has-error")
                //text the span tag which next to the #mail
                $("#mail").next("span").text("email formation is wrong")
            }else{
                //confer a class to the parent class of #mail
                $("#mail").parent().addClass("has-success")
                //text the span tag which next to the #mail
                $("#mail").next("span").addClass("glyphicon glyphicon-ok").attr("aria-hidden","true")
            }

            return true;
        }

        //check the duplicate in the database
        //the function running when the contest of input change
        $("#name").change(function(){
            var name = $("#name").val();
           $.ajax({
               url:"${ContextPath}/employee/checkuser",
               data:"name="+name,
               type:"POST",
               success:function(result){
                   if(result.code==100){
                       $("#name").parent().removeClass("has-error has-success");
                       $("#name").parent().addClass("has-success");
                       $("#name").next("span").text("");
                       $("#table_submit").attr("ajax_val","success")
                   }else{
                       $("#name").parent().removeClass("has-error has-success");
                       $("#name").parent().addClass("has-error");
                       $("#name").next("span").text("duplicate username");
                       $("#table_submit").attr("ajax_val","error")
                   }
               }
           })
        })


       $("#table_submit").click(function(){
           //1. submit info to service to save table,

           //  check the data which submit to service on front, if false, return false
            if(!validate_add_form()){
                return false;
            }

            //1.1 judge the duplicate function: $("#name").change(function(){...})
           if($("#table_submit").attr("ajax_val")=="error"){
               $("#name").parent().removeClass("has-error has-success");
               $("#name").parent().addClass("has-error");
               $("#name").next("span").text("duplicate username").removeClass("glyphicon glyphicon-ok");
               return false;
           }
           //2. send ajax request
           //alert( decodeURIComponent($("#user_Modal form").serialize()))
           $.ajax({
               url:"${ContextPath}/employee/save_table",
               type:"POST",//Must be POST method
               data:$("#user_Modal form").serialize(),
               success:function (result) {
                   if(result.code == 100){
                       //close the modal
                       $("#user_Modal").modal("hide");
                       //jump to the last page
                       //the variate of to_page can be anything which over the last page
                       to_page(totalPage+1000);
                   }else{
                       console.log(result);

                       if(result.map.errorMap.name == undefined){
                           check_modal("#name", "has-success", result.map.errorMap.name)
                       }else{
                           check_modal("#name", "has-error", result.map.errorMap.name)
                       }
                       if(result.map.errorMap.email == undefined){
                           check_modal("#mail", "has-success", result.map.errorMap.email)
                       }else{
                           check_modal("#mail", "has-error", result.map.errorMap.email)
                       }
                   }
               }
           })
       })

        function check_modal(Obj, check, text){
            //remove
            $(Obj).parent().removeClass("has-error has-success")
            $(Obj).next("span").text("").removeClass("glyphicon glyphicon-ok")
           if(check == "has-error"){
               //confer a class to the parent class of #id
               $(Obj).parent().addClass(check)
               //text the span tag which next to the #id
               $(Obj).next("span").text(text)
           }else{
               //confer a class to the parent class of #id
               $(Obj).parent().addClass(check)
               //text the span tag which next to the #id
               $(Obj).next("span").addClass("glyphicon glyphicon-ok").attr("aria-hidden","true")
           }
        }

        //Because .edit_btn was created by ajax, so we should band the offspring of .edit_btn with click function though 'on'
        $(document).on("click",".edit_btn",function () {
            //remove
            $("#upd_mail").parent().removeClass("has-error has-success");
            $("#upd_mail").next("span").text("").removeClass("glyphicon glyphicon-ok");

            //alert("asdasdasd")
            // reset form
            form_reset("#user_Modal_update");
            get_depts("#upd_dep");
            getEmp($(this).attr("empId"));
            $("#table_update").attr("empId",$(this).attr("empId"));
            $("#user_Modal_update").modal({
                backdrop:"static"
            });
        });

       function getEmp(id){
           $.ajax({
                url:"${ContextPath}/employee/getEmp/"+id,
                type:"GET",
               success:function(result){
                    console.log(result)
                   var resultData = result.map.empWithDep;
                   $("#upd_name").text(resultData.name);
                   $("#user_Modal_update input[name=gender]").val([resultData.gender]);

                   $("#upd_mail").val(resultData.email);
                   $("#user_Modal_update select").val([resultData.department.depName]);
               }
           });
       }

       $("#table_update").click(function () {
           //remove
           $("#upd_mail").parent().removeClass("has-error has-success")
           $("#upd_mail").next("span").text("").removeClass("glyphicon glyphicon-ok")
           //2.1 mail
           var mail = $("#upd_mail").val()
           //2.2 regular expression mail   mean: email support characters (a-z,A-Z,0-9,_,.,-)@(a-z,A-Z).(a-z and length of 2-6).
           var regMail = /^([a-zA-Z0-9_\.-]+)@([\da-zA-Z\.-]+)\.([a-z\.]{2,6})$/
           if(!regMail.test(mail)){
               //alert("email formation is wrong")
               //confer a class to the parent class of #mail
               $("#upd_mail").parent().addClass("has-error")
               //text the span tag which next to the #mail
               $("#upd_mail").next("span").text("email formation is wrong")
               return false;
           }else{
               //confer a class to the parent class of #mail
               $("#upd_mail").parent().addClass("has-success")
               //text the span tag which next to the #mail
               $("#upd_mail").next("span").addClass("glyphicon glyphicon-ok").attr("aria-hidden","true")
           }

           $.ajax({
              url:"${ContextPath}/employee/save_updEmp/"+$(this).attr("empId"),
               //Because the 'HiddenHttpMethodFilter' in web.xml can change POST request to PUT and DELETE request
               type:"POST",
               data: $("#user_Modal_update form").serialize()+"&_method=PUT",
               success:function (result) {
                   $("#user_Modal_update").modal("hide");
                   alert(result.message)
                   to_page(currentPage)
               }
           });
       })

      $(document).on("click",".delete_btn",function(){
          // find the parent tag of ".delete_btn" and find the second td which is 'name' and catch the name element
          var empName = $(this).parents("tr").find("td:eq(2)").text();
          var id = $(this).attr("empId");
          if(confirm("Are you sure delete "+empName+"?")){
             $.ajax({
                 url:"${ContextPath}/employee/deleteEmp/"+id,
                 type:"DELETE",
                 success:function(result){
                     alert(result.message)
                     to_page(currentPage)
                 }
             })
          }
      })

      $("#check_all").click(function () {
          //prop as same as attr, but prop use to judge checkbox or radio input.
          //alert($(this).prop("checked"));
          $(".check_item").prop("checked",$(this).prop("checked"));
      });

       $(document).on("click",".check_item",function(){
           //alert($(".check_item:checked").length);
           var flag = $(".check_item:checked").length == $(".check_item").length;
           $("#check_all").prop("checked",flag);
       })

        $("#delete_user").click(function(){
            var empNames = "";
            var id_str = "";
            $.each($(".check_item:checked"),function(){
                // alert($(this).parents("tr").find("td:eq(2)").text());
                empNames += $(this).parents("tr").find("td:eq(2)").text()+",";
                id_str += $(this).parents("tr").find("td:eq(1)").text()+",";
            });
            // drop the extra ','
            empNames = empNames.substring(0,empNames.length-1);
            id_str = id_str.substring(0,id_str.length-1);
            if(confirm("Are you sure delete "+empNames+"?")){
                //send ajax request
                $.ajax({
                    url:"${ContextPath}/employee/deleteEmps/"+id_str,
                    type:"DELETE",
                    success:function(result){
                        alert(result.message);
                        to_page(currentPage);
                    }
                });
            }
        })
    </script>
</body>
</html>
