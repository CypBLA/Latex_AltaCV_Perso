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
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{altacv}[2020/05/17 AltaCV v1.3.3, yet another alternative class for a resume/curriculum vitae.]

%%%%% EXTERNAL PACKAGES

%% v1.3.2 Hopefully this helps make the PDF
%% file more 'friendly' with copy-paste etc
\RequirePackage[a-1b]{pdfx}

\RequirePackage[margin=2cm]{geometry}
% geometry – Flexible and complete interface to document dimensions : https://www.ctan.org/pkg/geometry

\RequirePackage[fixed]{fontawesome5}
% fontawesome5 – Font Awesome 5 with LaTeX support : https://www.ctan.org/pkg/fontawesome5

\RequirePackage{ifxetex,ifluatex}
% ifluatex – Provides the \ifluatex switch : https://www.ctan.org/pkg/ifluatex
% ifxetex – Am I running under XeTeX? : https://www.ctan.org/pkg/ifxetex

\RequirePackage{scrlfile}
% scrlfile – Installation control for koma-script packages : https://www.ctan.org/pkg/scrlfile
% The package provides hooks for the execution of commands before or after loading files, classes or packages.

\RequirePackage{xparse}
% xparse – A generic document command parser : https://www.ctan.org/pkg/xparse
% The package provides a high-level interface for producing document-level commands. In that way, it offers a replacement for LaTeX2ε’s \newcommand macro, with significantly improved functionality. 

\RequirePackage{xcolor}
% xcolor – Driver-independent color extensions for LaTeX and pdfLaTeX
% https://www.ctan.org/pkg/xcolor

\RequirePackage{pgf}
% OLD : \RequirePackage{tikz}
% pgf – Create PostScript and PDF graphics in TeX
% https://www.ctan.org/pkg/pgf
\usetikzlibrary{arrows}

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

\RequirePackage{multirow,tabularx}
% multirow – Create tabular cells spanning multiple rows
% https://www.ctan.org/pkg/multirow
%
% tabularx – Tabulars with adjustable-width columns
% https://www.ctan.org/pkg/tabularx

\RequirePackage{changepage}
% changepage – Margin adjustment and detection of odd/even pages
% https://www.ctan.org/pkg/changepage

% \RequirePackage{marginfix}

\RequirePackage[backend=biber,style=authoryear,sorting=ydnt]{biblatex}
% BibLaTeX – Sophisticated Bibliographies in LaTeX
% https://www.ctan.org/pkg/biblatex

\RequirePackage{afterpage}
% afterpage – Execute command after the next page break
% https://www.ctan.org/pkg/afterpage

%%%%% OPTIONS

%% v1.1: Optionally load academicons
\newif\if@academicons 

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

\DeclareOption{academicons}{\@academiconstrue}
% Regarde si l'option "academicons" a été passé lors de l'appel à la classe

%% v1.1.3: Choice of round/square photo
\newif\if@normalphoto
\DeclareOption{normalphoto}{\@normalphototrue}

%% Choice to call or not the package "ragged2e".
% The package essentially defines new commands \Centering, \RaggedLeft, and \RaggedRight and new environments Center, FlushLeft, and FlushRight.
\newif\if@raggedtwoe

\DeclareOption{ragged2e}{\@raggedtwoetrue}

%% Les options non explicitement déclarées sont passée à la classe "extarticle".
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
% Toute option supplémentaire inconnue car non déclarée par un élément \DeclareOption est passé à la classe "article" pour être géré par cette dernière.

% OLD : > \DeclareOption*{\PassOptionsToClass{\CurrentOption}{extarticle}}
% La classe "extarticle" est-elle incluse par défaut dans LaTeX ?
% Ne faut-il pas inclure à un moment donné le paquet "extsizes" ? :
% https://www.ctan.org/pkg/extsizes

%% v1.3: load hyperref for clickable hyperlinks
\newif\if@withhyper
\DeclareOption{withhyper}{\@withhypertrue}
\ProcessOptions\relax

%%%%% External classes loading

\LoadClass{article}
% Convenient command to build classes from existing ones
 
%% v1.3.3 Temporary fix for pdfx and biblatex incompatibility
%% (Thanks to @badetitou for highlighting this issue)
%% https://github.com/plk/biblatex/issues/1044
%% Will be removed when fix is released in biblatex 3.16
\catcode30=12

