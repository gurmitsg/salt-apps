base:
  '*':
    - common
  'os_family:debian':
    - match: grain
    - aptusers
  'os_family:redhat':
    - match: grain
    - yumusers    
