rd output /s/q
call build-content.cmd
%JAVAEXE% -Xmx4G -jar ../publisher.jar -ig ig.ini %TX% %*
