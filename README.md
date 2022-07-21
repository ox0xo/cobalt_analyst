```
sudo docker image build -t cobalt .
sudo docker run -d --rm -p 10122:22 --name user01 cobalt
sudo docker run -d --rm -p 10222:22 --name user02 cobalt
sudo docker run -d --rm -p 10322:22 --name user03 cobalt
```