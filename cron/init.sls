"Manage Group Management Script":
  file.managed:
    - name: /usr/local/bin/pihole_group_mgmt.sh
    - source: salt://formula/pihole/files/group_mgmt.sh
    - user: root
    - group: root
    - mode: 755

"Manage Cron Files":
  cron.file:
    - identifier: pihole_cron
    - user: root
    - name: salt://{{ slspath }}/files/pihole_crons

