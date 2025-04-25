FROM ubuntu:25.04

ARG TARGETARCH

ENV BASEDIR="/unrealserver"
WORKDIR ${BASEDIR}
ENV UNREAL_SERVER_NAME="quebec"
ENV UNREAL_HOME="${BASEDIR}/${UNREAL_SERVER_NAME}/ut-server"

RUN apt-get update && \
    apt-get install bzip2 && \
    if [ "$TARGETARCH" == "amd64" ]; then \
        echo "PLATFORM1: $TARGETARCH" \
        apt-get install -y lib32z1; \
    else \
        echo "PLATFORM2: $TARGETARCH" \
        apt-get install -y zlib1g; \
    fi


COPY ut-server-436.tar.gz ${BASEDIR}
COPY asu-0.6.tar.gz ${BASEDIR}
COPY UTPGPatch451LINUX.tar.tar ${BASEDIR}
COPY createserver.sh ${BASEDIR}

RUN ${BASEDIR}/createserver.sh ${BASEDIR} ${UNREAL_SERVER_NAME} && \
    rm ${BASEDIR}/ut-server-436.tar.gz && \
    rm ${BASEDIR}/asu-0.6.tar.gz && \
    rm ${BASEDIR}/UTPGPatch451LINUX.tar.tar && \
    rm ${BASEDIR}/createserver.sh

ENV UT_DATA_PATH="${UNREAL_HOME}/System"

WORKDIR ${UNREAL_HOME}

CMD ["/bin/sh", "-c", "${UNREAL_HOME}/ucc server DM-Barricade\\?game=Botpack.DeathMatchPlus", "log=/dev/null", "multihome=0.0.0.0"]