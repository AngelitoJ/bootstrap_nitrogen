%% Include the automatically generated plugins directory
-include("plugins.hrl").

%% Include any application-specific custom elements, actions, or validators below


%% Move the following record definition to records.hrl:
-record(i, {?ELEMENT_BASE(element_i),
    			 text        = ""    :: string()
    			,html_encode = true  :: boolean()
    		}).

%% Basic Bootstrap navigation
-record(bs_nav, {?ELEMENT_BASE(element_bs_nav)
	              ,body  :: body()
	              }).


%% Bootstrap progress bar
-record(bs_progress_bar, {?ELEMENT_BASE(element_bs_progress_bar),
							html_encode = true    :: boolean()
    						,sr_only    = false   :: boolean()
    						,severity   = none    :: none | success | warning | danger
    						,mode       = normal  :: normal | stripped | active
    						,active     = false   :: boolean()
    						,text       = ""      :: string()
    						,percentage = 0       :: integer()
    						}).

%% Move the following record definition to records.hrl:
-record(bs_badge, {?ELEMENT_BASE(element_bs_badge),
					text = ""  :: string() 
    				}).

%% Move the following record definition to records.hrl:
-record(bs_alert, {?ELEMENT_BASE(element_bs_alert),
                         text        = ""     :: string()
                        ,html_encode = true  :: boolean()
                        ,dimissible  = true   :: boolean()
                        ,severity    = info   :: info | success | warning | danger 
                    }).

-type pag_item()  :: minimum | less | string() | {active, string()} | more | maximum.

%% Bootstrap pagination element
-record(bs_pagination, {
                             ?ELEMENT_BASE(element_bs_pagination)
                            ,items :: [ pag_item() ]
                        }).
