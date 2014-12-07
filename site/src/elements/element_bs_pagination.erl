%% -*- mode: nitrogen -*-
%% vim: ts=4 sw=4 et
-module (element_bs_pagination).
-include_lib("nitrogen_core/include/wf.hrl").
-include("records.hrl").
-export([
    reflect/0,
    transform_element/1
]).


-type pag_item()  :: minimum | less | string() | {active, string()} | more | maximum.

%% Move the following record definition to records.hrl:
-record(bs_pagination, {
							 ?ELEMENT_BASE(element_bs_pagination)
							,items :: [ pag_item() ]
    					}).

-spec reflect() -> [atom()].
reflect() -> record_info(fields, bs_pagination).

-spec transform_element(#bs_pagination{}) -> body().
transform_element(#bs_pagination{ id = Id, class = Class, items = Items}) ->
    PagItems = lists:map(fun(I) -> {Id, I} end, Items),
    Body     = lists:map(fun bs_pagination_item/1, PagItems),

    #list{  
             class = "pagination " ++ Class
            ,body  = Body
    	}.

bs_pagination(Id, Items) ->
    PagItems = lists:map(fun(I) -> {Id, I} end, Items),
    Body     = lists:map(fun bs_pagination_item/1, PagItems),
    
    #list{  
             class = "pagination pull-right"
            ,body = Body
    }.

bs_pagination_item({Id, minimum}) -> 
    #listitem{ class = "disabled ",body = #link { text = "&laquo;", html_encode = false }};

bs_pagination_item({Id, less}) -> 
    #listitem{ body = #link { text = "&laquo;", html_encode = false, postback = {pagination, Id, less}}};

bs_pagination_item({Id, more}) -> 
    #listitem{ body = #link { text = "&raquo;", html_encode = false, postback = {pagination, Id, more}}};

bs_pagination_item({Id, maximum}) -> 
    #listitem{ class = "disabled ",body = #link { text = "&raquo;", html_encode = false, postback = {pagination, Id, more}}};

bs_pagination_item({Id,{current, Label}}) ->
    #listitem{ class = "active", body = #link { body = [ #literal{ text = Label }, #span{ class = "sr-only", text ="(current)"}]}};

bs_pagination_item({Id, Label}) ->
    #listitem{ body = #link { body = #literal{ text = Label } , postback = {pagination, Id, Label}}}.
