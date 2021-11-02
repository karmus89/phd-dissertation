%% tauthesis.cls
%% Copyright 2019 Tampere University
%
% This work may be distributed and/or modified
% under the conditions of the LaTeX Project Public
% License, either version 1.3 of this license or
% (at your option) any later version.
%
% The latest version of this license is in
%   http://www.latex-project.org/lppl.txt
% and version 1.3 or later is part of all distributions of LaTeX
% version 2005/12/01 or later.
%
% This work has the LPPL maintenance status `maintained'.
% 
% The Current Maintainer of this work is
%   Ville Koljonen (ville.koljonen (at) tuni.fi)
%
% This work consists of the files tauthesis.cls.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{taudissertation}
[2019/02/25 v1.2 Dissertation styles used in Tampere University]

% Inherit from the book document class.
\LoadClass[11pt, b5paper]{book}

% Gain access to internal macros.
\makeatletter

%%%%% CLASS OPTIONS %%%%%

\newcommand{\@mainlanguage}{finnish}
\newcommand{\@otherlanguage}{english}
\newcommand{\@citationstyle}{numeric}

% Language selection.
\newif\if@langenglish\@langenglishfalse
\DeclareOption{english}{%
    \@langenglishtrue
    \renewcommand{\@mainlanguage}{english}
    \renewcommand{\@otherlanguage}{finnish}
}
\DeclareOption{finnish}{%
    \@langenglishfalse
    \renewcommand{\@mainlanguage}{finnish}
    \renewcommand{\@otherlanguage}{english}
}

% Citation style selection.
\DeclareOption{numeric}{%
    \renewcommand{\@citationstyle}{numeric}
}
\DeclareOption{authoryear}{%
    \renewcommand{\@citationstyle}{authoryear}
}

\DeclareOption*{
  \ClassWarning{tauthesis}{Unknown option '\CurrentOption'}
}

% Default options.
\ExecuteOptions{finnish,numeric}

\ProcessOptions\relax

%%%%% PACKAGES AND RELATED DEFINITIONS %%%%%

% ISO-19005 compliant document (pdf/A-1b)
% Requires sRGB_IEC61966-2-1_black_scaled.icc
\RequirePackage[a-1b,mathxmp]{pdfx}
\catcode30=12

% UTF-8 input
\RequirePackage[utf8]{inputenc}

% Font selection
\RequirePackage{helvet}
%\RequirePackage[cmintegrals,cmbraces]{newtxmath}
%\RequirePackage{ebgaramond-maths}
\RequirePackage[urw-garamond]{mathdesign}
\RequirePackage[T1]{fontenc}

% Page geometry and heading handling
\newlength{\thispaperwidth}
\setlength{\thispaperwidth}{176mm}

\newlength{\thispaperheight}
\setlength{\thispaperheight}{250mm}

\newlength{\bindingoffsetwidth}
\setlength{\bindingoffsetwidth}{0.5cm}

\RequirePackage
    [%showframe,
    b5paper,
    top=2cm,
    bottom=3cm,
    inner=2cm,
    outer=2cm,
    bindingoffset=\bindingoffsetwidth]{geometry}
\special{papersize={\thispaperwidth, \thispaperheight}}
\RequirePackage{fancyhdr}
\RequirePackage[explicit]{titlesec}
\RequirePackage{enumitem}
\RequirePackage{setspace}

%\setlength{\voffset}{-0.9in}

\newlength\chapterspace
\setlength\chapterspace{0.4cm}
\setlength{\parindent}{0.5cm}
\linespread{1.213}

\setlist{itemsep=0pt, labelindent=0.5cm}

% Try to prevent large figures appearing
% by themselves without any text. Be
% careful not to make \floatpagefraction
% larger than \topfraction.
\renewcommand{\topfraction}{0.85}        % default 0.7
\renewcommand{\textfraction}{0.1}        % default 0.2
\renewcommand{\floatpagefraction}{0.75}

% Define the header and footer content.

\pagestyle{fancyplain}
\fancyhf{}
\rhead{\thepage}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}

% Define chapter and section heading styles.

\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{3}

% Part
\titleformat
    {\part}[hang]{\centering\huge\sffamily}
    {\makebox[0.4in][l]{\thepart}}{0em}
    {\fancyhf{}\cfoot{\thepage}\MakeUppercase{#1}}
\titleformat
    {name=\part, numberless}[hang]
    {\centering\huge\sffamily}{}{0em}
    {\fancyhf{}\cfoot{\thepage}\MakeUppercase{#1}}

% Chapter
\titleformat
    {\chapter}[hang]{\raggedright\huge\sffamily}
    {\makebox[0.4in][l]{\thechapter}}{0em}
    {\fancyhf{}\cfoot{\thepage}\MakeUppercase{#1}}
\titleformat
    {name=\chapter, numberless}[hang]
    {\raggedright\huge\sffamily}{}{0em}
    {\fancyhf{}\cfoot{\thepage}\MakeUppercase{#1}}
\titlespacing*{\chapter}{0em}{0pt}{70.9pt}
\titlespacing*{name=\chapter, numberless}{0em}{0pt}{70.9pt}

% Section
\titleformat
    {\section}[hang]{\raggedright\LARGE\sffamily}
    {\makebox[0.4in][l]{\thesection}}{0em}{#1}
\titleformat
    {name=\section, numberless}[hang]
    {\raggedright\LARGE\sffamily}{}{0em}{#1}
\titlespacing*{\section}{0em}{14.2pt}{14.2pt}
\titlespacing*{name=\section, numberless}{0em}{14.2pt}{14.2pt}

% Subsection
\titleformat
    {\subsection}[hang]{\raggedright\Large\sffamily}
    {\thesubsection}{\chapterspace}{#1}
\titleformat
    {name=\subsection, numberless}[hang]
    {\raggedright\Large\sffamily}{}{0em}{#1}
\titlespacing*{\subsection}{0em}{14.2pt}{14.2pt}
\titlespacing*{name=\subsection, numberless}{0em}{14.2pt}{14.2pt}

% Subsubsection
\titleformat
    {\subsubsection}[hang]{\raggedright\large\sffamily}
    {\thesubsubsection}{\chapterspace}{#1}
\titleformat
    {name=\subsubsection, numberless}[hang]
    {\raggedright\large\sffamily}{}{0em}{#1}
\titlespacing*{\subsubsection}{0em}{14.2pt}{14.2pt}
\titlespacing*{name=\subsubsection, numberless}{0em}{14.2pt}{14.2pt}

%\setlength{\parskip}{14.2pt}
\setlength{\parskip}{0pt}

% Language support for Finnish and English
\RequirePackage[\@otherlanguage, main=\@mainlanguage]{babel}
\RequirePackage{csquotes}

% Powerful color package
\RequirePackage{xcolor}
\definecolor{taupurple}{RGB}{78,0,148}

% Date and time handling
%\RequirePackage[en-GB,finnish]{datetime2}
%\DTMlangsetup[en-GB,finnish]{showdayofmonth=false}

% Smart bibliography handling
\RequirePackage
    [backend=biber,
    sorting=nyt,
    citestyle=\@citationstyle,
    bibstyle=\@citationstyle,
    maxbibnames=99,
    giveninits=true,
    uniquename=init,
    sortcites,
    sortlocale=fin,
    defernumbers=true]{biblatex}

\DefineBibliographyStrings{finnish}{%
  bibliography = {Lähteet},
  references = {Lähteet},
  in = {}
}
\DefineBibliographyStrings{english}{%
  bibliography = {References},
  references = {References},
  in = {}
}

\DeclareNameAlias{sortname}{last-first}

\DeclareFieldFormat[%
  article,inbook,incollection,inproceedings,
  patent,thesis,unpublished]{citetitle}{#1\isdot}
\DeclareFieldFormat[%
  article,inbook,incollection,inproceedings,
  patent,thesis,unpublished]{title}{#1\isdot}
\DeclareFieldFormat{pages}{#1}

\AtBeginBibliography{\renewcommand*{\makelabel}[1]{#1\hss}}

\DefineBibliographyExtras{english}{\let\finalandcomma=\empty}

% Graphics inclusion and drawing
\RequirePackage{graphicx}
\RequirePackage{tikz}
\usetikzlibrary{calc}

% Caption formatting
\RequirePackage
    [format=hang,
    singlelinecheck=false,
    labelfont={bf,sf,small},
    font={sf,small},
    labelsep={quad}]{caption}
\renewcommand{\arraystretch}{1.25}

% Text hyperlinking
\RequirePackage{hyperref}

% (SI) unit handling
\RequirePackage{siunitx}

\sisetup{
    detect-all,
    exponent-product=\cdot
}

\if@langenglish
    \sisetup{output-decimal-marker={.}}
\else
    \sisetup{output-decimal-marker={,}}
\fi

% Code listing handling
\RequirePackage{listings}

\lstset{texcl=true, captionpos=b, commentstyle=\tt}

% List of symbols and abbreviations
\RequirePackage[automake, nonumberlist, nopostdot]{glossaries}

\if@langenglish
    \newcommand{\@glossaryname}{Abbreviations}
\else
    \newcommand{\@glossaryname}{Lyhenteet}
\fi

% Table of contents formatting
\RequirePackage[titles]{tocloft}
\RequirePackage[titletoc]{appendix}

\if@langenglish
    \addto\captionsenglish{%
        \renewcommand{\contentsname}{Contents}%
        \renewcommand{\listfigurename}{List of Figures}%
        \renewcommand{\listtablename}{List of Tables}%
    }
    \renewcommand{\lstlistlistingname}{List of Programs and Algorithms}
\else
    \addto\captionsfinnish{%
        \renewcommand{\contentsname}{Sisällys}%
        \renewcommand{\listfigurename}{Kuvioluettelo}%
        \renewcommand{\listtablename}{Taulukkoluettelo}%
        \renewcommand{\figurename}{Kuvio}%
    }
    \renewcommand{\lstlistlistingname}{Ohjelma- ja algoritmiluettelo}
\fi

\newlistof[chapter]{listing}{lst}{\lstlistlistingname}

\newcommand{\renewlistof}[3]%
{\renewcommand{#1}%
    {\subsection*{\emph{#3}}%
%       \addcontentsline{toc}{chapter}{#3}%
        \markboth{#3}{#3}%
        \begin{spacing}{1.5}%
            \@starttoc{#2}%
        \end{spacing}%
    }%
}
\renewlistof{\listoffigures}{lof}{\listfigurename}
\renewlistof{\listoftables}{lot}{\listtablename}
\renewlistof{\lstlistoflistings}{lol}{\lstlistlistingname}
 
\renewcommand\cftchapfont{}
\renewcommand{\cftchappagefont}{}
\renewcommand{\cftchapleader}{\cftdotfill{\cftdotsep}}
\setlength{\cftbeforechapskip}{8.5pt}
\setlength{\cftbeforesecskip}{2.85pt}
\setlength{\cftbeforesubsecskip}{2.85pt}
\setlength{\cftbeforesubsubsecskip}{2.85pt}
%\setlength{\cftbeforefigskip}{2.85pt}
%\setlength{\cftbeforetabskip}{2.85pt}
%\setlength{\cftbeforelolskip}{2.85pt}

% Including original article pdf files.
\RequirePackage{pdfpages}

\includepdfset{%
    offset={0.5\bindingoffsetwidth} 0pt
}

%%%%% COMMAND DEFINITIONS %%%%%

% Functional language selection
\newcommand{\xselectlanguage}[1]{%
  \begingroup\edef\x{\endgroup
    \noexpand\selectlanguage{#1}}\x
}

% \title command
\renewcommand{\title}[1]{%
    \gdef\@title{#1}
}
\renewcommand{\@title}[1]{
    \@latex@warning@no@line{No \noexpand\title given.}
}

% \subtitle command
\newcommand{\subtitle}[1]{%
    \gdef\@subtitle{#1}
}
\newcommand{\@subtitle}[1]{
    \@latex@warning@no@line{No \noexpand\subtitle given.}
}

\if@langenglish
    \newcommand{\@firstprinttext}{%
        This and the following page
        will be replaced in the printing house.
    }
    \newcommand{\@lastprinttext}{%
        This and the preceding page
        will be replaced in the printing house.
    }
    \newcommand{\@librarytext}{%
        The series, ISBN and ISSN numbers
        are added on this page in the library.
    }
\else
    \newcommand{\@firstprinttext}{%
        Tämä ja seuraava sivu
        korvataan painossa nimiösivuilla.
    }
    \newcommand{\@lastprinttext}{%
        Tämä ja edellinen sivu
        korvataan painossa nimiösivuilla.
    }
    \newcommand{\@librarytext}{%
        Tälle sivulle lisätään kirjastossa
        sarjan numero, ISBN- ja ISSN-numerot.
    }
\fi

% Make the title
\renewcommand\maketitle{
    \thispagestyle{empty}
    \hspace{0pt}\vfill
    {\raggedleft\LARGE\textsc{\@author}\par}
    \vspace{42pt}
    {\raggedleft\huge\@title\par}
    {\raggedleft\LARGE\@subtitle\par}
    \vfill
    {\raggedleft\sffamily\large\color{red}\@firstprinttext\par}
    \vspace{42pt}
    \clearpage
    \thispagestyle{empty}
    \hspace{0pt}\vfill
    \noindent\@librarytext
    \vfill
    {\raggedleft\sffamily\large\color{red}\@lastprinttext\par}
    \vspace{42pt}
    \cleardoublepage
}

% The \frontmatter command
\renewcommand{\frontmatter}{
    \cleardoublepage
    \pagenumbering{roman}
    \setcounter{page}{1}
    \fancyhf{}
    \cfoot{\thepage}
}

% Make the dedication
\newcommand{\dedication}[1]{
    \cleardoublepage
    \input{#1}
    \cleardoublepage
}

% Make the acknowledgements or preface
\newcommand{\preface}[2]{
    \cleardoublepage
    \chapter*{#1}
    \input{#2}
    \cleardoublepage
}

\if@langenglish
    \newcommand{\@abstractname}{Abstract}
    \newcommand{\@otherabstractname}{Tiivistelmä}
\else
    \newcommand{\@abstractname}{Tiivistelmä}
    \newcommand{\@otherabstractname}{Abstract}
\fi

% Make the abstracts
\newcommand{\abstract}[1]{
    \cleardoublepage
    \chapter*{\@abstractname}
    \input{#1}
    \cleardoublepage
}

\newcommand{\otherabstract}[1]{
    \cleardoublepage
    \chapter*{\@otherabstractname}
    \input{#1}
    \cleardoublepage
}

% Make the glossary
\renewcommand{\glossary}{
    \glsaddall
    \setglossarystyle{long}
    \setlength{\glsdescwidth}{0.75\textwidth}
    \renewcommand*{\glsgroupskip}{}
    \printglossary[title=\@glossaryname]
}

\if@langenglish
    \newcommand{\@publicationname}{Publication}
    \newcommand{\@publicationplural}{Publications}
    \newcommand{\@listpublicationname}{%
        Original publications}
    \newcommand{\@copyrighttext}{%
        Publication reprinted with
        the permission of the copyright holders
    }
    \newcommand{\@authorcontributionname}{Author's contribution}
\else
    \newcommand{\@publicationname}{Julkaisu}
    \newcommand{\@publicationplural}{Julkaisut}
    \newcommand{\@listpublicationname}{%
        Alkuperäisjulkaisut}
    \newcommand{\@copyrighttext}{%
        Artikkeleiden käyttöön väitöskirjan
        osana on saatu kustantajan lupa
    }
    \newcommand{\@authorcontributionname}{Kirjoittajan osuus}
\fi

\newlength\publistlabelwidth
\settowidth{\publistlabelwidth}{\@publicationname8888}
\addtolength{\publistlabelwidth}{\parindent}

\defbibenvironment{thisdissertationstyle}
    {\list
        {\printtext[labelnumberwidth]{%
            \printfield{labelprefix}%
            \printfield{labelnumber}}}
        {\settowidth{\labelnumberwidth}{\@publicationname8888}%
            \setlength{\labelwidth}{\labelnumberwidth}%
            \setlength{\leftmargin}{\labelwidth}%
            \setlength{\labelsep}{\biblabelsep}%
            \addtolength{\leftmargin}{\labelsep}%
            \setlength{\itemsep}{\bibitemsep}%
            \setlength{\parsep}{\bibparsep}}%
        \renewcommand*{\makelabel}[1]{##1\hss}}
    {\endlist}
    {\item}

\newlist{publikeenumerate}{enumerate}{1}
\setlist[publikeenumerate,1]{label={\@publicationname{} \Roman*}, wide=0pt, widest=99, leftmargin=\publistlabelwidth, labelsep=*, itemsep=\bibitemsep}

% Make the list of publications
\newcommand{\listofpublications}{
    \begin{refsection}
    \begin{refcontext}[labelprefix=\@publicationname\addspace, sorting=none]
    \nocite{*}
    \emergencystretch=2em
    \setlength{\bibitemsep}{8.5pt}
    \DeclareFieldFormat{labelnumber}{\ifinteger{##1}{\RN{##1}}{##1}}
    \DeclareFieldFormat{labelnumberwidth}{##1}
    \printbibliography[%
        title=\@listpublicationname,%
        keyword=thisdissertation,%
        env=thisdissertationstyle]
    \end{refcontext}
    \end{refsection}
    \settowidth{\labelnumberwidth}{888}
}

% Make the author's contribution
\newcommand{\authorcontribution}[1]{
    \subsection*{\emph{\@authorcontributionname}}
    \input{#1}
    \cleardoublepage
}

% The \mainmatter command
\renewcommand{\mainmatter}{
    \cleardoublepage
    \newcounter{temp}
    \setcounter{temp}{\value{page}}
    \pagenumbering{arabic}
    \setcounter{page}{\value{temp}}
}

% The \publicationmatter command
\newcommand{\publicationmatter}{
    \addtocontents{toc}{\protect\setcounter{tocdepth}{-10}}
    \part*{\@publicationplural}
    \addtocontents{toc}{\protect\setcounter{tocdepth}{3}}
}

% Make the publication title pages.
\newcounter{publication}
\setcounter{publication}{0}

\DeclareFieldFormat{parens}{\mkbibparens{#1}}

\DeclareCiteCommand{\thisdissertation}{
%    \cleardoublepage
    \thispagestyle{empty}
    \refstepcounter{publication}
    \addcontentsline{toc}{chapter}{\@publicationname{} \Roman{publication}}
    \hspace*{0pt}\vfill
    {\centering\huge\sffamily
        \MakeUppercase{\@publicationname}\\
        \Roman{publication}
    \par}
    \vspace{42pt}
}{
    {\centering\textbf{\printfield{title}}\par}
    {\centering\printnames[][-\value{listtotal}]{author}\par}
    \bigskip
    {\centering\small
    \iffieldundef{journaltitle}{%
        \printfield{booktitle}%
        \ifnameundef{editor}{}{%
            \setunit*{\addperiod\space}%
            \printtext{\bibstring{byeditor}}%
            \setunit*{\addspace}%
            \printnames[][-\value{listtotal}]{editor}%
            \setunit*{\addperiod\space}%
        }%
        \printfield{year}%
        \setunit*{\addcomma\space}%
        \printfield{pages}%
    }{%
        \printfield{journaltitle}%
        \setunit*{\addspace}%
        \printfield{volume}%
        \setunit*{\addperiod}%
        \printfield{number}%
        \setunit*{\addspace}%
        \printfield[parens]{year}%
        \setunit*{\addcomma\space}%
        \printfield{pages}%
    }%
    \setunit{\addperiod\space}%
    \printfield{note}%
    \setunit{\nopunct}\\%
    \printfield{doi}\par}
}{}{
    \bigskip
    {\centering\textbf{\@copyrighttext}\par}
    \vfill\hspace*{0pt}
    \clearpage
    \thispagestyle{empty}
    \cleardoublepage
}

\newlength{\@includewidth}
\newlength{\@includeheight}
\newlength{\@onept}
\setlength{\@onept}{1pt}

\newlength{\@widthratio}
\newlength{\@heightratio}

\newlength{\@truepaperwidth}
\setlength{\@truepaperwidth}{%
    \thispaperwidth-\bindingoffsetwidth%
}

\newcommand{\publication}[2]{
    \thisdissertation{#1}
    \includepdf[%
        pages=-,
        width=\@truepaperwidth,
        height=\paperheight,
        keepaspectratio]{#2}
    \cleardoublepage
}