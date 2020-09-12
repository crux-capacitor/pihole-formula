"Install cloudflared":
  archive.extracted:
    - name: /root/cloudflared
    - source: https://bin.equinox.io/c/VdrWdbjqyF/cloudflared-stable-linux-arm.tgz
    - source_hash: bed4f0dd9aa4e7e2188c103619955b5d
    - if_missing: /usr/local/bin/cloudflared
    - enforce_toplevel: False
    - keep_source: False
  file.copy:
    - name: /usr/local/bin/cloudflared
    - source: /root/cloudflared/cloudflared
    - mode: 755
    - require:
      - archive: /root/cloudflared
    - unless: which cloudflared

"Install cloudflared Service":
  file.managed:
    - name: /etc/cloudflared/config.yml
    - source: salt://{{ slspath }}/files/cloudflared_config.yml
    - makedirs: True
    - require:
      - "Install cloudflared"
  cmd.run:
    - name: cloudflared service install 
    - unless: service cloudflared status
    - require:
      - file: /etc/cloudflared/config.yml
  service.running:
    - name: cloudflared
    - enable: True
    - require:
      - cmd: cloudflared service install

"Cron Update cloudflared":
  cron.present:
    - name: /usr/local/bin/cloudflared update; code=$?; if [ $code -eq 64 ]; then systemctl restart cloudflared; exit 0; fi; exit $code
    - user: root
    - minute: 0
    - hour: 7
    - dayweek: 1
    - require:
      - "Install cloudflared Service"
