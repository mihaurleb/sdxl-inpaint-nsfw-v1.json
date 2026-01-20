# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.5.1-base

# install custom nodes into comfyui (first node with --mode remote to fetch updated cache)
RUN comfy node install --exit-on-fail comfyui-inpaint-cropandstitch@3.0.2 --mode remote
# The following custom nodes are from an unknown registry and have no aux_id (could not be resolved):
# Note
# Label (rgthree)
# Label (rgthree)
# Label (rgthree)
# Note
# Note
# Note

# download models into comfyui
RUN comfy model download --url https://huggingface.co/dci05049/sdxl/resolve/main/lustify-inpainting-olt.safetensors --relative-path models/checkpoints --filename lustify-inpainting-olt.safetensors
# (Duplicate/related model entry referencing the same file in the workflow; no second download added)

# copy all input data (like images or videos) into comfyui (uncomment and adjust if needed)
# COPY input/ /comfyui/input/
