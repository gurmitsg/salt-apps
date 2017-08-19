__virtualname__ = 'custompkg'

def __virtual__():
    '''
    Confirm this module is on a Debian based system
    '''
    if __grains__['os_family'] != 'Debian':
        return False
    return __virtualname__


def search(package):
    '''
    Searches the OS relevant repository for list of packages.
    Writes the output to /tmp/<package>.txt file.

    CLI Example:

    .. code-block:: bash
        salt '*' custompkg.search apache
    '''
    out = __salt__['cmd.run']('apt-cache search ' + package + ' > /tmp/' + package + '.txt', python_shell=True)
    return True
