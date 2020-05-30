FROM python:3.6

# Create app directory
WORKDIR /app

# Install app dependencies
COPY . /app

RUN pip3 install -r requirements.txt

# Bundle app source

CMD [ "python", "app.py" ]
