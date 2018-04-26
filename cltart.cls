%---------------------------------------------------------------------------%
%-                                                                         -%
%-                           Document Class                                -%
%-                                                                         -%
%---------------------------------------------------------------------------%
%- Copyright (C) Chunlin Tian <cl.tian@live.com> 
%- This is free software: you can redistribute it and/or modify it
%- under the terms of the GNU General Public License as published by
%- the Free Software Foundation, either version 3 of the License, or
%- (at your option) any later versions.
%---------------------------------------------------------------------------%
%->> Identification
%---------------------------------------------------------------------------%
\NeedsTeXFormat{LaTeX2e}%
\ProvidesClass{cltart}[2018/05/01 v1.0 LaTeX document class]%

%---------------------------------------------------------------------------%
%->> Declare options
%---------------------------------------------------------------------------%
%-
%-> Citation and reference style
%-
\newif\iftarticle@numbers \tarticle@numberstrue
\newif\iftarticle@super \tarticle@superfalse
\newif\iftarticle@authoryear \tarticle@authoryearfalse

\DeclareOption{numbers}{%
    \tarticle@numberstrue
    \tarticle@superfalse
    \tarticle@authoryearfalse
}
\DeclareOption{super}{%
    \tarticle@numberstrue
    \tarticle@supertrue
    \tarticle@authoryearfalse
}
\DeclareOption{authoryear}{%
    \tarticle@numbersfalse
    \tarticle@superfalse
    \tarticle@authoryeartrue
}
\newif\iftarticle@bibieee \tarticle@bibieeefalse
\DeclareOption{bibieee}{%
     \tarticle@bibieeetrue
}
%-
%-> Header and footer
%-
\newif\iftarticle@myhdrone \tarticle@myhdronefalse
\newif\iftarticle@myhdrtwo \tarticle@myhdrtwofalse
\newif\iftarticle@myhdrthree \tarticle@myhdrthreefalse
\newif\iftarticle@myhdrfour \tarticle@myhdrfourfalse
\newif\iftarticle@myhdrfive \tarticle@myhdrfivefalse


\DeclareOption{myhdrone}{%
    \tarticle@myhdronetrue
    \tarticle@myhdrtwofalse
    \tarticle@myhdrthreefalse
    \tarticle@myhdrfourfalse
    \tarticle@myhdrfivefalse
}
\DeclareOption{myhdrtwo}{%
    \tarticle@myhdronefalse
    \tarticle@myhdrtwotrue
    \tarticle@myhdrthreefalse
    \tarticle@myhdrfourfalse
    \tarticle@myhdrfivefalse
}
\DeclareOption{myhdrthree}{%
    \tarticle@myhdronefalse
    \tarticle@myhdrtwofalse
    \tarticle@myhdrthreetrue
    \tarticle@myhdrfourfalse
    \tarticle@myhdrfivefalse
}
\DeclareOption{myhdrfour}{%
    \tarticle@myhdronefalse
    \tarticle@myhdrtwofalse
    \tarticle@myhdrthreefalse
    \tarticle@myhdrfourtrue
    \tarticle@myhdrfivefalse
}
\DeclareOption{myhdrfive}{%
    \tarticle@myhdronefalse
    \tarticle@myhdrtwofalse
    \tarticle@myhdrthreefalse
    \tarticle@myhdrfourfalse
    \tarticle@myhdrfivetrue
}
%-
%-> Color support
%-
\newif\iftarticle@color \tarticle@colorfalse
\DeclareOption{color}{%
    \tarticle@colortrue
}
%-
%-> figure support
%-
\newif\iftarticle@figure \tarticle@figurefalse
\DeclareOption{figure}{%
    \tarticle@figuretrue
}
%-
%-> Complex diagrams support
%-
\newif\iftarticle@tikz \tarticle@tikzfalse
\DeclareOption{tikz}{%
    \tarticle@colortrue
    \tarticle@tikztrue
}
%-
%-> Complex tables support
%-
\newif\iftarticle@table \tarticle@tablefalse
\DeclareOption{table}{%
    \tarticle@tabletrue
}
%-
%-> Enhanced list
%-
\newif\iftarticle@list \tarticle@listfalse
\DeclareOption{list}{%
    \tarticle@colortrue
    \tarticle@listtrue
}
%-
%-> Enhanced list, extra predefined tcolorbox
%-
\newif\iftarticle@precolorbox \tarticle@precolorboxfalse
\DeclareOption{precolorbox}{%
    \tarticle@precolorboxtrue
}
%-
%-> Extra math support
%-
\newif\iftarticle@math \tarticle@mathfalse
\DeclareOption{math}{%
    \tarticle@mathtrue
}
%-
%-> hyper link support
%-
\newif\iftarticle@nohref \tarticle@nohreffalse
\DeclareOption{nohref}{%
    \tarticle@nohreftrue
}
%-
%-> special chars
%-
\newif\iftarticle@chars \tarticle@charsfalse
\DeclareOption{chars}{%
    \tarticle@charstrue
}
%-
%-> syntax only
%-
\newif\iftarticle@syntaxonly \tarticle@syntaxonlyfalse
\DeclareOption{syntaxonly}{%
    \tarticle@syntaxonlytrue
}
%-
%-> Handle non-implemented options
%-
\DeclareOption*{%
    \PassOptionsToClass{\CurrentOption}{ctexart}%
}
%-
%-> Terminates all options processing
%-
\ProcessOptions\relax%
%---------------------------------------------------------------------------%

%---------------------------------------------------------------------------%
%->> Process options
%---------------------------------------------------------------------------%
%-
%-> font family
%-     
\LoadClass[UTF8,a4paper,oneside,zihao=-4]{ctexart}
\RequirePackage{fontspec}
\setCJKmainfont[AutoFakeBold,AutoFakeSlant]{SimSun}%
\setCJKsansfont[AutoFakeBold]{SimHei}%
\setCJKmonofont{KaiTi}%
\xeCJKsetup{CJKmath=true}
\setCJKmathfont{KaiTi}  % 数学环境中使用楷体
\setmainfont{Times New Roman}
%-
%-> Math packages
%-
\iftarticle@math% extra math packages
    \RequirePackage{amsmath}% math packages
    \RequirePackage{mathdots} % 数学省略号，会重定义 dddot 和 ddddot
    \RequirePackage{amsmath}  
    \RequirePackage{amssymb}
    \RequirePackage{mathrsfs} % 线性代数字体
    \RequirePackage{yhmath} % \wideparen命令：弧AB
    \RequirePackage{mathtools} % dcases环境，prescript命令
    \RequirePackage{amsthm} % 定理环境
    \theoremstyle{definition}\newtheorem{laws}{Law}[section]
    \theoremstyle{plain}\newtheorem{ju}[laws]{Jury}
    \theoremstyle{remark}\newtheorem*{marg}{Margaret}
    \RequirePackage{esint} % 多重积分，需放在amsmath后
    % 箭头与长等号
    \RequirePackage{extarrows}
\fi
%-
%-> Citations
%-
\iftarticle@numbers% enable numbered citation style
    \iftarticle@super% enable superscripted citation style
        \RequirePackage[square,comma,super,sort&compress]{natbib}% superscripted square bracket
    \else
        \RequirePackage[square,comma,numbers,sort&compress]{natbib}% square bracket
    \fi
    \iftarticle@bibieee
        \bibliographystyle{bib/IEEEbib}% numbered scheme
    \else
         \bibliographystyle{bib/gbt7714-unsrt}% numbered scheme
    \fi
\fi
\iftarticle@authoryear% enable author year citation style
    \RequirePackage{natbib}% author year citation mode
    \iftarticle@bibieee
          \bibliographystyle{bib/IEEEbib}% numbered scheme
    \else
          \bibliographystyle{bib/gbt7714-plain}% author year scheme
    \fi
\fi

\setlength{\bibsep}{0.0ex plus 0.2ex minus 0.2ex}% set distance between entries
\renewcommand*{\bibfont}{\small}% set font size for bibliography


