# Unbound DNS Resolver - Sidecar Container

A containerized Unbound DNS resolver configured as a sidecar for Pi-hole deployments.

## Overview

This Docker image provides Unbound as a recursive DNS resolver that runs alongside Pi-hole in the same pod. Unbound handles DNS resolution by querying authoritative DNS servers directly, eliminating the need for upstream DNS providers and improving privacy.

## Configuration

- **Port**: 5353 (localhost only)
- **Interface**: 127.0.0.1 (sidecar access only)
- **Access Control**: Localhost only
- **DNSSEC**: Enabled with validation
- **Cache**: Optimized for container environment

## Usage with Pi-hole

Configure Pi-hole to use this Unbound container as its upstream DNS server:

```
Upstream DNS: 127.0.0.1#5353
```

## Build

```bash
docker build --build-arg UID=1001 --build-arg GID=1001 .
```

## Deployment

This container is designed to run as a sidecar alongside Pi-hole:

```yaml
containers:
- name: pihole
  # Pi-hole container config
- name: unbound
  # This Unbound container
```

Both containers share the same network namespace, allowing Pi-hole to access Unbound on localhost.

