HOST=vitortoledo.busercamp.com.br

function devhelp() {
  echo "dkbuild constroi a imagem docker"
  echo "dkrun   roda o projeto dockerzinho"
  echo "deploy  da deploy no conteudo"
}

function dkbuild() {
  docker build -t vitortoledo .
}

function dkrun(){
  docker run -it -p 8000:8000 \
         -e DATABASE_FILE=/dkdata/db.sqlite3 \
         -e DJANGO_STATIC_ROOT=/dkata/static \
         -v $(pwd)/dkdata:/dkdata \
         vitortoledo start.sh
         # \ = quebra de linha
}

function deploy(){
  rsync -av --exclude dkdata --exclude db.sqlite3 \
        ./* ubuntu@$HOST:./vitortoledo/
  ssh ubuntu@$HOST "cd vitortoledo && ./dkrunprod.sh"
}

devhelp