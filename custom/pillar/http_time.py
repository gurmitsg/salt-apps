import json

def ext_pillar(minion_id,pillar,config):
    '''
    Return Pillar data
    '''
    comps = config.split()
    key = comps[0]
    url = comps[1]
    status = __salt__['http.query'](url, decode=True)
    mytime = json.loads(status['text'])
    return {key: mytime['seconds']}
