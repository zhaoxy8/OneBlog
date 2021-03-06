# 基于centos6基础镜像
FROM xy1219.zhao/jdk-8u201:1.8
MAINTAINER xy1219.zhao "xy1219.zhao@sansumg.com"

# 设置当前工具目录
# 该命令不会新增镜像层
WORKDIR /home

# 安装必要的工具
#RUN yum install -y wget && \
#    rpm --rebuilddb && \
#    yum install -y tar && \
#    wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" https://download.oracle.com/otn-pub/java/jdk/8u201-b09/42970487e3af4f5aa5bca3f542482c60/jdk-8u201-linux-x64.tar.gz && \
#    tar -xvzf jdk-8u201-linux-x64.tar.gz && \
#    #wget https://mirrors.tuna.tsinghua.edu.cn/apache/tomcat/tomcat-8/v8.5.34/bin/apache-tomcat-8.5.34.tar.gz && \
#    #tar -xvzf apache-tomcat-8.5.34.tar.gz && \
#    #mv apache-tomcat-8.5.34/ tomcat && \
#    rm -f jdk-8u201-linux-x64.tar.gz && \
#    #rm -f apache-tomcat-8.5.34.tar.gz && \    
#    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && \
#    yum clean all
## 安装redis客户端
#RUN yum install -y epel-release  && \
#    yum install -y redis
 
# 设置环境变量
ENV JAVA_HOME /home/jdk1.8.0_201
ENV CATALINA_HOME /home/tomcat
ENV PATH $PATH:$JAVA_HOME/bin:$CATALINA_HOME/bin
ENV TZ Asia/Shanghai

# 暴露tomcat 8443端口
EXPOSE 8443

COPY samsung-baidu-token-1.5.0.jar /home/samsung-baidu-token-1.5.0.jar


# 启动容器执行下面的命令
#ENTRYPOINT /home/tomcat/bin/startup.sh && tail -f /home/tomcat/logs/catalina.out
ENTRYPOINT java -jar samsung-baidu-token-1.5.0.jar
#ENTRYPOINT /home/tomcat/bin/startup.sh && tail -f /home/tomcat/logs/catalina.out

# 创建容器启动tomcat，由于ENTRYPOINT优先级比CMD高，所以这里的CMD不会执行
#CMD ["/home/tomcat/bin/startup.sh"]
CMD ["java -jar samsung-baidu-token-1.5.0.jar"]
