import os
import torch
from others.logging import logger, init_logger
if __name__  == "__main__":
    init_logger("../logs/cnndm.log")
    print("wangdongmei")
    print(torch.cuda.is_available())
    print(torch.cuda.device_count())
    os.environ["CUDA_VISIBLE_DEVICES"] = "0,1,2,3,4,5,6,7"
    print(torch.cuda.is_available())
    print(torch.cuda.device_count())

    logger.info("cuda available %s" % torch.cuda.is_available())
    logger.info('sssssssssssssss %d' % torch.cuda.device_count())