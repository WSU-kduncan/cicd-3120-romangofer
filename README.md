# Project 5 Documentation

## Part 1 - Dockerize It

- Project Overview:
    - This project is going to be a website-hosting server that will host webpage content using the Apache webserver service. The server/method of hosting this content will be a Docker container. This way, this project can be wrapped up in a compact container that can easily be downloaded/installed on different systems and toted around without having to worry about installing and setting up all the project's dependencies on the system itself. This makes it easier because the container with the project in it can be run by someone without the person having to bog down their own system with the dependencies just to run the project and see how it works.
- Run Project Locally:
    - How I installed Docker + dependencies: To begin, I installed Docker desktop on my Windows system. I already have another dependency, WSL2, installed on my system, so I didn't have to install anything special for this part of the project. Once Docker desktop was installed, I went into Docker desktop and make sure that some settings were configured correctly. These are as follows:
        1. I made sure the "Use the WSL 2 based engine" box was checked under "General" > "Settings" in Docker desktop.
        2. Under "Settings" > "Resources" > "WSL Integration", I made sure that the "Enable integration with my default WSL distro" box was checked.
        3. On the same section as the previous setting, I also made sure that under "Enable integration with additional distros:" the "Ubuntu-20.04" switch was toggled on since this is the distro that I currently use.
    - Once all these settings were configured correctly, I pressed the "Apply & Restart" button on Docker desktop to apply the new settings and restart Docker.
    - Here is a screenshot of how the first described screen should look:
    ![first docker screen](docker-screen.PNG)
    - Here is a screenshot of how the second described screen should look:
    ![second docker screen](docker-screen-2.PNG)
    - My "Apply & Restart" button was not lit up and clickable because I didn't change any settings when I took the screenshots since I had already configured them.
    - Also, the WSL 2 based engine setting was enabled by default for me, and I can't change mine because my system supports WSL 2, so this might not be greyed out as a default setting, and the box might need to be checked manually.
- How to build the container:
    - To find the container that was the right one to use for this project, I went to DockerHub and searched "apache" in the search bar at the top.
    - The first option to come up was the official Apache image, which is called "httpd", which is the one I am using for this project.
    - To pull the container to my system, I ran `docker pull httpd`.
    - Once the image was pulled, I created a `Dockerfile` inside my project git repository and added the following lines to the file:

                                             ```
                                             FROM httpd:2.4
                                             COPY ./public-html/ /usr/local/apache2/htdocs/

                                             ```
    - After this, I created a `public-html` directory inside my repository to store my HTML content.
    - Also, to get the `Dockerfile` to work properly and build successfully, I put the `Dockerfile` inside of the parent directory of `public-html`, which was just the main space in my project repository.
    - Another step I took was copying my HTML/CSS content into the `public-html` folder.
    - Once this was finished, I ran `docker build -t my-apache2 .` while I was in the main directory of my project repository, which was the parent directory of the `public-html` folder. When this command was run, the HTML file from the `public-html` directory was copied onto the new container being built since this was specified inside the `Dockerfile`. This could be copied from another directory, it would just have to be specified inside the `Dockerfile`.
    - After the container was built, I ran `docker run -dit --name my-running-app -p 8080:80 my-apache2` to run the container and bind it to port 8080 on localhost.
    - Once the container was running, I was able to view the project webpage in a browser by going to http://localhost:8080/. Since the IP address for localhost is "127.0.0.1", http://127.0.0.1:8080 could also be typed in on my computer to access the webpage since localhost refers to "127.0.0.1". Also, the ":8080" at the end of the URL that is being typed in is to specify to the browser to look on port 8080 for the content since that is what port the website was bound to when the container was run.
