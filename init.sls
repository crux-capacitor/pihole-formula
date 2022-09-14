
{% import_yaml slspath~'/config.yaml' as pihole %}

include:
  - formula.pihole.service
  - formula.pihole.cron.gravity-update
  - formula.pihole.cron.nightly-blacklist
{% if pihole.cloudflared.enabled %}
  - formula.pihole.cloudflared
{% endif %}


