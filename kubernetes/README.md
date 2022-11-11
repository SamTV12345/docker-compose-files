# Pihole in Kubernetes

Enables a pihole cluster in Kubernetes. 

## Getting started
```
kubectl apply -f pihole-deploy.yml
```

That`s it. Everything should roll out. In the beginning there is a small wait period because kubernetes only marks 
our container as started when the startupProbe succeeds.


## Advanced explanation

The cluster should start and stay the same once you have configured everything. Because it is a persisted volume 
shared across all pods you only need to modify one Pihole instance. The performance gets really worse when logging 
is enabled because everything is written to this specific volume (even on an SSD). Because I'm not interested in the 
non-anonymous logs I simply deactivated it and could achieve really fast speeds.

To enter the admin interface modify the pihole entries and add **pi.hole** to your custom entries. Pi.hole needs to 
point to the LoadBalancer's IP retrieved by 
``
kubectl get all
`` in the service section.