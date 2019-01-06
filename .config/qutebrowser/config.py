# We still want to be able to source changes made locally
config.load_autoconfig()

# Mpv Bindings
config.bind('<Ctrl-m>', 'spawn mpv {url}')
config.bind(';m', 'hint links spawn nohup mpv {hint-url}')

c.editor.command = ['urxvt', '-e', 'vim', '{}']
# c.spellcheck.languages = ['en-US', 'fr-FR']

c.content.geolocation = False

c.url.searchengines = {
    "DEFAULT":"https://duckduckgo.com/?q={}",
    "ddg":"https://duckduckgo.com/?q={}",
    "g": "https://www.google.com/search?hl=en&q={}",
    "s": "https://www.startpage.com/do/search?q={}",
    "sp": "https://www.startpage.com/do/search?q={}",
    "w": "https://en.wikipedia.org/wiki/Special:Search/{}",
    "yt": "https://www.youtube.com/results?search_query={}",
    "aw": "https://wiki.archlinux.org/?search={}",
    "gw": "https://wiki.gentoo.org/?search={}",
    "4": "https://boards.4chan.org/{}",
    "4g": "https://boards.4chan.org/g/catalog#s={}",
    "r": "https://reddit.com/r/{}",
    "rs": "https://reddit.com/search?q={}",
    "hn": "https://hn.algolia.com/?query={}",
    "sf": "https://stackoverflow.com/search?q={}",
    "se": "https://{}.stackexchange.com",
    "gh": "https://github.com/search?q={}",
    "42": "https://profile.intra.42.fr/searches/search?query={}",
    "42g": "https://projects.intra.42.fr/projects/graph?login={}"
}

c.tabs.show = "multiple"
c.tabs.background = True
c.hints.mode = "number"

# Pywal integration (https://github.com/jjzmajic/qutewal)
from sys import platform
if platform not in ["darwin", "win32", "win64"]:
    config.source('qutewal.py')
