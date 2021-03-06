
FROM node:8.4.0

# Sobrescreve o log basico
ENV NPM_CONFIG_LOGLEVEL warn

# Instala o serve
RUN npm install -g serve

# Instala dependencias.
COPY package.json package.json
RUN npm install

# Copia todos os arquivos para a imagem
COPY . .

# Builda a imagem
RUN npm run build

# Serve arquivos estaticos na pasta dist
CMD serve -p $PORT -s dist
