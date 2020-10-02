## Bind9 alpine

__Build__

```bash
docker build --tag bind9:latest .
```

__Run__
```bash
docker run --network host --restart unless-stopped --name bind9 bind9:latest
```

__Info__
This config was generated from info found in 'DNS for Rocket Scientists':
https://www.zytrax.com/books/dns/
They have also written a book, 'Pro DNS and BIND' by Ronald (Ron) Aitchison.