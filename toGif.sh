#!/bin/bash

# Verifica se o arquivo de vídeo foi fornecido como argumento
if [ -z "$1" ]; then
  echo "Por favor, forneça um arquivo de vídeo como argumento"
  exit 1
fi

# Define o nome do arquivo GIF a ser gerado
filename="${1%.*}.gif"

# Usa o programa ffmpeg para converter o arquivo de vídeo em um arquivo GIF
ffmpeg -i "$1" -vf "scale=320:-1:flags=lanczos,fps=15" -loop 0 "$filename"

# Verifica se a conversão foi concluída com sucesso
if [ $? -eq 0 ]; then
  echo "Arquivo GIF gerado com sucesso: $filename"
else
  echo "Ocorreu um erro ao gerar o arquivo GIF"
fi

