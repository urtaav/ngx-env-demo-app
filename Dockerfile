# Establece la imagen base
FROM node:18 as build

# Get the arguments from the command line
ARG NG_APP_NAME
ARG NG_APP_API

# Set the environment variables
ENV NG_APP_NAME=$NG_APP_NAME
ENV NG_APP_API=$NG_APP_API

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /usr/src/app

# Copia el archivo de configuración de paquetes (package.json) y el archivo de bloqueo de paquetes (package-lock.json)
COPY package*.json ./

# Instala las dependencias del proyecto
RUN npm install

# Copia todos los archivos de la aplicación al contenedor
COPY . .

# Compila la aplicación
RUN npm run build --prod

# Establece una nueva imagen base más pequeña y eficiente
FROM nginx

# Copia los archivos de compilación de la aplicación desde la etapa de construcción al contenedor
COPY --from=build /usr/src/app/dist/variables-entorno-app /usr/share/nginx/html

# Copia el archivo de configuración de Nginx personalizado al contenedor
COPY --from=build /usr/src/app/nginx.conf /etc/nginx/conf.d/default.conf

# Expone el puerto 80 para que la aplicación sea accesible desde fuera del contenedor
EXPOSE 80

# Inicia el servidor Nginx
# CMD ["nginx", "-g", "daemon off;"]
