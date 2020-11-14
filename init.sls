
{% import_yaml slspath~'/config.yaml' as pihole %}

include:
  - formula.pihole.service
  - formula.pihole.gravity-update-cron
{% if pihole.cloudflared.enabled %}
  - formula.pihole.cloudflared
{% endif %}
