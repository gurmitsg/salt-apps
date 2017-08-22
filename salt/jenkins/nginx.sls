install_nginx:
  pkg.installed:
    - name: nginx
    - skip_verify: True

ensure_nginx_running:
  service.running:
    - name: nginx
    - enable: True

modify_nginx_conf:
  file.managed:
    - name: /etc/nginx/sites-available/default
    - source: salt://jenkins/files/default
    - require:
      - pkg: nginx
    - watch_in:
      - service: nginx
