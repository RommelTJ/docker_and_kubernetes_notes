# Module Summary

Containers can read + write data. Volumes can help with data storage, Bind Mounts
can help direct container interaction.

Containers can read + write data, but written data is lost if the container is 
removed.

Volumes are folders on the host machine, managed by Docker, which are mounted into the
Container.

Named Volumes survive container removal and can therefore be used to store 
persistent data.

Anonymous Volumes are attached to a container - they can be used to save 
(temporary) data inside the container.

Bind Mounts are folders on the host machine which are specified by the user and 
mounted into containers - like Named Volumes.

Build ARGuments and Runtime ENVironment variables can be used to make images
and containers more dynamic / configurable.
