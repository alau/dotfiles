# Source: https://github.com/knubie/vim-kitty-navigator/blob/2aafc20a0a4eb3efa757db51868a2ab181e88690/get_layout.py
def main():
    pass


def handle_result(args, result, target_window_id, boss):
    return boss.active_tab.current_layout.name


handle_result.no_ui = True
