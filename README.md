**MPAS-Urban (HKUST)**
MPAS-Urban is a HKUST-modified version of the MPAS-Atmosphere core based on the official MPAS-Model v8.2.2 release.
In this version, the Noah-MP land surface scheme is extended to include the Single-Layer Urban Canopy Model (SLUCM) for urban climate applications.

Key features
Based on official MPAS-Model v8.2.2 atmosphere core (Noah-MP land surface scheme).

SLUCM urban canopy scheme has been added and coupled to Noah-MP in the atmosphere physics:

Urban surface energy balance and canopy parameters are computed by SLUCM.

New diagnostics for urban surface variables are available in MPAS output.

At present, BEP/BEM is not coupled in this branch – only SLUCM is available as the urban scheme.

Global LCZ-based datasets for MPAS-Urban is uploaded with name mpas_cglc_lcz.tar.gz
User should tar this file into config_geog_data_path.

LCZ data can be used by setting config_landuse_data = 'CGLC_LCZ' in the namelist.init_atmosphere

How to enable SLUCM
To run MPAS-Urban with SLUCM, turn on the urban physics switch in namelist.atmosphere:

config_urban_physics = .true.

When config_urban_physics = .true., SLUCM is used as the default urban canopy scheme.

When config_urban_physics = .false., the model falls back to the standard Noah-MP land surface configuration without urban canopy processes.

Usage notes
Build and run instructions for the general MPAS framework and MPAS-Atmosphere core are unchanged from the official v8.2.2 release; please refer to the MPAS-Atmosphere user guide and documentation on the MPAS-Dev website.

This repository only documents the urban extensions on top of v8.2.2; all other model components and workflows follow the official MPAS distribution.
