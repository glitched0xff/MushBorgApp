// Draw TodoList
async function drawTodoList(eseguito=0){
        await $.ajax({
          type: "GET",
          url: "/toDo/getAllOpenClose?eseguito="+eseguito,
          success: function (response) {
            let data=response.data
            if (data.length>0){
        html=`<ul class="todo-list ui-sortable" data-widget="todo-list" id="my-todo-list">`
        for (let i = 0; i < data.length; i++) {
            const elem = data[i];
            switch (elem.priority) {
                case "0":
                    elem.priorityBadgeClass="badge-danger"
                    elem.priorityBadgeText=`<i class="far fa-clock"></i> Urgente`
                    break;
                case "1":
                    elem.priorityBadgeClass="badge-warning"
                    elem.priorityBadgeText=`<i class="fas fa-exclamation-triangle"></i> Importante`
                break;
                case "2":
                    elem.priorityBadgeClass="badge-success"
                    elem.priorityBadgeText=`<i class="fas fa-smoking"></i> Easy`
                break;
            }
            switch (elem.sezione) {
                case "0":
                    elem.sezioneBadgeClass="badge-primary"
                    elem.sezioneBadgeText=`<i class="far fa-clock"></i> Laboratorio`
                    break;
                case "1":
                    elem.sezioneBadgeClass="badge-secondary"
                    elem.sezioneBadgeText=`<i class="fas fa-exclamation-triangle"></i> Spawn`
                break;
                case "2":
                    elem.sezioneBadgeClass="badge-success"
                    elem.sezioneBadgeText=`<i class="fas fa-smoking"></i> Substrato`
                break;
                case "3":
                    elem.sezioneBadgeClass="badge-danger"
                    elem.sezioneBadgeText=`<i class="far fa-clock"></i> Inoculo`
                    break;
                case "4":
                    elem.sezioneBadgeClass="badge-warning"
                    elem.sezioneBadgeText=`<i class="fas fa-exclamation-triangle"></i> Espansione`
                break;
                case "5":
                    elem.sezioneBadgeClass="badge-info"
                    elem.sezioneBadgeText=`<i class="fas fa-smoking"></i> Fruttificazione`
                break;
                case "6":
                    elem.sezioneBadgeClass="badge-light "
                    elem.sezioneBadgeText=`<i class="far fa-clock"></i> Post produzione`
                    break;
                case "7":
                    elem.sezioneBadgeClass="badge-dark"
                    elem.sezioneBadgeText=`<i class="fas fa-exclamation-triangle"></i> Altro`
                break;
            }
            let done,checked,style
            let divDone=""
            if (elem.eseguito=="1"){
                done="done"
                if (showDone==false){
                    style=`style="display:none"`
                }
                checked="checked disabled"
                divDone=`<span class="tetx">Completato il : ${moment(elem.updatedAt).format("DD-MM-YY hh:mm")}</span>`
            }
            html+=`<li id="todoCheck${elem.id}_Li" class="${done}" ${style}>
            <span class="handle ui-sortable-handle">
                <i class="fas fa-ellipsis-v"></i>
                <i class="fas fa-ellipsis-v"></i>
            </span>
            <div class="icheck-primary d-inline ml-2">
                <input type="checkbox" value="" name="todo${elem.id}" id="todoCheck${elem.id}" class="checkboxTodo" ${checked}>
                <label for="todoCheck${elem.id}"></label>
            </div>
            <small class="badge ${elem.priorityBadgeClass}" style="width:80px"> ${elem.priorityBadgeText}</small>
            <small class="badge ${elem.sezioneBadgeClass}" style="width:80px> ${elem.sezioneBadgeText}</small>

            <span class="text">${elem.titolo} </span>
            
            <span class="text font-weight-light">${elem.descrizione} </span>
            ${divDone}
            <div class="tools">
                <i class="fas fa-trash deleteTodo_btn" id="${elem.id}"></i>
            </div>
        </li>`
        }
        html+="</ul>"
        } else{
            html=`<div class="alert alert-danger alert-dismissible">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                    <h5><i class="icon fas fa-ban"></i> Alert!</h5>
                    Non sono presenti elementi in questa sezione
                  </div>`
                  html=""
        }
        $("#todo_Tbl").html(html)
        // Config to-do.list come sortable
        $(".todo-list").sortable({
            placeholder: "sort-highlight",
            handle: ".handle",
            forcePlaceholderSize: true,
            zIndex: 999999
        }).disableSelection();
        
          }
        });
        
        return html
    }

    $(document).on("click","#showDone",function (e) { 
            e.preventDefault();
            showDone=true
            $.get("/todo/getAllOpenClose?eseguito=1", 
                function (data) {
                    console.log(data)
                    $("#delAllDone").show()
                    $("#showDone").hide()
                    $("#showOpen").show()
                    drawTodoList(1)
                },
            );
            
        });
        $(document).on("click","#delAllDone",function (e) { 
            e.preventDefault();
            let c=confirm("Stai eliminando tutti i ToDo completati, continuare?")
            if (c=true){
                showDone=false
                $.ajax({
                    type: "DELETE",
                    url: "/todo/delAllDone",
                    success: function (response) {
                        console.log(response)
                        drawTodoList(0)
                        $( ".todo-list" ).sortable( "refresh" );
                        $("#delAllDone").hide()
                        $("#showDone").hide()
                        $("#showOpen").show()
                        $("#showOpen").show()
                    }
                });
            }
        });
        $(document).on("click","#showOpen",function (e) { 
            e.preventDefault();
            showDone=false
            $.get("/todo/getAllOpenClose?eseguito=0", 
                function (data) {
                    console.log(data)
                    $("#showDone").show()
                    $("#delAllDone").hide()
                    $("#showOpen").hide()
                    drawTodoList(0)
                    $( ".todo-list" ).sortable( "refresh" );
                },
            );
            
        });
        
        // check/uncheck
        $(document).on("click",".checkboxTodo", function(){
            let id=$(this).attr("id")
            if ($('#' + id).is(":checked")){
                id=id.substring(9)
                console.log(id)
                $("#todoCheck"+id+"_Li").addClass("done")
                $.get("/todo/markDone?val=1&id="+id);
            }
            else{
                id=id.substring(9)
                $("#todoCheck"+id+"_Li").removeClass(" done")              
                $.get("/todo/markDone?val=0&id="+id);
            }
                
        })
        
        // Insert new todo
        $(document).on("click","#addElemento_btn",function (e) { 
            e.preventDefault();
            console.log('Click')
            $("#toDo_Frm").trigger("reset")
            $("#todo_RowTbl").fadeOut(200)
            $("#todo_RowFrm").fadeIn(200)
            $("#cardTitle").html("Aggiungi nuovo todo")

        });
        $(document).on("click","#annulla_FrmBtn",function (e) { 
            e.preventDefault();
            $("#todo_RowFrm").fadeOut(200)
            $("#todo_RowTbl").fadeIn(200) 
        });
        $(document).on("click","#addtoDo_FrmBtn",function (e) {
            e.preventDefault();
            $.ajax({
                type: "POST",
                url: "/todo/insert",
                data: $("#toDo_Frm").serialize(),
                success: function (response) {
                    $.ajax({
                        type: "GET",
                        url: "/todo/getAll",
                        success: function (response) {
                            todos=response.todos
                            drawTodoList(0)
                            $("#todo_RowFrm").fadeOut(200)
                            $("#todo_RowTbl").fadeIn(200) 
                        }
                    });
                },
                error: function (err) {
                    console.log(err)
                }
            });
            $("#todo_RowFrm").fadeOut(200)
            $("#todo_RowTbl").fadeIn(200) 
        });
        $(document).on("click","#saveTodo_Btn",function (e) {
            e.preventDefault();
            $.ajax({
                type: "POST",
                url: "/todo/insert",
                data: $("#toDo_Frm").serialize(),
                success: function (response) {
                    drawTodoList(0)
                    $("#addTodo_Mdl").modal('hide')
                },
                error: function (err) {
                    console.log(err)
                }
            });
            $("#todo_RowFrm").fadeOut(200)
            $("#todo_RowTbl").fadeIn(200) 
        })
        // Modify todo

        // Delete todo
        $(document).on("click",".deleteTodo_btn",function(e){
            e.preventDefault();
            let id=$(this).attr("id")
            let c=confirm("Stai eliminando il ToDo selezionato, continuare?")
            if (c=true){
                $.ajax({
                    type: "DELETE",
                    url: "/todo/delete?id="+id,
                    success: function (response) {
                        console.log(response)
                        drawTodoList(0)
                        $( ".todo-list" ).sortable( "refresh" );
                    }
                });
            }
        })