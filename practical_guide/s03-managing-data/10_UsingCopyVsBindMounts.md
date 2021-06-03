# Using COPY vs Bind Mounts

Why do we copy in the Dockerfile when we use a Bind Mount?  
In Production, we always have a snapshot of our code. I still want to be able
to create snapshot images which we can then use to create production containers.
But you don't need it in development.
