FROM python:3.7-slim

# On copie le local vers l'image du container
ADD requirements.txt /app/requirements.txt
RUN pip install -r /app/requirements.txt --no-cache-dir

WORKDIR app/
# Ajouter les fichiers nécessaires pour faire tourner l'app streamil
ADD ./datacraft.py /app/datacraft.py 
ADD ./images/ /app/images/
ADD ./models/ /app/models/
ADD ./utils/ /app/utils/
ADD ./css/ /app/css/

EXPOSE 8501 

CMD ["streamlit","run","/app/datacraft.py"]