%%%%% DECLARATIONS DEPENDING ON SELECTED OPTIONS

%% v1.1.5: added for convenience
\newif\ifxetexorluatex
\ifxetex
  \xetexorluatextrue
\else
  \ifluatex
    \xetexorluatextrue
  \else
    \xetexorluatexfalse
  \fi
\fi

\ifxetexorluatex
  \RequirePackage{fontspec}
  % fontspec – Advanced font selection in XeLaTeX and LuaLaTeX : https://www.ctan.org/pkg/fontspec
\else
  %% v1.3.2 attempts to make ligatures
  %% copy-paste as normal characters
  \RequirePackage{cmap}
  \RequirePackage[utf8]{inputenc}
  \RequirePackage[T1]{fontenc}
  \input{glyphtounicode}
  \pdfglyphtounicode{f_f}{FB00}
  \pdfglyphtounicode{f_f_i}{FB03}
  \pdfglyphtounicode{f_f_l}{FB04}
  \pdfglyphtounicode{f_i}{FB01}
  \pdfgentounicode=1
\fi

%% v1.1: Optionally load academicons
%% v1.1.5: Handle different versions of academicons
\if@academicons
  \ifxetexorluatex
    \RequirePackage{fontspec}
    %% academicons in TL2018 doesn't require
    %% Academicons to be installed in OS fonts
    %% so can be loaded directly
    
    % D'où vient la command \@ifl@t@r ? Est-elle liée à un paquet spécifique ?
    % Est-elle dans les commandes par défaut de LaTex ?
    % LaTeX core macro \@ifl@ter to check the file date
    \@ifl@t@r\fmtversion{2018/04/01}{%
      \RequirePackage{academicons}
    }{%
      % TL2017
      % TL = TexLive ??
      \@ifl@t@r\fmtversion{2017/04/01}{%
        \@ifpackagelater{academicons}{2018/03/01}{%
          \RequirePackage{academicons}
        }{%
          \let\ori@newfontfamily\newfontfamily%
          \renewcommand{\newfontfamily}[2]{}
          \RequirePackage{academicons}
          \let\newfontfamily\ori@newfontfamily
          \newfontfamily{\AI}{academicons.ttf}
        }
      }{% TL2016 requires the package to be loaded before
        % the version can be checked. Only added because
        % Overleaf v1 still runs TL2016; will be removed
        % when v1 is completely retired.
          \let\ori@newfontfamily\newfontfamily%
          \renewcommand{\newfontfamily}[2]{}
          \RequirePackage{academicons}
          \let\newfontfamily\ori@newfontfamily
          \newfontfamily{\AI}{academicons.ttf}
      }
    }
  \else
    \ClassError{AltaCV}{academicons unsupported by latex or pdflatex. Please compile with xelatex or lualatex}{Please compile with xelatex or lualatex to use the academicons option}
  \fi
\fi

\if@raggedtwoe
  \RequirePackage[newcommands]{ragged2e}
\fi

% Macro \AtBeginDocument has its content expanded right after \begin{document}
\if@withhyper
  \AtBeginDocument{%
    \RequirePackage{hyperref}
    \hypersetup{hidelinks}
    \urlstyle{same}
  }
\fi

%%%%% CONFIGURATIONS AND NEW COMMANDS DECLARATION

%% Definition of color associations
\colorlet{accent}{blue!70!black}
\colorlet{emphasis}{black}
\colorlet{heading}{black}
\colorlet{headingrule}{black}
\colorlet{subheading}{emphasis}
\colorlet{body}{black!80!white}
\colorlet{name}{heading}
\colorlet{tagline}{accent}

%% Definition of marker commands : \itemmarker, \ratingmarker
\newcommand{\itemmarker}{{\small\textbullet}}
\newcommand{\ratingmarker}{\faCircle}

\setlist{leftmargin=*,labelsep=0.5em,nosep,itemsep=0.25\baselineskip,after=\vspace{0.25\baselineskip}}
\setlist[itemize]{label=\itemmarker}
% > \setlist
% Command of the "enumitem" package. 

