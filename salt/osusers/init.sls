{% for user in pillar['users'] %}
add_newuser_{{ user }}:
  user.present:
    - name: {{ user }}
{% endfor %}
