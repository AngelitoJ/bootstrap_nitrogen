%% -*- mode: nitrogen -*-
-module(dashboard).
-compile(export_all).

-include_lib("nitrogen_core/include/wf.hrl").
-include("records.hrl").


%%% -------------- Main template  functions --------------


%% A buch of comet process goes up here, they care for the widgets on some panels
main() -> 
    #template { file="./site/templates/dashboard.tpl", bindings = [{'Content', main}] }.

title() -> 
            "Bootstrap test on Nitrogen".
header() -> 
            "Bootstrap test on Nitrogen".
%%header() -> #link { text = title(), url = "/"}.

%% Load the sidebar, and notice comet processes main panel is available.
sidebar() ->
    wf:send(contentPool, {panel, main}),
    #panel{  id   = sidebarPanel
            ,body = #template{ file="./site/templates/sidebar_panel.tpl"}
            }.



%% Load templates for the content panel among diferent templates
content(Panel) ->
    case Panel of
        main ->
                #panel{  id = contentPanel
                        ,body = #template{ file="./site/templates/dashboard_panel_main.tpl" }
                        };
        data ->
                #panel{  id = contentPanel
                        ,body = #template{ file="./site/templates/dashboard_panel_data.tpl" }
                        };
        tables ->
                #panel{  id = contentPanel
                        ,body = #template{ file="./site/templates/dashboard_panel_tables.tpl" }
                        };
        _      ->
                content(main)
    end.

load_comet() ->
    %% This comet function updates a counter and display a moving progress bar
%%    wf:comet(fun() -> background:background_update_init(bar1, main) end, contentPool),    
    "".

%%% -------------- Main panel functions --------------

flash() -> #flash{}.

alert_block() ->
    [
        #bs_alert{ text = "Hello!" }
    ].


nav_pills_block() -> 
    #bs_nav {    
                class= "nav-pills"
                ,body = [
                             #listitem{ class= active, body= #link{ text="Home "    , body= #bs_badge{ text="12" }  ,postback=home_click }}
                            ,#listitem{ class= active, body= #link{ text="Profile " , body= #bs_badge{ text="126" } ,postback=home_click }}
                            ,#listitem{ class= active, body= #link{ text="Messages ", body= #bs_badge{ text="14" }  ,postback=home_click }}
                        ]
 
            }.

progress_bar_block() -> 
    [
         #bs_progress_bar{ id = bar1, text = "50", severity = normal, percentage = 50 }
        ,#bs_progress_bar{ text = "45% Complete", sr_only= true, mode = normal, percentage = 45 }   
    ].


badge(N) when is_integer(N) ->
    #bs_badge{ class= "pull-right", text = wf:to_list(N) }; 
badge(_) ->
    "".

%%% -------------- Data panel functions --------------
dropdown_menu() ->
    dropdown_menu(["a","b","c"]).

dropdown_menu(List) when is_list(List) ->
    Body = lists:map(fun(Item) -> #listitem{ body = #link{ text = Item, url="#" }} end, List),
    #list{
             class = "dropdown-menu" 
            ,body = Body 
    }.

pagination_block() ->
    #list{  
             class = "pagination pull-right"
            ,body = [
                     #listitem{ class = "disabled "
                                ,body = #link { text = "&laquo;", html_encode = false, url = "#"}}
                    ,#listitem{ class = "active"
                                ,body = #link { url="#", body = [ #literal{ text="1"}, #span{ class = "sr-only", text ="(current)"}]}}
                    ,#listitem{ body = #link { url ="#", body = [ #literal{ text ="2" }, #span{ class = "sr-only", text ="(current)"}]}}
                    ,#listitem{ body = #link { url ="#", body = [ #literal{ text ="3" }, #span{ class = "sr-only", text ="(current)"}]}}
                    ,#listitem{ body = #link { url ="#", body = [ #literal{ text ="4" }, #span{ class = "sr-only", text ="(current)"}]}}
                    ,#listitem{ body = #link { url ="#", body = [ #literal{ text ="5" }, #span{ class = "sr-only", text ="(current)"}]}}
                    ,#listitem{ body = #link { url="#", text = "&raquo;", html_encode =false }}
                    ]
    }.


%%% -------------- Sidebar panel functions --------------

menubar_block() ->
    lists:map(
                 fun menu_bar_item/1
                ,[ 
                     {main       , "fa fa-home", "Home", ""}
                    ,{data       , "fa fa-cubes", "Data Visualization",9}
                    ,{maps       , "fa fa-map-marker", "Maps",42}
                    ,{tables     , "fa fa-users" , "Manage Users","ADMIN"}
                    ,{preferences, "fa fa-cog", "Preferences",""}
                    ]
                ).

menu_bar_item({Target, Class, Label, Badge}) ->
        #listitem {
                    body = #link {                                         
                                    body = [
                                             #i{ class = Class }
                                            ,#bs_badge{ class = "pull-right", text = wf:to_list(Badge) }
                                            ,#literal{ text = Label }
                                                    ]
                                        ,postback = {sidebar, Target}
                                    }
                    }.
%% Receive sidebar events and change content panels, signaling comet pool "content" about panel change.
sidebar_event({sidebar, Panel}) ->
    case Panel of
        main    ->
                    wf:send(contentPool, {panel, main}),
                    wf:replace(contentPanel, content(main));
        data    ->
                    wf:replace(contentPanel, content(data)),
                    wf:send(contentPool, {panel, data});
        tables  ->
                    wf:send(contentPool, {panel, tables}),
                    wf:replace(contentPanel, content(tables));
        _       ->
                    wf:wire(#alert { text="Function not implemented!"})
    end.


%%% -------------- Event functions --------------



%% reroute sidebar event to dedicated function
event({sidebar, Msg}) ->
    sidebar_event({sidebar,Msg});

%% Signal the user for unknown events 
event(_) ->
            wf:wire(#alert { text="Function not implemented!"}).





%sidebarlink(maps) ->
%    wf:wire(maps_menu, #event { type=click, postback={content,dashboard} } ).


% event(click) ->
%     wf:replace(button, #panel { 
%         body="You clicked the button!", 
%         actions=#effect { effect=highlight }
%     });


% event(bar_click) ->
%     wf:replace(bar1, #bs_progress_bar{ id = bar2, severity = danger, text = "99", percentage = 99 }),
%     FlashID = wf:temp_id(),
%     wf:flash(FlashID, #panel { 
%                                  class = "alert alert-success alert-dismissible"
%                                 ,text = "You clicked the button." 
%                                 }),
%     wf:wire(FlashID, #hide { effect=blind, speed=100 });



