__virtualname__ = 'mybeacon'

def __virtual__():
    return True


def beacon(config):
    users = __salt__['user.list_users']()
    user_count = len(users)
    ret = []
    if user_count > config['count']:
        ret.append({ 'count': 'user count above limit.'})

    return ret
