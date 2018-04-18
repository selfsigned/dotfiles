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
    "gh": "https://github.com/search?q={}",
    "42": "https://profile.intra.42.fr/searches/search?query={}",
    "42g": "https://projects.intra.42.fr/projects/graph?login={}"
}

c.tabs.show = "multiple"
c.tabs.background = True
c.hints.mode = "number"

# Xrdb integration
from sys import platform
import subprocess

def read_xresources(prefix):
    props = {}
    x = subprocess.run(['xrdb', '-query'], stdout=subprocess.PIPE)
    lines = x.stdout.decode().split('\n')
    for line in filter(lambda l : l.startswith(prefix), lines):
        prop, _, value = line.partition(':\t')
        props[prop] = value
    return props

if platform not in ["darwin", "win32", "win64"]:
    xresources = read_xresources('*')
    c.colors.statusbar.normal.bg = xresources['*.background']
    c.colors.statusbar.normal.fg = xresources['*.foreground']
    c.colors.statusbar.normal.bg = xresources['*.background']
    c.colors.statusbar.normal.fg = xresources['*.foreground']
