bootstrap_nitrogen
==================

A Nitrogen Project playground for Twitter Bootstrap elements


A toy project giving a taste of Nitrogen current capabilities and also a playground for development of
Nitrogen DSL elements featuring Twitter Bootstrap widgets.

A "templatemo" templated featuring a example dashboard mostly upon Twitter Bootstrap was choosen for this project.
The templated is being translated into a series of nitrogen elements resembling the original crude html+css markup.

First, bare nitrogen elements are used to mimic the original markeup using nested structures if needed.
Second, new custom elemnets "bs_<element>" are created into nitrogen for every bootstrap widget contained in the template.

Custom elements have a much detail as needed to represent all reasonable bootstrap variants:

	bs_progress_bar can be used to make bar of classes info, success, wraning or danger and also can be
	of type basic, stripped and stripped active.

	Stacked bars are not implemented yet.

Remarks:

	Current nitrogen version lacks some elemens like <i> or uses form fields (input type button) to represent buttons while 
	this template and others found in the while seems to use the button html element. When approaching custom elements that need 
	functions like wf_tag:emit() new tags need proper patching of this module to tell whether the tag is proper terminate "lONG"
	or not "SHORT".
