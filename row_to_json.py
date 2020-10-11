def row2json(rows):
    result = []
    for row in rows:
        row2dict = {}
        for key, value in zip(rows.keys(), row):
            row2dict[key] = value
        result.append(row2dict)
    return result
