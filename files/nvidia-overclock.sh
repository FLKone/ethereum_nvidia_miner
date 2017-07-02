#!/usr/bin/env bash


# Overclocking with nvidia-settings
# Increase or decrease in small increments (+/- 25)


# GPUGraphicsClockOffset
MY_CLOCK="-200"
# GPUMemoryTransferRateOffset
MY_MEM="1200"

# GPUTargetFanSpeed (%)
MY_FAN="50"


# Graphics card 1 to 6
for MY_DEVICE in {0..3}
do
	DISPLAY=:0 XAUTHORITY=/var/lib/mdm/:0.Xauth nvidia-settings -a "[gpu:$MY_DEVICE]/GPUPowerMizerMode=1"
	# Fan speed
	DISPLAY=:0 XAUTHORITY=/var/lib/mdm/:0.Xauth nvidia-settings -a "[gpu:$MY_DEVICE]/GPUFanControlState=1"
	DISPLAY=:0 XAUTHORITY=/var/lib/mdm/:0.Xauth nvidia-settings -a "[fan:$MY_DEVICE]/GPUTargetFanSpeed=$MY_FAN"
	# Grafics clock
	DISPLAY=:0 XAUTHORITY=/var/lib/mdm/:0.Xauth nvidia-settings -a "[gpu:$MY_DEVICE]/GPUGraphicsClockOffset[3]=$MY_CLOCK"
	# Memory clock
	DISPLAY=:0 XAUTHORITY=/var/lib/mdm/:0.Xauth nvidia-settings -a "[gpu:$MY_DEVICE]/GPUMemoryTransferRateOffset[3]=$MY_MEM"
done

echo
echo "Done"
echo
