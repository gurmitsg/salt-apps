create_map_instances:
  salt.runner:
    - name: cloud.map_run
    - path: /etc/salt/cloudmaps/dev_environment.map
    - kwarg:
        parallel: True

webserver_deploy:
  salt.state:
    - tgt: 'node_type:web'
    - tgt_type: grain
    - sls:
      - webserver


database_deploy:
  salt.state:
    - tgt: 'node_type:database'
    - tgt_type: grain
    - sls:
      - jenkins

load_balancer_deploy:
  salt.state:
    - tgt: 'node_type:load-balancer'
    - tgt_type: grain
    - sls:
      - myfiles
