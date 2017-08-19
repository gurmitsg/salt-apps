Btmp_Pager_Alert:
  cmd.pagerduty.create_event:
    - tgt: {{ data['id'] }}
    - kwarg:
        description: "Unauthorized access on {{ data['id'] }}"
        details: "Unauthorized access from host {{ data['hostname'] }} at {{ data['_stamp'] }}"
        service_key: <service_integration_key>
        profile: my-pagerduty-account
