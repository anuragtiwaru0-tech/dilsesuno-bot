DilSeSuno Docker Setup

1. Place this folder on your VPS.
2. Make sure Docker and Docker Compose are installed.
3. Build the Docker image:
   docker-compose build
4. Run the container:
   docker-compose up -d
5. Access Botpress: http://<your-vps-ip>:3000
6. GPT4All API will run on port 5000.
7. To stop the container:
   docker-compose down

Note: Adjust ports and paths as needed.