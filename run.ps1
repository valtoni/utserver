# Nome da imagem
$imageName = "valtoni/unreal-server:latest"
# Nome do container
$containerName = "unreal_tournament"

# Verifica se a imagem existe
$imageExists = docker images --format "{{.Repository}}:{{.Tag}}" | Where-Object { $_ -eq $imageName }

if (-not $imageExists) {
    Write-Host "A imagem $imageName ainda não existe, construindo..."
    # Faz o build da imagem
    docker build . -t "$imageName"
} else {
    Write-Output "A imagem $imageName já existe."
}



docker run --rm -v ${volumeName}:${cstrikeDir} -p7777:7777/udp -p7778:7778/udp -p8777:8777/tcp --name=$containerName $imageName

#docker image push valtoni/unreal-server:latest
docker run -p7777:7777/udp -p7778:7778/udp -p8777:8777/tcp --name=unreal_server valtoni/unreal-server:latest


# Habilitar o Buildx no docker
docker run --rm --privileged multiarch/qemu-user-static --reset -p yes
# Novo contexto e defini-lo como padrão
docker buildx create --use
# Construindo para ARM
docker buildx build --platform linux/amd64,linux/arm64 -t valtoni/unreal-server:latest . --load
#docker buildx build . --push -t nome-do-registro.com/meu-repositorio:minha-tag
#docker buildx build . --push -t dockerhub.com/valtoni/unreal-server:latest
#docker buildx build . --output type=tar,dest=imagem.tar