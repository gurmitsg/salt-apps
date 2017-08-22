{% for user in pillar['dbusers'] %}
add_newuser_{{ user }}:
  user.present:
    - name: {{ user }}
{% endfor %}
