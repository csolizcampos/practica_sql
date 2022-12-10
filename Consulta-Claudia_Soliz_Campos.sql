--Consulta SQL
select v.model,
		bg.name_brand ,
		cg.name_group ,
		pv.init_date ,
		v.num_plate ,
		v.color ,
		v.kilometers ,
		i.insurance_company ,
		pv.num_policy 
	from claudia_soliz_campos.vehicles as v 
	join claudia_soliz_campos.brand_group as bg on v.id_brand = bg.id_brand 
	join claudia_soliz_campos.corporate_group as cg on v.id_group  = cg.id_group 
	join claudia_soliz_campos.policy_vh as pv on v.num_policy = pv.num_policy 
	join claudia_soliz_campos.insurance as i on v.id_insurance = i.id_insurance 
		
	