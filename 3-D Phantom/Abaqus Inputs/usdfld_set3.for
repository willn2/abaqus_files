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
	 real, dimension(100) :: ideal_e 
		
	 do j=1,500
		ideal_e(j) = j
	 end do
	 n_coords = 3 ! 3D, so 3 coordinates
	 
	 circ_r = 5
	  ! Assuming no overlap of the inclusions, figure out if the point lies in any
	  
	  ! The spherical inclusion centered at x = -8, y = 0, z = 0
	 d1 = sqrt((COORD(1) - (-8.0))**2 + (COORD(2)-0.0)**2 + (COORD(3)-0.0)**2)
	 !((xm(:)-10).^2./5^2 + (ym(:)*cosd(30) - zm(:)*sind(30)).^2./3^2 + (ym(:)*cosd(30) + zm(:)*sind(30)).^2./6^2) <=1);
	 
	 ! The elliptical inclusion centered at x = 10
	 d2 = (((COORD(1) - (10.0))**2)/5**2 + ((COORD(2)*cosd(30.0) - COORD(3)*sind(30.0))**2)/3**2 + ((COORD(2)*cosd(30.0) + COORD(3)*sind(30.0))**2)/6**2)
	 
	 
	 ! The inclusion centered at x = 10, y = 0
	 !d3 = sqrt((COORD(1) - 10.0)**2 + (COORD(2)-0.0)**2)
	 
	 
	 if (d1 <= circ_r) then
		FIELD(1) = 125001.0
	 elseif (d2 <= 1) then
		FIELD(1) = 125002.0
	 else
		FIELD(1) = NOEL
	 end if


      RETURN
      END
      
