FROM ubuntu

RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-venv \
    git \
    curl \
    neovim

WORKDIR /app

RUN git clone https://github.com/Mongar28/chat_rag_pdf.git

WORKDIR /app/chat_rag_pdf

RUN mkdir -p /app/chat_rag_pdf/documents/pdfs

RUN python3 -m venv .venv

COPY .env ./

RUN /bin/bash -c "source .venv/bin/activate && pip install --no-cache-dir -r requirements.txt"

EXPOSE 8501

CMD ["/bin/bash", "-c", "source .venv/bin/activate && streamlit run app.py"]


