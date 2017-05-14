# nghttpx-squid

Docker镜像：wangyi2005/nghttpx-squid

如部署到  OPENSHIFT 3 online starter，自签发 *.1d35.starter-us-east-1.openshiftapps.com 证书。

环境变量：

1、SERVER_CRT（证书，用notepad++ 扩展模式替换换行符 为 \n ,变成一行）

-----BEGIN CERTIFICATE-----\nMIICODCCAb2gAwIBAgIBBjAK.....-----END CERTIFICATE-----

2、SERVER_KEY（私钥）

-----BEGIN EC PRIVATE KEY-----\nMIGkAgEBBDATTre93W........-----END EC PRIVATE KEY-----
