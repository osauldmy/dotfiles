# "Prelude" for things I use often and need to import myself
from itertools import *
from functools import reduce
from pathlib import Path
from pprint import pprint

pp = pprint

try:
    import toolz
except ImportError:
    pass

try:
    import more_itertools
except ImportError:
    pass
