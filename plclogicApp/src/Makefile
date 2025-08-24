# SPDX-FileCopyrightText: 2003 Argonne National Laboratory
#
# SPDX-License-Identifier: EPICS

TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = plclogic
# plclogic.dbd will be created and installed
DBD += plclogic.dbd


# plclogic.dbd will be made up from these files:
plclogic_DBD += base.dbd
plclogic_DBD += asyn.dbd
plclogic_DBD += modbusSupport.dbd
plclogic_DBD += drvAsynIPPort.dbd
plclogic_DBD += drvAsynSerialPort.dbd
plclogic_LIBS += modbus
plclogic_LIBS += asyn

plclogic_DBD += plclogicInclude.dbd

# Include dbd files from all support applications:
#plclogic_DBD += xxx.dbd

# Add all the support libraries needed by this IOC
#plclogic_LIBS += xxx

# plclogic_registerRecordDeviceDriver.cpp derives from plclogic.dbd
plclogic_SRCS += plclogic_registerRecordDeviceDriver.cpp
plclogic_SRCS += logic.cpp

# Build the main IOC entry point on workstation OSs.
plclogic_SRCS_DEFAULT += plclogicMain.cpp
plclogic_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#plclogic_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
plclogic_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

