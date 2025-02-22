

Sample composefile:

```yaml
services:
  homeassistant:
    build:
      context: ./custom-homeassistant/
      dockerfile: Dockerfile
    container_name: "home-assistant"
    restart: always
    volumes:
      - /opt/docker/homeassistant:/config
      - /etc/localtime:/etc/localtime:ro
      - hass-brands:/config/www/brands
    network_mode: "host"
    depends_on:
      - mariadb_hass

  hass-brands-generator:
    build:
      context: ./hass-brands-generator/
      dockerfile: Dockerfile
    container_name: "hass-brands-generator"
    restart: no
    volumes:
      - hass-brands-workspace:/workspace
      - hass-brands:/output

volumes:
  hass-brands-workspace:
  hass-brands:

```