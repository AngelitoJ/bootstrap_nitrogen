%% -*- mode: nitrogen -*-
%% vim: ts=4 sw=4 et
%% (C) Angel ALvarez 2014

-module (element_i).
-include_lib("nitrogen_core/include/wf.hrl").
-include("records.hrl").
-export([
    reflect/0,
    render_element/1
]).



-spec reflect() -> [atom()].
reflect() -> record_info(fields, i).

-spec render_element(#i{}) -> body().
render_element(#i{ class = Class, text = Text, html_encode = Encode }) ->
    wf_tags:emit_tag(i, wf:html_encode(Text,Encode), [ {class, Class} ]).

