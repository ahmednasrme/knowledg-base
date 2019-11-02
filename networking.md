# Networking Commands

## Utilities
* Use `ifconfig` to list network cofiguration.
* `ip addr` or `ip link` can be used instead.

## Routing
Use `ip route` to list routing configuration, or `route` if available, for better formatting.

### Add Default Gateway
If you have multiple connections (for example: wireless and wired connections on same computer) and you want to force requests to go through one of them..
```
sudo route add default gw [IP] [Interface]
```

### Delete Default Gateway
```
sudo route delete default gw [name]
```

### Add Route
If you have multiple connections (for example: wireless and wired connections ton same computer) and you want to force requests to a specific destination to go through one of them..
```
sudo ip route add [DestinationServer] via [IP]
```