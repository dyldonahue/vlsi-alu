###############################################################################
#                                                                             #
# Cadence GPDK 45nm Setup Script                                              #
#    7/10/2024 by Minghan Liu                                                 #
#                                                                             #
###############################################################################

# Set the gpdk045_DIR variable to the root directory of the FreePDK distribution
setenv PDKS /ECEnet/Apps1/linux/cad12/tools/PDKs
setenv gpdk045_v_6_0_DIR 		$PDKS/gpdk045_v_6_0
# Set CDSHOME to the root directory of the Cadence ICOA installatio

if !(-f ${PWD}/.cdsinit ) then
  cp ${gpdk045_v_6_0_DIR}/cdssetup/cdsinit ${PWD}/.cdsinit
endif

if !( -f ${PWD}/.cdsplotinit ) then
  cp ${gpdk045_v_6_0_DIR}/cdssetup/cdsplotinit ${PWD}/.cdsplotinit
endif

if !( -f ${PWD}/pvtech.lib ) then
  cp ${gpdk045_v_6_0_DIR}/cdssetup/pvtech.lib ${PWD}/pvtech.lib
endif

if !( -f ${PWD}/cds.lib ) then
  cp ${gpdk045_v_6_0_DIR}/cdssetup/cds.lib ${PWD}/cds.lib
endif

if !( -f ${PWD}/assura_tech.lib ) then
  cp ${gpdk045_v_6_0_DIR}/cdssetup/assura_tech.lib ${PWD}/assura_tech.lib
endif

#if !( -f ${PWD}/.abstractrc ) then
#  cp ${gpdk045_v_6_0_DIR}/cdssetup/.abstractrc ${PWD}/.abstractrc
#endif

######           make folders             ######
if ( ! -e models) then
  ln -s ${gpdk045_v_6_0_DIR}/models models
endif

if ( ! -e qrc) then
  ln -s ${gpdk045_v_6_0_DIR}/qrc qrc
endif

if ( ! -e gpdk045) then
  ln -s ${gpdk045_v_6_0_DIR}/gpdk045 gpdk045
endif

if ( ! -e soce) then
  ln -s ${gpdk045_v_6_0_DIR}/soce soce
endif

if ( ! -e pvs ) then
  cp -r ${gpdk045_v_6_0_DIR}/pvs pvs
endif

if ( ! -e assura) then
  ln -s ${gpdk045_v_6_0_DIR}/assura assura
endif






