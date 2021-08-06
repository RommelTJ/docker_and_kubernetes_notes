# Bind Mounts in Production

Running a Container in Development
- Containers should encapsulate the runtime environment but not necessarily the code.
- Use "Bind Mounts" to provide your local host project files to the running container.

Running a Container in Production
- A container should really work standalone, you should NOT have source code on your remote machine.
- Image / Container is the single source of truth.
- Use COPY to copy a code snapshot into the image. 
- Ensures that every image runs without any extra surrounding configuration or code.
