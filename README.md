# MyTurn

  ## Initial Setup

  ### Mac

  Install [Docker Toolbox](https://www.docker.com/products/docker-toolbox)
  Use the Docker Quickstart Terminal app the Docker Toolbox installs to open up
  a terminal window that can run the docker commands below

  ## Usage

  ### Web Server

  * In the project root directory run `docker-compose-up`
  * Once that is complete, open a second terminal window with Docker Quickstart
  Terminal and run `docker-machine ip myturn_web_1`
  * Navigate to the ip given by the previous step, on port 4000

  ### Single Command

  * Run `docker-compose run web [YOUR PHOENIX COMMAND]`

  ### Terminal Session

  This will give you a bash session inside the docker container. This allows
  you to run commands without prefacing them with `docker-compose run web`.

  * Run `docker-compose run web bash`
