# Understanding the Problem

After the container is deleted, the feedback in the temporary files are gone.  
If a container is just stopped, the temporary file is still there since it's 
added to the container.

The problem is that the filesystem is inside the container. Starting/Stopping
is ok, but if we remove a container all the data is cleared and deleted. 
A new container, even from the same image, the data is lost. The image is 
read-only. 

Multiple containers based on the same image are isolated from each other.

So how do we keep the feedbacks even after a container is deleted? Volumes.  
