Load_Pager_Alert:
  cmd.pagerduty.create_event:
    - tgt: {{ data['id'] }}
    - kwarg:
        description: "CPU Load avg breached threshold on {{ data['id'] }}"
        details: "Load averages = 15m {{ data['15m'] }} 1m {{ data['1m'] }}"
        service_key: <service_integration_key>
        profile: my-pagerduty-account
