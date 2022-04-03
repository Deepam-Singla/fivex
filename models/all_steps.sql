with COVID_CASE_DETAILS as 
(

select 
Date
,Location_ISO_Code
,New_Cases
,New_Deaths
,New_Recovered
,New_Active_Cases
,Total_Cases
,Total_Deaths
,Total_Recovered
,Total_Active_Cases
,New_Cases_per_Million
,Total_Cases_per_Million
,New_Deaths_per_Million
,Total_Deaths_per_Million
,to_decimal(REPLACE(CASE_FATALITY_RATE, '%', '')) as CASE_FATALITY_RATE
,to_decimal(REPLACE(CASE_RECOVERED_RATE, '%', '')) as CASE_RECOVERED_RATE
,Growth_Factor_of_New_Cases
,Growth_Factor_of_New_Deaths


from "FIVETRAN_INTERVIEW_DB"."GOOGLE_SHEETS"."COVID19_INDONESIA_DEEPAM_SINGLA_2"

),
LOCATIONS as 

(

select 
Distinct      
Location_ISO_Code,
Location,
Location_Level,
City_or_Regency,
Province,
Country,
Continent,
Island,
Time_Zone,
Special_Status,
Total_Regencies,
Total_Cities,
Total_Districts,
Total_Urban_Villages,
Total_Rural_Villages,
Area_km_2_,
Population,
Population_Density,
Longitude,
Latitude


from "FIVETRAN_INTERVIEW_DB"."GOOGLE_SHEETS"."COVID19_INDONESIA_DEEPAM_SINGLA_2"

),


Complete_Data  as
(

select
INTERVIEW_DB.PLAYGROUND_DEEPAM_SINGLA.COVID_CASE_DETAILS.Location_ISO_Code
,New_Cases
,New_Deaths
,New_Recovered
,New_Active_Cases
,Total_Cases
,Total_Deaths
,Total_Recovered
,Total_Active_Cases
,to_decimal(REPLACE(CASE_FATALITY_RATE, '%', '')) as CASE_FATALITY_RATE
,to_decimal(REPLACE(CASE_RECOVERED_RATE, '%', '')) as CASE_RECOVERED_RATE
,Growth_Factor_of_New_Cases
,Growth_Factor_of_New_Deaths,
  Location,
Location_Level,
City_or_Regency,
Province,
DATE,
week(Cast(DATE as datetime)) as week,
    month(Cast(DATE as datetime)) as month,
    year(Cast(DATE as datetime)) as year
        
    from INTERVIEW_DB.PLAYGROUND_DEEPAM_SINGLA.COVID_CASE_DETAILS 
	inner join INTERVIEW_DB.PLAYGROUND_DEEPAM_SINGLA.LOCATIONS 
	on INTERVIEW_DB.PLAYGROUND_DEEPAM_SINGLA.COVID_CASE_DETAILS.Location_ISO_Code = INTERVIEW_DB.PLAYGROUND_DEEPAM_SINGLA.LOCATIONS.Location_ISO_Code
	
)

Select * from Complete_Data



