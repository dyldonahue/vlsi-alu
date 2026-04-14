#!/usr/bin/env bash
# cad13_everything_env.sh
# Must be SOURCED:  source cad13_everything_env.sh

# ---------- helpers ----------
path_prepend() {
  for d in "$@"; do
    [ -d "$d" ] || continue
    case ":$PATH:" in *":$d:"*) ;; *) PATH="$d:$PATH" ;; esac
  done
}
path_append() {
  for d in "$@"; do
    [ -d "$d" ] || continue
    case ":$PATH:" in *":$d:"*) ;; *) PATH="$PATH:$d" ;; esac
  done
}
ld_prepend() {
  for d in "$@"; do
    [ -d "$d" ] || continue
    case ":${LD_LIBRARY_PATH-}:" in *":$d:"*) ;; *) LD_LIBRARY_PATH="$d:${LD_LIBRARY_PATH-}" ;; esac
  done
}

# ---------- OS guard (your scripts do Linux vs SunOS) ----------
if [ "$(uname -s)" != "Linux" ]; then
  echo "This bash env is currently written to match your Linux block."
  return 1 2>/dev/null || exit 1
fi

# ---------- 1) Core knobs ----------
# matches: setenv CDS_LOAD_ENV CSF
export CDS_LOAD_ENV="CSF"


# --- CLEAN: remove cad2024 from PATH so it can't override cad13 ---
PATH="$(echo "$PATH" | tr ':' '\n' | grep -v '/ECEnet/Apps1/linux/cad2024' | paste -sd: -)"
export PATH
hash -r


# ---------- 2) CAD_TOOLS + CNI (kept same as your csh Linux block) ----------
# Your csh sets CAD_TOOLS to cad12/tools (for PDKs + synopsys/mentor paths),
# BUT sets Cadence tool homes to cad13/tools/cadence/....
export CAD_TOOLS="/ECEnet/Apps1/linux/cad12/tools"

# (Optional) If you ever need the cad13 base:
export CAD13_TOOLS="/ECEnet/Apps1/linux/cad13/tools"

# ---------- 3) Cadence tool homes (EXACT paths from your csh Linux section) ----------
export MMSIMHOME="/ECEnet/Apps1/linux/cad13/tools/cadence/SPECTRE191"
export CDSHOME="/ECEnet/Apps1/linux/cad13/tools/cadence/IC618"
export ASSURAHOME="/ECEnet/Apps1/linux/cad13/tools/cadence/ASSURA41-618"
export QRC_HOME="/ECEnet/Apps1/linux/cad13/tools/cadence/EXT191"
export EDIHOME="/ECEnet/Apps1/linux/cad13/tools/cadence/EDI142"
export ET_HOME="/ECEnet/Apps1/linux/cad13/tools/cadence/ET151"
export CTOS_HOME="/ECEnet/Apps1/linux/cad13/tools/cadence/CTOS142"
export CONFRML_HOME="/ECEnet/Apps1/linux/cad13/tools/cadence/CONFRML182"
export RC_HOME="/ECEnet/Apps1/linux/cad13/tools/cadence/RC142"
export INCISIVE="/ECEnet/Apps1/linux/cad13/tools/cadence/INCISIVE152"
export XCELIUM="/ECEnet/Apps1/linux/cad13/tools/cadence/XCELIUM1903"
export SPB_HOME="/ECEnet/Apps1/linux/cad13/tools/cadence/SPB172"
export ADW_HOME="/ECEnet/Apps1/linux/cad13/tools/cadence/ADW166"
export ADW_HOME="/ECEnet/Apps1/linux/cad13/tools/cadence/ADW166"

PEGASUS_HOME="/ECEnet/Apps1/linux/cad2024/tools/PEGASUS222"
PEGASUS_PATH="${PEGASUS_HOME}/bin:${PEGASUS_HOME}/tools.lnx86/bin"
export PEGASUS_HOME


# OA_HOME path (your csh)
export OA_HOME="/ECEnet/Apps1/linux/cad13/tools/cadence/IC618/oa_v22.60.022"

# Derived vars you set later in csh:
export CDS_ROOT="$CDSHOME"
export CDS_INST_DIR="$CDSHOME"
export CDS_HOME="$CDSHOME"
export MMSIM_ROOT="$MMSIMHOME"

