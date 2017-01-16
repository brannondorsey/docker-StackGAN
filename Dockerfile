FROM tensorflow/tensorflow:0.11.0-gpu
MAINTAINER Brannon Dorsey <brannon@brannondorsey.com>

WORKDIR /root
RUN apt-get update
RUN apt-get install -y git wget

# Clone StackGAN
RUN git clone https://github.com/hanzhanggit/StackGAN.git
ENV PYTHONPATH /root/StackGAN

# Install StackGAN dependencies
RUN pip install prettytensor progressbar python-dateutil easydict pandas torchfile

# copy local files to image 
COPY download_data.sh /root/
COPY download_models.sh /root/
COPY install_torch.sh /root/

CMD echo "container started"