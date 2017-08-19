ensure_apache_is_running:
  service.running:
    {% if grains['os_family'] == 'Debian' %}
    - name: apache2
    {% elif grains['os_family'] == 'RedHat' %}
    - name: httpd
    {% endif %}
    - enable: True
    - require:
        - pkg: install_apache
    - watch:
      - file: sync_modstatus_conf
      {% if grains['os_family'] == 'Debian' %}
      - file: sync_modstatus_load
      {% endif %}

install_apache:
  pkg.installed:
    {% if grains['os_family'] == 'Debian' %}
    - name: apache2
    {% elif grains['os_family'] == 'RedHat' %}
    - name: httpd
    {% endif %}


sync_modstatus_conf:
  file.managed:
    {% if grains['os_family'] == 'Debian' %}
    - name: /etc/apache2/mods-enabled/mod_status.conf
    {% elif grains['os_family'] == 'RedHat' %}
    - name: /etc/httpd/conf.d/mod_status.conf
    {% endif %}
    - source: salt://apache/files/mod_status.conf
    - user: root
    - group: root
    - mode: 600

{% if grains['os_family'] == 'Debian' %}
sync_modstatus_load:
  file.managed:
    - name: /etc/apache2/mods-enabled/mod_status.load
    - source: salt://apache/files/mod_status.load
    - user: root
    - group: root
    - mode: 600
{% endif %}
