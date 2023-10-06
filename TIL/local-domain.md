# .local Domain Name

My router implements **mDNS** out of the box, which makes it possible to resolve any hostname on the local network with the [.local](https://en.wikipedia.org/wiki/.local) suffix.  
It conveniently allow me to access my printer at `printer.local` and my nas at `nas.local` without having to remember their IP addresses, as long as I'm connecter to my router.  
My DHCP server could update their address without the need fo me to update any configuration, and when I move and change my ISP, it should also work out of the box.
