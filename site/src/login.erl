%% -*- mode: nitrogen -*-
-module (login).
-compile(export_all).
-include_lib("nitrogen_core/include/wf.hrl").

main() -> #template { file="./site/templates/login.tpl" }.

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
    [
         #h1 { text="Welcome to Nitrogen"}
        ,#h1 { text="(Bootstrap playground)" }
        ,#p{}
        ,<<"If you can see this page, then your Nitrogen server is up and running. Click the button below to start.">>
        ,#p{} 	
        ,#button { id=button, text="Click me!", postback=click }
		,#p{}
    ].
	
event(click) ->
    wf:replace(button, #panel { 
                                 body=[
                                        #button { 
                                                     id=button2
                                                    ,text="Ready to see dashboard?"
                                                    ,postback=click2
                                                }
                                        ] 
                                ,actions=#effect { effect=highlight, speed=100 }
                                });
event(click2) -> 
    wf:redirect("dashboard").
