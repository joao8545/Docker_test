FROM python:3.9-alpine
RUN pip install flask 
RUN pip install requests
RUN mkdir logFiles
RUN chown 2000:2000 logFiles
COPY App2.py .
ENV FLASK_APP App2.py
ENTRYPOINT ["python", "-m", "flask", "run", "--host=0.0.0.0", "--port=5002"]
