staging:
  '*':
    - webserver
    - myfiles
    - dbusers
  'os_family:debian':
    - match: grain
    - frontend
  'os_family:redhat':
    - match: grain
    - backend