\providecommand*{\citens}[2][]{% text embedded \citep in superscripted mode
    \begingroup%
        \let\NAT@mbox=\mbox%
        \let\@cite\NAT@citenum%
        \let\NAT@space\NAT@spacechar%
        \let\NAT@super@kern\relax%
        \renewcommand\NAT@open{[}%
        \renewcommand\NAT@close{]}%
        \citep[#1]{#2}%
    \endgroup%
}

%-
%-> Figure environment support
%-

\iftarticle@figure
    \RequirePackage{graphicx}% packages for including graphics
    \RequirePackage{caption}
    \setlength{\abovecaptionskip}{6pt}
    \setlength{\belowcaptionskip}{0pt}
    \captionsetup{font={footnotesize,bf}}
    \RequirePackage[font={footnotesize,bf}]{subcaption}% package for subfigures
    \RequirePackage[list=off]{bicaption}% package for binary captions
    \captionsetup[figure][bi-first]{format=hang,hangindent=-0.5em}%
    \captionsetup[figure][bi-second]{format=hang,hangindent=-2em,name=Figure}%
    \captionsetup[table][bi-first]{format=hang,hangindent=-0.5em}%
    \captionsetup[table][bi-second]{format=hang,hangindent=-2em,name=Table}%
    \RequirePackage[section]{placeins}% prevent floats from being moved over section
    \RequirePackage{overpic} %图上标记
    \RequirePackage{float} %禁止浮动
\else
    \RequirePackage{graphicx}% packages for including graphics
    \RequirePackage{caption}
    \setlength{\abovecaptionskip}{6pt}
    \setlength{\belowcaptionskip}{0pt}
    \captionsetup{font={footnotesize,bf}}
\fi
%-
%-
\RequirePackage{geometry}% page layout
%-
%-> Color
%-
\iftarticle@color% enable color package to use color
    %\RequirePackage{color}%
    \RequirePackage[usenames,dvipsnames,table]{xcolor}%
\fi
%-
%-> Draw graphics directly with TeX commands
%-
\iftarticle@tikz%
    \RequirePackage{tikz}% automatically load pgf package
    \usetikzlibrary{% load libraries
         calc,intersections,positioning,angles,quotes,decorations.pathmorphing,fit,backgrounds,through
    }%
\fi
%-
%-> Complex tables
%-
\iftarticle@table%
    \RequirePackage{ctable}% imports the array, tabularx and booktabs packages
    \RequirePackage{longtable} %长表格
    \RequirePackage{multirow} %通行表格
    \RequirePackage{array}
    \RequirePackage{booktabs} %三线表
\fi
%-
%-> List structures
%-
\iftarticle@list% enable enhanced list and verbatim structures
    \RequirePackage{verbatim}% improve verbatim environment
    \RequirePackage{etoolbox}
    \preto{\@verbatim}{\topsep=0pt \partopsep=0pt }
    \patchcmd{\@verbatim}
     {\verbatim@font}
     {\verbatim@font\small}
     {}{}
    \RequirePackage{enumitem}% configure the enumerate environment
    \setlist[enumerate]{wide=\parindent}% only indent the first line
    \setlist[itemize]{wide=\parindent}% only indent the first line
    \setlist{nosep}% default text spacing
    \RequirePackage{listings}% source code
    \lstset{extendedchars=false}
    \RequirePackage{algpseudocode,algorithm,algorithmicx}% algorithm
    \RequirePackage{tcolorbox}
\fi
%-
%-> Links support
%-
\iftarticle@nohref

\else
    \RequirePackage{hyperref}%
        \hypersetup{% set hyperlinks
            %bookmarks=true,% show bookmarks bar
            pdfencoding=auto,% allows non-Latin based languages in bookmarks
            %pdftitle={},% title
            %pdfauthor={},% author
            %pdfsubject={},% subject
            %pdftoolbar=true,% show toolbar
            %pdfmenubar=true,% show menu
            pdffitwindow=false,% window fit to page when opened
            pdfstartview={FitH},% fits the width of the page to the window
            %pdfnewwindow=true,% links in new window
            %backref=true,% do bibliographical back references
            %pagebackref=true,% backreference by page number
            colorlinks=true,% false: boxed links; true: colored links
            linkcolor=black,% color of internal links
            citecolor=blue,% color of links to bibliography
            %filecolor=magenta,% color of file links
            urlcolor=red,% color of external links
            bookmarksnumbered=true,% put section numbers in bookmarks
            %hidelinks% remove link color and border
        }
    \RequirePackage{url} %url
\fi

%-
%-> include special chars packages
%-
\iftarticle@chars
    \RequirePackage{textcomp} 
    \RequirePackage{pifont} 
    \RequirePackage[misc,clock,geometry,weather,electronic]{ifsym} 
\fi
%-
%-> Page layout and spacing
%-
\iftarticle@syntaxonly% enable geometry to redefine page layout
    \RequirePackage{syntonly}% page layout
    \syntaxonly
\fi

%---------------------------------------------------------------------------%
%-
%-> Page header and footer Style
%-
\iftarticle@myhdrone% user defined header and footer style
    \RequirePackage{fancyhdr}
    \pagestyle{fancy}
    \fancyhf{}
    \lhead{\footnotesize \tarticle@value@headings}
    \rhead{\footnotesize \thepage}
    \chead{} \lfoot{} \cfoot{} \rfoot{}
\else
    \iftarticle@myhdrtwo% user defined header and footer style
        \RequirePackage{fancyhdr}
        \pagestyle{fancy}
        \fancyhf{}
        \lhead{} \rhead{}
        \chead{\footnotesize \tarticle@value@headings} \lfoot{} \rfoot{}
        \cfoot{\footnotesize \thepage} 
    \else
        \iftarticle@myhdrthree
            \RequirePackage{fancyhdr}
            \pagestyle{fancy}
            \fancyhf{}
            \lhead{\footnotesize \rightmark}
            \rhead{\footnotesize \thepage}
            \chead{} \lfoot{} \cfoot{} \rfoot{}
        \else
            \iftarticle@myhdrfour
                \RequirePackage{fancyhdr}
                \pagestyle{fancy}
                \fancyhf{}
                \fancyhf{}
                \lhead{} \rhead{}
                \chead{\footnotesize \rightmark} \lfoot{} \rfoot{}
                \cfoot{\footnotesize \thepage} 
            \else
                \iftarticle@myhdrfive
                    \pagestyle{empty}
                \else
                     \renewcommand\thepage{{\footnotesize \arabic{page}}}
                     \pagestyle{plain}
                \fi
            \fi
        \fi
    \fi
\fi

%---------------------------------------------------------------------------%
%-
%-> Lstings settings
%-
\iftarticle@list% enable enhanced list
    \definecolor{mymauve}{rgb}{0.58,0,0.82}
    \lstset{%
        %basicstyle=\linespread{0.8},
        numberbychapter=false,% numbered sequentially or by chapter
        backgroundcolor=\color{white},% background color;
        basicstyle=\linespread{0.8}\small\ttfamily,% font size for code
        breakatwhitespace=false,% sets if automatic breaks should only happen at whitespace
        breaklines=true,% sets automatic line breaking
        captionpos=b,% caption-position to bottom
        commentstyle=\color{green!50!black},% comment style
        columns=fullflexible,  % Avoid too sparse word spaces
        %deletekeywords={...},% delete keywords from the given language
        frame=single,% adds a frame around the code
        keepspaces=true,% keeps spaces in text for keeping indentation of code
        keywordstyle=\color{blue},% keyword style
        %otherkeywords={*,...},% add more keywords to the set
        numbers=left,% where to put the line-numbers; possible values are (none, left, right)
        numbersep=5pt,% how far the line-numbers are from the code
        numberstyle=\tiny\color{red!75!black},% the style that is used for the line-numbers
        rulecolor=\color{black},% if not set, the frame-color may be changed on line-breaks
        showspaces=false,% show spaces everywhere adding particular underscores;
        showstringspaces=false,% underline spaces within strings only
        showtabs=false,% show tabs within strings adding particular underscores
        stepnumber=1,% the step between two line-numbers. If it's 1, each line will be numbered
        stringstyle=\color{mymauve},% string literal style
        tabsize=2,% sets default tabsize to 2 spaces
        title=\lstname% show the filename of files
    }
    %Extra lstlistings language settings
    %JavaScipt
        \definecolor{allcomment}{HTML}{808080} % comment
        \lstdefinelanguage{JS}{
          alsoletter={.},  keywords={arguments,await,break,case,catch,class,const,continue,debugger,default,delete,do,else,enum,eval,export,extends,false,finally,for,function,if,implements,import,in,instanceof,interface,let,new,null,package,private,protected,public,return,static,super,switch,this,throw,true,try,typeof,var,void,while,with,yield}, % JavaScript ES6 keywords
          keywordstyle=keywordstyle=\color{blue},
          ndkeywords={add, apply, args, Array, Array.from, Array.isArray, Array.of , Array.prototype, ArrayBuffer, bind, Boolean, call, charAt, charCodeAt, clear, codePointAt, concat, constructor, copyWithin, DataView, Date, Date.now, Date.parse, Date.prototype, Date.UTC, decodeURI, decodeURIComponent, encodeURI, encodeURIComponent, endsWith, entries, Error, Error.prototype, EvalError, every, false, fill, filter, find, findIndex, Float32Array, Float64Array, forEach, FulfillPromise, Function, Function.length, get, getDate, getDay, getFullYear, getHours, getMilliseconds, getMinutes, getMonth, getSeconds, getTime, getTimezoneOffset, getUTCDate, getUTCDay, getUTCFullYear, getUTCHours, getUTCMilliseconds, getUTCMinutes, getUTCMonth, getUTCSeconds, has,hasInstance, hasOwnProperty, ignoreCase, includes, indexOf, indexOf, Infinity, Int8Array, Int16Array, Int32Array, isConcatSpreadable, isFinite, isNaN, IsPromise, isPrototypeOf, Iterable, iterator, join, JSON, JSON.parse, JSON.stringify, keys, lastIndexOf, lastIndexOf, length, localeCompare, map, Map, match, match, Math, Math.abs , Math.acos, Math.acosh, Math.asin, Math.asinh, Math.atan, Math.atan2, Math.atanh, Math.cbrt, Math.ceil, Math.clz32, Math.cos, Math.cosh,  Math.E, Math.exp, Math.expm1, Math.floor, Math.fround, Math.hypot, Math.imul, Math.LN2, Math.LN10, Math.log, Math.log1p, Math.log2, Math.LOG2E, Math.log10, Math.LOG10E, Math.max, Math.min, Math.PI, Math.pow, Math.random, Math.round, Math.sign, Math.sin, Math.sinh, Math.sqrt, Math.SQRT1_2, Math.SQRT2, Math.tan, Math.tanh, Math.trunc, message, multiline, name, NaN, NewPromiseCapability, next, normalize, null, Number, Number.EPSILON, Number.isFinite, Number.isInteger, Number.isNaN, Number.isSafeInteger, Number.MAX_SAFE_INTEGER, Number.MAX_VALUE, Number.MIN_SAFE_INTEGER, Number.MIN_VALUE, Number.NaN, Number.NEGATIVE_INFINITY, Number.parseFloat, Number.parseInt, Number.POSITIVE_INFINITY, Number.prototype, Object, Object, Object.assign, Object.create, Object.defineProperties, Object.defineProperty, Object.freeze, Object.getOwnPropertyDescriptor, Object.getOwnPropertyNames, Object.getOwnPropertySymbols, Object.getPrototypeOf, Object.is, Object.isExtensible, Object.isFrozen, Object.isSealed, Object.keys, Object.preventExtensions, Object.prototype, Object.seal, Object.setPrototypeOf, of, parseFloat, parseInt, pop, Promise, Promise.all , Promise.race, Promise.reject, Promise.resolve, PromiseReactionJob, propertyIsEnumerable, prototype, Proxy, Proxy.revocable , push, RangeError, reduce, reduceRight, ReferenceError, Reflect, Reflect.apply, Reflect.construct , Reflect.defineProperty, Reflect.deleteProperty, Reflect.enumerate, Reflect.get, Reflect.getOwnPropertyDescriptor, Reflect.getPrototypeOf, Reflect.has, Reflect.isExtensible, Reflect.ownKeys, Reflect.preventExtensions, Reflect.set, Reflect.setPrototypeOf, Reflection, RegExp, RegExp, RegExp.prototype, repeat, replace, replace, reverse, search, search, Set, set, setDate, setFullYear, setHours, setMilliseconds, setMinutes, setMonth, setSeconds, setTime, setUTCDate, setUTCFullYear, setUTCHours, setUTCMilliseconds, setUTCMinutes, setUTCMonth, setUTCSeconds, shift, slice, slice, some, sort, species, splice, split, split, startsWith, String, String.fromCharCode, String.fromCodePoint, String.raw, substring, Symbol, Symbol.for, Symbol.hasInstance, Symbol.isConcatSpreadable, Symbol.iterator, Symbol.keyFor, Symbol.match, Symbol.prototype, Symbol.replace, Symbol.replace, Symbol.search, Symbol.species, Symbol.split, Symbol.toPrimitive, Symbol.toStringTag, Symbol.unscopables, SyntaxError, then, toDateString, toExponential, toFixed, toISOString, toJSON, toLocaleDateString, toLocaleLowerCase, toLocaleString, toLocaleString, toLocaleString, toLocaleString, toLocaleTimeString, toLocaleUpperCase, toLowerCase, toPrecision, toPrimitive, toString, toStringTag, toTimeString, toUpperCase, toUTCString, TriggerPromiseReactions, trim, true, TypeError, Uint8Array, Uint8ClampedArray, Uint16Array, Uint32Array, undefined, unscopables, unshift, URIError, valueOf, WeakMap, WeakSet
          }, % JavaScript extended keywords
          sensitive=true,
          stringstyle=\color{mymauve}\ttfamily,
          morestring=[b]", 
          morestring=[d]',
          morestring=[s][\color{string}\ttfamily]{`}{`},
          commentstyle=\color{green!50!black},
          morecomment=[l][\color{allcomment}]{//},
          morecomment=[s][\color{allcomment}]{/*}{*/},
          morecomment=[s][\color{allcomment}]{/**}{*/},
          emph={app.all, app.delete, app.disable, app.disabled, app.enable, app.enabled, app.engine, app.get, app.listen, app.locals, app.METHOD, app.mountpath, app.param, app.path, app.post, app.put, app.render, app.route, app.set, app.use, express, express.Router, express.static, req.acceptLanguages, req.accepts, req.acceptsCharsets, req.acceptsEncodings, req.app, req.baseUrl, req.body, req.cookies, req.fresh, req.get, req.hostname, req.ip, req.ips, req.is, req.method, req.originalUrl, req.param, req.params, req.path, req.protocol, req.query, req.range, req.route, req.secure, req.signedCookies, req.stale, req.subdomains, req.xhr, res.app, res.append, res.attachment, res.clearCookie, res.cookies, res.download, res.end, res.format, res.get, res.headersSent, res.json, res.jsonp, res.links, res.locals, res.location, res.redirect, res.render, res.sendFile, res.sendStatus, res.set, res.status, res.type, res.vary, router.all, router.METHOD, router.param, router.route, router.use}, % express keywords
          emph={[2]agent.createConnection, agent.destroy, agent.freeSockets, agent.getName, agent.maxFreeSockets, agent.maxSockets, agent.requests, agent.sockets, certificate.exportChallenge, certificate.exportPublicKey, certificate.verifySpkac, child.channel, child.connected, child.disconnect, child.kill, child.pid, child.send, child.stderr, child.stdin, child.stdio, child.stdout, child_process.exec, child_process.execFile, child_process.execFileSync, child_process.execSync, child_process.fork, child_process.spawn, child_process.spawnSync, cipher.final, cipher.getAuthTag, cipher.setAAD, cipher.setAutoPadding, cipher.update, clearImmediate, clearImmediate, clearInterval, clearInterval, clearTimeout, clearTimeout, console, console.assert, console.dir, console.error, console.info, console.log, console.time, console.timeEnd, console.trace, console.warn, decipher.final, decipher.setAAD, decipher.setAuthTag, decipher.setAutoPadding, decipher.update, dgram.createSocket, dgram.createSocket, diffieHellman.computeSecret, diffieHellman.generateKeys, diffieHellman.getGenerator, diffieHellman.getPrime, diffieHellman.getPrivateKey, diffieHellman.getPublicKey, diffieHellman.setPrivateKey, diffieHellman.setPublicKey, diffieHellman.verifyError, dns.getServers, dns.getServers, dns.lookup, dns.lookup, dns.lookupService, dns.resolve, dns.resolve4, dns.resolve6, dns.resolveCname, dns.resolveMx, dns.resolveNaptr, dns.resolveNs, dns.resolvePtr, dns.resolveSoa, dns.resolveSrv, dns.resolveTxt, dns.reverse, dns.setServers, ecdh.computeSecret, ecdh.generateKeys, ecdh.getPrivateKey, ecdh.getPublicKey, ecdh.setPrivateKey, ecdh.setPublicKey, error.address, error.code, error.errno, error.message, error.path, error.port, error.stack, error.syscall, exports, fs.access, fs.accessSync, fs.appendFile, fs.appendFileSync, fs.chmod, fs.chmodSync, fs.chown, fs.chownSync, fs.close, fs.closeSync, fs.constants, fs.createReadStream, fs.createWriteStream, fs.exists, global, http.createServer, http.get, http.globalAgent, http.request, https.createServer, https.get, https.globalAgent, https.request, message.destroy, message.headers, message.httpVersion, message.method, message.rawHeaders, message.rawTrailers, message.setTimeout, message.socket, message.statusCode, message.statusMessage, message.trailers, message.url, module, module.children, module.exports, module.filename, module.id, module.loaded, module.parent, module.require, os.arch, os.constants, os.cpus, os.endianness, os.EOL, os.freemem, os.homedir, os.hostname, os.loadavg, os.networkInterfaces, os.platform, os.release, os.tmpdir, os.totalmem, os.type, os.uptime, os.userInfo, path.basename, path.delimiter, path.dirname, path.extname, path.format, path.isAbsolute, path.join, path.normalize, path.parse, path.posix, path.relative, path.resolve, path.sep, path.win32, process, process.abort, process.arch, process.argv, process.argv0, process.channel, process.chdir, process.config, process.connected, process.cpuUsage, process.cwd, process.disconnect, process.emitWarning, process.env, process.execArgv, process.execPath, process.exit, process.exitCode, process.getegid, process.geteuid, process.getgid, process.getgroups, process.getuid, process.hrtime, process.initgroups, process.kill, process.mainModule, process.memoryUsage, process.nextTick, process.pid, process.platform, process.release, process.send, process.setegid, process.seteuid, process.setgid, process.setgroups, process.setuid, process.stderr, process.stdin, process.stdout, process.title, process.umask, process.uptime, process.version, process.versions, querystring.escape, querystring.parse, querystring.stringify, querystring.unescape, r.clearLine, readable.pause, readable.pipe, readable.push, readable.push, readable.read, readable.read, readable.resume, readable.setEncoding, readable.unpipe, readable.unshift, readable.wrap, readable._read, readStream.bytesRead, readStream.isRaw, readStream.path, readStream.setRawMode, repl.start, request.abort, request.aborted, request.end, request.flushHeaders, request.setNoDelay, request.setSocketKeepAlive, request.setTimeout, request.write, require, require.cache, require.extensions, response.addTrailers, response.end, response.finished, response.getHeader, response.getHeaderNames, response.getHeaders, response.hasHeader, response.headersSent, response.removeHeader, response.sendDate, response.setHeader, response.setTimeout, response.statusCode, response.statusMessage, response.write, response.writeContinue, response.writeHead, rl.clearScreenDown, rl.close, rl.createInterface, rl.cursorTo, rl.emitKeypressEvents, rl.moveCursor, rl.pause, rl.prompt, rl.question, rl.resume, rl.setPrompt, rl.write, script.runInNewContext, script.runInThisContext, server.addContext, server.address, server.address, server.close, server.close, server.connections, server.getTicketKeys, server.listen, server.listen, server.setTicketKeys, server.setTimeout, server.setTimeout, server.timeout, server.timeout, setImmediate, setInterval, setTimeout, socket.addMembership, socket.address, socket.bind, socket.bind, socket.close, socket.dropMembership, socket.ref, socket.send, socket.setBroadcast, socket.setMulticastLoopback, socket.setMulticastTTL, socket.setTTL, socket.unref, stream.Readable, stringDecoder.end, stringDecoder.write, timeout.ref, timeout.unref, tls.connect, tls.createSecureContext, tls.createServer, tls.getCiphers, tlsSocket.address, tlsSocket.authorizationError, tlsSocket.authorized, tlsSocket.encrypted, tlsSocket.getCipher, tlsSocket.getEphemeralKeyInfo, tlsSocket.getPeerCertificate, tlsSocket.getProtocol, tlsSocket.getSession, tlsSocket.getTLSTicket, tlsSocket.localAddress, tlsSocket.localPort, tlsSocket.remoteAddress, tlsSocket.remoteFamily, tlsSocket.remotePort, tlsSocket.renegotiate, tlsSocket.setMaxSendFragment, transform._flush, transform._transform, util.debuglog, util.deprecate, util.format, util.inherits, util.inspect, v8.getHeapStatistics, v8.setFlagsFromString, vm.createContext, vm.isContext, vm.runInContext, vm.runInDebugContext, vm.runInNewContext, vm.runInThisContext, watcher.close, worker.disconnect, worker.exitedAfterDisconnect, worker.id, worker.isConnected, worker.isDead, worker.kill, worker.process, worker.send, worker.suicide, writable.cork, writable.end, writable.setDefaultEncoding, writable.write, writeStream.bytesWritten, writeStream.columns, writeStream.path, writeStream.rows, zlib, zlib.createGunzip, zlib.createGzip, zlib.createInflate, zlib.createInflateRaw, zlib.createUnzip, zlib.deflate, zlib.deflateRaw, zlib.deflateRawSync, zlib.deflateSync, zlib.gunzip, zlib.gunzipSync, zlib.gzip, zlib.gzipSync, zlib.inflate, zlib.inflateRaw, zlib.inflateRawSync, zlib.inflateSync, zlib.unzip, zlib.unzipSync, __dirname, __filename}, % Node.js keywords
          emph={[3] assert, assert.deepEqual, assert.deepStrictEqual, assert.doesNotThrow, assert.equal, assert.fail, assert.ifError, assert.notDeepEqual, assert.notDeepStrictEqual, assert.notEqual, assert.notStrictEqual, assert.ok, assert.strictEqual, assert.throws, describe, toBe, it, xdescribe, beforeEach, afterEach, beforeAll, afterAll, expect, it, xit, xdiscribe, pending, and.callThrough, and.returnValue, and.returnValues, and.callFake, and.throwError, and.stub, .not, .calls.any, .calls.count, .calls.argsFor, .calls.allArgs, .calls.all, .calls.mostRecent, .calls.first, .calls.reset, jasmine.createSpy, jasmine.createSpyObj, jasmine.any, jasmine.anything, jasmine.objectContaining, jasmine.arrayContaining, jasmine.stringMatching, asymmetricMatch,  jasmine.clock, .not.toBeTruthy, .toBeTruthy, .not.toBeFalsy, .toBeFalsy, .not.toBeDefined .toBeDefined, .not.toBeNull .toBeNull, .not.toEqual .toEqual, .not.toBeCloseTo .toBeCloseTo, .not.toContain, .toContain, .not.toMatch, .toMatch, .not.toBeGreaterThan, .toBeGreaterThan, .not.toBeLessThan, .toBeLessThan, .toThrow, .not.toThrow, .toBeNull, .not.toBeNull, .toBeDefined, .not.toBeDefined}, % Node.js Assert, Jasmine, ... keywords
          }
    \iftarticle@precolorbox
            \tcbuselibrary{breakable,theorems,skins,listings}
        %>box
            \newtcbox{\boxonegreen}[1][green]{on line,before upper=\ttfamily,
              arc=0pt,outer arc=0pt,colback=#1!10!white,colframe=#1!50!black,
              boxsep=0pt,left=1pt,right=1pt,top=1pt,bottom=1pt,
              boxrule=0pt,bottomrule=1pt,toprule=1pt}
            \newtcbox{\boxoneviolet}[1][violet!70!cyan]{on line,before upper=\ttfamily,
              arc=0pt,outer arc=0pt,colback=#1!10!white,colframe=#1!50!black,
              boxsep=0pt,left=1pt,right=1pt,top=1pt,bottom=1pt,
              boxrule=0pt,bottomrule=1pt,toprule=1pt}
            \newtcbox{\boxonered}[1][orange!70!red]{on line,before upper=\ttfamily,
              arc=0pt,outer arc=0pt,colback=#1!10!white,colframe=#1!50!black,
              boxsep=0pt,left=1pt,right=1pt,top=1pt,bottom=1pt,
              boxrule=0pt,bottomrule=1pt,toprule=1pt}
            \newtcbox{\boxoneyellow}[1][pink!50!yellow]{on line,before upper=\ttfamily,
              arc=0pt,outer arc=0pt,colback=#1!10!white,colframe=#1!50!black,
              boxsep=0pt,left=1pt,right=1pt,top=1pt,bottom=1pt,
              boxrule=0pt,bottomrule=1pt,toprule=1pt}
            \newtcbox{\boxoneblue}[1][cyan!75!black]{on line,before upper=\ttfamily,
              arc=0pt,outer arc=0pt,colback=#1!10!white,colframe=#1!50!black,
              boxsep=0pt,left=1pt,right=1pt,top=1pt,bottom=1pt,
              boxrule=0pt,bottomrule=1pt,toprule=1pt}
            \newtcbox{\boxtwogreen}[1][green]{on line,before upper={\rule[-0.2ex]{0pt}{1ex}\ttfamily},
              arc=0.8ex,colback=#1!10!white,colframe=#1!50!black,
              boxsep=0pt,left=1.5pt,right=1.5pt,top=1pt,bottom=1pt,
              boxrule=1pt}
            \newtcbox{\boxtwoviolet}[1][violet!70!cyan]{on line,before upper={\rule[-0.2ex]{0pt}{1ex}\ttfamily},
              arc=0.8ex,colback=#1!10!white,colframe=#1!50!black,
              boxsep=0pt,left=1.5pt,right=1.5pt,top=1pt,bottom=1pt,
              boxrule=1pt}
            \newtcbox{\boxtwored}[1][orange!70!red]{on line,before upper={\rule[-0.2ex]{0pt}{1ex}\ttfamily},
              arc=0.8ex,colback=#1!10!white,colframe=#1!50!black,
              boxsep=0pt,left=1.5pt,right=1.5pt,top=1pt,bottom=1pt,
              boxrule=1pt}
            \newtcbox{\boxtwoyellow}[1][pink!50!yellow]{on line,before upper={\rule[-0.2ex]{0pt}{1ex}\ttfamily},
              arc=0.8ex,colback=#1!10!white,colframe=#1!50!black,
              boxsep=0pt,left=1.5pt,right=1.5pt,top=1pt,bottom=1pt,
              boxrule=1pt}
            \newtcbox{\boxtwoblue}[1][cyan!75!black]{on line,before upper={\rule[-0.2ex]{0pt}{1ex}\ttfamily},
              arc=0.8ex,colback=#1!10!white,colframe=#1!50!black,
              boxsep=0pt,left=1.5pt,right=1.5pt,top=1pt,bottom=1pt,
              boxrule=1pt}
            %>par box with title
            \newtcolorbox{parboxbluetitle}[2][]{colbacktitle=blue,breakable,
            colback=blue!5!white,coltitle=white,colframe=blue,
            title={#2},fonttitle=\sffamily,#1}
            \newtcolorbox{parboxredtitle}[2][]{colbacktitle=red!75!black,breakable,
            colback=red!5!white,coltitle=white,colframe=red!75!black,
            title={#2},fonttitle=\sffamily,#1}
            \newtcolorbox{parboxgreentitle}[2][]{colbacktitle=green!35!black,breakable,
            colback=green!5!white,coltitle=white,colframe=green!35!black,
            title={#2},fonttitle=\sffamily,#1}
            \newtcolorbox{parboxyellowtitle}[2][]{colbacktitle=yellow!75!red,breakable,
            colback=yellow!10!white,coltitle=black,colframe=yellow!75!red,
            title={#2},fonttitle=\sffamily,#1}
            \newtcolorbox{parboxvoilettitle}[2][]{colbacktitle=violet!70!cyan,breakable,
            colback=red!5!white,coltitle=white,colframe=violet!70!cyan,
            title={#2},fonttitle=\sffamily,#1}
            %>par box no title
            \newtcolorbox{parboxbluenotitle}{breakable,
            colback=blue!5!white,colframe=blue}
            \newtcolorbox{parboxrednotitle}{breakable,
            colback=red!5!white,colframe=red!75!black}
            \newtcolorbox{parboxgreennotitle}{breakable,
            colback=green!5!white,colframe=green!35!black}
            \newtcolorbox{parboxyellownotitle}{breakable,
            colback=yellow!10!white,colframe=yellow!75!red}
            \newtcolorbox{parboxvoiletnotitle}{breakable,
            colback=red!5!white,colframe=violet!70!cyan}
    %%Ada,Objective, Sharp, C, C++, Assembler, Awk, Caml, bash, Delphi, erlang, Fortran, Gnuplot, Haskell, HTML
    %%Lingo, Java, Scala, Lua, make, Lisp, Matlab, Mathematica, Octave, Pascal, Perl, PHP, PostScript, Prolog
    %%Python, Ruby, SQL, SAS, R, Tex, LaTex, VBScript, Verilog, VHDL, XML
        %%C++
        \lstdefinestyle{tcbC++}{
            language=c++,
            numberbychapter=false,
            backgroundcolor=\color{gray!30!white},
            basicstyle=\linespread{0.8}\small\ttfamily,
            breakatwhitespace=false,
            breaklines=true,
            captionpos=b,
            commentstyle=\color{green!50!black},
            columns=fullflexible,  
            frame=none,
            keepspaces=true,
            keywordstyle=\color{blue},
            numbers=left,
            numbersep=5pt,
            numberstyle=\tiny\color{red!75!black},
            rulecolor=\color{black},
            showspaces=false,
            showstringspaces=false,
            showtabs=false,
            stepnumber=1,
            stringstyle=\color{mymauve},
            tabsize=2,
            title=\lstname
        }
        \newtcblisting{tcbC++}{breakable,colback=gray!30!white,colframe=cyan!75!black,listing only, 
          left=6mm,top=2pt,bottom=2pt,fontupper=\small,
          listing options={style=tcbC++}
        }

        %%Ada
        \lstdefinestyle{tcbAda}{
            language=Ada,      
            numberbychapter=false,
            backgroundcolor=\color{gray!30!white},
            basicstyle=\linespread{0.8}\small\ttfamily,
            breakatwhitespace=false,
            breaklines=true,
            captionpos=b,
            commentstyle=\color{green!50!black},
            columns=fullflexible,  
            frame=none,
            keepspaces=true,
            keywordstyle=\color{blue},
            numbers=left,
            numbersep=5pt,
            numberstyle=\tiny\color{red!75!black},
            rulecolor=\color{black},
            showspaces=false,
            showstringspaces=false,
            showtabs=false,
            stepnumber=1,
            stringstyle=\color{mymauve},
            tabsize=2,
            title=\lstname
        }
        \newtcblisting{tcbAda}{breakable,colback=gray!30!white,colframe=cyan!75!black,listing only, 
          left=6mm,top=2pt,bottom=2pt,fontupper=\small,
          listing options={style=tcbAda}
        }

        %%Objective C
        \lstdefinestyle{tcbObjective}{
            language=Objective,
            numberbychapter=false,
            backgroundcolor=\color{gray!30!white},
            basicstyle=\linespread{0.8}\small\ttfamily,
            breakatwhitespace=false,
            breaklines=true,
            captionpos=b,
            commentstyle=\color{green!50!black},
            columns=fullflexible,  
            frame=none,
            keepspaces=true,
            keywordstyle=\color{blue},
            numbers=left,
            numbersep=5pt,
            numberstyle=\tiny\color{red!75!black},
            rulecolor=\color{black},
            showspaces=false,
            showstringspaces=false,
            showtabs=false,
            stepnumber=1,
            stringstyle=\color{mymauve},
            tabsize=2,
            title=\lstname
        }
        \newtcblisting{tcbObjective}{breakable,colback=gray!30!white,colframe=cyan!75!black,listing only, 
          left=6mm,top=2pt,bottom=2pt,fontupper=\small,
          listing options={style=tcbObjective}
        }

        %%C#
        \lstdefinestyle{tcbSharp}{
            language=Sharp,
            numberbychapter=false,
            backgroundcolor=\color{gray!30!white},
            basicstyle=\linespread{0.8}\small\ttfamily,
            breakatwhitespace=false,
            breaklines=true,
            captionpos=b,
            commentstyle=\color{green!50!black},
            columns=fullflexible,  
            frame=none,
            keepspaces=true,
            keywordstyle=\color{blue},
            numbers=left,
            numbersep=5pt,
            numberstyle=\tiny\color{red!75!black},
            rulecolor=\color{black},
            showspaces=false,
            showstringspaces=false,
            showtabs=false,
            stepnumber=1,
            stringstyle=\color{mymauve},
            tabsize=2,
            title=\lstname
        }
        \newtcblisting{Sharp}{breakable,colback=gray!30!white,colframe=cyan!75!black,listing only, 
          left=6mm,top=2pt,bottom=2pt,fontupper=\small,
          listing options={style=tcbSharp}
        }

        %%C
        \lstdefinestyle{tcbC}{
            language=C,
            numberbychapter=false,
            backgroundcolor=\color{gray!30!white},
            basicstyle=\linespread{0.8}\small\ttfamily,
            breakatwhitespace=false,
            breaklines=true,
            captionpos=b,
            commentstyle=\color{green!50!black},
            columns=fullflexible,  
            frame=none,
            keepspaces=true,
            keywordstyle=\color{blue},
            numbers=left,
            numbersep=5pt,
            numberstyle=\tiny\color{red!75!black},
            rulecolor=\color{black},
            showspaces=false,
            showstringspaces=false,
            showtabs=false,
            stepnumber=1,
            stringstyle=\color{mymauve},
            tabsize=2,
            title=\lstname
        }
        \newtcblisting{tcbC}{breakable,colback=gray!30!white,colframe=cyan!75!black,listing only, 
          left=6mm,top=2pt,bottom=2pt,fontupper=\small,
          listing options={style=tcbC}
        }

        %%Assemble
        \lstdefinestyle{tcbAssembler}{
            language=Assembler,
            numberbychapter=false,
            backgroundcolor=\color{gray!30!white},
            basicstyle=\linespread{0.8}\small\ttfamily,
            breakatwhitespace=false,
            breaklines=true,
            captionpos=b,
            commentstyle=\color{green!50!black},
            columns=fullflexible,  
            frame=none,
            keepspaces=true,
            keywordstyle=\color{blue},
            numbers=left,
            numbersep=5pt,
            numberstyle=\tiny\color{red!75!black},
            rulecolor=\color{black},
            showspaces=false,
            showstringspaces=false,
            showtabs=false,
            stepnumber=1,
            stringstyle=\color{mymauve},
            tabsize=2,
            title=\lstname
        }
        \newtcblisting{tcbAssembler}{breakable,colback=gray!30!white,colframe=cyan!75!black,listing only, 
          left=6mm,top=2pt,bottom=2pt,fontupper=\small,
          listing options={style=tcbAssembler}
        }

        %%Awk
        \lstdefinestyle{tcbAwk}{
            language=Awk,
            numberbychapter=false,
            backgroundcolor=\color{gray!30!white},
            basicstyle=\linespread{0.8}\small\ttfamily,
            breakatwhitespace=false,
            breaklines=true,
            captionpos=b,
            commentstyle=\color{green!50!black},
            columns=fullflexible,  
            frame=none,
            keepspaces=true,
            keywordstyle=\color{blue},
            numbers=left,
            numbersep=5pt,
            numberstyle=\tiny\color{red!75!black},
            rulecolor=\color{black},
            showspaces=false,
            showstringspaces=false,
            showtabs=false,
            stepnumber=1,
            stringstyle=\color{mymauve},
            tabsize=2,
            title=\lstname
        }
        \newtcblisting{tcbAwk}{breakable,colback=gray!30!white,colframe=cyan!75!black,listing only, 
          left=6mm,top=2pt,bottom=2pt,fontupper=\small,
          listing options={style=tcbAwk}
        }

        %%Caml
        \lstdefinestyle{tcbCaml}{
            language=Caml,
            numberbychapter=false,
            backgroundcolor=\color{gray!30!white},
            basicstyle=\linespread{0.8}\small\ttfamily,
            breakatwhitespace=false,
            breaklines=true,
            captionpos=b,
            commentstyle=\color{green!50!black},
            columns=fullflexible,  
            frame=none,
            keepspaces=true,
            keywordstyle=\color{blue},
            numbers=left,
            numbersep=5pt,
            numberstyle=\tiny\color{red!75!black},
            rulecolor=\color{black},
            showspaces=false,
            showstringspaces=false,
            showtabs=false,
            stepnumber=1,
            stringstyle=\color{mymauve},
            tabsize=2,
            title=\lstname
        }
        \newtcblisting{tcbCaml}{breakable,colback=gray!30!white,colframe=cyan!75!black,listing only, 
          left=6mm,top=2pt,bottom=2pt,fontupper=\small,
          listing options={style=tcbCaml}
        }

        %%bash
        \lstdefinestyle{tcbbash}{
            language=bash,
            numberbychapter=false,
            backgroundcolor=\color{gray!30!white},
            basicstyle=\linespread{0.8}\small\ttfamily,
            breakatwhitespace=false,
            breaklines=true,
            captionpos=b,
            commentstyle=\color{green!50!black},
            columns=fullflexible,  
            frame=none,
            keepspaces=true,
            keywordstyle=\color{blue},
            numbers=left,
            numbersep=5pt,
            numberstyle=\tiny\color{red!75!black},
            rulecolor=\color{black},
            showspaces=false,
            showstringspaces=false,
            showtabs=false,
            stepnumber=1,
            stringstyle=\color{mymauve},
            tabsize=2,
            title=\lstname
        }
        \newtcblisting{tcbbash}{breakable,colback=gray!30!white,colframe=cyan!75!black,listing only, 
          left=6mm,top=2pt,bottom=2pt,fontupper=\small,
          listing options={style=tcbbash}
        }

        %%Delphi
        \lstdefinestyle{tcbDelphi}{
            language=Delphi,
            numberbychapter=false,
            backgroundcolor=\color{gray!30!white},
            basicstyle=\linespread{0.8}\small\ttfamily,
            breakatwhitespace=false,
            breaklines=true,
            captionpos=b,
            commentstyle=\color{green!50!black},
            columns=fullflexible,  
            frame=none,
            keepspaces=true,
            keywordstyle=\color{blue},
            numbers=left,
            numbersep=5pt,
            numberstyle=\tiny\color{red!75!black},
            rulecolor=\color{black},
            showspaces=false,
            showstringspaces=false,
            showtabs=false,
            stepnumber=1,
            stringstyle=\color{mymauve},
            tabsize=2,
            title=\lstname
        }
        \newtcblisting{tcbDelphi}{breakable,colback=gray!30!white,colframe=cyan!75!black,listing only, 
          left=6mm,top=2pt,bottom=2pt,fontupper=\small,
          listing options={style=tcbDelphi}
        }

        %%erlang
        \lstdefinestyle{tcberlang}{
            language=erlang,
            numberbychapter=false,
            backgroundcolor=\color{gray!30!white},
            basicstyle=\linespread{0.8}\small\ttfamily,
            breakatwhitespace=false,
            breaklines=true,
            captionpos=b,
            commentstyle=\color{green!50!black},
            columns=fullflexible,  
            frame=none,
            keepspaces=true,
            keywordstyle=\color{blue},
            numbers=left,
            numbersep=5pt,
            numberstyle=\tiny\color{red!75!black},
            rulecolor=\color{black},
            showspaces=false,
            showstringspaces=false,
            showtabs=false,
            stepnumber=1,
            stringstyle=\color{mymauve},
            tabsize=2,
            title=\lstname
        }
        \newtcblisting{tcberlang}{breakable,colback=gray!30!white,colframe=cyan!75!black,listing only, 
          left=6mm,top=2pt,bottom=2pt,fontupper=\small,
          listing options={style=tcberlang}
        }

        %%Fortran
        \lstdefinestyle{tcbFortran}{
            language=Fortran,
            numberbychapter=false,
            backgroundcolor=\color{gray!30!white},
            basicstyle=\linespread{0.8}\small\ttfamily,
            breakatwhitespace=false,
            breaklines=true,
            captionpos=b,
            commentstyle=\color{green!50!black},
            columns=fullflexible,  
            frame=none,
            keepspaces=true,
            keywordstyle=\color{blue},
            numbers=left,
            numbersep=5pt,
            numberstyle=\tiny\color{red!75!black},
            rulecolor=\color{black},
            showspaces=false,
            showstringspaces=false,
            showtabs=false,
            stepnumber=1,
            stringstyle=\color{mymauve},
            tabsize=2,
            title=\lstname
        }
        \newtcblisting{tcbFortran}{breakable,colback=gray!30!white,colframe=cyan!75!black,listing only, 
          left=6mm,top=2pt,bottom=2pt,fontupper=\small,
          listing options={style=tcbFortran}
        }

        %%Gnuplot
        \lstdefinestyle{tcbGunplot}{
            language=Gnuplot,
            numberbychapter=false,
            backgroundcolor=\color{gray!30!white},
            basicstyle=\linespread{0.8}\small\ttfamily,
            breakatwhitespace=false,
            breaklines=true,
            captionpos=b,
            commentstyle=\color{green!50!black},
            columns=fullflexible,  
            frame=none,
            keepspaces=true,
            keywordstyle=\color{blue},
            numbers=left,
            numbersep=5pt,
            numberstyle=\tiny\color{red!75!black},
            rulecolor=\color{black},
            showspaces=false,
            showstringspaces=false,
            showtabs=false,
            stepnumber=1,
            stringstyle=\color{mymauve},
            tabsize=2,
            title=\lstname
        }
        \newtcblisting{tcbGunplot}{breakable,colback=gray!30!white,colframe=cyan!75!black,listing only, 
          left=6mm,top=2pt,bottom=2pt,fontupper=\small,
          listing options={style=tcbGunplot}
        }

        %%Haskell
        \lstdefinestyle{tcbHaskell}{
            language=Haskell,
            numberbychapter=false,
            backgroundcolor=\color{gray!30!white},
            basicstyle=\linespread{0.8}\small\ttfamily,
            breakatwhitespace=false,
            breaklines=true,
            captionpos=b,
            commentstyle=\color{green!50!black},
            columns=fullflexible,  
            frame=none,
            keepspaces=true,
            keywordstyle=\color{blue},
            numbers=left,
            numbersep=5pt,
            numberstyle=\tiny\color{red!75!black},
            rulecolor=\color{black},
            showspaces=false,
            showstringspaces=false,
            showtabs=false,
            stepnumber=1,
            stringstyle=\color{mymauve},
            tabsize=2,
            title=\lstname
        }
        \newtcblisting{tcbHaskell}{breakable,colback=gray!30!white,colframe=cyan!75!black,listing only, 
          left=6mm,top=2pt,bottom=2pt,fontupper=\small,
          listing options={style=tcbHaskell}
        }
        %%HTML
        \lstdefinestyle{tcbHTML}{
            language=HTML, 
            numberbychapter=false,
            backgroundcolor=\color{gray!30!white},
            basicstyle=\linespread{0.8}\small\ttfamily,
            breakatwhitespace=false,
            breaklines=true,
            captionpos=b,
            commentstyle=\color{green!50!black},
            columns=fullflexible,  
            frame=none,
            keepspaces=true,
            keywordstyle=\color{blue},
            numbers=left,
            numbersep=5pt,
            numberstyle=\tiny\color{red!75!black},
            rulecolor=\color{black},
            showspaces=false,
            showstringspaces=false,
            showtabs=false,
            stepnumber=1,
            stringstyle=\color{mymauve},
            tabsize=2,
            title=\lstname
        }
        \newtcblisting{tcbHTML}{breakable,colback=gray!30!white,colframe=cyan!75!black,listing only, 
          left=6mm,top=2pt,bottom=2pt,fontupper=\small,
          listing options={style=tcbHTML}
        }
        %%Scala
        \lstdefinestyle{tcbScala}{
            language=Scala,
            numberbychapter=false,
            backgroundcolor=\color{gray!30!white},
            basicstyle=\linespread{0.8}\small\ttfamily,
            breakatwhitespace=false,
            breaklines=true,
            captionpos=b,
            commentstyle=\color{green!50!black},
            columns=fullflexible,  
            frame=none,
            keepspaces=true,
            keywordstyle=\color{blue},
            numbers=left,
            numbersep=5pt,
            numberstyle=\tiny\color{red!75!black},
            rulecolor=\color{black},
            showspaces=false,
            showstringspaces=false,
            showtabs=false,
            stepnumber=1,
            stringstyle=\color{mymauve},
            tabsize=2,
            title=\lstname
        }
        \newtcblisting{tcbScala}{breakable,colback=gray!30!white,colframe=cyan!75!black,listing only, 
          left=6mm,top=2pt,bottom=2pt,fontupper=\small,
          listing options={style=tcbScala}
        }
        %%Lingo
        \lstdefinestyle{tcbLingo}{
            language=Lingo,
            numberbychapter=false,
            backgroundcolor=\color{gray!30!white},
            basicstyle=\linespread{0.8}\small\ttfamily,
            breakatwhitespace=false,
            breaklines=true,
            captionpos=b,
            commentstyle=\color{green!50!black},
            columns=fullflexible,  
            frame=none,
            keepspaces=true,
            keywordstyle=\color{blue},
            numbers=left,
            numbersep=5pt,
            numberstyle=\tiny\color{red!75!black},
            rulecolor=\color{black},
            showspaces=false,
            showstringspaces=false,
            showtabs=false,
            stepnumber=1,
            stringstyle=\color{mymauve},
            tabsize=2,
            title=\lstname
        }
        \newtcblisting{tcbLingo}{breakable,colback=gray!30!white,colframe=cyan!75!black,listing only, 
          left=6mm,top=2pt,bottom=2pt,fontupper=\small,
          listing options={style=tcbLingo}
        }
        %%Lisp
        \lstdefinestyle{tcbLisp}{
            language=Lisp,
            numberbychapter=false,
            backgroundcolor=\color{gray!30!white},
            basicstyle=\linespread{0.8}\small\ttfamily,
            breakatwhitespace=false,
            breaklines=true,
            captionpos=b,
            commentstyle=\color{green!50!black},
            columns=fullflexible,  
            frame=none,
            keepspaces=true,
            keywordstyle=\color{blue},
            numbers=left,
            numbersep=5pt,
            numberstyle=\tiny\color{red!75!black},
            rulecolor=\color{black},
            showspaces=false,
            showstringspaces=false,
            showtabs=false,
            stepnumber=1,
            stringstyle=\color{mymauve},
            tabsize=2,
            title=\lstname
        }
        \newtcblisting{tcbLisp}{breakable,colback=gray!30!white,colframe=cyan!75!black,listing only, 
          left=6mm,top=2pt,bottom=2pt,fontupper=\small,
          listing options={style=tcbLisp}
        }
        %%Lua
        \lstdefinestyle{tcbLua}{
            language=Lua,
            numberbychapter=false,
            backgroundcolor=\color{gray!30!white},
            basicstyle=\linespread{0.8}\small\ttfamily,
            breakatwhitespace=false,
            breaklines=true,
            captionpos=b,
            commentstyle=\color{green!50!black},
            columns=fullflexible,  
            frame=none,
            keepspaces=true,
            keywordstyle=\color{blue},
            numbers=left,
            numbersep=5pt,
            numberstyle=\tiny\color{red!75!black},
            rulecolor=\color{black},
            showspaces=false,
            showstringspaces=false,
            showtabs=false,
            stepnumber=1,
            stringstyle=\color{mymauve},
            tabsize=2,
            title=\lstname
        }
        \newtcblisting{tcbLua}{breakable,colback=gray!30!white,colframe=cyan!75!black,listing only, 
          left=6mm,top=2pt,bottom=2pt,fontupper=\small,
          listing options={style=tcbLua}
        }
        %%make
        \lstdefinestyle{tcbmake}{
            language=make,
            numberbychapter=false,
            backgroundcolor=\color{gray!30!white},
            basicstyle=\linespread{0.8}\small\ttfamily,
            breakatwhitespace=false,
            breaklines=true,
            captionpos=b,
            commentstyle=\color{green!50!black},
            columns=fullflexible,  
            frame=none,
            keepspaces=true,
            keywordstyle=\color{blue},
            numbers=left,
            numbersep=5pt,
            numberstyle=\tiny\color{red!75!black},
            rulecolor=\color{black},
            showspaces=false,
            showstringspaces=false,
            showtabs=false,
            stepnumber=1,
            stringstyle=\color{mymauve},
            tabsize=2,
            title=\lstname
        }
        \newtcblisting{tcbmake}{breakable,colback=gray!30!white,colframe=cyan!75!black,listing only, 
          left=6mm,top=2pt,bottom=2pt,fontupper=\small,
          listing options={style=tcbmake}
        }
        %%Matlab
        \lstdefinestyle{tcbMatlab}{
            language=Matlab,
            numberbychapter=false,
            backgroundcolor=\color{gray!30!white},
            basicstyle=\linespread{0.8}\small\ttfamily,
            breakatwhitespace=false,
            breaklines=true,
            captionpos=b,
            commentstyle=\color{green!50!black},
            columns=fullflexible,  
            frame=none,
            keepspaces=true,
            keywordstyle=\color{blue},
            numbers=left,
            numbersep=5pt,
            numberstyle=\tiny\color{red!75!black},
            rulecolor=\color{black},
            showspaces=false,
            showstringspaces=false,
            showtabs=false,
            stepnumber=1,
            stringstyle=\color{mymauve},
            tabsize=2,
            title=\lstname
        }
        \newtcblisting{tcbMatlab}{breakable,colback=gray!30!white,colframe=cyan!75!black,listing only, 
          left=6mm,top=2pt,bottom=2pt,fontupper=\small,
          listing options={style=tcbMatlab}
        }
        %%Mathematica
        \lstdefinestyle{tcbMathematica}{
            language=Mathematica,
            numberbychapter=false,
            backgroundcolor=\color{gray!30!white},
            basicstyle=\linespread{0.8}\small\ttfamily,
            breakatwhitespace=false,
            breaklines=true,
            captionpos=b,
            commentstyle=\color{green!50!black},
            columns=fullflexible,  
            frame=none,
            keepspaces=true,
            keywordstyle=\color{blue},
            numbers=left,
            numbersep=5pt,
            numberstyle=\tiny\color{red!75!black},
            rulecolor=\color{black},
            showspaces=false,
            showstringspaces=false,
            showtabs=false,
            stepnumber=1,
            stringstyle=\color{mymauve},
            tabsize=2,
            title=\lstname
        }
        \newtcblisting{tcbMathematica}{breakable,colback=gray!30!white,colframe=cyan!75!black,listing only, 
          left=6mm,top=2pt,bottom=2pt,fontupper=\small,
          listing options={style=tcbMathematica}
        }
        %%Octave
        \lstdefinestyle{tcbOctave}{
            language=Octave,
            numberbychapter=false,
            backgroundcolor=\color{gray!30!white},
            basicstyle=\linespread{0.8}\small\ttfamily,
            breakatwhitespace=false,
            breaklines=true,
            captionpos=b,
            commentstyle=\color{green!50!black},
            columns=fullflexible,  
            frame=none,
            keepspaces=true,
            keywordstyle=\color{blue},
            numbers=left,
            numbersep=5pt,
            numberstyle=\tiny\color{red!75!black},
            rulecolor=\color{black},
            showspaces=false,
            showstringspaces=false,
            showtabs=false,
            stepnumber=1,
            stringstyle=\color{mymauve},
            tabsize=2,
            title=\lstname
        }
        \newtcblisting{tcbOctave}{breakable,colback=gray!30!white,colframe=cyan!75!black,listing only, 
          left=6mm,top=2pt,bottom=2pt,fontupper=\small,
          listing options={style=tcbOctave}
        }
        %%Pascal
        \lstdefinestyle{tcbPascal}{
            language=Pascal,
            numberbychapter=false,
            backgroundcolor=\color{gray!30!white},
            basicstyle=\linespread{0.8}\small\ttfamily,
            breakatwhitespace=false,
            breaklines=true,
            captionpos=b,
            commentstyle=\color{green!50!black},
            columns=fullflexible,  
            frame=none,
            keepspaces=true,
            keywordstyle=\color{blue},
            numbers=left,
            numbersep=5pt,
            numberstyle=\tiny\color{red!75!black},
            rulecolor=\color{black},
            showspaces=false,
            showstringspaces=false,
            showtabs=false,
            stepnumber=1,
            stringstyle=\color{mymauve},
            tabsize=2,
            title=\lstname
        }
        \newtcblisting{tcbPascal}{breakable,colback=gray!30!white,colframe=cyan!75!black,listing only, 
          left=6mm,top=2pt,bottom=2pt,fontupper=\small,
          listing options={style=tcbPascal}
        }
        %%Perl
        \lstdefinestyle{tcbPerl}{
            language=Perl,
            numberbychapter=false,
            backgroundcolor=\color{gray!30!white},
            basicstyle=\linespread{0.8}\small\ttfamily,
            breakatwhitespace=false,
            breaklines=true,
            captionpos=b,
            commentstyle=\color{green!50!black},
            columns=fullflexible,  
            frame=none,
            keepspaces=true,
            keywordstyle=\color{blue},
            numbers=left,
            numbersep=5pt,
            numberstyle=\tiny\color{red!75!black},
            rulecolor=\color{black},
            showspaces=false,
            showstringspaces=false,
            showtabs=false,
            stepnumber=1,
            stringstyle=\color{mymauve},
            tabsize=2,
            title=\lstname
        }
        \newtcblisting{tcbPerl}{breakable,colback=gray!30!white,colframe=cyan!75!black,listing only, 
          left=6mm,top=2pt,bottom=2pt,fontupper=\small,
          listing options={style=tcbPerl}
        }
        %%PHP
        \lstdefinestyle{tcbPHP}{
            language=PHP,
            numberbychapter=false,
            backgroundcolor=\color{gray!30!white},
            basicstyle=\linespread{0.8}\small\ttfamily,
            breakatwhitespace=false,
            breaklines=true,
            captionpos=b,
            commentstyle=\color{green!50!black},
            columns=fullflexible,  
            frame=none,
            keepspaces=true,
            keywordstyle=\color{blue},
            numbers=left,
            numbersep=5pt,
            numberstyle=\tiny\color{red!75!black},
            rulecolor=\color{black},
            showspaces=false,
            showstringspaces=false,
            showtabs=false,
            stepnumber=1,
            stringstyle=\color{mymauve},
            tabsize=2,
            title=\lstname
        }
        \newtcblisting{tcbPHP}{breakable,colback=gray!30!white,colframe=cyan!75!black,listing only, 
          left=6mm,top=2pt,bottom=2pt,fontupper=\small,
          listing options={style=tcbPHP}
        }
        %%PostScript
        \lstdefinestyle{tcbPostScript}{
            language=PostScript,
            numberbychapter=false,
            backgroundcolor=\color{gray!30!white},
            basicstyle=\linespread{0.8}\small\ttfamily,
            breakatwhitespace=false,
            breaklines=true,
            captionpos=b,
            commentstyle=\color{green!50!black},
            columns=fullflexible,  
            frame=none,
            keepspaces=true,
            keywordstyle=\color{blue},
            numbers=left,
            numbersep=5pt,
            numberstyle=\tiny\color{red!75!black},
            rulecolor=\color{black},
            showspaces=false,
            showstringspaces=false,
            showtabs=false,
            stepnumber=1,
            stringstyle=\color{mymauve},
            tabsize=2,
            title=\lstname
        }
        \newtcblisting{tcbPostScript}{breakable,colback=gray!30!white,colframe=cyan!75!black,listing only, 
          left=6mm,top=2pt,bottom=2pt,fontupper=\small,
          listing options={style=tcbPostScript}
        }
        %%Prolog
        \lstdefinestyle{tcbProlog}{
            language=Prolog,
            numberbychapter=false,
            backgroundcolor=\color{gray!30!white},
            basicstyle=\linespread{0.8}\small\ttfamily,
            breakatwhitespace=false,
            breaklines=true,
            captionpos=b,
            commentstyle=\color{green!50!black},
            columns=fullflexible,  
            frame=none,
            keepspaces=true,
            keywordstyle=\color{blue},
            numbers=left,
            numbersep=5pt,
            numberstyle=\tiny\color{red!75!black},
            rulecolor=\color{black},
            showspaces=false,
            showstringspaces=false,
            showtabs=false,
            stepnumber=1,
            stringstyle=\color{mymauve},
            tabsize=2,
            title=\lstname
        }
        \newtcblisting{tcbProlog}{breakable,colback=gray!30!white,colframe=cyan!75!black,listing only, 
          left=6mm,top=2pt,bottom=2pt,fontupper=\small,
          listing options={style=tcbProlog}
        }
        %%Python
        \lstdefinestyle{tcbPython}{
            language=Python,
            numberbychapter=false,
            backgroundcolor=\color{gray!30!white},
            basicstyle=\linespread{0.8}\small\ttfamily,
            breakatwhitespace=false,
            breaklines=true,
            captionpos=b,
            commentstyle=\color{green!50!black},
            columns=fullflexible,  
            frame=none,
            keepspaces=true,
            keywordstyle=\color{blue},
            numbers=left,
            numbersep=5pt,
            numberstyle=\tiny\color{red!75!black},
            rulecolor=\color{black},
            showspaces=false,
            showstringspaces=false,
            showtabs=false,
            stepnumber=1,
            stringstyle=\color{mymauve},
            tabsize=2,
            title=\lstname
        }
        \newtcblisting{tcbPython}{breakable,colback=gray!30!white,colframe=cyan!75!black,listing only, 
          left=6mm,top=2pt,bottom=2pt,fontupper=\small,
          listing options={style=tcbPython}
        }
        %%Ruby
        \lstdefinestyle{tcbRuby}{
            language=Ruby,
            numberbychapter=false,
            backgroundcolor=\color{gray!30!white},
            basicstyle=\linespread{0.8}\small\ttfamily,
            breakatwhitespace=false,
            breaklines=true,
            captionpos=b,
            commentstyle=\color{green!50!black},
            columns=fullflexible,  
            frame=none,
            keepspaces=true,
            keywordstyle=\color{blue},
            numbers=left,
            numbersep=5pt,
            numberstyle=\tiny\color{red!75!black},
            rulecolor=\color{black},
            showspaces=false,
            showstringspaces=false,
            showtabs=false,
            stepnumber=1,
            stringstyle=\color{mymauve},
            tabsize=2,
            title=\lstname
        }
        \newtcblisting{tcbRuby}{breakable,colback=gray!30!white,colframe=cyan!75!black,listing only, 
          left=6mm,top=2pt,bottom=2pt,fontupper=\small,
          listing options={style=tcbRuby}
        }
        %%SQL
        \lstdefinestyle{tcbSQL}{
            language=SQL,
            numberbychapter=false,
            backgroundcolor=\color{gray!30!white},
            basicstyle=\linespread{0.8}\small\ttfamily,
            breakatwhitespace=false,
            breaklines=true,
            captionpos=b,
            commentstyle=\color{green!50!black},
            columns=fullflexible,  
            frame=none,
            keepspaces=true,
            keywordstyle=\color{blue},
            numbers=left,
            numbersep=5pt,
            numberstyle=\tiny\color{red!75!black},
            rulecolor=\color{black},
            showspaces=false,
            showstringspaces=false,
            showtabs=false,
            stepnumber=1,
            stringstyle=\color{mymauve},
            tabsize=2,
            title=\lstname
        }
        \newtcblisting{tcbSQL}{breakable,colback=gray!30!white,colframe=cyan!75!black,listing only, 
          left=6mm,top=2pt,bottom=2pt,fontupper=\small,
          listing options={style=tcbSQL}
        }
        %%SAS
        \lstdefinestyle{tcbSAS}{
            language=SAS,
            numberbychapter=false,
            backgroundcolor=\color{gray!30!white},
            basicstyle=\linespread{0.8}\small\ttfamily,
            breakatwhitespace=false,
            breaklines=true,
            captionpos=b,
            commentstyle=\color{green!50!black},
            columns=fullflexible,  
            frame=none,
            keepspaces=true,
            keywordstyle=\color{blue},
            numbers=left,
            numbersep=5pt,
            numberstyle=\tiny\color{red!75!black},
            rulecolor=\color{black},
            showspaces=false,
            showstringspaces=false,
            showtabs=false,
            stepnumber=1,
            stringstyle=\color{mymauve},
            tabsize=2,
            title=\lstname
        }
        \newtcblisting{tcbSAS}{breakable,colback=gray!30!white,colframe=cyan!75!black,listing only, 
          left=6mm,top=2pt,bottom=2pt,fontupper=\small,
          listing options={style=tcbSAS}
        }
        %%R
        \lstdefinestyle{tcbR}{
            language=R,
            numberbychapter=false,
            backgroundcolor=\color{gray!30!white},
            basicstyle=\linespread{0.8}\small\ttfamily,
            breakatwhitespace=false,
            breaklines=true,
            captionpos=b,
            commentstyle=\color{green!50!black},
            columns=fullflexible,  
            frame=none,
            keepspaces=true,
            keywordstyle=\color{blue},
            numbers=left,
            numbersep=5pt,
            numberstyle=\tiny\color{red!75!black},
            rulecolor=\color{black},
            showspaces=false,
            showstringspaces=false,
            showtabs=false,
            stepnumber=1,
            stringstyle=\color{mymauve},
            tabsize=2,
            title=\lstname
        }
        \newtcblisting{tcbR}{breakable,colback=gray!30!white,colframe=cyan!75!black,listing only, 
          left=6mm,top=2pt,bottom=2pt,fontupper=\small,
          listing options={style=tcbR}
        }
        %%Tex
        \lstdefinestyle{tcbTex}{
            language=Tex,
            numberbychapter=false,
            backgroundcolor=\color{gray!30!white},
            basicstyle=\linespread{0.8}\small\ttfamily,
            breakatwhitespace=false,
            breaklines=true,
            captionpos=b,
            commentstyle=\color{green!50!black},
            columns=fullflexible,  
            frame=none,
            keepspaces=true,
            keywordstyle=\color{blue},
            numbers=left,
            numbersep=5pt,
            numberstyle=\tiny\color{red!75!black},
            rulecolor=\color{black},
            showspaces=false,
            showstringspaces=false,
            showtabs=false,
            stepnumber=1,
            stringstyle=\color{mymauve},
            tabsize=2,
            title=\lstname
        }
        \newtcblisting{tcbTex}{breakable,colback=gray!30!white,colframe=cyan!75!black,listing only, 
          left=6mm,top=2pt,bottom=2pt,fontupper=\small,
          listing options={style=tcbTex}
        }
        %%LaTex
        \lstdefinestyle{tcbLaTex}{
            language=LaTex,
            numberbychapter=false,
            backgroundcolor=\color{gray!30!white},
            basicstyle=\linespread{0.8}\small\ttfamily,
            breakatwhitespace=false,
            breaklines=true,
            captionpos=b,
            commentstyle=\color{green!50!black},
            columns=fullflexible,  
            frame=none,
            keepspaces=true,
            keywordstyle=\color{blue},
            numbers=left,
            numbersep=5pt,
            numberstyle=\tiny\color{red!75!black},
            rulecolor=\color{black},
            showspaces=false,
            showstringspaces=false,
            showtabs=false,
            stepnumber=1,
            stringstyle=\color{mymauve},
            tabsize=2,
            title=\lstname
        }
        \newtcblisting{tcbLaTex}{breakable,colback=gray!30!white,colframe=cyan!75!black,listing only, 
          left=6mm,top=2pt,bottom=2pt,fontupper=\small,
          listing options={style=tcbLaTex}
        }
        %%VBScript
        \lstdefinestyle{tcbVBScript}{
            language=VBScript,
            numberbychapter=false,
            backgroundcolor=\color{gray!30!white},
            basicstyle=\linespread{0.8}\small\ttfamily,
            breakatwhitespace=false,
            breaklines=true,
            captionpos=b,
            commentstyle=\color{green!50!black},
            columns=fullflexible,  
            frame=none,
            keepspaces=true,
            keywordstyle=\color{blue},
            numbers=left,
            numbersep=5pt,
            numberstyle=\tiny\color{red!75!black},
            rulecolor=\color{black},
            showspaces=false,
            showstringspaces=false,
            showtabs=false,
            stepnumber=1,
            stringstyle=\color{mymauve},
            tabsize=2,
            title=\lstname
        }
        \newtcblisting{tcbVBScript}{breakable,colback=gray!30!white,colframe=cyan!75!black,listing only, 
          left=6mm,top=2pt,bottom=2pt,fontupper=\small,
          listing options={style=tcbVBScript}
        }
        %%Verilog
        \lstdefinestyle{tcbVerilog}{
            language=Verilog,
            numberbychapter=false,
            backgroundcolor=\color{gray!30!white},
            basicstyle=\linespread{0.8}\small\ttfamily,
            breakatwhitespace=false,
            breaklines=true,
            captionpos=b,
            commentstyle=\color{green!50!black},
            columns=fullflexible,  
            frame=none,
            keepspaces=true,
            keywordstyle=\color{blue},
            numbers=left,
            numbersep=5pt,
            numberstyle=\tiny\color{red!75!black},
            rulecolor=\color{black},
            showspaces=false,
            showstringspaces=false,
            showtabs=false,
            stepnumber=1,
            stringstyle=\color{mymauve},
            tabsize=2,
            title=\lstname
        }
        \newtcblisting{tcbVerilog}{breakable,colback=gray!30!white,colframe=cyan!75!black,listing only, 
          left=6mm,top=2pt,bottom=2pt,fontupper=\small,
          listing options={style=tcbVerilog}
        }
        %%VHDL
        \lstdefinestyle{tcbVHDL}{
            language=VHDL,
            numberbychapter=false,
            backgroundcolor=\color{gray!30!white},
            basicstyle=\linespread{0.8}\small\ttfamily,
            breakatwhitespace=false,
            breaklines=true,
            captionpos=b,
            commentstyle=\color{green!50!black},
            columns=fullflexible,  
            frame=none,
            keepspaces=true,
            keywordstyle=\color{blue},
            numbers=left,
            numbersep=5pt,
            numberstyle=\tiny\color{red!75!black},
            rulecolor=\color{black},
            showspaces=false,
            showstringspaces=false,
            showtabs=false,
            stepnumber=1,
            stringstyle=\color{mymauve},
            tabsize=2,
            title=\lstname
        }
        \newtcblisting{tcbVHDL}{breakable,colback=gray!30!white,colframe=cyan!75!black,listing only, 
          left=6mm,top=2pt,bottom=2pt,fontupper=\small,
          listing options={style=tcbVHDL}
        }
        %%XML
        \lstdefinestyle{tcbXML}{
            language=XML,
            numberbychapter=false,
            backgroundcolor=\color{gray!30!white},
            basicstyle=\linespread{0.8}\small\ttfamily,
            breakatwhitespace=false,
            breaklines=true,
            captionpos=b,
            commentstyle=\color{green!50!black},
            columns=fullflexible,  
            frame=none,
            keepspaces=true,
            keywordstyle=\color{blue},
            numbers=left,
            numbersep=5pt,
            numberstyle=\tiny\color{red!75!black},
            rulecolor=\color{black},
            showspaces=false,
            showstringspaces=false,
            showtabs=false,
            stepnumber=1,
            stringstyle=\color{mymauve},
            tabsize=2,
            title=\lstname
        }
        \newtcblisting{tcbXML}{breakable,colback=gray!30!white,colframe=cyan!75!black,listing only, 
          left=6mm,top=2pt,bottom=2pt,fontupper=\small,
          listing options={style=tcbXML}
        }
        %%JS
        \lstdefinestyle{tcbJS}{
            language=JS,
            numberbychapter=false,
            backgroundcolor=\color{gray!30!white},
            basicstyle=\linespread{0.8}\small\ttfamily,
            breakatwhitespace=false,
            breaklines=true,
            captionpos=b,
            commentstyle=\color{green!50!black},
            columns=fullflexible,  
            frame=none,
            keepspaces=true,
            keywordstyle=\color{blue},
            numbers=left,
            numbersep=5pt,
            numberstyle=\tiny\color{red!75!black},
            rulecolor=\color{black},
            showspaces=false,
            showstringspaces=false,
            showtabs=false,
            stepnumber=1,
            stringstyle=\color{mymauve},
            tabsize=2,
            title=\lstname
        }
        \newtcblisting{tcbJS}{breakable,colback=gray!30!white,colframe=cyan!75!black,listing only, 
          left=6mm,top=2pt,bottom=2pt,fontupper=\small,
          listing options={style=tcbJS}
        }
    \fi
\fi
%---------------------------------------------------------------------------%
%->> Layout
%---------------------------------------------------------------------------%
\RequirePackage{indentfirst} %去除LaTex默认的section首不空格
\setlength{\parindent}{2em}
\RequirePackage[normalem]{ulem}% 下划线宏包
%- part one -- horizontal widths
%- left side width + textwidth + right side width = paperwidth
%- binding side width + textwidth + nonbinding side width = paperwidth
%- binding side width of [odd, even] page = [left, right] side width
%- left side width of [odd, even] page = 1.0in (fixed) + hoffset + [odd, even]sidemargin
%- assuming A4 paper (210mm x 297mm)
\setlength{\textwidth}{146.6mm}% set required text width first
\setlength{\hoffset}{0mm}% set horizontal offset
\setlength{\oddsidemargin}{6.3mm}% left side margin
\setlength{\evensidemargin}{6.3mm}% ensure uniform left side width for EThesis
\setlength{\marginparwidth}{35pt}% width of margin notes
\setlength{\marginparsep}{10pt}% width of space between body text and margin notes
%- part two -- vertical heights
%- top height + textheight + bottom height = paperheight
%- top height = 1.0in (fixed) + voffset + topmargin + headheight + headsep 
\setlength{\textheight}{246.2mm}% set required text height first
\setlength{\voffset}{-17.4mm}% set vertical offset
\setlength{\topmargin}{20pt}% vertical margin above header
\setlength{\headheight}{12pt}% header height
\setlength{\headsep}{17.5pt}% vertical margin between header and body text
\setlength{\footskip}{29.5pt}% vertical margin between footer and body text
%- specifies the amount of space between paragraphs.
\setlength{\parskip}{0.5ex plus 0.25ex minus 0.25ex}
%- line spacing
%\linespread{1.5}% line space setting
\RequirePackage{setspace} %设置行间距
\onehalfspacing
\raggedbottom% prevent adding vertical white space in strange places
%
%- default pagestyle is page number at bottom without headers and footers
%-
%-
\renewcommand{\textfraction}{0.15}%页面中必须用来排放文本的最小比例。缺省值为 0.2，即一页中浮动对象所占的比例不得超过 80%。
\renewcommand{\topfraction}{0.85}%页面顶部可以用来放置浮动对象的高度与整个页面高度的最 大比例。缺省值为 0.7，即放置在页顶部的浮动对象所占 的高度不得超过整个页面高度 70%。同样地，如果多个 使用了选项 t 的浮动对象的高度和超过了 整个页面高度的 60%，即使它们的数目没有超过  topnumber 的值，仍将一个也不会被放置 在页面顶部。
\renewcommand{\bottomfraction}{0.65}%页面底部可以用来放置浮动对象的高度与整个页面高度的最 大比例。缺省值为 0.3，这使得如果浮动对象的高度 不超过整个页面高度的 40%，可以允许放置在页面底部。
\renewcommand{\floatpagefraction}{0.60}%浮动页中必须由浮动对象占用的最小比例。因此 在一浮动页中空白所占的比例不会超过 1 - \floatpagefraction。 缺省值为 0.5。
%---------------------------------------------------------------------------%
%->> Structure elements configuration
%---------------------------------------------------------------------------%
%- section
\ctexset {
    section = {
        format = \linespread{1.0}\zihao{-4}\sffamily \raggedright,
        aftername = \quad,
        beforeskip = {24pt},
        afterskip = {6pt},
    }
}
%- subsection
\ctexset {
    subsection = {
        format = \linespread{1.0}\zihao{-4} \sffamily\raggedright,
        aftername = \quad,
        beforeskip = {12pt},
        afterskip = {6pt},
    }
}
%- subsubsection
\ctexset {
    subsubsection = {
        format = \linespread{1.0}\zihao{-4}\sffamily\raggedright,
        aftername = \quad,
        beforeskip = {12pt},
        afterskip = {6pt},
    }
}
%---------------------------------------------------------------------------%
%->> New environments
%---------------------------------------------------------------------------%
%- define chinese keywords
\newcommand{\clttitle}[1]{%
               \begin{center}\zihao{3}\textbf{\sffamily #1}\end{center}}
\newcommand{\cltinfo}[1]{%
               \begin{center}\zihao{5}\textbf{\sffamily #1}\end{center}}  
\newcommand{\cltheading}[1]{%
               \def\tarticle@value@headings {#1}}  
\RequirePackage{pgffor}              
\newcommand{\smallblank}[1]{%
               \foreach \n in {1,...,#1}{\hspace{0.33em}}}
\newcommand{\bigblank}[1]{%
               \hspace{#1em}}
\newcommand{\nextline}[1]{%
               \foreach \n in {1,...,#1}{\newline}}
\newcommand{\nextlineindent}[1]{%
               \foreach \n in {1,...,#1}{\newline \indent}}  
\newcommand{\blankline}[1]{%
               \foreach \n in {1,...,#1}{\mbox{}}}            
\newcommand{\blankpage}[1]{%
               \foreach \n in {1,...,#1}{\vfill \clearpage \mbox{} \clearpage}}
\newcommand{\nextpage}{%
               \vfill \clearpage}
\newcommand{\nofake}{
	\setCJKmainfont[BoldFont=SimHei,ItalicFont=KaiTi]{SimSun}%
    \setCJKsansfont{SimHei}%
    \setCJKmonofont{KaiTi}%
    \xeCJKsetup{CJKmath=true}
    \setCJKmathfont{KaiTi}  % 数学环境中使用楷体
    \setmainfont{Times New Roman}
}
% famousquote
\newenvironment{famousquote}[2]
    {\newcommand\Qauthor{#1}\newcommand\Qref{#2}}
    {\medskip\begin{flushright}\small ——~\Qauthor\\
    \emph{\Qref}\end{flushright}}