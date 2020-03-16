



-------------estado 0: Busqueda Exacta
---estado 1: no exacta
select *from av_baseLinkedin_razonsocial where estado = 0  
order by fechabusqueda desc

select *From Parque_Linkedin WHERE REV != 1
--------------------------------------
select a.*, nombre_producto, linea_credito_usd 
From av_baselinkedin_razonsocial a left join mae_titular_uba b
on a.numdoc = b.numdoc

------------------------------------
select distinct *
From AV_BaseLinkedin_RAZONSOCIAL 
WHERE FechaBusqueda = '20200130'
-------------------------------------ACTUALIZAR
update Parque_Linkedin set rev = 0
where id_cuenta in (SELECT b.idencuenta
 FROM Av_baselinkedin_razonsocial A LEFT JOIN Mae_titular_uba b on A.numdoc = b.numdoc
 where a.FechaBusqueda = '20200129')
 ------------------------------------PARQUE_LINKEDIN
select *from AV_BaseLinkedin_RAZONSOCIAL
--where rev= 1
--ESTADO = 0
order by FechaBusqueda, LugarTrabajo 
--where numdoc = '80614509'
--------------------------------------DELETE
delete from AV_BaseLinkedin_RAZONSOCIAL
 where FECHABUSQUEDA = '20200129'

----------------------------ARMAR EN GRUPOS

