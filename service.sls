{% import_yaml slspath~'/config.yaml' as pihole %}

"Manage Pihole Service":
  service.running:
    - name: pihole-FTL
    - enable: True

{% if pihole.config.webserver.enabled %}

"Manage Lighttpd Service":
  service.running:
    - name: lighttpd
    - enable: True

{% endif %}
