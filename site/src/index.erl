%% -*- mode: nitrogen -*-
-module (index).
-compile(export_all).
-include_lib("nitrogen_core/include/wf.hrl").

main() -> #template { file="./site/templates/index.tpl" }.

title() -> "Welcome to Nitrogen BootStrap playground".

body() ->
    #container_12 { body=[
                            #grid_8 { alpha=true
                                        ,prefix=2
                                        ,suffix=2
                                        ,omega=true
                                        ,body=inner_body() }
                        ]
                    }.

inner_body() -> 
        #panel{  id = msgPanel
                ,body = [
                            #h1{ text = "Nitrogen Bootstrap playground" }
                            ,#p{ text = "Playground is a toy project to feature current Nitrogen capabilities and provide a test bed to develop Bootstrap components upon nitrogen DSL."}
                            ,#p{ html_encode = false, text = "<a href=\"nitrogenproject.com\">Nitrogen Project</a> is a erlang web framework geared toward higly dynamic sites."}
                            ,#p{ html_encode = false, text = "Dashboard is <a rel=\"nofollow\" href=\"http://www.templatemo.com/preview/templatemo_415_dashboard\">free admin template</a> for everyone. Credits go to <a href=\"http://chartjs.org\">Chart JS</a>, <a href=\"http://getbootstrap.com\">Bootstrap</a>, and <a href=\"http://jqvmap.com\">JQVMap</a>. templatemo provides <a href=\"#\">free website templates</a> that can be used for any purpose."}
                            ,#p{}
                            ,<<"If you can see this page, then your Nitrogen server is up and running. Click the button below to start.">>
                            ,#p{} 	
                            ,#button { id=button, text="Click me!", postback=click }
		                  ,#p{}
                        ]
                }.
	
event(click) ->
    wf:replace(msgPanel, #panel { 
                                 body=[
                                        #h1{ text="Ready to see the Dashboard?"}
                                        ,#button { 
                                                     id=button2
                                                    ,text="Go!"
                                                    ,postback=click2
                                                }
                                        ] 
                                ,actions=#effect { effect=slide, speed=100 }
                                });
event(click2) -> 
    wf:redirect("dashboard").
