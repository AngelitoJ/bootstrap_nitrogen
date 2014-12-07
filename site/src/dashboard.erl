%% -*- mode: nitrogen -*-
%% Copyright (c) 2014 Angel Alvarez

-module(dashboard).
-compile(export_all).

-include_lib("nitrogen_core/include/wf.hrl").
-include("records.hrl").


%%% -------------- Main template  functions --------------


%% A buch of comet process goes up here, they care for the widgets on some panels
main() ->
    wf:comet(fun() -> background:background_update_init(bar1, main, 50 ) end),    
    wf:comet(fun() -> background:background_update_init(bar2, main, 45 ) end),    
     #template { file="./site/templates/dashboard.tpl", bindings = [{'Content', main}] }.

title() -> 
            "Bootstrap test on Nitrogen".
header() -> 
            "Bootstrap test on Nitrogen".


breadcrumb(Items) ->
    Body = lists:map(
                        fun({active, Element}) -> #listitem{ class = "active", text = Element };
                           (Other)             -> #listitem{ text = Other} 
                        end
                        ,Items),
    #list{ 
             class = "breadcrumb"
            ,numbered = true
            ,body = Body
        }.


%% Load the sidebar, and notice comet processes main panel is available.
sidebar_block() ->
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

modal_panel_block() ->
                #panel{  id = modalPanel
                        ,body = #template{ file="./site/templates/dashboard_panel_modal.tpl" }
                        }.

load_comet() ->
    %% This comet function updates a counter and display a moving progress bar
    "".

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
                    wf:replace(contentPanel, content(main)),
                    wf:send(contentPool, {panel, main});
        data    ->
                    wf:replace(contentPanel, content(data)),
                    wf:send(contentPool, {panel, data});
        tables  ->
                    wf:replace(contentPanel, content(tables)),
                    wf:send(contentPool, {panel, tables});
        _       ->
                    wf:wire(#alert { text="Function not implemented!"})
    end.


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
        ,#bs_progress_bar{ id = bar2, text = "45% Complete", sr_only= true, mode = normal, percentage = 45 }   
    ].


badge(N) when is_integer(N) ->
    #bs_badge{ class= "pull-right", text = wf:to_list(N) }; 
badge(_) ->
    "".

%%% -------------- Data panel functions --------------

table_block() ->
    Data = [
                 {record, ["1", "John", "Smith", "@js", "js@jar.com"]}
                ,{record, ["2", "Karl", "Marx", "@km", "km@alist.com"]}
                ,{record, ["3", "John", "Goodman", "@jg", "jg@addle.com"]}
                ,{record, ["4", "Chris", "Jensen", "@cj", "cj@computers.com"]}
                ,{record, ["5", "Mary", "Shelly", "@ms", "ms@books.com"]}
            ],
    L  = length(Data),       
    R0 = lists:map(fun(Item) -> {random:uniform(5), Item} end, Data),
    R1 = lists:sort(R0),
    R2 = lists:map(fun({_,I}) -> I end, R1),
    table(R2).

table(List) ->

    Header =  #tablerow {
                                    cells = [
                                                 #tableheader{ text = "#"}
                                                ,#tableheader{ text = "First Name"}
                                                ,#tableheader{ text = "Last Name"}
                                                ,#tableheader{ text = "Username"}
                                                ,#tableheader{ text = "Email"}
                                                ,#tableheader{ text = "Edit"}
                                                ,#tableheader{ text = "Action"}
                                                ,#tableheader{ text = "Delete"}
                                            ]
                                    },
    Rows = lists:map(fun tablerow/1,List),
                                    
    #table {
             id = usertable
            ,class = "table table-striped table-hover table-bordered"
            ,rows = [Header|Rows]
            }.

tablerow({record,List}) ->
    Cells = lists:map(fun(Data) -> #tablecell{ text = Data} end, List),
    #tablerow {
                cells = lists:append(Cells, [
                                                 #tablecell{ body = #link{ class = "btn btn-default", url = "#", text = "Edit"}}
                                                ,#tablecell{ body = button_group("Action", ["Block/Unblock", "Remove", "Activate"])}
                                                ,#tablecell{ body = #link{ class = "btn btn-link", url = "#", text = "Delete"}}
                                            ])}.

button_group(Label, Options) ->
    #panel{
             class = "btn-group"
            ,body = [
                       #button{ class = "btn btn-info", text = Label, body = #literal{ text = ""}}
                      ,#button{  class = "btn btn-info dropdown-togle"
                                ,data_fields = [{togle,dropdown}]
                                ,body = [ 
                                             #span{ class = "caret"}
                                            ,#span{ class = "sr-only", text = "Toggle Dropdown" }
                                        ]}
                      ,dropdown_menu(Options)
                    ]
            }.

dropdown_menu() ->
    dropdown_menu(["a","b","c"]).

dropdown_menu(List) when is_list(List) ->
    Body = lists:map(fun(Item) -> #listitem{ body = #link{ text = Item, url="#" }} end, List),
    #list{
             class = "dropdown-menu" 
            ,body = Body 
    }.

pagination_block() ->
    #bs_pagination{
                     id = pg_usertable
                    ,class = "pull-right"
                    ,items = [minimum, "1", {current, "2"}, "3", "4", "5", maximum]
    }.



%%% -------------- Event functions --------------


%% reroute sidebar event to dedicated function
event({sidebar, Msg}) ->
    sidebar_event({sidebar,Msg});

%% Handle pagination events for the user table pagnination control
event({pagination, pg_usertable, Item}) ->
    %% make a new control reflecting new current page
    NewPagination = #bs_pagination{
                                     id    = pg_usertable   %% Don't forget to set the same ID
                                    ,class = "pull-right"
                                    ,items = lists:map(
                                                        fun(I) when I == Item -> {current, I};
                                                           (I) -> I end
                                                        ,[minimum, "1", "2", "3", "4", "5", maximum])
                                    },
    %% place the updated table (current setup is just random)                                
    wf:replace(usertable, table_block()),
    %% page the new pagination control
    wf:replace(pg_usertable, NewPagination);

%% Handle pagination event for any pagination control
event({pagination, Id, Item}) ->
    Msg = io_lib:format("User click ~p on pagination element: ~p",[Item, Id]),
    wf:wire(#alert{ text = Msg});

%% Signal the user for unknown events 
event(Other) ->
    Msg = io_lib:format("Received ~p event",[Other]),
    wf:wire(#alert{ text = Msg}).






