#!/bin/bash

echo -e "\n" #un salto de línea
echo -e "\e[1;46mBienvenido al sistema de ordenación de ficheros\e[0m"

while true; do
    read -p "Por favor, introduzca un directorio a ordenar: " carpeta

    if [ -d "$carpeta" ]; then
        echo -e "Analizando el directorio: \e[1;34m$carpeta\e[0m"
        numeroFicheros=$(find "$carpeta" -maxdepth 1 -type f | wc -l)
        echo -e "Encontrados \e[7;32m$numeroFicheros\e[0m ficheros"

        # INICIO DEL CORAZÓN DEL PROGRAMA
        for archivo in "$carpeta"/*; do
            # primero vemos si es un archivo y no un directorio
            if [[ -f "$archivo" ]]; then
                # obtenemos la extensión del fichero
                extension=$(basename "$archivo" | awk -F. '{if (NF>1) print $NF}')
                # declaramos una variable donde se almacenará el nombre de la carpeta a guardar
                usuario=$(whoami)
                carpetaDestino="ninguna"
                if [[ -n "$extension" ]]; then
                    case $extension in
                        png|PNG|jpg|JPG|jpeg|JPEG|gif|GIF|bmp|BMP|webp|WEBP|tiff|TIFF|tif|TIF|ico|ICO|svg|SVG|heif|HEIF|heic|HEIC)
                            carpetaDestino="/home/$usuario/Imágenes"
                            ;;
                        mp3|MP3|wav|WAV|flac|FLAC|aac|AAC|ogg|OGG|wma|WMA|m4a|M4A)
                            carpetaDestino="/home/$usuario/Música"
                            ;;
                        mp4|MP4|mkv|MKV|avi|AVI|mov|MOV|wmv|WMV|flv|FLV|webm|WEBM|mpeg|MPEG|mpg|MPG|3gp|3GP|m4v|M4V)
                            carpetaDestino="/home/$usuario/Vídeos"
                            ;;
                        dot|DOT|dotx|DOTX|ott|OTT|otp|OTP|ots|OTS|otg|OTG)
                            carpetaDestino="/home/$usuario/Plantillas"
                            ;;
                        docm|DOCM|doc|DOC|docx|DOCX|uot|UOT|fodt|FODT|odt|ODT|pdf|PDF|rtf|RTF|txt|TXT|xml|XML|html|HTML|xls|XLS|xlsx|XLSX|xlsm|XLSM|xlsb|XLSB|xltx|XLTX|xltm|XLTM|ods|ODS|fods|FODS|csv|CSV|tsv|TSV)                            carpetaDestino="/home/$usuario/Documentos"
                            ;;
                        *)
                            echo -e "\e[1;31m$archivo tiene una extensión no reconocida\e[0m"
                            ;;
                    esac
                    # lleva el archivo a la carpeta destino si la carpeta no es ninguna
                    if [[ $carpetaDestino != "ninguna" ]]; then
                        mv "$archivo" "$carpetaDestino"
                        # vemos si el movimiento fue exitoso
                        if [ $? -eq 0 ]; then
                            echo -e "Moviendo'\e[1;33m$archivo'\e[0m a \e[1;34m'$carpetaDestino'\e[0m."
                        else
                            echo -e "\e[1;31mError: No se pudo mover el archivo.\e[0m"
                        fi
                    fi
                else
                    echo -e "\e[1;33m$archivo no tiene extensión\e[0m"
                fi
            fi
        done
        # FIN DEL CORAZÓN DEL PROGRAMA
        echo -e "\n" #un salto de línea
        echo -e "\e[7;32mFicheros ordenados\e[0m"
        echo -e "\n" #un salto de línea
        read -p "¿Quieres ordenar otro directorio? (S/N): " finPrograma
        if [[ "$finPrograma" =~ ^[Nn]$ ]]; then
            echo "Cerrando programa..."
            exit 0
        fi
    # SI NO SE ENCUENTRA EL DIRECTORIO SE PASA AQUÍ
    else
        echo -e "\n" #un salto de línea
        echo "No se encuentra el directorio: $carpeta"
        read -p "¿Quieres terminar la ejecución del script? (S/N): " finPrograma
        if [[ "$finPrograma" =~ ^[Ss]$ ]]; then
            echo "Cerrando programa..."
            exit 0
        fi
    fi
done
