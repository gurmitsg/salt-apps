base:
  'node_type:web':
    - match: grain
    - webserver
  'node_type:database':
    - match: grain
    - dbusers
  'node_type:load-balancer':
    - match: grain
    - myfiles
