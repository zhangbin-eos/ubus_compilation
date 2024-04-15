
json-c-0.17-20230812
libubox  6339204c21
ubus     65bb027054


```sh
sudo -s
mkdir -p /var/run/ubus/
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${PRJ_ROOT}/__install/lib
./sbin/ubusd &
```
