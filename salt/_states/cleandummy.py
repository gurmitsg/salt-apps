import salt.exceptions
import os

def __virtual__():
    '''
    Check for disk.usage
    '''
    if 'disk.usage' in __salt__:
        return True
    return False


def empty_logs (name):
    '''
    Ensure dummy log files are cleared, if more than 70% disk space is used upself.

    This module, will first check if disk usage is > 70%
    If it is then it will deletefiles from the target dir.

    name
        The target dir from which files have to be deleted.
    '''

    ret = {
        'name': name,
        'changes': {},
        'result': False,
        'comment': '',
        'pchanges': {},
        }

    if not os.path.isdir(name):
        raise salt.exceptions.SaltInvocationError('Directory does not exist')

    used = _getcurrent()

    if used > 70:
        __salt__['cmd.run']('rm '+name+'/*', python_shell=True)
        newused = _getcurrent()
        ret['result'] = True
        ret['comment'] = 'System disk space cleared.'
        ret['changes'] = {"Current Disk Usage": str(newused)+'%'}
    else:
        ret['result'] = True
        ret['comment'] = 'System in stable state. '+str(used)+'% disk used.'

    return ret

def _getcurrent():
    disk_usage = __salt__['disk.usage']()
    used_percent = disk_usage['/']['capacity']
    used = int(used_percent.replace("%",""))
    return used
