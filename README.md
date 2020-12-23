# rofi-websearch
Rofi script for web search, allows you to quickly choose which search engine and browser to use

## Supported browsers/search engines
Supported browsers are
* chromium (c)
* vivaldi-stable (v)
launching in a new window is done by using the respective uppercase letter.

Supported search engines are
* Google (g)
* YouTube (y)
* DuckDuckGo (d)
* [Genius](genius.com) (G)

## Usage
You can run this script with the command `rofi -show websearch -modi "websearch:/path/to/rofi-websearch.sh"`
The syntax is:
```
[browser][search engine] [keywords]
[browser] [url]
```
### Examples
`cy kittens` looks for kittens videos on Youtube using Chromium
`C github.com` opens GitHub in a new Chromium window
