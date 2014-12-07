%% -*- mode: nitrogen -*-
%% vim: ts=4 sw=4 et
%%
%% (C) Angel Alvarez 2014
%%

-module (element_bs_pagination).
-author ("angel@uah.es").
-include_lib("nitrogen_core/include/wf.hrl").
-include("records.hrl").
-export([
    reflect/0,
    transform_element/1
]).

%% bs_pagination element represents a Bootstrap pagination component and is rendered into HTML
%% transforming it into regular Nitrogen list adding appropiate Bootstrap CSS styles.
%%
%% Properties:
%% id: this control id (used on postbacks)
%% class: Custom class
%% size: small | normal | large
%% items: a subrange of posible page (see below).
%% 
%% Postbacks from this element have the form {pagination, Id, Page} where Id represents the final list element id
%% and page the value of the #listitem that triggered the postback. This element should be replaced with a new one
%% instead of attemptenting to update the individual sub elements.
%%      
%% A clasical pagination control features a list of page markers from wider range of page results
%%
%% A range of page markers is represetned as a closed interval,
%%
%%  [ minimum..maximum ]
%% 
%% of a possible finite number of elements where the control represents a suitable smaller subrange
%% of elements:
%%   minimum < [less    ..    more] < maximum
%%             [minimum ..    more] < maximum
%%   minimum < [less    .. maximum]
%%             [minimum .. maximum]
%%
%% Example: In a full range of 100 pages we can have many 5 page spans like:
%%
%%   [minimum, "1", "2", "3", {current,"4"}, "5", more]
%%
%%   [less, "10", "11", {current,"12"}, "13", more]
%%
%%   [less, {current,"95"}, "96", "97", "98", "99", maximum]
%%

-spec reflect() -> [atom()].
reflect() -> record_info(fields, bs_pagination).


%% Transform a bs_pagination element into a suitable list element with the boostrap requires CSS classes
-spec transform_element(#bs_pagination{}) -> body().
transform_element(#bs_pagination{ id = Id, size = Size, class = CustomClass, items = Items}) ->

    %% Add the main element id to every item just in case it needs to generate a postback
    PagItems = lists:map(fun(I) -> {Id, I} end, Items),
    
    %% convert every item into the appropiate list item
    Body     = lists:map(fun bs_pagination_item/1, PagItems),
    
    %% Add suitable Boostrap class
    Class    = case Size of 
        small ->
                "pagination pagination-sm ";
        large ->
                "pagination pagination-lg ";
        _     ->
                "pagination "
    end,
    %% Build the final list element and append custom CSS classes
    #list{  
             id = Id
            ,class = Class ++ CustomClass   %% add custom classes required by the author
            ,body  = Body
    	}.

%% Create an element for every page marker needed in the Bootstrap navigation control
bs_pagination_item(Item) ->
    case Item of
        {_Id, minimum}           -> %% Absolute lower bound of posible markers, generate a disabled control.
                        #listitem{ class = "disabled ",body = #link { text = "&laquo;", html_encode = false }};

        {Id, less}              -> %% Relative lower bound, it can be posible to request lower makers with a suitable postback event
                        #listitem{ body = #link { text = "&laquo;", html_encode = false, postback = {pagination, Id, less}}};

        {Id, more}              -> %% Relative upper bound, it can be posible to request upper makers with a suitable postback event
                        #listitem{ body = #link { text = "&raquo;", html_encode = false, postback = {pagination, Id, more}}};

        {_Id, maximum}          -> %% Absolute upper bound of posible markers, generate a disabled control.
                        #listitem{ class = "disabled ",body = #link { text = "&raquo;", html_encode = false }};

        {Id, {current, Label}} -> %% Current page marker, style as active and disable postback
                        #listitem{ class = "active", body = #link { body = [ #literal{ text = Label }, #span{ class = "sr-only", text ="(current)"}]}};

        {Id, Label}            -> %% Any marker in the current span, generate a suitabke postback
                        #listitem{ body = #link { body = #literal{ text = Label } , postback = {pagination, Id, Label}}}
    end.

