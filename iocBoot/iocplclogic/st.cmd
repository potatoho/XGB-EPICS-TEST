#!../../bin/linux-x86_64/plclogic
< envPaths
epicsEnvSet("TOP", "$(TOP)")

dbLoadDatabase("$(TOP)/dbd/plclogic.dbd", 0, 0)
plclogic_registerRecordDeviceDriver(pdbbase)

drvAsynIPPortConfigure("PLC", "192.168.1.2:502", 0, 0, 0)
asynSetOption("PLC", 0, "disconnectOnReadTimeout", "Y")

modbusInterposeConfig("PLC", 0, 2000, 2)

drvModbusAsynConfigure("K2_Yn_Out_Bit",    "PLC", 1, 5,   0,   1, 0,   0,   "")
drvModbusAsynConfigure("K2_V3000_In_Word", "PLC", 1, 3, 100,   1, 1, 100,   "")

dbLoadRecords("$(TOP)/plclogicApp/Db/plc.db")

iocInit
