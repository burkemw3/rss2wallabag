FROM frolvlad/alpine-python3

RUN apk --update --no-cache add build-base python3-dev

COPY *.py /rss2wallabag/
COPY *.txt /rss2wallabag/
COPY config.yaml /rss2wallabag/

RUN pip install -r /rss2wallabag/requirements.txt

RUN mkdir /data
RUN ln -s /data/sites.yaml /rss2wallabag/sites.yaml

WORKDIR /rss2wallabag
CMD python3 main.py
