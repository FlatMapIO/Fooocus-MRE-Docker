import os
os.environ["PYTORCH_ENABLE_MPS_FALLBACK"] = "1"

import sys
import argparse
import fooocus_version
from modules.launch_util import script_path, dir_repos


print(f"Python {sys.version}")
print(f"Fooocus version: {fooocus_version.version}")

sys.path.append(os.path.join(script_path, dir_repos,  'ComfyUI-from-StabilityAI-Official'))

def ini_comfy_args():
    from args_manager import args
    return args

ini_comfy_args()

from webui import *
