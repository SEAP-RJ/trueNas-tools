#!/bin/bash

# Caminho base onde procurar as pastas .recycle
BASE_DIR="/mnt"

# Número de dias limite para considerar arquivos antigos
DIAS=30

echo "Iniciando verificação de arquivos com mais de $DIAS dias nas pastas .recycle..."

# Localizar todas as pastas chamadas .recycle
find "$BASE_DIR" -type d -name ".recycle" | while read -r recycle_dir; do
    echo ">>> Verificando: $recycle_dir"
    
    # Listar arquivos com mais de X dias (sem deletar)
    find "$recycle_dir" -type f -mtime +$DIAS -exec ls -lh {} \;

    # (Opcional) listar diretórios vazios com mais de X dias
    find "$recycle_dir" -type d -empty -mtime +$DIAS -exec echo "Diretório vazio: {}" \;
done

echo "Verificação concluída."
