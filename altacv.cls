%%%%%%%%%%%%%%%%
% This is altacv.cls (v1.3.3, 31 October 2020) written by
% LianTze Lim (liantze@gmail.com).
%
%% It may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%    http://www.latex-project.org/lppl.txt
%% and version 1.3 or later is part of all distributions of LaTeX
%% version 2003/12/01 or later.
%%
%%
% Contributions:
% - https://github.com/akreuzer Added ragged2e option (5 Nov 2018)
% - https://github.com/stefanogermano Fixed bad boxes and undefined font shape (July 2018)
% - https://github.com/foohyfooh Fixed blank spaces in \cvevent and bad link in README.md (June 2018)
%%%%%%%%%%%%%%%%

%%%%% IDENTIFICATION 
\NeedsTeXFormat{LaTeX2e}%[1995/12/01]
\ProvidesClass{altacv}[2021/03/01 Based on AltaCV v1.3.3 - yet another alternative class for a resume/curriculum vitae.]

%%%%% EXTERNAL PACKAGES

%% v1.3.2 Hopefully this helps make the PDF
%% file more 'friendly' with copy-paste etc
\RequirePackage[a-1b]{pdfx}

\RequirePackage[margin=2cm]{geometry}
% geometry – Flexible and complete interface to document dimensions : https://www.ctan.org/pkg/geometry

\RequirePackage[fixed]{fontawesome5}
% fontawesome5 – Font Awesome 5 with LaTeX support : https://www.ctan.org/pkg/fontawesome5

\RequirePackage{ifxetex}
% ifxetex – Am I running under XeTeX? : https://www.ctan.org/pkg/ifxetex

\RequirePackage{ifluatex}
% ifluatex – Provides the \ifluatex switch : https://www.ctan.org/pkg/ifluatex

\RequirePackage{scrlfile}
% scrlfile – Installation control for koma-script packages : https://www.ctan.org/pkg/scrlfile
% The package provides hooks for the execution of commands before or after loading files, classes or packages.

%% l3kernel bundle
% CTAN : https://ctan.org/pkg/l3kernel
% 
% Note that we can't write :
% \RequirePackage{l3kernel}
%
% If we browse the files of the package there : https://miktex.org/packages/l3kernel
% There's no "l3kernel.sty" but "expl3.sty".
%
% So we call it specifically.
% I don't know how miktex knows it has to pass through the l3kernel bundle to find the expl3 package.
\RequirePackage{expl3}

%% l3packages bundle
% l3packages – High-level LaTeX3 concepts : https://www.ctan.org/pkg/l3packages
%
% Same thing, it contains the following packages : 
% 
\RequirePackage{xparse}
\RequirePackage{xfp}
%\RequirePackage{xtemplate}
%\RequirePackage{l3keys2e}
%\RequirePackage{xfrac}

% CypBLA : Commented to be replaced by the meta-package "l3packages"
%\RequirePackage{xparse}
% xparse – A generic document command parser : https://www.ctan.org/pkg/xparse
% The package provides a high-level interface for producing document-level commands. In that way, it offers a replacement for LaTeX2ε’s \newcommand macro, with significantly improved functionality. 

\RequirePackage{realscripts}
% realscripts – Access OpenType subscript and superscript glyphs : https://www.ctan.org/pkg/realscripts
% This package requires fontspec running on either XeLaTeX or LuaLaTeX. 

\RequirePackage[svgnames]{xcolor}
% xcolor – Driver-independent color extensions for LaTeX and pdfLaTeX
% https://www.ctan.org/pkg/xcolor

\RequirePackage{pgf}
% OLD : \RequirePackage{tikz}
% pgf – Create PostScript and PDF graphics in TeX
% https://www.ctan.org/pkg/pgf

% \usetikzlibrary{arrows}
% CypBLA : Don't seem know by Latex even after pgf package.

\RequirePackage[skins]{tcolorbox}
% tcolorbox – Coloured boxes, for LaTeX examples and theorems, etc
% https://www.ctan.org/pkg/tcolorbox

\RequirePackage[inline]{enumitem}
% enumitem – Control layout of itemize, enumerate, description
% https://www.ctan.org/pkg/enumitem

\RequirePackage{graphicx}
% graphicx – Enhanced support for graphics
% https://www.ctan.org/pkg/graphicx

\RequirePackage{etoolbox}
% etoolbox – e-TeX tools for LaTeX
% https://www.ctan.org/pkg/etoolbox

