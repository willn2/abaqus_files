*****************************************************************************
**  USDFLD FOR FGMs        **************************************************
*****************************************************************************
*****************************************************************************
** Emilio Martinez-Paneda
** Department of Construction and Manufacturing Engineering
** University of Oviedo (Spain)      
** martinezemilio@uniovi.es
** Please refer the following paper:
** Martinez-Paneda, E. and Gallego, R., Numerical analysis of quasi-static
** fracture in functionally graded materials. International Journal of
** Mechanics and Materials in Design. 2014. doi: 10.1007/s10999-014-9265-y
**      
**USER SUBROUTINE

      SUBROUTINE USDFLD(FIELD,STATEV,PNEWDT,DIRECT,T,CELENT,
     1 TIME,DTIME,CMNAME,ORNAME,NFIELD,NSTATV,NOEL,NPT,LAYER,
     2 KSPT,KSTEP,KINC,NDI,NSHR,COORD,JMAC,JMATYP,MATLAYO,LACCFLA)
C
      INCLUDE 'ABA_PARAM.INC'
C
      CHARACTER*80 CMNAME,ORNAME
      CHARACTER*3  FLGRAY(15)
      DIMENSION FIELD(NFIELD),STATEV(NSTATV),DIRECT(3,3),
     1 T(3,3),TIME(2)
      DIMENSION ARRAY(15),JARRAY(15),JMAC(*),JMATYP(*)
C    DIMENSION INTV(1),REALV(1)
	
	 integer n_coords, NOEL, NPT,j
	
	 double precision COORD(3), d1,d2,d3, circ_r
	 real, dimension(500) :: ideal_e 
		
	 do j=1,500
		ideal_e(j) = j
	 end do
	 n_coords = 3 ! 3D, so 3 coordinates
	 
	 circ_r = 5
	  ! Assuming no overlap of the inclusions, figure out if the point lies in any
	  
	  ! The inclusion centered at x = -10, y = 0
	 !d1 = sqrt((COORD(1) - (-10,0))**2 + (COORD(2)-0.0)**2 + (COORD(3)-0.0)**2)
	 
	 ! The inclusion centered at x = 10 y = 0
	 !d2 = sqrt((COORD(1) - (10))**2 + (COORD(2)-(0.0))**2 + (COORD(3)-0.0)**2)
	 
	 ! The inclusion centered at x = 10, y = 0
	 d1 = sqrt((COORD(1) - 0.0)**2 + (COORD(2)-0.0)**2)
	 
	 
	 if (d1 <= circ_r) then
		FIELD(1) = 1.0
	 else
		FIELD(1) = 2.0
	 end if


      RETURN
      END
      
