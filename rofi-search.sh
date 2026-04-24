query=$(rofi -dmenu -p "Search the web:")
[ -z "$query" ] && exit 0
escaped=$(python3 -c "import urllib.parse, sys; print(urllib.parse.quote(sys.argv[1]))" "$query")
url="https://duckduckgo.com/?q=${escaped}"
if pgrep -x firefox >/dev/null; then
  firefox --new-tab "$url" >/dev/null 2>&1 &
else
  firefox "$url" >/dev/null 2>&1 &
fi
exit 0
