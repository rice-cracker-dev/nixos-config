import sys
import json

def toJSON(conf):
    jsonO = {};
    currentGroup = None
    
    for line in conf.split('\n'):
        if len(line.strip()) == 0:
            continue

        if line[0] == '[' and line[-1] == ']':
            group = line[1:-1]
            jsonO[group] = {}
            currentGroup = group
            continue

        key, value = line.split('=')
        
        if currentGroup:
            jsonO[currentGroup][key] = { "value": value }

    return json.dumps(jsonO)
            

if __name__ == '__main__':
    with open(sys.argv[1], "r") as f:
        print(toJSON(f.read()));


