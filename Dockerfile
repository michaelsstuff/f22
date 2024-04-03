FROM steamcmd/steamcmd:windows

EXPOSE 8080/tcp
EXPOSE 8443/tcp
EXPOSE 10823/tcp

COPY entrypoint.bat C:\\entrypoint.bat
COPY dedicatedServer.xml c:\\dedicatedServer.xml
ENTRYPOINT ["cmd", "/c", "C:\\entrypoint.bat"]
