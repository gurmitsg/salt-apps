ensure_ngnix_is_running:
  service.running:
    - name: nginx
    - require:
        - pkg: install_nginx


install_nginx:
  pkg.installed:
    - name: nginx
