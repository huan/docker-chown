FROM ubuntu:eoan as Builder

RUN groupadd group \
  && useradd -m -g group user \
  && echo 'user:gropu created'

COPY --chown=user:group entrypoint.sh /
RUN ls -l /entrypoint.sh

COPY --chown=user:group container_root/ /
RUN ls -l /chown_test

RUN chown -R user:group /chown_test \
  && ls -l /chown_test

RUN ls -l /chown_test

RUN /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]