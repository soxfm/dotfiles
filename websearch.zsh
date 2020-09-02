# web_search from terminal

function web_search() {
  emulate -L zsh

  # define search engine URLS
  typeset -A urls
  urls=(
    google      "https://www.google.com/search?q="
    yahoo       "https://search.yahoo.com/search?p="
    metager     "https://metager.org/search?q=%s"
    searx       "https://searx.be/search?q=%s"
    duckduckgo  "https://www.duckduckgo.com/?q="
    startpage   "https://www.startpage.com/do/search?q="
    so          "https://stackoverflow.com/search?q=%s"
    github      "https://github.com/search?q="
    ecosia      "https://www.ecosia.org/search?q="
    goodreads   "https://www.goodreads.com/search?q="
    swisscows   "https://swisscows.com/search?q=%s"
  )

  # check whether the search engine is supported
  if [[ -z "$urls[$1]" ]]; then
    echo "Search engine $1 not supported."
    return 1
  fi

  # search or go to main page depending on number of arguments passed
  if [[ $# -gt 1 ]]; then
    # build search url:
    # join arguments passed with '+', then append to search engine URL
    url="${urls[$1]}${(j:+:)@[2,-1]}"
  else
    # build main page url:
    # split by '/', then rejoin protocol (1) and domain (2) parts with '//'
    url="${(j://:)${(s:/:)urls[$1]}[1,2]}"
  fi

  open_command "$url"
}


alias google='web_search google'
alias ddg='web_search duckduckgo'
alias sp='web_search startpage'
alias github='web_search github'
alias ecosia='web_search ecosia'
alias goodreads='web_search goodreads'
alias so='web_search so'
alias swiss='web_search swisscows'
alias searx='web_search searx'
alias metager='web_search metager'

#add your own !bang searches here
alias wiki='web_search duckduckgo \!w'
alias news='web_search duckduckgo \!n'
alias youtube='web_search duckduckgo \!yt'
alias map='web_search duckduckgo \!m'
alias image='web_search duckduckgo \!i'
alias ducky='web_search duckduckgo \!'
