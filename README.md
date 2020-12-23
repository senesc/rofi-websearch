# rofi-websearch
Rofi script for web search, allows you to quickly choose which search engine and browser to use

## Supported browsers/search engines
Supported browsers are
* chromium (c)
* firefox (f)
* vivaldi-stable (v)<br/>
launching in a new window can be done by using the respective uppercase letter.

Supported search engines are
* Google (g)
* YouTube (y)
* DuckDuckGo (d)
* GitHub (gh)
* [Genius](genius.com) (gn)

## Usage
You can run this script with the command `rofi -show websearch -modi "websearch:/path/to/rofi-websearch.sh"`<br/>
The syntax is:
```
[browser][search engine] [keywords]
[browser] [url]
```

### Examples
`cgh rofi` looks for rofi on GitHub using Chromium<br/>
`C github.com` opens GitHub in a new Chromium window<br/>
