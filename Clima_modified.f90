INCLUDE 'header.inc'
PARAMETER(NF=55, NA=1, NLAYERS=ND-1, NZ=64)
PARAMETER(NS=3, NS1=NS+1, NS4=NS+5)
PARAMETER(NT=76, MT=36)
PARAMETER(NSOL=38, NGS=8, IK=8)
parameter :: nrow=11			

CHARACTER(len=5) :: STARR   
CHARACTER(len=11) :: AA
CHARACTER(len=2) :: DIRINOUT,DIRDATA

REAL :: newalt(NZ), kappa_ir 
               
COMMON/DIR/DIRINOUT,DIRDATA
COMMON/WAVE/AV(NF),LAM(NF),W(NF)
COMMON/ABLOK/LTYPE(NF,3),XH2O(NF),YH2O(NF),XCO2(NF),YCO2(NF),
   &  AXH(NF),AYH(NF),BXH(NF),BYH(NF),AXC(NF),AYC(NF),BXC(NF),
   &  BYC(NF),PDOP(NF),CPR(NF),TPR(NF),PATH(NS4),PATHP(NS4),
   &  PATHT(NS4),P1,P2,T1,T2,TAU2,TAUP2,
   &  ALPHA(4),BETH2O(4,5,NF),
   &  BETCO2(4,5,NF),CA(19),CB(19),CC(19),CD(19),CE(19),CH(19),
   &  CK(19)
COMMON/CBLOK/FO2,FN2,FCO2,FAR,FCH4,FC2H6,FNO2, FI(NS1,ND),FH22
COMMON/ALTBLOK/DALT(NLAYERS),RADIUS(NLAYERS),PARTICLES(NLAYERS),RAER(NLAYERS),
   & ALT(NLAYERS)
COMMON/EBLOK/PG,TG,PG0,IMW,RSURF,OMEGA,POCEAN,IMOIST,
   &  BETA1,BETA2,FVDRY,PDRY
COMMON/FBLOK/TTAB(NT),PVAP(NT),DPVAP(NT),SVC(NT),DSV(NT),DSC(NT)
   &  ,RHOV(NT),DRHOV(NT),BETAM(70,75),TCP(75),PCP(70),DPDTL(70,75),
   &  DRDTL(70,75)
COMMON/GBLOK/TCTAB(MT),PCVAP(MT),BETASC(MT),DPCVAP(MT),
   &  DRCVAP(MT),SVSC(MT),DSCC(MT),TKTAB(MT),TCC(25),PCC(36),
   &  BETAMC(25,36),CPC(25,36),DVDTC(25,36),DVDPC(25,36),
   &  DSVC(MT)
COMMON/SBLOK/P0P,T0P,R,SUBL
COMMON/PRESSURE/P(NLAYERS),PLOG(NLAYERS)
COMMON/PRESS/BETIR1(4,5,NSOL),BETIR2(4,5,NSOL),
   &  kappa_solh2o(NSOL,8,8,IK), kappa_solco2(NSOL,8,8,IK) 

COMMON/RSOL/ALPHAZ(4,2),BETAZ(4,2),NPROB(2),
   &  NG(2),SIGG(4,2,NSOL)
! COMMON/SOLARDATA/weightco2_h2oSOL(16), weights(2,NSOL,IK)
!     & ,kmatrix_sol(NSOL,IK) ! Added SOLARDATA block here 3/26/2012

COMMON/SOLARBLK/AMU0,SRFALB,OMG0A(NSOL,NLAYERS),
  & ASYA(NSOL,NLAYERS),TAUAER(NSOL),SIGERT(NSOL),FMA(NSOL),PF(NLAYERS),
  & ALAMBDA(NSOL),CGAS(NLAYERS,NGS),FUPSOL(NLAYERS),FDNSOL(NLAYERS),
  & NGAS(2,NSOL),WGHT(4,2,NSOL),NPR(2,NSOL),SOLINT(NSOL),
  & TAULAM(NLAYERS),ASY(NLAYERS),OMG0(NLAYERS),FMT(NLAYERS),QEXT(NSOL,NLAYERS)

