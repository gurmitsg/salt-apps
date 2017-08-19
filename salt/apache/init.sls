ensure_apache_is_running:
  service.running:
    - name: apache2
    - enable: True
    - require:
        - pkg: install_apache
    - watch:
      - file: /etc/apache2/mods-enabled/mod_status.conf
      - file: /etc/apache2/mods-enabled/mod_status.load

install_apache:
  pkg.installed:
    - name: apache2


sync_modstatus_conf:
  file.managed:
    - name: /etc/apache2/mods-enabled/mod_status.conf
    - source: salt://apache/files/mod_status.conf
    - user: root
    - group: root
    - mode: 600

sync_modstatus.load:
  file.managed:
    - name: /etc/apache2/mods-enabled/mod_status.load
    - source: salt://apache/files/mod_status.load
    - user: root
    - group: root
    - mode: 600
