# Using a Load Balancer for a Stable Domain

Problem: Public IP address changes every time we update the container.

We made a load balancer to fix this.  
The load balancer is stopping/starting services if they are unhealthy.  
On Target Groups, under Health > Edit, the load balancer is sending a request to `/`. This is a typo
and thus we get a `404` and therefore the load balancer kills the container and starts a new one.  
The other thing that was wrong was the security group.  
