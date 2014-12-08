bootstrap_nitrogen
==================

A Nitrogen Project playground for Twitter Bootstrap elements


A toy project giving a taste of Nitrogen current capabilities and a playground for development of new Nitrogen DSL 
elements featuring Twitter Bootstrap widgets.

A "templatemo" template featuring an example dashboard using Twitter Bootstrap framework was choosen for this project.
The template is gonna be translated into a series of nitrogen elements resembling the original crude html+css markup.

First, bare nitrogen elements are used to mimic the original markup using nested structures if needed.
Second, new custom elemnets "bs_<element>" are created into nitrogen for every bootstrap widget contained in the template.

Current Bootstrap elements so far:

	- progress bar
		support for classes "info", "success", "warning" and danger 
		support for types "normal" "striped" and "striped active"
		TODO: stacked bars
	- pagination
		full support for navigation component (see code element_bs_pagination for comments)
	- nav

	- breadcrumb

	- badge



Thanks to Jesse Gumm (Nitrogen project) for his kind support. 