%% Supression de l'indentation des paragraphes
\setlength{\parindent}{0pt}
% CypBLA : Supression de l'indentation ?
% Aucune indentation de paragraphe n'aura lieu dans le document.
% Même si la commande \indent est utilisée.

%% Command \divider
\newcommand{\divider}{\textcolor{body!30}{\hdashrule{\linewidth}{0.6pt}{0.5ex}}\medskip}
% Définission d'une commande de barre horizontale de la largeur d'une ligne.
% Précisions : 
% > \hdashrule{<largeur>}{<hauteur>}{<espace_laissé_vide>}
% \medskip <=> \vspace{\medskipamount}
% > \smallskip
% > \bigskip

%% Environment \begin{fullwidth}
\newenvironment{fullwidth}{%
  \begin{adjustwidth}{}{\dimexpr-\marginparwidth-\marginparsep\relax}}
  {\end{adjustwidth}}
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

%% v1.3.1 \detokenize will break UTF-8 in pdflatex
%% Using alternative from https://tex.stackexchange.com/a/530911/226
\newcommand{\utffriendlydetokenize}[1]{%
\scantokens{%
  \catcode`\_=12%
%   \catcode`\^=12%
%   \catcode`\{=12%
%   \catcode`\}=12%
  \catcode`\&=12%
  \catcode`\$=12%
  \catcode`\#=12%
  \catcode`\~=12%
%   \catcode`\\=12%
  {#1}%
}%
}

%% v1.3: Incorporating hyperlinks
%% v1.3.1: using \unfriendlydetokenize to avoid
%% breaking unicode
\ExplSyntaxOn
% The \ExplSyntaxOn command alters the treatment of spaces and line endings so these are ignored.
% Inside, the code does not require % at the end of each line (compare to 'normal' LaTeX2e code).
% CypBLA : Mais alors pourquoi % toujours utilisé ci-dessous ? Je peux le supprimer ?
% To allow inclusion of spaces in the output, ~ is made into a 'normal' space by \ExplSyntaxOn.
% \ExplSyntaxOff reverses this, returning :, _ and ~ to their values before \ExplSyntaxOn and making spaces 'important' again.

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

\NewDocumentCommand{\printinfo}{m m o}{%
  \IfNoValueTF{#3}{%
    \mbox{\textcolor{accent}{\normalfont #1}~\utffriendlydetokenize{#2}\hspace{2em}}%
  }{%
     \if@withhyper%
      \mbox{\textcolor{accent}{\normalfont #1}~
      \href{#3}{\utffriendlydetokenize{#2}}\hspace{2em}}
     \else%
       \ClassWarning{Please specify [withhyper] option to enable hyperlinks. Printing out full hyperlink prefix #1 for now.}%
      \mbox{\textcolor{accent}{\normalfont #1}~{\utffriendlydetokenize{#3#2}}\hspace{2em}}%
     \fi%
  }%
}%

%% Command \NewInfoField
% > \NewInfoFiled{fieldname}{symbol}[optional hyperlink prefix]
% 
% Ex :
% \NewInfoField{gitlab}{\faGitlab}[https://gitlab.com/]
%
% \gitlab{your_id}

% v1.3: Exploring convenient creation of fields
\NewDocumentCommand{\NewInfoField}{m m o}{%
  \IfNoValueF{#3}{\csdef{#1 hyperprefix}{#3}}%
  \csdef{#1 symbol}{#2}%
  \csdef{#1}##1{%
    \if@withhyper
      \IfNoValueTF {#3}
        {\printinfo{\csuse{#1 symbol}}{##1}}%
        {\printinfo{\csuse{#1 symbol}}{##1}[\csuse{#1 hyperprefix}##1]}%
    \else
      \printinfo{\csuse{#1 symbol}}{##1}%
    \fi%
  }
}
% CypBLA : Je n'ai honnetement pas tout compris de comment cette déclaration de commande fonctionne.
% Pourtant, elle doit bien fonctionner puisqu'elle est appelée en dessous.
\ExplSyntaxOff

%% Définition de 3 champs d'information.
\newcommand{\name}[1]{\def\@name{#1}} % > \name{<nom>}
\newcommand{\tagline}[1]{\def\@tagline{#1}} % > \tagline{<tag>}
\newcommand{\personalinfo}[1]{\def\@personalinfo{#1}} % > \personalinfo{<personalinfo>}

%% Champs d'information à symbole.
\NewInfoField{email}{\faAt}[mailto:] % Adresse mail
\NewInfoField{mailaddress}{\faEnvelope} % Adresse postale
\NewInfoField{phone}{\faPhone} % Numéro de téléphone
\NewInfoField{homepage}{\faGlobe}[https://] % Site internet
\NewInfoField{twitter}{\faTwitter}[https://twitter.com/] % Twitter
\NewInfoField{linkedin}{\faLinkedin}[https://linkedin.com/in/] % LinkedIn
\NewInfoField{github}{\faGithub}[https://github.com/] % Github
\NewInfoField{orcid}{\aiOrcid}[https://orcid.org/] % Open Researcher and Contributor ID : https://fr.wikipedia.org/wiki/ORCID
\NewInfoField{location}{\faMapMarker} % Emplacement (Pas forcément utile si la même que l'adresse déclarée...)

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
\newcommand{\@makeaphoto}[2]{%
  \begin{minipage}{#1}%
    \if@normalphoto
      \includegraphics[width=\linewidth]{#2} % \linewidth => largeur au sein de la minipage.
    \else
      \tikz\path[fill overzoom image={#2}]circle[radius=0.5\linewidth];
    \fi%
  \end{minipage}%
}

% \appto{〈hook〉}{〈code〉}
% This command appends arbitrary〈code〉to a〈hook〉.  If the〈code〉contains any pa-rameter characters, they need not be doubled. This command is robust.
% Part of the "etoolbox" package.

%% Command \altacv@add@photo@left
% > \altacv@add@photo@left{<photoPath>}
\newcommand{\altacv@add@photo@left}[1]{%
  \appto{\altacv@left@photos}{%
    \@makeaphoto{\altacv@photo@diam@left}{#1}\hspace{1ex}%
  }%
  \addtolength{\altacv@photos@width}{\altacv@photo@diam@left}%
  \addtolength{\altacv@photos@width}{1ex}%
}

%% Command \altacv@add@photo@right
% > \altacv@add@photo@right{<photoPath>}
\newcommand{\altacv@add@photo@right}[1]{%
  \appto{\altacv@right@photos}{%
    \@makeaphoto{\altacv@photo@diam@right}{#1}\hspace{1ex}%
  }%
  \addtolength{\altacv@photos@width}{\altacv@photo@diam@right}%
  \addtolength{\altacv@photos@width}{1ex}%
}

% \forcsvlist{〈handler〉}{〈item, item, ...〉}
% This command loops over a comma-separated list of items and executes the 〈handler〉specified at invocation time for every item in the list, passing the item as an argument.
% Ex : \forcsvlist{\listadd\mylist}{item1, item2, item3}
% La commande est définie par la paquet "etoolbox"

%% Command \photoL
% > \photoL{<width>}{<photoPath1>,<photoPath2>}
\newcommand{\photoL}[2]{%
  \setlength{\altacv@photo@diam@left}{#1}%
  \forcsvlist{\altacv@add@photo@left}{#2}%
}

%% Command \photoR
% > \photoR{<width>}{<photoPath1>,<photoPath2>}
\newcommand{\photoR}[2]{%
  \setlength{\altacv@photo@diam@right}{#1}%
  \forcsvlist{\altacv@add@photo@right}{#2}%
}

%% \photo=\photoR
\let\photo\photoR % Est-ce que rend la commande \photo équivalente à \photoR ?
% \let allows you to copy the content of a command into a new command.  
% \let<new-command>[[<spaces>]=]<original-command>

%% Command \namefont
\newcommand{\namefont}{\Huge\bfseries}
% > \bfseries
% Command for font changing. Passe the text to bold font.
%
% > Huge
% Commande créant automatiquement la plus grande taille de polices.
% Dans l'ordre croissant : 
% \tiny \scriptsize \footnotesize \small \normalsize \large \Large \LARGE \huge \Huge

%% Commands to shape the cv header : \taglinefont \personalinfofont \cvsectionfont
\newcommand{\taglinefont}{\large\bfseries}
\newcommand{\personalinfofont}{\footnotesize\bfseries}

%% Commands for fonts of cv sectionning : \cvsectionfont \cvsubsectionfont
\newcommand{\cvsectionfont}{\LARGE\bfseries}
\newcommand{\cvsubsectionfont}{\large\bfseries}
\newcommand{\cvsubsubsectionfont}{\normalsize\bfseries}

%% Command \makecvheader
\newcommand{\makecvheader}{%
  \begingroup
    \altacv@left@photos\hfill%
    \begin{minipage}{\dimexpr\linewidth-\altacv@photos@width}%
    \raggedright%
    {\namefont\color{name}\MakeUppercase{\@name}\par}
    \medskip
    {\taglinefont\color{tagline}\@tagline\par}
    \medskip
    {\personalinfofont\@personalinfo\par}
    \end{minipage}\hfill%
    \altacv@right@photos\par%
  \endgroup\medskip
}

%% Environment \begin{quote}
% Adaptation of the quote environment
\renewenvironment{quote}{\color{accent}\itshape\large}{\par}

% \ifstrequal{〈string〉}{〈string〉}{〈true〉}{〈false〉}
% Compares two strings and executes〈true〉if they are equal, and〈false〉otherwise.

% Rappel : Fonctionnement de \newcommand
% Exemple avec écriture d'une expression binomiale :
% > \newcommand{\plusbinomial}[3][2]{(#2 + #3)^#1}
% 
% \plusbinomial - This is the name of the new command.
% [3] - The number of parameters the command will take, in this case 3.
% [2] - Is the default value for the first parameter. This is what makes the first parameter optional, if not passed it will use this default value.
% (#2 + #3)^#1 - This is what the command does. In this case it will put the second and third parameters in a "binomial format" to the power represented by the first parameter.

% CypBLA
% Ma lecture de cette commande :
% Si un premier argument est fourni, exprimé entre crochets, il est inséré dans la marge ?
% ... je devrais teste la commande pour observer son résultat...

%% Command \cvsection
% > \cvsection[optional]{heading}
\newcommand{\cvsection}[2][]{%
  \bigskip%
  \ifstrequal{#1}{}{}{\marginpar{\vspace*{\dimexpr1pt-\baselineskip}\raggedright\input{#1}}}%
  {\color{heading}\cvsectionfont\MakeUppercase{#2}}\\[-1ex]%
  {\color{headingrule}\rule{\linewidth}{2pt}\par}\medskip
}

%% Command \cvsubsection
% > cvsubsection{heading}
\newcommand{\cvsubsection}[1]{%
  \smallskip%
  {\color{subheading}\cvsubsectionfont{#1}\par}\medskip
}

%% Command \cvsubsubsection
% > cvsubsubsection{heading}
\newcommand{\cvsubsubsection}[1]{%
	\smallskip%
	{\cvsubsectionfont{#1}\par}
}	

% v1.1.4: fixes inconsistent font size

%% Command \cvevent
% > cvevent{Niveau_&_discipline}{Université}{Date}{Lieu_géographique}
\newcommand{\cvevent}[4]{%
  {\large\color{emphasis}#1\par}
  \smallskip\normalsize
  \ifstrequal{#2}{}{}{
  \textbf{\color{accent}#2}\par
  \smallskip}
  \ifstrequal{#3}{}{}{{\small\makebox[0.5\linewidth][l]{\faCalendar~#3}}}%
  \ifstrequal{#4}{}{}{{\small\makebox[0.5\linewidth][l]{\faMapMarker~#4}}}\par
  \medskip\normalsize
}

% tabularx environment (tabularx package)
% > \begin{tabularx}{<width>}[<pos>]{<preamble>}

%% Command \cvachievement
% > \cvachievement{<symbole>}{<achievement>}{<details_about_achievement>}
\newcommand{\cvachievement}[3]{%
  \begin{tabularx}{\linewidth}{@{}p{2em} @{\hspace{1ex}} >{\raggedright\arraybackslash}X@{}}
  \multirow{2}{*}{\Large\color{accent}#1} & \bfseries\textcolor{emphasis}{#2}\\
  & #3
  \end{tabularx}%
  \smallskip
}

%% Command \cvtag
% > \cvtag{<contenuEtiquette>}
% Crée une étiquette directement au sein du paragraphe avec un mot clé au sein d'un cadre aux bords arrondis.
\newcommand{\cvtag}[1]{%
  \tikz[baseline]\node[anchor=base,draw=body!30,rounded corners,inner xsep=1ex,inner ysep =0.75ex,text height=1.5ex,text depth=.25ex]{#1};
}

% \ifnumgreater{〈integer expression〉}{〈integer expression〉}{〈true〉}{〈false〉}
% Vient du paquet "etoolbox".

%% Command \cvskill
% > \cvskill{<compétence>}{<valeurDe1à5>}
%
% Explication :
% Test sur x allant de 1 à 5 par rapport à #2.
% Si x > #2 => \space\color{body!30}\ratingmarker
% Si x <= #2 => \space\color{accent}\ratingmarker
\newcommand{\cvskill}[2]{%
\textcolor{emphasis}{\textbf{#1}}\hfill
\foreach \x in {1,...,5}{%
  \space{\ifnumgreater{\x}{#2}{\color{body!30}}{\color{accent}}\ratingmarker}}\par%
}

\newcommand{\skillfive[1]{%
	\hfill
	\foreach \x in {1,...,5}{%
		\space{\ifnumgreater{\x}{#2}{\color{body!30}}{\color{accent}}\ratingmarker}}\par%
	}
}

%% Command \wheelchart
% Adapted from @Jake's answer at http://tex.stackexchange.com/a/82729/226
% \wheelchart[<angle>]{<outer_radius>}{<inner_radius>}{<value>,<text_width>,<color>,<detail>}	% comma-separated list of value/text width/color/detail
\newcommand{\wheelchart}[4][0]{%
    \begingroup\centering
    \def\innerradius{#3}%
    \def\outerradius{#2}%
    % Calculate total
    \pgfmathsetmacro{\totalnum}{0}%
    \foreach \value/\colour/\name in {#4} {%
        \pgfmathparse{\value+\totalnum}%
        \global\let\totalnum=\pgfmathresult%
    }%
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
%      \draw[gray] (0,0) circle (\outerradius) circle (\innerradius);
    \end{tikzpicture}\par
    \endgroup
}

%% Command \cvref
% Description of referees
% > \cvref{<name>}{<email>}{<mail adress>}
\newcommand{\cvref}[3]{%
  \smallskip
  \textcolor{emphasis}{\textbf{#1}}\par
  \begin{description}[font=\color{accent},style=multiline,leftmargin=1.35em,align=left]
  \item[\small\normalfont\emailsymbol] #2
  \item[\small\normalfont\mailaddresssymbol] #3
  \end{description}
%   \medskip
}

% ...Environnement ne semblant utilisé nulle part dans le CV...
% 
% A propos de \parbox : 
% A \parbox is a box of specific width formatted in paragraph mode. 
% In paragraph mode, text is broken into lines and lines are broken into pages.
% > \parbox[pos][height][contentpos]{width}{text} 
%
% A propos de l'environnement minipage : 
% The minipage environment takes the same parameters as a \parbox, and behaves nearly identically to it. 
% The difference between a minipage and a \parbox is that a \parbox can only contain a single paragraph and you cannot use all commands and environments inside it, while a minipage may contain multiple paragraphs and, in fact, almost anything.
% > \begin{minipage}[<pos>][<height>][<contentpos>]{<width>} text \end{minipage} 

%% Environment \begin{cvcolumn}
\newenvironment{cvcolumn}[1]{\begin{minipage}[t]{#1}\raggedright}{\end{minipage}}

%% Gestion bibliographie à l'aide du paquet biblatex

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

% v1.1.2: make it easier to add a sidebar aligned with top of next page

% Quel utilité pour ces commandes dans ce document ?
% \addsidebar{<dimen>}{<}
% \addnextpagesidebar

%% Command \addsidebar
\newcommand{\addsidebar}[2][]{\marginpar{%
  \ifstrequal{#1}{}{}{\vspace*{#1}}%
  \input{#2}}%
}

%% Command \addnextpagesidebar
\newcommand{\addnextpagesidebar}[2][]{\afterpage{\addsidebar[#1]{#2}}}

% > \afterpage
% Command from the "afterpage" package.

%%% Actions en début de document
\AtBeginDocument{%
  \pagestyle{empty}
  \color{body}
  \raggedright
}
