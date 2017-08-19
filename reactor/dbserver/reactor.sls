Pager_Alert:
  cmd.pagerduty.create_event:
    - tgt: {{ data['id'] }}
    - kwarg:
        description: "DB server failure on {{ data['id'] }}"
        details: "DB server not responding"
        service_key: <service_integration_key>
        profile: my-pagerduty-account
