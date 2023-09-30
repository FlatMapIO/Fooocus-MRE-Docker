import os
os.environ["PYTORCH_ENABLE_MPS_FALLBACK"] = "1"

import sys
import argparse

DEFAULT_ARGS = ['--disable-smart-memory', '--disable-cuda-malloc']

comfyui_name = 'ComfyUI-from-StabilityAI-Official'

from modules.launch_util import script_path, dir_repos
sys.path.append(os.path.join(script_path, dir_repos, comfyui_name))

def parse_args():
    argv = sys.argv + DEFAULT_ARGS
    sys.argv = [sys.argv[0]]
    import comfy.cli_args
    sys.argv = argv

    parser = argparse.ArgumentParser('launch.py', parents=[comfy.cli_args.parser], conflict_handler='resolve')
    parser.add_argument("--port", type=int, default=None, help="Set the listen port.")
    parser.add_argument("--share", action='store_true', help="Set whether to share on Gradio.")
    parser.add_argument("--listen", type=str, default='0.0.0.0', metavar="IP", nargs="?", const="0.0.0.0", help="Set the listen interface.")

    comfy.cli_args.args = parser.parse_args()




parse_args()


from webui import *
