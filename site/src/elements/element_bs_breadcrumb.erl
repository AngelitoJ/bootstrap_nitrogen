%% -*- mode: nitrogen -*-
%% vim: ts=4 sw=4 et

%% (c) Angel ALvarez 2014

-module (element_bs_breadcrumb).
-include_lib("nitrogen_core/include/wf.hrl").
-include("records.hrl").
-export([
    reflect/0,
    transform_element/1
]).



-spec reflect() -> [atom()].
reflect() -> record_info(fields, bs_breadcrumb).

-spec transform_element(#bs_breadcrumb{}) -> body().
transform_element(#bs_breadcrumb{ id = Id, items = Items }) ->
    L    = length(Items),
    {Body, _} = lists:mapfoldl(
                        fun(Text, 0)	-> { #listitem{ class = "active", text = Text }, 0};
                           (Text, Acc)	-> { #listitem{ text = Text }, Acc - 1} 
                        end
                        ,L - 1 
                        ,Items),
    #list{ 
             id = Id
            ,class = "breadcrumb"
            ,numbered = true
            ,body  = Body
        }.
