# https://docs.python.org/3/library/readline.html?highlight=readline#example

import atexit
import os
import readline


XDG_DATA_HOME = os.path.expandvars(
    os.path.expanduser(os.environ.get("XDG_DATA_HOME", "~/.local/share"))
)
histfile = os.path.join(XDG_DATA_HOME, "python_history")


try:
    readline.read_history_file(histfile)
    # default history len is -1 (infinite), which may grow unruly
    readline.set_history_length(-1)
except FileNotFoundError:
    pass

atexit.register(readline.write_history_file, histfile)
