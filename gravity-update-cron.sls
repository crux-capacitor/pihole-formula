"Add Gravity Update Cron Job":
  cron.present:
    - name: pihole -g
    - special: '@daily'