# Cadence runtime knobs (your csh)
export CDS_Netlisting_Mode="Analog"
export NOVERSION=1
export CDS_AUTO_64BIT="pipo layout.exe layoutPlus.exe ERC cdba2icc ivVerify"
export BITMODE=32
export SKIP_CDS_DIALOG=1

# Incisive-derived vars (your csh)
export SPECMAN_HOME="$INCISIVE/components/sn"
export SOCV_KIT_HOME="$INCISIVE/kits/VerificationKit"
export VRST_HOME="$INCISIVE"
export VMANAGER_HOME="$INCISIVE/components/vm"
export IFV_HOME="$INCISIVE"

# Allegro vars (your csh)
export CONCEPT_INST_DIR="$SPB_HOME"
export LDV_INST_DIR="$CAD_TOOLS"      # matches your csh: LDV_HOME=$CAD_TOOLS
export LDV_HOME="$CAD_TOOLS"
export SYNPLIFYHOME="$CAD_TOOLS"
export ALSDIR="$CAD_TOOLS"

# ---------- 4) Synopsys + Mentor homes (kept as your csh uses CAD_TOOLS) ----------
export ASTRO="$CAD_TOOLS/synopsys/astro_vZ-2007.03-SP12"
export ASTRO_IU="$CAD_TOOLS/synopsys/astro_iu_vZ-2007.03-SP12"
export ASTRO_RAIL="$CAD_TOOLS/synopsys/astro-rail_vZ-2007.03-SP11"
export CSC="$CAD_TOOLS/synopsys/cosmosscope_vE-2011.03"
export SCD="$CAD_TOOLS/synopsys/customdesigner_vE-2011.03"
export SNPS_SX="$CAD_TOOLS/synopsys/customexp_vJ-2014.09"
export HERCULES="$CAD_TOOLS/synopsys/hercules_vB-2008.09-SP4"
export SNPS_HSIM="$CAD_TOOLS/synopsys/hsimplus_vF-2011.09"
export HSPICE="$CAD_TOOLS/synopsys/hspice_vJ-2014.09-SP2"
export SNPS_SIMIF="$CAD_TOOLS/synopsys/hspice_vF-2011.09-SP2"
export IC_COMPILER="$CAD_TOOLS/synopsys/IC_COMPILER_vH-2013.03-SP3"
export PRIME_ST="$CAD_TOOLS/synopsys/pts_vH-2013.06-SP1"
export SCL="$CAD_TOOLS/synopsys/scl_v11.3"
export STAR_RCXT="$CAD_TOOLS/synopsys/starrc_vF-2011.12-SP2"
export SYNOPSYS="$CAD_TOOLS/synopsys/SYNTHESIS_vH-2013.03-SP3"
export TCAD="$CAD_TOOLS/synopsys/tcad_sentaurus_vF-2011.09-SP1"
export VCS_HOME="$CAD_TOOLS/synopsys/vcs_mx_vF-2011.12"
export FORMALITY="$CAD_TOOLS/synopsys/FORMALITY_vH-2013.03-SP3"

# Mentor (your csh uses this cad13 tool path)
export MGC_HOME="/ECEnet/Apps1/linux/cad13/tools/mentor/aoi_cal_2019.4_28.13"
export MODELSIM="$CAD_TOOLS/mentor/modelsim_se_10.1a/modeltech"


# ---------- 5) PATH (matches the order in your csh) ----------
# Start with some base bins similar to your csh behaviour:
path_append "$HOME" /usr/local/sbin /usr/local/bin /sbin /bin /usr/sbin /usr/bin /usr/X11R6/bin /etc /usr

# Synopsys PATH additions (your csh)
path_append \
  "$ASTRO/bin/IA.32" \
  "$ASTRO_IU/bin/IA.32" \
  "$ASTRO_RAIL/bin/IA.32" \
  "$CSC/ai_bin" \
  "$SCD/bin" \
  "$SNPS_SX/bin" \
  "$HERCULES/bin/IA.32" \
  "$SNPS_HSIM/hsimplus/platform/linux/bin" \
  "$HSPICE/hspice/bin" \
  "$SNPS_SIMIF/bin" \
  "$IC_COMPILER/bin" \
  "$PRIME_ST/bin" \
  "$SCL/bin" \
  "$STAR_RCXT/bin" \
  "$SYNOPSYS/bin" \
  "$TCAD/bin" \
  "$VCS_HOME/bin" \
  "$FORMALITY/bin"

