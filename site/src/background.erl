
%% Background comet process
%% (c) 2014 Angel Alvarez


-module(background).
-compile(export_all).

-include_lib("nitrogen_core/include/wf.hrl").
-include("records.hrl").

-type bar_state() :: tuple().

-record(state,{
                 count       = 0    :: integer()
                ,element            :: nitrogen_element()
                }).


bar_update(Control, Count) ->
    Element = #bs_progress_bar{ 
                                 id         = Control
                                ,text       = wf:to_list(Count)
                                ,percentage = Count 
                                },
    bar_update_loop(#state{ count = Count, element = Element }).

%% Loop updating the state and wiring the results
bar_update_loop(State) ->
    receive
    after
        1000 ->
                NewState = update_state(State),
                Element  = NewState#state.element,
                wf:replace(Element#bs_progress_bar.id, Element),
                bar_update_loop(NewState)
    end.


% state transformation, increment counter and build an apropiate progress bar, send it to browser and return new state
-spec update_state(bar_state()) -> bar_state().
update_state(#state{ count = Count, element = Element } = State) ->
%%    wf:replace(Element#bs_progress_bar.id, Element), 
%%    wf:flush(),
    case Count of
        33  ->
                State#state{ count = Count+1, element = Element#bs_progress_bar{ severity = warning, text = wf:to_list(Count), percentage = Count }}; 
        66  ->
                State#state{ count = Count+1, element = Element#bs_progress_bar{ severity = danger, text = wf:to_list(Count), percentage = Count }}; 
        100 -> 
                State#state{ count = 0, element = Element#bs_progress_bar{ severity = success, text = wf:to_list(Count), percentage = Count }}; 
        _ ->
                State#state{ count = Count+1, element = Element#bs_progress_bar{ text = wf:to_list(Count), percentage = Count }}
    end.
