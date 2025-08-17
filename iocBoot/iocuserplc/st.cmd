#!../../bin/linux-x86_64/userplc
< envPaths

epicsEnvSet("STREAM_PROTOCOL_PATH", "$(TOP)/userplcApp/Db")

dbLoadDatabase("$(TOP)/dbd/userplc.dbd", 0, 0)
userplc_registerRecordDeviceDriver(pdbbase)

drvAsynSerialPortConfigure("PLC", "/dev/ttyUSB0", 0)
asynSetOption("PLC", 0, "baud",   "115200")
asynSetOption("PLC", 0, "bits",   "8")
asynSetOption("PLC", 0, "parity", "none")
asynSetOption("PLC", 0, "stop",   "1")
asynSetOption("PLC", 0, "clocal", "Y")
asynSetOption("PLC", 0, "crtscts","N")


dbLoadRecords("$(TOP)/userplcApp/Db/plc.db", "P=PLC:, PORT = PLC")

iocInit
