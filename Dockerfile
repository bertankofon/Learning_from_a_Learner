# Use an official Python runtime as a parent image
FROM python:3.9

# Set the working directory in the container
WORKDIR /usr/src/app

# Install GCC - old
# RUN apt-get update && apt-get install -y gcc-9 g++-9

# Install GCC
RUN apt-get update && apt-get install -y gcc g++

# Update alternatives to make gcc-9 and g++-9 the default compilers
RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-9 100
RUN update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-9 100

# Install any needed packages specified in requirements.txt
# Uncomment the next line if you have a requirements.txt file
# COPY requirements.txt ./
# RUN pip install --no-cache-dir -r requirements.txt

# Copy the current directory contents into the container at /usr/src/app
COPY . .

# Make port 80 available to the world outside this container
EXPOSE 80

# Define environment variable
ENV NAME World

# Run app.py when the container launches
# Replace "app.py" with the script you want to run
CMD ["python", "learner.py"]
