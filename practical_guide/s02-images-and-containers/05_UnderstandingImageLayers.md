# Understanding Image Layers

When you re-build an image, only the instructions that changed are re-built. 

Layer-based architecture:  
* Every instruction creates a layer
* Instructions are cached
  
If you run a container based on an image, then
* that container runs a new layer on top of the image (the result of executing the command)

If layers change, all subsequent layers have to re-run.

For example, you can optimize the building of an image by moving the npm install command 
before copying the app so that it doesn't need to re-run if you change anything in the code.
