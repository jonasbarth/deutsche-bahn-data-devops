FROM python:3.9

WORKDIR /deutsche-bahn-data-devops/app

COPY . .
ADD https://github.com/jonasbarth/deutsche-bahn-station/blob/main/src/proto/station.proto .

RUN python -m venv .venv
RUN .venv/Scripts/bin/activate
RUN pip install -r requirements.txt

RUN python -m grpc_tools.protoc -I . --python_out=. --grpc_python_out=. ./station.proto

CMD ["python", "main.py"]