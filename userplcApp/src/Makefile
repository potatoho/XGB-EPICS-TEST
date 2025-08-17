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

PROD_IOC = userplc
# userplc.dbd will be created and installed
DBD += userplc.dbd

# userplc.dbd will be made up from these files:
userplc_DBD += base.dbd
userplc_DBD += asyn.dbd
userplc_DBD += stream.dbd
userplc_DBD += drvAsynSerialPort.dbd

# Include dbd files from all support applications:
#userplc_DBD += xxx.dbd

# Add all the support libraries needed by this IOC
#userplc_LIBS += xxx
userplc_LIBS += stream asyn

# userplc_registerRecordDeviceDriver.cpp derives from userplc.dbd
userplc_SRCS += userplc_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
userplc_SRCS_DEFAULT += userplcMain.cpp
userplc_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#userplc_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
userplc_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

