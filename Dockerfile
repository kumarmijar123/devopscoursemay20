FROM node
LABEL np.com.techaxis.version=1.0.0
ENV PORT=3000
ARG DIR=/var/node
WORKDIR $DIR
# RUN useradd -m -h /var/myuser myuser
RUN groupadd myusergrp
RUN useradd -g myusergrp -m -d /var/myuser --shell /bin/bash myuser
# USER myuser
COPY ./weather-app/package.json . 
RUN npm install
COPY ./weather-app .
USER myuser
EXPOSE $PORT
CMD ["node", "./bin/www"]
