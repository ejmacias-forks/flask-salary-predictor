# Sets the base image 
FROM python:3

# set the working directory for containers
WORKDIR /usr/src/flask-salary-predictor

# Copy the source files to the working directory
COPY app.py .
COPY model.pkl .
COPY requirements.txt .
COPY templates/ ./templates
COPY static/ ./static

# list workdir
RUN ls -la .

# install build utilities
RUN apt-get -y update
RUN pip3 install -r requirements.txt

# check our python environment
RUN python3 --version
RUN pip3 --version

#Expose the required port
EXPOSE 5000

# Command to run on container start
CMD [ "python3", "./app.py" ]
