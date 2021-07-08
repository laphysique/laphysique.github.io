\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{yhlcv}[2021. Yi\-Hsuan Lin's CV template]

% Based on article documentclass
\LoadClass{article}
\renewcommand\familydefault{\sfdefault} 
\usepackage[top=0.5in, left=0.75in, right=0.75in, bottom=1in]{geometry} 

\usepackage{enumitem}
\usepackage{etaremune}
\usepackage{tabularx}

\usepackage[explicit]{titlesec}
\usepackage{lastpage}
\usepackage{fancyhdr}

\usepackage{fontawesome}



% HTuO colors
\usepackage{xcolor}
\definecolor{htuol}{RGB}{0,191,255}
\definecolor{htuoh}{RGB}{0,47,167}


\color[gray]{0.2}


\def\name#1{\def\@name{#1}}
\def\email#1{\def\@email{#1}}
\def\mobile#1{\def\@mobile{#1}}
\def\linkedin#1{\def\@linkedin{#1}}
\def\github#1{\def\@github{#1}}
\def\webpage#1{\def\@webpage{#1}}


\usepackage{hyperref}
\hypersetup{
    colorlinks = true,
    urlcolor = black,
    linkcolor = black,
    citecolor = black,
}


%header 
\fancyhf{}
\pagestyle{fancy}
\renewcommand{\headrulewidth}{0.75pt}
%\lhead{\@title}
%\chead{\@name}
%\rhead{\thepage/\pageref*{LastPage}}
	\renewcommand{\headrulewidth}{0pt}
	\cfoot{\textcolor[gray]{0.5}{\@title~of \@name}}
	\rfoot{\thepage/\pageref*{LastPage}}

% first page does not have header 
\fancypagestyle{firstpage}{
	\fancyhead{}
	\renewcommand{\headrulewidth}{0pt}
	\cfoot{\thepage/\pageref*{LastPage}}
	
}


% Title
\renewcommand{\maketitle}{\bgroup\setlength{\parindent}{0pt}
%\begin{minipage}[t]{0.7\linewidth}
\centering 
 { \huge {\color{black}\@name}}
 \vspace{1.5em}\\
 {
   \ifdefined\@mobile{\color{black}\faMobile~\@mobile}~~\fi
   \ifdefined\@email\href{mailto:\@email}{{\faEnvelope}~\@email}~~\fi
   \ifdefined\@linkedin\href{https://linkedin.com/in/\@linkedin}{\faLinkedin~\@linkedin}~~\fi
   \ifdefined\@github\href{https://github.com/\@github}{\faGithub~\@github}~~\fi
   \ifdefined\@webpage\href{https://\@webpage}{\faGlobe~\@webpage}\fi
 }
%\vspace{1.5em}\\

%\thispagestyle{firstpage}

\egroup
}

% Title of sections
\titleformat{\section}
  {\normalfont\large\bfseries\color{black}\vspace{0.5em}}
  {{%
      \makebox[1em][l]{\thesection \hfill}%
      }\hspace{10pt}%
  }
  {0em}
  {\uppercase{#1}\hrulefill}
  
  \titleformat{\subsection}
  {\normalfont\bfseries\color{black}\vspace{0em}}
  {{%
      \makebox[1em][l]{\thesection \hfill}%
      }\hspace{0pt}%
  }
  {-1em}
  {#1}
  
% Itemize format  
\renewcommand{\labelitemi}{\color{black}$\vcenter{\hbox{\tiny$\bullet$}}$}
  


