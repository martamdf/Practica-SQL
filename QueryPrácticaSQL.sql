SELECT keepcodingcars.company_group."name" as "Grupo Empresarial", 
		keepcodingcars.brand."name" as "Marca", 
		keepcodingcars.model ."name" as "Modelo", 
		keepcodingcars.car.purchase_date as "Fecha Compra",
		keepcodingcars.car.plate_number as "Matricula",
		keepcodingcars.color."name" as "Color",
		keepcodingcars.car.kms,
		keepcodingcars.insurance_company."name" as "Aseguradora",
		keepcodingcars.insurance_policy.policy_number as "Nº de Póliza" 
FROM keepcodingcars.car  
INNER JOIN keepcodingcars.model  
	ON keepcodingcars.model.id_model = keepcodingcars.car.id_model 
INNER JOIN keepcodingcars.brand  
	ON keepcodingcars.model.id_brand = keepcodingcars.brand.id_brand
INNER JOIN keepcodingcars.company_group  
	ON keepcodingcars.company_group.id_company = keepcodingcars.brand.id_company
INNER JOIN keepcodingcars.color  
	ON keepcodingcars.color.id_color  = keepcodingcars.car.id_color 
INNER JOIN keepcodingcars.insurance_policy  
	ON keepcodingcars.car.id_policy  = keepcodingcars.insurance_policy.id_policy  
INNER JOIN keepcodingcars.insurance_company  
	ON keepcodingcars.insurance_policy.id_insurance_company  = keepcodingcars.insurance_company.id_insurance_company  
WHERE keepcodingcars.car.termination_date is NULL;  