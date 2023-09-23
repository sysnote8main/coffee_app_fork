FROM node:16.17.1-bullseye
ARG WORKDIR

ENV HOME=/${WORKDIR}

WORKDIR ${HOME}

RUN apt update \
    && apt upgrade -yq

COPY package.json /${WORKDIR}/package.json
RUN npm install

COPY . ./

EXPOSE 5173
CMD ["npm", "run", "dev", "--host"]