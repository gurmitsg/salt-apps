create_marker_file:
  local.cmd.run:
    - tgt: '*'
    - arg:
      - 'touch /tmp/webserver_failed.txt'


#run_a_highstate:
#  local.state.highstate:
#    - tgt: {{ data['id'] }}
#    - kwarg:
#        pillar:
#          event_tag: {{ data['tag'] }}
