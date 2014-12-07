%% -*- mode: nitrogen -*-
%% vim: ts=4 sw=4 et
%% Copyright (c) 2014 Angel Alvarez

-module (element_bs_badge).
-include_lib("nitrogen_core/include/wf.hrl").
-include("records.hrl").
-export([
    reflect/0,
    transform_element/1
]).



-spec reflect() -> [atom()].
reflect() -> record_info(fields, bs_badge).

-spec transform_element(#bs_badge{}) -> body().
transform_element(_Record = #bs_badge{ class = Class, text = Text }) ->
    #span{ 
    		class = "badge " ++ Class
    		,text = Text
    		}.
