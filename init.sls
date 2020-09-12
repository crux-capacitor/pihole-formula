
{% import_yaml slspath~'/config.yaml' as pihole %}

include:
  - formula.pihole.service
{% if pihole.cloudflared.enabled %}
  - formula.pihole.cloudflared
{% endif %}
