def _pad(self, data, pad_id, width=-1):
        if (width == -1):
            width = max(len(d) for d in data)
        rtn_data = [d + [pad_id] * (width - len(d)) for d in data]
        return rtn_data

if __name__ == "__main__":
    src=[[1,2,4],[1,1,1,1,1],[2]]
    label=[1,2]