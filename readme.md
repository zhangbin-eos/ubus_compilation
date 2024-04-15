

```sh
sudo -s
mkdir -p /var/run/ubus/
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${PRJ_ROOT}/__install/lib
./sbin/ubusd &
```
