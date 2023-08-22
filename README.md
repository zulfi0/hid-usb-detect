# hid-usb-detect
Android auto detect USB powered to perform HID attack.
#
When performing USB HID attack with android using [DroidDucky](https://github.com/anbud/DroidDucky) or [Rucky apk](https://github.com/mayankmetha/Rucky)
the device have to connected first to pc / laptop, these condition slightly bothers me
so i create this script to detect if the device is connected to pc/laptop or not.



in android there are 2 power type AC and USB,

**AC powered**: This refers to when a device is powered or charged using an AC (Alternating Current) power source, typically from an electrical outlet. While the device might connect to the power source using a USB cable, the source of power itself is AC, which is then converted into DC (Direct Current) within the device to charge its battery.


**USB Powered**: This refers to when a device, such as a smartphone or tablet, is powered or charged using a USB (Universal Serial Bus) connection. Most Android devices can be charged through a USB connection using a computer, a USB wall charger, or other compatible USB power sources. 

these can be viewed with `dumpsys` command

![image](https://github.com/zulfi0/hid-usb-detect/assets/68773572/626840a3-95cd-4c9c-b213-b17062265382)


The Idea is when the device is powered through usb (USB powered become true) such as connected to pc/laptop then we will perfrom
the HID attack so we can run the script before connecting the android device to pc/laptop.
# Installation
download usb-detect.sh in this repo and roidducky repo at https://github.com/anbud/DroidDucky

move DroidDucky folder into /data/local/ and put usb-detect.sh in DroidDucky directory
```bash
mv /sdcard/Download/DroicDucky /data/local/
mv /sdcard/Download/usb-detect.sh /data/local/DroidDucky
```

# Example
Try with the following payload:
```dd
GUI r
DELAY 100
STRING notepad.exe
ENTER
DELAY 200
STRING You have been hacked !! 
ENTER
```

save these in payload.txt and run the script:
```sh
sh usb-detect.sh payload.txt
```

not connected to pc/laptop

![image](https://github.com/zulfi0/hid-usb-detect/assets/68773572/e80a5b9f-a172-43d1-8c4a-5c8e75872bb8)

once connected

![image](https://github.com/zulfi0/hid-usb-detect/assets/68773572/c41171a6-0078-40b7-8e13-f52abc4b7456)



