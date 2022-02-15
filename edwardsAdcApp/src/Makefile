TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = edwardsAdc
# edwardsAdc.dbd will be created and installed
DBD += edwardsAdc.dbd

# edwardsAdc.dbd will be made up from these files:
edwardsAdc_DBD += base.dbd

# Include dbd files from all support applications:
#edwardsAdc_DBD += xxx.dbd
edwardsAdc_DBD += asyn.dbd
edwardsAdc_DBD += drvAsynSerialPort.dbd
edwardsAdc_DBD += stream.dbd

# Add all the support libraries needed by this IOC
#edwardsAdc_LIBS += xxx
edwardsAdc_LIBS += asyn
edwardsAdc_LIBS += stream

# edwardsAdc_registerRecordDeviceDriver.cpp derives from edwardsAdc.dbd
edwardsAdc_SRCS += edwardsAdc_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
edwardsAdc_SRCS_DEFAULT += edwardsAdcMain.cpp
edwardsAdc_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#edwardsAdc_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
edwardsAdc_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

