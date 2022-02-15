# Things to consider

When running Proxmox it is important that all managers are run inside a vm and the workers can be configured to run 
in lxc containers for performance uplift. 

This is due to the fact that **Portainer** doesn't start its webgui on non vm instances.  