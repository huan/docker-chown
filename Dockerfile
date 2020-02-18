FROM ubuntu:eoan as Builder

RUN groupadd group \
  && useradd -m -g group user \
  && echo 'user:gropu created'

COPY --chown=user:group container_root/ /
RUN ls -l /chown_test

RUN chown -R user:group /chown_test \
  && ls -l /chown_test

RUN ls -l /chown_test

ARG TEST_FILE=/chown_test/owner.dat
RUN FILE_USER=$(stat -c '%U' "$TEST_FILE") \
  FILE_GROUP=$(stat -c '%G' "$TEST_FILE"); \
  if [ "$FILE_USER" != 'user' -o "$FILE_GROUP" != 'group' ]; then \
    echo "ERROR: User:Group is not right - $FILE_USER:$FILE_GROUP"; \
    exit 1; \
  fi
