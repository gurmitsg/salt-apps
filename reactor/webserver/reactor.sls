create_marker_file:
  local.cmd.run:
    - tgt: '*'
    - arg:
      - 'touch /tmp/webserver_failed.txt'
