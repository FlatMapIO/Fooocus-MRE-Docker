import os
os.environ["PYTORCH_ENABLE_MPS_FALLBACK"] = "1"

import sys
import fooocus_version
import argparse

from modules.launch_util import repo_dir, git_clone, script_path, dir_repos

REINSTALL_ALL = False
DEFAULT_ARGS = ['--disable-smart-memory', '--disable-cuda-malloc']

def prepare_environment():
    print(f"Python {sys.version}")
    print(f"Fooocus version: {fooocus_version.version}")

    comfyui_name = 'ComfyUI-from-StabilityAI-Official'
    git_clone(comfy_repo, repo_dir(comfyui_name), "Inference Engine", comfy_commit_hash)
    sys.path.append(os.path.join(script_path, dir_repos, comfyui_name))



def parse_args():
    argv = sys.argv + DEFAULT_ARGS
    sys.argv = [sys.argv[0]]
    import comfy.cli_args
    sys.argv = argv

    parser = argparse.ArgumentParser('launch.py', parents=[comfy.cli_args.parser], conflict_handler='resolve')
    parser.add_argument("--port", type=int, default=None, help="Set the listen port.")
    parser.add_argument("--share", action='store_true', help="Set whether to share on Gradio.")
    parser.add_argument("--listen", type=str, default=None, metavar="IP", nargs="?", const="0.0.0.0", help="Set the listen interface.")

    comfy.cli_args.args = parser.parse_args()


def cuda_malloc():
    import cuda_malloc

prepare_environment()

parse_args()

from webui import *
