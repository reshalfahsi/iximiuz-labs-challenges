# **Edit a File in a Running Container: a Simple Case**

There is a web server container running. You need to edit its ``index.html`` file without restarting the container:

Replace the phrase "Hello World" with the phrase "Hello Labs".
Add the phrase "Practice for the win!" to any place in the file.
The file is located in the ``/var/www/html`` directory.

## **Hint**

### **Hint #1:**

Do you really need a hint? It's an easy one 😉 There is a whole bunch of ways to edit a file in a running container. Can you think of a few?

### **Hint #2:**

Since the editing requirements are relatively simple in this particular case, you can use ``docker exec sed`` and the like to edit the file right in the container.

<p align="center"> 
    <img src="https://labs.iximiuz.com/content/files/challenges/edit-file-in-running-container/__static__/docker-exec.png" width="400" alt="docker-exec" > 
</p>

### **Hint #3:**

Not the most secure way, but you can start an interactive shell in the container using docker ``exec -it sh`` and install the editor of your choice (e.g. ``vim`` or ``nano``) to the running container.

### **Hint #4:**

The most boring way it to copy the file to your host machine, edit it there using your favorite IDE, and then copy it back. You can use ``docker cp`` to copy files from and to the container.

## **Source**

[Edit a File in a Running Container: a Simple Case](https://labs.iximiuz.com/challenges/edit-file-in-running-container)

## **[Back to Home](../../)**