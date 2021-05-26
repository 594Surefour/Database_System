#_*_coding=utf-8 _*
#__author__ = 'chubby_superman'
import psutil
import time
def get_net_speed(interval):
    net_msg = psutil.net_io_counters()
    bytes_sent, bytes_recv = net_msg.bytes_sent, net_msg.bytes_recv
    time.sleep(interval)
    net_msg = psutil.net_io_counters()
    bytes_sent2, bytes_recv2 = net_msg.bytes_sent, net_msg.bytes_recv
    sent_speed = (bytes_sent2 - bytes_sent) / interval
    sent_speed = str(round((sent_speed / 1048576), 2)) + " MB/s" if sent_speed >= 1048576 else str(
        round((sent_speed / 1024), 2)) + " KB/s"
    recv_speed = (bytes_recv2 - bytes_recv) / interval
    recv_speed = str(round((recv_speed / 1048576), 2)) + " MB/s" if recv_speed >= 1048576 else str(
        round(recv_speed / 1024, 2)) + " KB/s"
    return sent_speed, recv_speed
sent_speed, recv_speed = get_net_speed(3)
print(f"网络实时IO（3s内）\n上传速度:{sent_speed}\n下载速度:{recv_speed}")
net = psutil.net_io_counters()
sent_bytes = net.bytes_recv / 1024 / 1024
recv_bytes = net.bytes_sent / 1024 / 1024
sent_bytes = str(round(sent_bytes, 2)) + "MB" if sent_bytes < 1024 else str(round(sent_bytes / 1024, 2)) + "GB"
recv_bytes = str(round(recv_bytes, 2)) + "MB" if recv_bytes < 1024 else str(round(recv_bytes / 1024, 2)) + "GB"
print(f"网卡总接收流量{recv_bytes}\n总发送流量{sent_bytes}")




