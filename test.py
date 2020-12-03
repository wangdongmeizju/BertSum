import torch
def _pad(data, pad_id, width=-1):
        if (width == -1):
            width = max(len(d) for d in data)
        rtn_data = [d + [pad_id] * (width - len(d)) for d in data]
        return rtn_data

if __name__ == "__main__":
    tokens=[[101, 1006, 13229, 1007, 2323, 2610, 3738, 4929, 8629, 2000, 6254, 2037, 3450, 2096, 2006, 4611, 1029, 102, 101, 1996, 9366, 2038, 2042, 2105, 2005, 1037, 2096, 1012, 102],[101,102,101,102,101,102]]
    labels=[[1, 0],[0,0,1]]
    segs=[[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],[0,0,1,1,0,0]]
    clss=[[0, 18],[0,2,4]]
    src=torch.tensor(_pad(tokens,0))
    mask=~(src == 0)
    print(mask)
