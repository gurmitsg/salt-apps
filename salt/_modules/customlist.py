
def users_as_csv():
    '''
    Retrieve the users from a minion, in CSV format.

    CLI Example:

    .. code-block:: bash
        salt '*' customlist.users_as_cv
    '''
    user_list = __salt__['user.list_users']()
    csv_list = ','.join(user_list)
    return csv_list