COMMON/IRBLK/FUPIR(NLAYERS),FDNIR(NLAYERS),SRFALBIR,OMG0AIR(NF,NLAYERS),
  & ASYAIR(NF,NLAYERS),IO3,QEXTIR(NF,NLAYERS)
COMMON/HYDROCARB/Qextirst(46,55),w0irst(46,55),
  & girst(46,55),Qextsolst(46,38),w0solst(46,38),gsolst(46,38),
  & radstand(46)
COMMON/CH4BLOCK/ALPHACH4T188(4,17),BETACH4T188(4,17),
  & ALPHACH4T295(4,17),BETACH4T295(4,17),ALPHACH4Kark(4,21),
  & BETACH4Kark(4,21),GAMMAEXP188(17),GAMMAEXP295(17),
  & ALPHACH4NEW(6),BETACH4NEW(17,3,5,6),ALCH4(6,38)
COMMON/CO2BLOK/betac1,betac2,PC0,TC0,VAPCL0,SUBCL0,DLVCDT
  & ,DLSCDT,CCL,CCS
COMMON/NO2BLOK/SIGNO2(NSOL)
!
!-KK  Added 6/15/01 to integrate Mlawer RRTM. 
COMMON/ MLAWERI/  layers, numspec, newalt(NLAYERS), TempT(0:NLAYERS), 
  & Pres(0:NLAYERS), gasses(7, 0:NLAYERS), COLDEP(NLAYERS)
COMMON/CONSS/C,BK,G,GNEW(NLAYERS),PI,SM,DM,DM2   ! Adding DM2 to common block entry 5/3/2011. DM and DM2 are AMN and AMN2 respectively in CONVEC
!-rr  3/29/11
COMMON/CPHEAT/CPO2(NLAYERS),CPCO2(NLAYERS), CPN2(NLAYERS), CPH2O(NLAYERS), 
  & CPN(NLAYERS), CPNT(NLAYERS), CPH2(NLAYERS)  ! Added CPH2 5/31/2012 c-rr
!
DATA BETA/ND*1./
DATA BETH2O/1100*0./
DATA BETCO2/1100*0./
DATA SIGNO2/1.1E-20, 5.0E-20, 9.5E-20, 2.23E-19, 3.36E-19,  
  & 5.1E-19, 5.36E-19, 2.58E-19, 1.07E-19, 8.0E-20, 4.75E-20,  
  & 2.65E-20, 1.25E-20, 0., 0., 0., 0., 0., 0., 0., 0., 0., 0.,  
  & 0., 0., 0., 0., 0., 0., 0., 0., 0., 0., 0., 0., 0., 0., 0./

!DATA ALT /  69., 67.9, 66.8, 65.7, 64.5, 63.1, 61.7, 60.3,
!		58.4, 56.4, 53.9, 50.5, 47.2, 44.9, 42.9, 40.9,
!		38.9, 36.9, 34.9, 32.9, 30.8, 29.1, 27.6, 26.2,
!		24.9, 23.7, 22.5, 21.3, 20.2, 19.1, 18., 16.9,
!		15.8, 14.7, 13.6, 12.4, 11.7, 11., 10.3, 9.6,
!		8.9, 8.2, 7.5, 6.8, 6.1, 5.3, 4.5, 3.7, 2.9, 2.1,
!		1.1, 0.0/

! FREQUENCIES AT ENDS OF SPECTRAL INTERVALS (1/CM)
DATA AV/40., 100., 160., 220., 280., 330., 380., 440., 495.,
  & 545., 617., 667., 720., 800., 875., 940., 1000., 1065.,
  & 1108., 1200., 1275., 1350., 1450., 1550., 1650., 1750., 1850.,
  & 1950., 2050., 2200., 2397., 2494., 2796., 3087., 3425., 3760.,
  & 4030., 4540., 4950., 5370., 5925., 6390., 6990., 7650., 8315.,
  & 8850., 9350., 9650., 10400., 11220., 11870., 12790., 13300.,
  & 14470., 15000./

DATA C,HP,BK,SIGMA,PI,SM/3.E10, 6.63E-27, 1.38E-16, 5.67E-5,
