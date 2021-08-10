FROM python:3.9-alpine
RUN pip install flask
RUN mkdir logFiles
RUN chown 2000:2000 logFiles
COPY App.py .
ENV FLASK_APP App.py
ENTRYPOINT ["python", "-m", "flask", "run", "--host=0.0.0.0", "--port=5001"]
