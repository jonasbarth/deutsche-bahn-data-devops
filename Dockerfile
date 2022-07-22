FROM python:3.9

WORKDIR /deutsche-bahn-data-devops/app

COPY . .
RUN wget https://github.com/jonasbarth/deutsche-bahn-station/blob/main/src/proto/station.proto --output-document=station.proto

ENV VIRTUAL_ENV=.venv

RUN python -m venv $VIRTUAL_ENV
RUN chmod +x $VIRTUAL_ENV/bin/activate

ENV PATH="$VIRTUAL_ENV/bin:$PATH"

RUN pip install -r requirements.txt

RUN python -m grpc_tools.protoc -I . --python_out=. --grpc_python_out=. ./station.proto

CMD ["python", "main.py"]