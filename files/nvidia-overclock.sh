#!/usr/bin/env bash


# Overclocking with nvidia-settings
# Increase or decrease in small increments (+/- 25)


# GPUGraphicsClockOffset
MY_CLOCK="-200"
# GPUMemoryTransferRateOffset
MY_MEM="1200"

# GPUTargetFanSpeed (%)
MY_FAN="55"


# Graphics card 1 to 6
for MY_DEVICE in {0..4}
do
	DISPLAY=:0 XAUTHORITY=/var/lib/mdm/:0.Xauth nvidia-settings -a "[gpu:$MY_DEVICE]/GPUPowerMizerMode=1"
	# Fan speed
	DISPLAY=:0 XAUTHORITY=/var/lib/mdm/:0.Xauth nvidia-settings -a "[gpu:$MY_DEVICE]/GPUFanControlState=1"
	DISPLAY=:0 XAUTHORITY=/var/lib/mdm/:0.Xauth nvidia-settings -a "[fan:$MY_DEVICE]/GPUTargetFanSpeed=$MY_FAN"
	# Grafics clock
	DISPLAY=:0 XAUTHORITY=/var/lib/mdm/:0.Xauth nvidia-settings -a "[gpu:$MY_DEVICE]/GPUGraphicsClockOffset[3]=$MY_CLOCK"
	# Memory clock
	# DISPLAY=:0 XAUTHORITY=/var/lib/mdm/:0.Xauth nvidia-settings -a "[gpu:$MY_DEVICE]/GPUMemoryTransferRateOffset[3]=$MY_MEM"
done

# Memory clock
DISPLAY=:0 XAUTHORITY=/var/lib/mdm/:0.Xauth nvidia-settings -a "[gpu:0]/GPUMemoryTransferRateOffset[3]=1200"
DISPLAY=:0 XAUTHORITY=/var/lib/mdm/:0.Xauth nvidia-settings -a "[gpu:1]/GPUMemoryTransferRateOffset[3]=1200"
DISPLAY=:0 XAUTHORITY=/var/lib/mdm/:0.Xauth nvidia-settings -a "[gpu:2]/GPUMemoryTransferRateOffset[3]=1200"
DISPLAY=:0 XAUTHORITY=/var/lib/mdm/:0.Xauth nvidia-settings -a "[gpu:3]/GPUMemoryTransferRateOffset[3]=1200"
DISPLAY=:0 XAUTHORITY=/var/lib/mdm/:0.Xauth nvidia-settings -a "[gpu:4]/GPUMemoryTransferRateOffset[3]=1200"

echo
echo "Done"
echo
