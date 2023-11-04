#!/usr/bin/env python

import os

requirements = []
all_deps = []

for root, dirs, files in os.walk('mount/ComfyUI/custom_nodes'):
  for file in files:
    if file == 'requirements.txt':
      requirements.append(os.path.join(root, file))

all_deps = []
for r in requirements:
  with open(r) as f:

    deps = f.read().splitlines()
    if len(deps) > 0:
      deps = [d for d in deps if not d.startswith('#')]
      all_deps.extend(deps)

# sort > unique
all_deps = list(set(all_deps))
all_deps.sort()

# write as requirements.txt
with open('docker/comfy-custom_nodes-requirements.txt', 'w') as f:
  for d in all_deps:
    f.write(d + '\n')