\RequirePackage{dashrule}
% dashrule – Draw dashed rules
% https://www.ctan.org/pkg/dashrule

\RequirePackage{multirow}
% multirow – Create tabular cells spanning multiple rows
% https://www.ctan.org/pkg/multirow

\RequirePackage{tabularx}
% tabularx – Tabulars with adjustable-width columns
% https://www.ctan.org/pkg/tabularx

% \RequirePackage{marginfix}

\RequirePackage[backend=biber,style=authoryear,sorting=ydnt]{biblatex}
% BibLaTeX – Sophisticated Bibliographies in LaTeX
% https://www.ctan.org/pkg/biblatex

\RequirePackage{iftex}
% iftex – Am I running under pdfTeX, XeTeX or LuaTeX?
% https://www.ctan.org/pkg/iftex
% The package, which works both for Plain TeX and for LaTeX, defines the \ifPDFTeX, \ifXeTeX, and \ifLuaTeX conditionals for testing which engine is being used for typesetting. 

\RequirePackage[normalem]{ulem}
% ulem – Package for underlining
% https://www.ctan.org/pkg/ulem
% The ulem package provides various types of underlining that canstretch between words and be broken across lines

\RequirePackage{layouts}
% layouts – Display various elements of a document's layout
% https://www.ctan.org/pkg/layouts

\RequirePackage{extsizes}
% extsizes – Extend the standard classes’ size options
% https://www.ctan.org/pkg/extsizes

\RequirePackage{multicol}
% multicol – Intermix single and multiple columns
% https://www.ctan.org/pkg/multicol

\RequirePackage{array}
% array – Extending the array and tabular environments
% https://ctan.org/pkg/array

\RequirePackage{silence}

%\RequirePackage[newcommands]{ragged2e}

%\RequirePackage{paracol}
%% paracol – Multiple columns with texts “in parallel”
%% https://www.ctan.org/pkg/paracol

%\RequirePackage[english, noftligs]{selnolig}

%%%%% OPTIONS

% The \newif macro creates three new macros from the argument \if<name>
% > \if<name>, a switch to be used in tests;
% > \<name>true, which sets the switch logically true;
% > \<name>false, which sets the switch logically false;
%
% The two switches can now be used in a constructions
% 
% \if@addpoints % or \ifcancelspace
%   Do stuff
% \else
%   Do other stuff
% \fi
%
% More information : https://tex.stackexchange.com/questions/27803/when-to-use-in-an-if-statement?newreg=b481381bef3c45178808e2d340ef623a

%% Choice of round/square photo
\newif\if@normalphoto
\DeclareOption{normalphoto}{\@normalphototrue}

%% Les options non explicitement déclarées sont passée à la classe "extarticle".
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{extarticle}}
% Toute option supplémentaire inconnue car non déclarée par un élément \DeclareOption est passé à la classe "article" pour être géré par cette dernière.
%
% Exsizes package : 
% https://www.ctan.org/pkg/extsizes

\ProcessOptions\relax

%%%%% External classes loading

\LoadClass{extarticle}
% Convenient command to build classes from existing ones
 
%%%%% Special fixing
%% v1.3.3 Temporary fix for pdfx and biblatex incompatibility
%% (Thanks to @badetitou for highlighting this issue)
%% https://github.com/plk/biblatex/issues/1044
%% Will be removed when fix is released in biblatex 3.16
\catcode30=12

%%%%% DECLARATIONS DEPENDING ON SELECTED OPTIONS

%\AtBeginDocument{
%	\RequirePackage[unicode]{hyperref}
%%	\hypersetup{final,unicode}
%}

%% Macro \AtBeginDocument has its content expanded right after \begin{document}
%\if@withhyper
%  	\AtBeginDocument{%
%    	\RequirePackage{hyperref}
%%		General options : 
%%    	* draft : all hypertext options are turned off
%% 		* final : all hypertext options are turned on
%%		* debug : extra diagnostic messages are printed in the log file
%%    final boolean true all hypertext options are turned on
%%    debug boolean false extra diagnostic messages are printed in
%%    the log file
%    % \hypersetup{hidelinks}
%    	\hypersetup{debug}
%    % CypBLA : Commented to see where a links in the PDF.
%    
%    % \urlstyle{same}
%    % CypBLA : Comment because don't know what it does.
%  }
%\fi

%%%%% CONFIGURATIONS AND NEW COMMANDS DECLARATION

