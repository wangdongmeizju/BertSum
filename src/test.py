import os
import torch
from others.logging import logger, init_logger
if "__name__"  == "__main__":
    print(torch.cuda.is_available())
    print(torch.cuda.device_count())
    os.environ["CUDA_VISIBLE_DEVICES"] = "0,1,2,3,4,5,6,7"
    print(torch.cuda.is_available())
    print(torch.cuda.device_count())