with tmpBASELINKEDIN AS
(
select *
, case  when areaTrabajo like '%doc%' or areaTrabajo like '%educ%' or areaTrabajo like '%profesor%' or  areaTrabajo like '%Catedr%'  then 'Docente'
when areaTrabajo like '%espe%' then 'Especialista'
when areaTrabajo like '%dire%' then 'Director'
when areaTrabajo like '%specia%' then 'Especialista'
when areaTrabajo like '%jef%' then 'Jefe'
when areaTrabajo like '%ejecut%' or areaTrabajo like '%senior%' or areaTrabajo like '%Exec%'  then 'Ejecutivo'
when areaTrabajo like '%coord%' then 'Coordinador'
when areaTrabajo like '%super%' then 'Supervisor'
when areaTrabajo like '%asist%' or areaTrabajo like '%assis%'  then 'Asistente'
when areaTrabajo like '%sopor%' then 'Soporte'
when areaTrabajo like '%erente%' or AreaTrabajo like 'geren%' then 'Gerente' 
when areaTrabajo like '%sub%' or areaTrabajo like '%subgere%' then 'Sub Gerente'
when areaTrabajo like '%aseso%' then 'Asesor'
when areaTrabajo like '%opera%' then 'Operador'
when areaTrabajo like '%audit%' then 'Auditor'
when areaTrabajo like '%anal%' then 'Analista'
when areaTrabajo like '%jub%' or AreaTrabajo like '%retir%' then 'Jubilado'
when AreaTrabajo like '%presid%' then 'Presidente'
when areaTrabajo like '%adm%' or  areaTrabajo like '%mana%'  then 'Administrador'
when areaTrabajo like '%enfe%' then 'Enfermero'
when areaTrabajo like '%ayud%' or  areaTrabajo like '%auxi%' or areaTrabajo like '%consul%'   then 'Consultor'
when areaTrabajo like '%agent%' then 'Agente'
when areaTrabajo like '%ceo%' then 'CEO'
when areaTrabajo like '%maint%' then 'Mantenimiento'
when areaTrabajo like '%líder%' then 'Jefe'
when areaTrabajo like '%psic%' or areaTrabajo like '%psyc%'  then 'Psicologo'
when areaTrabajo like '%stud%' then 'Estudiante'
when areaTrabajo like '%contro%'  then 'Ejecutivo'
when areaTrabajo like '%atenc%' or areaTrabajo like '%recep%' or areaTrabajo like '%secre%' then 'Secretaria'
when areaTrabajo like '%inge%' or areaTrabajo like '%engi%' or AreaTrabajo like '%data%' or AreaTrabajo like '%ing.%'   then 'Ingeniero'
when areaTrabajo like '%méd%' or areaTrabajo like '%med%' or areaTrabajo like '%ciru%' or areaTrabajo like '%denti%' or areaTrabajo like '%odont%' then 'Médico'
when areaTrabajo like '%abog%' then 'Abogado'
when areaTrabajo like '%arqui%' or areaTrabajo like '%archi%'  then 'Arquitecto'
when areaTrabajo like '%Plan%' then 'Planificador'
when areaTrabajo like '%funcio%' then 'Funcionario'
when areaTrabajo like '%Leader%' or areatrabajo like 'Lider' then 'Lead'
when areaTrabajo like '%conta%' then 'Contador'
when areaTrabajo like '%instruc%' or areaTrabajo like '%entrenad%' or areaTrabajo like '%coach%' then 'Instructor'
when areaTrabajo like '%develop%' or areaTrabajo like '%desarrolla%' or areaTrabajo like '%progra%'  then 'Programador'
when areaTrabajo like '%Marke%' then 'Marketing'
when areaTrabajo like '%técn%' or areaTrabajo like '%tecn%'  then 'Tecnico'
when areaTrabajo like '%Diseñ%' then 'Diseñador'
when areaTrabajo like '%terap%' then 'Terapeuta'
when areaTrabajo like '%indep%' then 'Independiente'
when areaTrabajo like '%profesi%' then 'Profesional'
when areaTrabajo like '%licen%' then 'Licenciado'
when areaTrabajo like '%Empre%' then 'Empresario'
when areaTrabajo like '%MBA%'  or  areaTrabajo like '%máster%' or areaTrabajo like '%máster%'  then 'MBA'
when areaTrabajo like '%Asoci%' or areaTrabajo like '%Associ%'  then 'Asociado'
when areaTrabajo like '%bachi%' or AreaTrabajo like '%egresa'  then 'Bachiller'
when AreaTrabajo like '%biól' or AreaTrabajo like '%biol%' or AreaTrabajo like '%quím%' or AreaTrabajo like '%quim%'   then 'Cientifico'
when areaTrabajo like '%cajer%' then 'Cajero'
when areaTrabajo like '%chef%' or areatrabajo like '%coci%' then 'Chef'
when areaTrabajo like '%comun%' then 'Comunicador'
when areaTrabajo like '%Econo%' then 'Economista'
when AreaTrabajo like '%Gesto%' or AreaTrabajo like '%Gestió%' then 'Gestor'
else 'OTRO'
end as [Profesion]

from av_baseLinkedin_razonsocial
)select distinct  A.NUMDOC, A.NOMBRE, A.PROFESION, A.AREATRABAJO, A.LugarTrabajo
into Base_Linkedin
From tmpBASELINKEDIN a left join mae_titular_uba b
on a.numdoc = b.numdoc
where  --A.PROFESION <> 'OTRO' 
--AND 
A.estado = 0
--order by AreaTrabajo
--------
--DROP TABLE [BDANALYTICS].DBO.BASE_LINKEDIN2020

--
SELECT *FROM [BDANALYTICS].DBO.BASE_LINKEDIN

SELECT *
FROM [BDANALYTICS].DBO.BASE_SUNEDU
WHERE FLG_MAYOR=1

ALTER TABLE  BASE_LINKEDIN2020 DROP COLUMN NOMBRE

02604645

select top 100 *   from OR_tmp_tabla_arbol_3 
WHERE SociosVitalicios LIKE '%1%'

SELECT *fROM AV_BaseLinkedin_RAZONSOCIAL WHERE NUMDOC IN ('03376273', '02604645')
--------
SELECT NOMBRE_LARGO FROM Mae_Titular_UBA WHERE NumDoc = '03376273'
03376273
--mario toribio lucero
;
select *
--id_cuenta, count(*) 
From OR_TMP_REPORT_PROV_2_2 
WHERE ID_CUENTA IN (132935,
109023,
166376,
127281)
order by numdoc 
--group by id_cuenta
--order by count(*) 
--DES_CALIFICACION IS NOT NULL
;
select top 10 *FROM OR_TMP_REPORT_PROV_3   
--where numdoc >10