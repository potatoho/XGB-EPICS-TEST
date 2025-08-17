#!../../bin/linux-x86_64/plc

#- SPDX-FileCopyrightText: 2000 Argonne National Laboratory
#-
#- SPDX-License-Identifier: EPICS

#- You may have to change plc to something else
#- everywhere it appears in this file

< envPaths

cd "${TOP}"

## Register all support components
dbLoadDatabase "dbd/plc.dbd"
plc_registerRecordDeviceDriver(pdbbase)


drvAsynIPPortConfigure("PLC","192.168.1.2:502",0,0,0)
asynSetOption("PLC",0, "disconnectOnReadTimeout", "Y")


modbusInterposeConfig("PLC",0,2000,0)


drvModbusAsynConfigure("K2_Yn_In_Bit",     "PLC", 1, 1, 000,   040,   0, 100, "")
drvModbusAsynConfigure("K2_Yn_Out_Bit",    "PLC", 1, 5, 00000, 040,   0, 1,   "")
drvModbusAsynConfigure("K2_V3000_In_Word", "PLC", 1, 3, 100,   040,   1, 100, "")
drvModbusAsynConfigure("plc_output",       "PLC", 1, 6, 100,   6,     1, 500, "")

#- Set this to see messages from mySub
#-var mySubDebug 1
dbLoadTemplate("db/PLC.substitutions")
#- Run this to trace the stages of iocInit
#-traceIocInit

cd "${TOP}/iocBoot/${IOC}"
iocInit

## Start any sequence programs
#seq sncExample, "user=ys"