\ExplSyntaxOn

	% The \ExplSyntaxOn command alters the treatment of spaces and line endings so these are ignored.
	% Inside, the code does not require % at the end of each line (compare to 'normal' LaTeX2e code).
	% CypBLA : Mais alors pourquoi % toujours utilisé ci-dessous ? Je peux le supprimer ?
	% To allow inclusion of spaces in the output, ~ is made into a 'normal' space by \ExplSyntaxOn.
	% \ExplSyntaxOff reverses this, returning :, _ and ~ to their values before \ExplSyntaxOn and making spaces 'important' again.
	
	%% Definition of color associations
	\colorlet{name}{black} % Used for : \name
	\colorlet{tagline}{blue!70!black} % Used for : \tagline
	\colorlet{heading}{black} % Used for : \cvsection
	\colorlet{headingrule}{black} % Used for : \rule
	\colorlet{subheading}{black} % Used for : \cvsubsection
	\colorlet{subsubheading}{black} % Used for : \cvsubsubsection
	\colorlet{accent}{blue!70!black} % Used for : \cvref(#2), \cvskill(#2), \skillfive, \cvachievment(#1), \cvevent(#2), \quote, \printinfo(#1)
	\colorlet{emphasis}{black} % Used for : \cvref(#1), \cvskill(#1) \cvachievment(#2), \cvevent(#1)
	\colorlet{body}{black} % Used for : all text color
	
	%% Definition of marker commands : \itemmarker, \ratingmarker
	\newcommand{\itemmarker}{{\small\textbullet}}
	\newcommand{\ratingmarker}{\faCircle}
	
%	\setlist{leftmargin=*,labelsep=0.5em,nosep,itemsep=0.25\baselineskip,after=\vspace{0.25\baselineskip}}
	% leftmargin : marge laissée à gauche du paragraphe de l'item par rapport à la frontière gauche du texte dans lequel l'environnement est inséré.
	% labelsep : espace horizontal entre le label et le paragraphe.
	% itemsep : espace vertical entre les items (en plus de la séparation de paragraphe).
	% 
	\setlist{
		% Horizontal distances
		labelindent=0ex,% Space from left margin to left of label box
		labelwidth=1ex,% Width of label box
		labelsep=0.5ex,% Space from right of label box to item paragraph first line beginning
		itemindent=0ex,% Indentation of the first line of item paragraph compared to the following lines
		leftmargin=!,% Distance from left margin to item paragraph (without item indent)
		% Vertical distances
		topsep=0pt,
%		parskip=0pt,
		itemsep=0pt,
		parsep=0.2\baselineskip
%		nosep% Remove vertical space altogether
%		noitemsep,% Kills the space between items and paragraphs
%		after=\vspace{0.25\baselineskip}
	}
	% Enumitem symbols :
	% "!" : Sets which value is to be computed from the others.
	% "*" : 
	% itemindent=*, sets the minimal width to that of widest label

	% Solutions found there to avoid spaces in itemize : 
	% https://stackoverflow.com/questions/3275622/latex-remove-spaces-between-items-in-list
	
	\setlist[itemize]{label=\itemmarker}
	% > \setlist
	% Command of the "enumitem" package. 
	
	%% Supression de l'indentation des paragraphes
	\setlength{\parindent}{0pt}
	% CypBLA : Supression de l'indentation ?
	% Aucune indentation de paragraphe n'aura lieu dans le document.
	% Même si la commande \indent est utilisée.
	
	%% Environment \begin{fullwidth}
	\newenvironment{fullwidth}
	{ % Opening
	  	\begin{adjustwidth}{}{\dimexpr-\marginparwidth-\marginparsep\relax}
	}
	{ % Closing
		\end{adjustwidth}
	}
	
	% CypBLA : Que renvoie \dimexpr dans cette expression ?
	%
	% Théoriquement :
	% \dimexpr ne sert qu'à exprimer que ce qui suit est une expression de type "dimen" (dimension)
	% Donc ajustement négatif de la largeur du paragraph ?
	% Je suppose que adjustwidth ajuste la largeur du paragraphe exprimée par la variable \textwidth ?
	%
	% > \begin{adjustwidth}{〈leftmargin〉}{〈rightmargin〉
	% The adjustwidth environment of changepage takes two arguments, both of which are adjustments inward from the existing margins.
	% So negative values will enlarge the text block width around this environment.
	% Apparemment ce serait la longueur \linewidth qui serait ajustée et non \textwidth.
	
	%% > \utffriendlydetokenize
	% Used to detokenize inputs with special meaning for Latex.
	% Particularly useful when parsing URLs
	% \detokenize will break UTF-8 in pdflatex
	% \unfriendlydetokenize is used to avoid breaking unicode
	%% Using alternative from https://tex.stackexchange.com/a/530911/226
	
	\newcommand{\utffriendlydetokenize}[1]{
		\scantokens{
			\catcode`\_=12
		%   \catcode`\^=12%
		%   \catcode`\{=12%
		%   \catcode`\}=12%
			\catcode`\&=12%
			\catcode`\$=12%
			\catcode`\#=12%
			\catcode`\~=12%
		%   \catcode`\\=12%
	  		{#1}
		}
	}
	
	% \NewDocumentCommand est tiré du paquet "xparse"
	% xparsedoes not simply need to know the number of arguments for a function, but also the nature of each one. This is done by constructing anargument specification, which defines the number of arguments, the type of each argument and any additional information needed for xparse to read the user input and properly pass itthrough to internal functions.
	%
	% Optional arguments created using xparse make use of dedicated variables to return information about the nature of the argument received.
	% \IfNoValueTF {<argument>} {<true code>} {<false code>}
	% \IfNoValueT {<argument>} {<true code>}
	% \IfNoValueF {<argument>} {<false code>}
	
	%% Command \printinfo
	% Création d'une commande \printinfo avec :
	% > Comme 1e argument obligatoire un symbole
	% > Comme 2e argument obligatoire l'information (illustrée par le symbole)
	% > Comme 3e argument facultatif un URL qui sera superposé à l'information.
	
	% \printinfo{symbol}{detail}[optional hyperlink prefix]
	
	\newcommand{\infoIconFont}[1]{
		\color{accent}{#1}
	}
	% OLD : \textcolor
	
	\newcommand{\interIconsHSpace}{
		\hspace{1.8em}
	}
	
	% > \NewDocumentCommand
	% Package xparse – A generic document command parser
	% https://ctan.org/pkg/xparse
	
	\NewDocumentCommand{\printinfo}{m m o}{
		% Arguments :
		% #1 : <icon>
		% #2 : <writtenText>
		% #3 : <hyperlink> - optional
		\IfNoValueTF{#3}
		{ % True case
			\makebox{
				% Create a single line box, large enough to hold its content.
				% "> \mbox{text}" is a shotcut command for "> \makebox[width][pos]{text}".
				\infoIconFont{#1}~\utffriendlydetokenize{#2}\interIconsHSpace
			}
		}
		{ % False case
			\makebox{
				\infoIconFont{#1}~\href{#3}{\utffriendlydetokenize{#2}}\interIconsHSpace
			}
	  	}
	}
	
	%% Command \NewInfoField
	% > \NewInfoFiled{fieldname}{symbol}[optional hyperlink prefix]
	% Used for convenient creation of fields with text and symbol.
	%
	% 
	% Ex :
	% \NewInfoField{gitlab}{\faGitlab}[https://gitlab.com/]
	%
	% \gitlab{your_id}
	
	% > \NewDocumentCommand{<command_name>}{<arguments_specification>}{< macro >}
	% Part of the "xparse" package.
	
	% > \@namedef{<text>}{<def>}
	% Lets define a macro called \<text>.
	
	% > \@nameuse{<text>}
	% Lets you call a macro called \<text>.
	
	% > \csdef
	% Part of the "etoolbox" package.
	
%	\NewDocumentCommand{\NewInfoField}{m m o}{
%		% Arguments :
%		% #1 : <fieldname>
%		% #2 : <symbol>
%		% #3 : <hyperlink> - optional
%		\IfNoValueF{#3}{
%			\csdef{#1 hyperprefix}{#3}% Create command > \<fieldname>hyperprefix{<hyperlink>}
%		}
%	  	\csdef{#1 symbol}{#2}% Create command > \<fieldname>symbol{<symbol>}
%	  	\csdef{#1}##1{% Create command > \<fieldname>{<text>} 
%			\if@withhyper
%	   			\IfNoValueTF{#3}
%				{% True case
%					\printinfo{\csuse{#1 symbol}}{##1}% Call : \printinfo{<symbol>}{<fieldname>}
%					% Note : 
%					% #1 : <fieldname>, is replaced right now by its value
%					% ##1 : <text>, will be filled when the command > \<fieldname>{<text>} < will be used.
%				}
%	      		{% False case
%	      			\printinfo{\csuse{#1 symbol}}{##1}[\csuse{#1 hyperprefix}##1]% Call : \printinfo{<symbol>}{<text>}[<hyperlink><text>]
%	      		}
%	    	\else
%				\printinfo{\csuse{#1 symbol}}{##1}
%	    	\fi
%	  	}
%	}
	
	%% Définition de 3 champs d'information.
	\newcommand{\name}[1]{\def\@name{#1}} % > \name{<nom>}
	\newcommand{\tagline}[1]{\def\@tagline{#1}} % > \tagline{<tag>}
	\newcommand{\personalinfo}[1]{\def\@personalinfo{#1}} % > \personalinfo{<personalinfo>}
	
	%% Champs d'information à symbole.
%	\NewInfoField{email}{\faAt}[mailto:] % Adresse mail
%	\NewInfoField{mailaddress}{\faEnvelope} % Adresse postale
%	\NewInfoField{phone}{\faPhone} % Numéro de téléphone
%	\NewInfoField{homepage}{\faGlobe}[https://] % Site internet
%	\NewInfoField{twitter}{\faTwitter}[https://twitter.com/] % Twitter
%	\NewInfoField{linkedin}{\faLinkedin}[https://linkedin.com/in/] % LinkedIn
%	\NewInfoField{github}{\faGithub}[https://github.com/] % Github
%	\NewInfoField{orcid}{\aiOrcid}[https://orcid.org/] % Open Researcher and Contributor ID : https://fr.wikipedia.org/wiki/ORCID
%	\NewInfoField{location}{\faMapMarker} % Emplacement (Pas forcément utile si la même que l'adresse déclarée...)
%	\NewInfoField{birth}{\faBaby} % Birthday and age field
%	\NewInfoField{drivingLicence}{\faCar} % Birthday and age field
	
	%% Create length fields. Act as global variables.
	% v1.2: Support for multiple photos
	\newlength{\altacv@photos@width}
	\newlength{\altacv@photo@diam@left}
	\newlength{\altacv@photo@diam@right}
	
	%% Macros used to append the macros "\@makeaphoto" as many times as needed.
	\def\altacv@left@photos{}
	\def\altacv@right@photos{}
	
	%% Command \@makeaphoto
	% Crée la commande :
	% \@makeaphoto{<width>}{<cheminVersImage>}
	
	% Mini-page environment
	% > \begin{minipage}[position][height][inner-pos]{width}
	% > 	contents
	% > \end{minipage}
	% Put contents into a box that is width wide. 
	% This is like a small version of a page; it can contain its own footnotes, itemized lists, etc. (There are some restrictions, including that it cannot have floats.) 
	% This box will not be broken across pages.
	
	\newcommand{\@makeaphoto}[2]{
		\begin{minipage}{#1}
			\if@normalphoto% Cas d'une photo carré
	 			\includegraphics[width=\linewidth]{#2}%
	 			% \linewidth => largeur au sein de la minipage.
			\else% Cas d'une photo ronde
				\tikz\path[fill overzoom image={#2}]circle[radius=0.5\linewidth];
			\fi
	  	\end{minipage}
	}
	
	% \appto{〈hook〉}{〈code〉}
	% This command appends arbitrary 〈code〉 to a 〈hook〉.  If the 〈code〉contains any parameter characters, they need not be doubled. This command is robust.
	% Part of the "etoolbox" package.
	
	%% Command \altacv@add@photo@left
	% > \altacv@add@photo@left{<photoPath>}
	%
	% Each time this command is called it append a new photo creation macro "\@makeaphoto" to the macro "\altacv@left@photos".
	% It also fill the length macro \altacv@photos@width
	
	\newcommand{\altacv@add@photo@left}[1]{%
		\appto{\altacv@left@photos}{
	    	\@makeaphoto{\altacv@photo@diam@left}{#1}\hspace{1ex}
	  	}
	  	\addtolength{\altacv@photos@width}{\altacv@photo@diam@left}
		\addtolength{\altacv@photos@width}{1ex}
	}
	
	%% Command \altacv@add@photo@right
	% > \altacv@add@photo@right{<photoPath>}
	%
	% The "symetric" \altacv@add@photo@left but to place photos on the right.
	\newcommand{\altacv@add@photo@right}[1]{
		\appto{\altacv@right@photos}{
	    	\@makeaphoto{\altacv@photo@diam@right}{#1}\hspace{1ex}
	  	}
	  	\addtolength{\altacv@photos@width}{\altacv@photo@diam@right}
		\addtolength{\altacv@photos@width}{1ex}
	}
	
	% \forcsvlist{〈handler〉}{〈item, item, ...〉}
	% This command loops over a comma-separated list of items and executes the 〈handler〉specified at invocation time for every item in the list, passing the item as an argument.
	% Ex : \forcsvlist{\listadd\mylist}{item1, item2, item3}
	% La commande est définie par la paquet "etoolbox"
	
	%% Command \photoL
	% > \photoL{<width>}{<photoPath1>,<photoPath2>}
	\newcommand{\photoL}[2]{
		\setlength{\altacv@photo@diam@left}{#1}
		\forcsvlist{\altacv@add@photo@left}{#2}
	}
	
	%% Command \photoR
	% > \photoR{<width>}{<photoPath1>,<photoPath2>}
	\newcommand{\photoR}[2]{
		\setlength{\altacv@photo@diam@right}{#1}
		\forcsvlist{\altacv@add@photo@right}{#2}
	}
	
	%% \photo=\photoR
	\let\photo\photoR % Est-ce que rend la commande \photo équivalente à \photoR ?
	% \let allows you to copy the content of a command into a new command.  
	% \let<new-command>[[<spaces>]=]<original-command>
	
	% Used for all titles. Change here to impact each title.
	\newcommand{\titlesfont}[1]{
		\textbf{#1}
	}

	\newcommand{\nameTitle}[1]{
		\color{name}{\Huge{\titlesfont{#1}}}\par
		\vspace{0mm}
	}

	% > Huge
	% Command which create the biggest font size.
	% In growing order : 
	% \tiny \scriptsize \footnotesize \small \normalsize \large \Large \LARGE \huge \Huge

	\newcommand{\taglinePar}[1]{
		\color{tagline}{\Large{\titlesfont{#1}}}\par
		\smallskip
	}

	\newcommand{\personalInfoPar}[1]{
		\begingroup
			\linespread{1.3}
			\large{\titlesfont{#1}}\par
		\endgroup
	}
	% Changing space between line :
	% https://tex.stackexchange.com/questions/48741/temporarily-increase-line-spacing
	% Propositions : 
	% > \linespread{1}
	% > \renewcommand\baselinestretch{1}
	
	% Vertical blank spaces commands :
	% \vspace{0mm}
	% \vspace{5mm}
	% \smallskip
	% \medskip
	% \bigskip
%	\newcommand{\nameskip}{\vspace{0mm}}
%	\newcommand{\taglineskip}{\smallskip}
	
	%% Command \makecvheader
	\newcommand{\makecvheader}{
		\begingroup
		    \altacv@left@photos % Call the macro containing the appened macros for photos insertion (left side)
		    \hfill
		    \begin{minipage}{\dimexpr\linewidth-\altacv@photos@width} % \dimexpr starts a <dimen expr> that is optionally closed with a \relax
	    		\raggedright % Left alignement
		    	\nameTitle{\@name} % Name as title of the CV
%		    	\namefont{\@name}\par % Name as title of the CV
%		    	\vspace{0mm}
%		    	\taglinefont{\@tagline}\par % Description text
%				\smallskip
				\taglinePar{\@tagline} % Description text
		    	\personalInfoPar{\@personalinfo} % Personnal infos which are information fields with symbols
		    \end{minipage}
	    	\hfill
		    \altacv@right@photos\par % Right side photo insertion
	  	\endgroup
	}
	
	% Used in :
	% * \cvskill
	% * \cvref
	\newcommand{\textEmph}[1]{
		\color{emphasis}{\textbf{#1}}
	}
	% OLD : \textcolor
	
	%% Command \divider
	% A dashed rule to divide the sections.
	\newcommand{\divider}{
		\textcolor{body!30}{\hdashrule{\linewidth}{0.6pt}{0.5ex}}
		\medskip
	}
	% Définission d'une commande de barre horizontale de la largeur d'une ligne.
	% Précisions : 
	% > \hdashrule{<largeur>}{<hauteur>}{<espace_laissé_vide>}
	% \medskip <=> \vspace{\medskipamount}
	% > \smallskip
	% > \bigskip
	
	%% Commands for heading rule, as separator
	\newcommand{\headingRule}{
		\color{headingrule}{\rule{\linewidth}{1pt}}
	}
	
	%% Commands for fonts of cv sectionning : \cvsectionfont \cvsubsectionfont
	% Definition of section titles
	\newcommand{\cvsection}[1]{
		\color{heading}{\uline{\Large{\titlesfont{#1}}}}\\
		[-1.2ex]\headingRule\par
		\smallskip
	}
	
	% > cvsubsection{heading}
	% Definition of subsection titles
	\newcommand{\cvsubsection}[1]{
		\smallskip
		\color{subheading}{\uline{\large{\titlesfont{#1}}}}\par
		\smallskip
	}
	
	%% Command \cvsubsubsection
	% > cvsubsubsection{heading}
	\newcommand{\cvsubsubsection}[1]{
		\smallskip
		\color{subsubheading}{\uline{\normalsize{\titlesfont{#1}}}}\par
		\smallskip
	}
	
	%%%% CV event configuration
	
	\newcommand{\cveventTitle}[1]{
		\color{emphasis}{\large{#1}}\par
	}

	\newcommand{\cveventPlacePar}[1]{
		\color{emphasis}{\textbf{#1}}\par
	}

	\newcommand{\cveventCalendarBox}[1]{
		\makebox[0.4\linewidth][l]{
			\small{\faCalendar~#1}
		}
	}

	\newcommand{\cveventMapBox}[1]{
		\makebox[0.4\linewidth][l]{
			\small{\faMapMarker~#1}
		}
	}
	
	%% Command \cvevent
	% > cvevent{Niveau_&_discipline}{Université}{Date}{Lieu_géographique}
	\newcommand{\cvevent}[4]{
		\cveventTitle{#1} % Event title writing
	  	\ifstrequal{#2}{}
	  	{} % True case
	  	{ % False case
	  		\cveventPlacePar{#2} % Event place writing
		}
		\ifstrequal{#3}{}
		{} % True case
		{
			\cveventCalendarBox{#3} % Event duration, dates
		}
	  	\ifstrequal{#4}{}
	  	{} % True case
	  	{ % False case
  			\cveventMapBox{#4} % Event location
		}
		\par
	}
	
	% tabularx environment (tabularx package)
	% > \begin{tabularx}{<width>}[<pos>]{<preamble>}
	
	%%%% CV achievment
	
	%% Command \cvachievement
	% > \cvachievement{<symbole>}{<achievement>}{<details_about_achievement>}
	\newcommand{\cvachievement}[3]{
		\begin{tabularx}{\linewidth}{ p{2em} | >{\raggedright\arraybackslash}X }
			\multirow{2}{*}{\Large\color{accent}#1} & \bfseries\textcolor{emphasis}{#2}\\
			& #3
	  	\end{tabularx}
	  	\smallskip
	}

	%%%% CV skill
	
	% \ifnumgreater{〈integer expression〉}{〈integer expression〉}{〈true〉}{〈false〉}
	% Vient du paquet "etoolbox".
	
	%% Command \cvskill
	% > \cvskill{<compétence>}{<valeurDe1à5>}
	%
	% Explication :
	% Test sur x allant de 1 à 5 par rapport à #2.
	% Si x > #2 => \space\color{body!30}\ratingmarker
	% Si x <= #2 => \space\color{accent}\ratingmarker
	\newcommand{\cvskill}[2]{
		\textEmph{#1} % Skill description
		\hfill
		\foreach \x in {1,...,5}{% Drawing of the score on five
			% OLD : \space
			\ifnumgreater{\x}{#2}
			{\color{body!30}}% True case
			{\color{accent}}% False case
			\ratingmarker
		}
		\par
	}

	%% Command \skillfive
	\newcommand{\skillfive}[1]{
%		\hfill
		\foreach \x in {1,...,5}{
			% OLD : \space
			\ifnumgreater{\x}{#1}
			{\color{body!30}} % True case
			{\color{accent}} % False case
			\ratingmarker
		}
%		\par
	}

	%%%% cvref
	
	%% Command \cvref
	% Description of referees
	% > \cvref{<name>}{<email>}{<mail adress>}
	\newcommand{\cvref}[3]{
		\smallskip
		\textEmph{#1}\par % Referee's name
		\begin{description}[font=\color{accent},style=multiline,leftmargin=1.35em,align=left]
			\item[\small\normalfont\emailsymbol] #2 % Referee's email
			\item[\small\normalfont\mailaddresssymbol] #3 % Referee's mail adress
		\end{description}
		%   \medskip
	}
	
	
	%%%% Gestion bibliographie à l'aide du paquet biblatex
	
	% Je pense qu'il est nécessaire de connaitre en détail le contenu de la librairie "biblatex"
	
	%% For removing numbering entirely when using a numeric style
	% \setlength{\bibhang}{1em}
	% \DeclareFieldFormat{labelnumberwidth}{\makebox[\bibhang][l]{\itemmarker}}
	% \setlength{\biblabelsep}{0pt}
	
	\defbibheading{pubtype}{\cvsubsection{#1}} 
	% Est-ce cette ligne qui définit le le heading comme "pubtype" ?
	% Ce qui permettra de jolies icones dans le titre ?
	
	\renewcommand{\bibsetup}{\vspace*{-\baselineskip}}
	\AtEveryBibitem{\makebox[\bibhang][l]{\itemmarker}} % Pour obtenir une liste de publication à puces ?
	\setlength{\bibitemsep}{0.25\baselineskip}
	
	
	%%%% Actions en début de document
	\AtBeginDocument{%
		\pagestyle{empty}
		\color{body}
		\raggedright
	}

\ExplSyntaxOff % L'environnement de syntaxe explicite ne considérant pas les espaces est fermé ici.
% Les commandes qui suivent de la bibliothèque "Tikz" son plus clairs avec l'utilisation de véritables espaces.
	
%%%% CV tags

%% Command \cvtag
% > \cvtag{<contenuEtiquette>}
% Crée une étiquette directement au sein du paragraphe avec un mot clé au sein d'un cadre aux bords arrondis.
\newcommand{\cvtag}[1]{%
	\tikz[baseline]\node[anchor=base,draw=body!30,rounded corners,inner xsep=1ex,inner ysep =0.75ex,text height=1.5ex,text depth=.25ex]{#1};
}

%%%% Wheelchart creation

%% Command \wheelchart
% Adapted from @Jake's answer at http://tex.stackexchange.com/a/82729/226
% \wheelchart[<angle>]{<outer_radius>}{<inner_radius>}{<value>,<text_width>,<color>,<detail>}	% comma-separated list of value/text width/color/detail
\newcommand{\wheelchart}[4][0]{%
 \begingroup
    	\centering
    	\def\innerradius{#3}
		\def\outerradius{#2}	
		
  % Calculate total
  \pgfmathsetmacro{\totalnum}{0}
  \foreach \value/\colour/\name in {#4} {
     		\pgfmathparse{\value+\totalnum}
      \global\let\totalnum=\pgfmathresult
  }
    	
		\begin{tikzpicture}

			% Calculate the thickness and the middle line of the wheel
			\pgfmathsetmacro{\wheelwidth}{\outerradius-\innerradius}
			\pgfmathsetmacro{\midradius}{(\outerradius+\innerradius)/2}
			\pgfmathsetmacro{\totalrot}{-90 + #1}

			% Rotate so we start from the top
			\begin{scope}[rotate=\totalrot]

				% Loop through each value set. \cumnum keeps track of where we are in the wheel
				\pgfmathsetmacro{\cumnum}{0}
				
				\foreach \value/\width/\colour/\name in {#4} {
           \pgfmathsetmacro{\newcumnum}{\cumnum + \value/\totalnum*360}
		
           % Calculate the percent value
           \pgfmathsetmacro{\percentage}{\value/\totalnum*100}
           % Calculate the mid angle of the colour segments to place the labels
           \pgfmathsetmacro{\midangle}{-(\cumnum+\newcumnum)/2}
		
           % This is necessary for the labels to align nicely
           \pgfmathparse{
              (-\midangle>180?"west":"east")
           } \edef\textanchor{\pgfmathresult}
           \pgfmathparse{
              (-\midangle>180?"flush left":"flush right")
           } \edef\textalign{\pgfmathresult}
           \pgfmathsetmacro\labelshiftdir{1-2*(-\midangle<180)}
		
           % Draw the color segments. Somehow, the \midrow units got lost, so we add 'pt' at the end. Not nice...
           \filldraw[draw=white,fill=\colour] (-\cumnum:\outerradius) arc (-\cumnum:-(\newcumnum):\outerradius) --
           (-\newcumnum:\innerradius) arc (-\newcumnum:-(\cumnum):\innerradius) -- cycle;
		
           % Draw the data labels
           \draw  [*-,thin,emphasis] node [append after command={(\midangle:\midradius pt) -- (\midangle:\outerradius + 1ex) -- (\tikzlastnode)}] at (\midangle:\outerradius + 1ex) [xshift=\labelshiftdir*0.5cm,inner sep=1ex, outer sep=0pt, text width=\width,anchor=\textanchor,align=\textalign,font=\small,text=body]{\name};
           
           % Set the old cumulated angle to the new value
           \global\let\cumnum=\newcumnum
	        	}
     
      		\end{scope}
%      	\draw[gray] (0,0) circle (\outerradius) circle (\innerradius);
    	\end{tikzpicture}\par
 \endgroup
}