#!../../bin/linux-x86_64/edwardsAdc

#- You may have to change edwardsAdc to something else
#- everywhere it appears in this file

< envPaths
epicsEnvSet( "STREAM_PROTOCOL_PATH", "$(TOP)/db" )

cd "${TOP}"

## Register all support components
dbLoadDatabase "dbd/edwardsAdc.dbd"
edwardsAdc_registerRecordDeviceDriver pdbbase

drvAsynSerialPortConfigure("RS232","/dev/edwardsADC")
##drvAsynSerialPortConfigure("RS232","/dev/ttyUSB1")
asynSetOption("RS232", 0, "baud", "9600")
asynSetOption("RS232", 0, "bits", "8")
asynSetOption("RS232", 0, "parity", "none")
asynSetOption("RS232", 0, "stop", "1")
##asynSetOption("RS232", 0, "clocal", "Y")
##asynSetOption("RS232", 0, "crtscts", "N")

## Load record instances

dbLoadRecords("db/edwards-adc.db", "P=Esther:,R=Vacuum:,A=1,BUS=RS232")

var streamError 1
# var streamDebug 1
#streamSetLogfile("stream_logfile.txt")

cd "${TOP}/iocBoot/${IOC}"
iocInit

## Start any sequence programs
#seq sncxxx,"user=bernardo"
