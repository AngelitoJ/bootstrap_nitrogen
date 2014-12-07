%% -*- mode: nitrogen -*-
%% vim: ts=4 sw=4 et
%% Copyright (c) 2014 Angel Alvarez

-module (element_bs_nav).
-include_lib("nitrogen_core/include/wf.hrl").
-include("records.hrl").
-export([ reflect/0, transform_element/1 ]).



-spec reflect() -> [atom()].
reflect() -> record_info(fields, bs_nav).

-spec transform_element(#bs_nav{}) -> nitrogen_element().
transform_element(#bs_nav{ class = Class, body = Body }) ->
    #list {  numbered=false
            ,class = "nav" ++ " " ++ Class
            ,body  = Body }.
