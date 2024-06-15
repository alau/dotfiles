import pdb
import pygments.formatters

class Config(pdb.DefaultConfig):
    sticky_by_default = True
    current_line_color = 50
    formatter = pygments.formatters.TerminalTrueColorFormatter(
        style='dracula',
    )
    use_pygments = True
