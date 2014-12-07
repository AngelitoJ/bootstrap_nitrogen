
%% Background comet process
%% (c) 2014 Angel Alvarez


-module(background).
-compile(export_all).

-include_lib("nitrogen_core/include/wf.hrl").
-include("records.hrl").

-type bar_state() :: tuple().

-record(bar_state,{
         id          = none       :: atom()
        ,panel       = none       :: atom() 
        ,severity    = none       :: atom()
        ,count       = 0          :: integer()
        ,bar         = none       :: none | nitrogen_element()
    }).

%% Wait for INIT message and setup a proper state, the go idle
background_update_init(Control, Panel, Count) ->
    io:format("Hey! I'm a comet process updating ~p in panel ~p \n",[Control, Panel]),
    background_update_idle(#bar_state{ id = Control, panel = Panel, severity = success, count = Count}).

%% Block until desired panel get visible
background_update_idle(#bar_state{ id = Control, panel = ThisPanel} = State) -> 
    receive
        'INIT' ->
                        io:format("background_update_idle: I'm process for ~p and I am the first in the pool..\n",[Control]),
                        background_update_idle(State);        
        {panel, ThisPanel} ->
                        io:format("background_update_idle: got a {~p, ~p} msg, going to ACTIVE..\n",[panel,ThisPanel]),
                        background_update(State);
        Other ->
                        io:format("background_update_idle: got a ~p msg, going to IDLE..\n",[Other]),
                        background_update_idle(State)        
    end.
%% Loop updating state unless we receive a new panel event, go to idle if apropiate (our panel is no longer visible)
background_update(#bar_state{ panel = ThisPanel } = State) ->
    io:format("background_update_idle: ACTIVE for panel ~p..\n",[ThisPanel]),
    receive
        {panel, Panel} when Panel =/= ThisPanel ->
                io:format("background_update: got a {~p, ~p} msg, going to idle..\n",[panel,Panel]),
                background_update_idle(State)
    after
        1000 ->
                io:format("background_update: looping\n",[]),
                NewState = update_state(State),
                background_update(NewState)
    end.


% state transformation, increment counter and build an apropiate progress bar, send it to browser and return new state
-spec update_state(bar_state()) -> bar_state().
update_state(#bar_state{ id = ID, severity = Severity, count = Count } = State) ->
    wf:replace(ID, #bs_progress_bar{ 
                                            id         = ID
                                            ,text       = wf:to_list(Count)
                                            ,severity   = Severity
                                            ,percentage = Count 
                                            }),
    wf:flush(),
    case Count of
        33  ->
                State#bar_state{ severity = warning, count = Count +1 }; 
        66  ->
                State#bar_state{ severity = danger, count = Count +1 }; 
        100 -> 
                State#bar_state{ severity = success, count = 0 }; 
        _ ->
                State#bar_state{ count = Count +1 }
    end.
