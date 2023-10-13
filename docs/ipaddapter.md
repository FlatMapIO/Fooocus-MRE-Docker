# [Does ipadapter keep realistic models realistic?](https://www.reddit.com/r/comfyui/comments/172qq14/comment/k400c1g/?context=3)

zoupishness7:
IP-Adapter helps with subject and composition, but it reduces the detail of the image.

You can use the adapter for just the early steps, by using two KSampler Advanced nodes, passing the latent from one to the other, using the model without the IP-Adapter in the second one. Don't forget to disable adding noise in the second node.

If you don't do that, once you have an image with composition you like, you can regenerate it several ways. You can do use Tile Resample/Kohya-Blur to regenerate a 1.5/SDXL image without IP-Adapter. Just end it early, reduce the weight or increase the blurring to increase the amount of detail it can add.

You can also use the Unsampler node, that comes with ComfyUI_Noise, and a KSampler Advanced node, to rewind the image some number of steps and regenerated it without the adapter.

https://preview.redd.it/8oors8ffz0tb1.jpeg?width=3172&format=pjpg&auto=webp&s=d999cc35319a014d88632b72e0bd1c8dd266caab