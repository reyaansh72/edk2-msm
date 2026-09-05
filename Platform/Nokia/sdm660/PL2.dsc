## @file
#
#  Copyright (c) 2011-2019, ARM / Linaro / Intel / Bingxing Wang / Xilin Wu
#  Copyright (c) 2026, PL2 (Nokia 6.1) port
#
#  SPDX-License-Identifier: BSD-2-Clause-Patent
#
##

################################################################################
#
# Defines Section
#
################################################################################
[Defines]
  SOC_PLATFORM               = SDM660
  USE_PHYSICAL_TIMER         = TRUE
  PLATFORM_NAME              = PL2
  PLATFORM_GUID              = 8a4e5b2c-9f1d-4a3e-b7c8-1d2e3f4a5b6c
  PLATFORM_VERSION           = 0.1
  DSC_SPECIFICATION          = 0x0001001C
  OUTPUT_DIRECTORY           = Build/PL2
  SUPPORTED_ARCHITECTURES    = AARCH64
  BUILD_TARGETS              = DEBUG|RELEASE
  SKUID_IDENTIFIER           = DEFAULT
  FLASH_DEFINITION           = Platform/Nokia/PL2/PL2.fdf

!include Silicon/Qualcomm/QcomPkg/QcomCommonDsc.inc

################################################################################
#
# PCD Section
#
################################################################################
[PcdsFixedAtBuild.common]
  # ===== Memory (3GB variant) =====
  gArmTokenSpaceGuid.PcdSystemMemoryBase|0x80000000
  gArmTokenSpaceGuid.PcdSystemMemorySize|0xC0000000          # 3 GB

  gArmTokenSpaceGuid.PcdCpuVectorBaseAddress|0x9FF8C000
  gArmTokenSpaceGuid.PcdArmArchTimerFreqInHz|19200000
  gArmTokenSpaceGuid.PcdArmArchTimerSecIntrNum|17
  gArmTokenSpaceGuid.PcdArmArchTimerIntrNum|18
  gArmTokenSpaceGuid.PcdGicDistributorBase|0x17A00000
  gArmTokenSpaceGuid.PcdGicRedistributorsBase|0x17B00000

  gEfiMdeModulePkgTokenSpaceGuid.PcdAcpiDefaultOemRevision|0x00000850

  # PrePi Stack
  gEmbeddedTokenSpaceGuid.PcdPrePiStackBase|0x9FF90000
  gEmbeddedTokenSpaceGuid.PcdPrePiStackSize|0x00040000       # 256 KB
  gEmbeddedTokenSpaceGuid.PcdPrePiCpuIoSize|44

  # UEFI Memory Pool (DXE Heap)
  gQcomTokenSpaceGuid.PcdUefiMemPoolBase|0xA0000000
  gQcomTokenSpaceGuid.PcdUefiMemPoolSize|0x2E000000

  # ===== Framebuffer =====
  gQcomTokenSpaceGuid.PcdMipiFrameBufferAddress|0x9D400000
  gQcomTokenSpaceGuid.PcdMipiFrameBufferWidth|1080
  gQcomTokenSpaceGuid.PcdMipiFrameBufferHeight|1920

  # CPU
  gArmPlatformTokenSpaceGuid.PcdCoreCount|8
  gArmPlatformTokenSpaceGuid.PcdClusterCount|2

  # SimpleInit
  gSimpleInitTokenSpaceGuid.PcdDeviceTreeStore|0x83300000
  gSimpleInitTokenSpaceGuid.PcdLoggerdUseConsole|FALSE

[LibraryClasses.common]
  AslUpdateLib|Silicon/Qualcomm/QcomPkg/Library/DxeAslUpdateLib/DxeAslUpdateLib.inf
  PlatformMemoryMapLib|Silicon/Qualcomm/sdm660/Library/PlatformMemoryMapLib/PlatformMemoryMapLib.inf
  PlatformPeiLib|Silicon/Qualcomm/sdm660/Library/PlatformPeiLib/PlatformPeiLib.inf
  PlatformPrePiLib|Silicon/Qualcomm/sdm660/Library/PlatformPrePiLib/PlatformPrePiLib.inf
  MsPlatformDevicesLib|Silicon/Qualcomm/sdm660/Library/MsPlatformDevicesLib/MsPlatformDevicesLib.inf
  SOCSmbiosInfoLib|Silicon/Qualcomm/sdm660/Library/SOCSmbiosInfoLib/SOCSmbiosInfoLib.inf

[Components.common]