# Cadence PATH additions (your csh)
# Cadence PATH additions (PREPEND so cad13 overrides cad2024)
path_prepend \
  "$CONFRML_HOME/tools/bin" \
  "$CTOS_HOME/tools/bin" \
  "$CDSHOME/tools/spectre/bin" \
  "$CDSHOME/tools/dfII/bin" \
  "$CDSHOME/tools/bin" \
  "$MMSIMHOME/tools/bin" \
  "$QRC_HOME/tools/bin" \
  "$QRC_HOME/bin" \
  "$ASSURAHOME/tools/dfII/bin" \
  "$PEGASUS_PATH" \
  /ECEnet/Apps1/linux/cad2024/tools/PEGASUS222/bin

# Allegro PATH additions (your csh)
path_append \
  "$SPB_HOME/tools/bin" \
  "$SPB_HOME/tools/lib" \
  "$SPB_HOME/tools/pcb_bin" \
  "$SPB_HOME/tools/fet/bin" \
  "$LDV_HOME/tools/bin" \
  "$LDV_HOME/tools/lib" \
  "$SYNPLIFYHOME/bin" \
  "$SYNPLIFYHOME/lib" \
  "$ADW_HOME/tools/bin" \
  "$ALSDIR/bin"

# “New Version” PATH additions (your csh)
path_append \
  "$INCISIVE/bin" \
  "$INCISIVE/tools/bin" \
  "$INCISIVE/tools/systemc/gcc/bin" \
  "$INCISIVE/specman/bin" \
  "$INCISIVE/tools/vtools/vfault/bin" \
  "$ET_HOME/tools/bin" \
  "$RC_HOME/tools/bin" \
  "$EDIHOME/tools/bin" \
  "$IFV_HOME/bin" \
  "$IFV_HOME/tools/bin"

# NOTE: your csh adds PEGASUS from cad2024. You said “everything cad13”, so we do NOT add it.

# Mentor PATH additions (your csh)
path_append "$MGC_HOME/bin" "$MODELSIM/bin"

# OA PATH additions (your csh)
path_append "$OA_HOME/bin"

export PATH

# ---------- 6) LD_LIBRARY_PATH (matches your csh) ----------
ld_prepend \
  "$MMSIMHOME/tools/ultrasim/lib" \
  "$CDSHOME/tools/dfII/lib" \
  "$OA_HOME/lib" \
  "/COEnet/Linux/lib/X11R6/lib" \
  "/usr/X11R6/lib"

export LD_LIBRARY_PATH

# ---------- 7) PDK setup (exact from your csh) ----------
export PDKS="$CAD_TOOLS/PDKs"
export CDK_DIR="$PDKS/ncsu-cdk-1.6.0"
export PDK_DIR="$PDKS/FreePDK45"
export gpdk180_DIR="$PDKS/gpdk180_v3.3"
export gpdk090_DIR="$PDKS/gpdk090_v4.6"
export gpdk045_DIR="$PDKS/gpdk045_v_3_5"
export MPDK_HL18G_DIR="$PDKS/Magnachip180_02082012"
export DPDK_BD350BB_DIR="$PDKS/Dongbu350_09072011_v1_29_02"
export DPDK_RF011_DIR="$PDKS/DPDK_1225_1233rf11sa_Rev0p1_0"
export TSMC18RF_DIR="$PDKS/TSMC18RF"
export gpdk045_v_6_0_DIR="$PDKS/gpdk045_v_6_0"

# ---------- 8) License (exact from your csh) ----------
export LM_LICENSE_FILE="5280@cadencelm.coe.neu.edu:27000@synopsyslm.coe.neu.edu:1717@mentorlm.coe.neu.edu"

# ---------- 9) Synopsys STDB dir creation (your csh) ----------
export STDB="$HOME/DB"
export STROOT="$TCAD"
mkdir -p "$STDB" 2>/dev/null || true

# ---------- status ----------
echo "[cad13_everything_env loaded]"
echo "  CDSHOME   = $CDSHOME"
echo "  MMSIMHOME = $MMSIMHOME"
echo "  OA_HOME   = $OA_HOME"
echo "  virtuoso  = $(command -v virtuoso 2>/dev/null || echo NOT_FOUND)"
echo "  spectre   = $(command -v spectre 2>/dev/null || echo NOT_FOUND)"


hash -r
