import torch

info = {
    "is_cuda_available": torch.cuda.is_available(),
}

if __name__ == "__main__":
    print(info)
