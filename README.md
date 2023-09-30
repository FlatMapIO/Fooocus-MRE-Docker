## Commands

- Prepare

```
scripts/prepare.fish
```

- Run once(debug)
```
docker compose run --service-ports fooocus-mre
open http://localhost:7860


docker compose run --service-ports comfy-ui
```

- Run as service

```
docker compose up comfy-ui -d
docker compose up fooocus-mre -d
```

# Links
- Management & Build models folder using typescript: https://github.com/FlatMapIO/stable-diffusion-models
- Fooocus-MRE: https://github.com/MoonRide303/Fooocus-MRE
- Fooocus: https://github.com/lllyasviel/Fooocus
- ComfyUI: https://github.com/comfyanonymous/ComfyUI/