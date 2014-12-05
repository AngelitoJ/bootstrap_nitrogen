%% -*- mode: nitrogen -*-
%% vim: ts=4 sw=4 et
% vim: sw=4 ts=4 et ft=erlang
% Nitrogen Web Framework for Erlang
% Copyright (c) 2008-2010 Rusty Klophaus
% ----------(c) 2014 Angel Alvarez Adapted to show flash elements based on Bootstrap
% See MIT-LICENSE for licensing information.


-module (element_bs_alert).
-include_lib("nitrogen_core/include/wf.hrl").
-include("records.hrl").
-export([
    reflect/0,
    transform_element/1
]).



-spec reflect() -> [atom()].
reflect() -> record_info(fields, bs_alert).

-spec transform_element(#bs_alert{}) -> body().
transform_element(#bs_alert{ id = ID, text = Text, html_encode = Encode, dimissible = Dimissible, severity = Severity }) ->
	Severity_class = case Severity of
		info    ->
					" alert-info";
		success ->
					" alert-success";
		warning ->
					" alert-warning";
		danger  ->
					" alert-danger";
		_       ->
					" alert-info"
	end,

	Dimissible_class = case Dimissible of
		true ->
				" alter-dismissible";
		_    -> 
				""
	end,

	Class = "alert" ++ Severity_class ++ Dimissible_class,
	#panel{
			 id    = ID
			,class = Class
			,body  = [
						 #link {
									 class   = "close"
									,text    = "x"
									,actions = #event{
														 type   = click
														,target = ID
														,actions= #hide{
																			 effect = blind
																			,speed  = 400
																		}
													}
								}
						,#literal{ text = wf:html_encode(Text, Encode)}
					] 
			}.

%<div class="alert alert-warning alert-dismissible" role="alert">
%  <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
%  <strong>Warning!</strong> Better check yourself, you're not looking too good.
%</div>


% -module (element_flash).
% -include("wf.hrl").
% -export([
% 	reflect/0,
% 	render_element/1,
% 	render/0,
% 	add_flash/1,
% 	add_flash/2,
% 	render_flash/2
% ]).

% -spec reflect() -> [atom()].
% reflect() -> record_info(fields, flash).

% -spec render_element(#flash{}) -> body().
% render_element(_Record) -> 
%     Terms = #panel { 
%         id=flash,
%         class=flash_container
%     },
%     wf:state(has_flash, true),
%     Terms.

% % render/0 - Convenience methods to place the flash element on a page from a template.
% -spec render() -> #flash{}.
% render() -> #flash{}.

% -spec add_flash(term()) -> ok.
%  add_flash(Term) ->
%     FlashID = wf:temp_id(),
%     add_flash(FlashID, Term).

% -spec add_flash(id(), term()) -> ok.
% add_flash(FlashID, Term) ->
% 	Elements = render_flash(FlashID, Term),
% 	wf:insert_bottom(defer, flash, Elements).

% -spec render_flash(id(), term()) -> nitrogen_element().
% render_flash(FlashID, Term) ->
% 	#panel{
% 		id=FlashID,
% 		style="display: none;",
% 		body=[
% 			#panel{
% 				class=flash,
% 				actions=#show{target=FlashID, effect=blind, speed=400},
% 				body=[
% 					#link{
% 						class=flash_close_button,
% 						text="Close",
% 						actions=
% 							#event{type=click, target=FlashID, actions=
% 								#hide{effect=blind, speed=400}
% 							}
% 					},
% 					#panel{class=flash_content, body=Term }
% 				]
% 			}
% 		]
% 	}.
