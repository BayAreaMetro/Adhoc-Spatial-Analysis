/****** Script for SelectTopNRows command from SSMS  ******/
SELECT 
      [NAME]
      ,[SHIELDNUM]
      ,([KPH] * .621371) MPH 
	  ,[City]
      ,[COUNTYNAME]
      ,[CountyFIP]
	  ,SUM([Killed]) Sum_Killed
	  ,SUM([Sevinj]) Sum_Injured 
	  ,Count(*) Sum_Incidents
	  ,geometry::UnionAggregate(RDS.Shape) as Shape
  INTO VZ_HIN_BAY_AREA_2006_2017 
  FROM [Analysis].[dbo].[VZ_MN_NW_BAYAREA] AS RDS
  LEFT JOIN [dbo].[VZ_BAYAREAACCIDENTS2006_2016_PROJECT] AS PTS
  ON RDS.OBJECTID = PTS.NEAR_FID
  GROUP BY 
  NAME,
  SHIELDNUM,
  KPH,
  CITY,
  COUNTYNAME, 
  CountyFIP
