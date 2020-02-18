FROM ubuntu:bionic-20200112
RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install lib32z1 lib32ncurses5 lib32stdc++6 python-urwid build-essential mspdebug
ADD http://software-dl.ti.com/msp430/msp430_public_sw/mcu/msp430/MSPGCC/8_3_1_0/export/msp430-gcc-full-linux-x64-installer-8.3.1.0.run /
RUN chmod +x msp430-gcc-full-linux-x64-installer-8.3.1.0.run && ./msp430-gcc-full-linux-x64-installer-8.3.1.0.run --mode unattended
ENV PATH $PATH:/root/ti/msp430-gcc/bin
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
