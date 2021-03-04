# AltaCV, yet another LaTeX CV/Résumé class

This CV is based on the original AltaCV template created by LianTze Lim (liantze@gmail.com) which can be found there : https://github.com/liantze/AltaCV
  
But I made a number of improvements in order to adapt it to my own usage and make it durable and reusable in the future. 

Among all the things done : 
* Rewriting of the content in order to make it easier to read and understand (tabulations, sections, explanations, etc.)
* Integration of a way to test different shades of colors
* Complete integration of the LaTeX3 interface libraries
* Integration of the possibility in the document preamble to overwrite the main commands in order to test different configurations
* Replacement of the "paracol" by the "multicol" package that seemed more convenient to me.
* I suppressed the usage of the NewInfoField command since it didn't seem so useful to my point of view and that the links generated weren't correctly managed when passing in the href utility
* Suppression of the passing of some options to the class since they just seemed "mandatory" to my point of view
* Usage of the "extarticle" class instead of the classic "article" in order to be able to reduce the font size up to 8pt
* ... and other things ...

What could yet still done : 
* Create a command shortcut to have a similar presentation that the one found in the language section.
* Find a way to act of the created pdf metadata to integrate title, author, etc.
* Invent new original types of sections to illustrate other curriculum aspects ?
* etc.
