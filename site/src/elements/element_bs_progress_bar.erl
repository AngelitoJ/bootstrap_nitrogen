%% -*- mode: nitrogen -*-
%% vim: ts=4 sw=4 et
%% Copyright (c) 2014 Angel Alvarez

 
-module (element_bs_progress_bar).
-include_lib("nitrogen_core/include/wf.hrl").
-include("records.hrl").
-export([
    reflect/0,
    transform_element/1
]).



-spec reflect() -> [atom()].
reflect() -> record_info(fields, bs_progress_bar).

%% Transform a Bootstrap elemnt into a nested set of frames with proper CSS styling 
-spec transform_element(#bs_progress_bar{}) -> nitrogen_element().
transform_element(#bs_progress_bar{ id = Id, html_encode = Encode, sr_only = SR, text = Text, severity = Severity, mode = Mode, percentage = Percentage}) ->
	
	SR_element = case SR of
		true ->
				#panel{ class = "sr-only", text = Text, html_encode = Encode };
		false ->
				wf:html_encode(Text,Encode)
	end,

	Mode_class = case Mode of
		active  ->
					" progress-bar-striped active";
		striped ->
					" progress-bar-striped";
		_       ->
					""
	end,

	Severity_class = case Severity of
		danger  -> 
					" progress-bar-danger";
		warning -> 
					" progress-bar-warning";
		success -> 
					" progress-bar-success";
		_       -> ""
	end,

	Class = "progress-bar" ++ Severity_class ++ Mode_class,
	Width =  "width: " ++ wf:to_list(Percentage) ++ "%",

	Inner_panel = #panel{
							 class = Class
							,style = Width
							,body  = SR_element
						},
	#panel{ 
			 id    = Id
			,class = "progress"
			,body  = Inner_panel
			}.


% -spec render_element(#bs_progress_bar{}) -> body().
% render_element(#bs_progress_bar{ id = Id, html_encode = Encode, sr_only = SR, text = Text, severity = Severity, mode = Mode, percentage = Percentage}) ->
% 	Label = wf:html_encode(Text,Encode),

% 	Body = case SR of
% 		true ->
% 				wf_tags:emit_tag('div',[Label],[{class, "sr-only"}]);			
% 		false ->
% 				Label
% 	end,

% 	Mode_class = case Mode of
% 		active  ->
% 					" progress-bar-striped active";
% 		striped ->
% 					" progress-bar-striped";
% 		_       ->
% 					""
% 	end,
% 	Severity_class = case Severity of
% 		danger  -> 
% 					" progress-bar-danger";
% 		warning -> 
% 					" progress-bar-warning";
% 		success -> 
% 					" progress-bar-success";
% 		_       -> ""
% 	end,
% 	Class = "progress-bar" ++ Severity_class ++ Mode_class,
% 	Width =  "width: " ++ wf:to_list(Percentage) ++ "%",

% 	Inner_panel = wf_tags:emit_tag('div', Body, [
% 												 	 {class,  Class}
% 													,{style, Width}
% 												]),
% 	wf_tags:emit_tag('div', Inner_panel, [
% 											 {id, Id}
% 											,{class, "progress"}
% 											]).


