
create table AV_BaseLinkedin_RAZONSOCIAL (
NumDoc varchar(20),
Nombre varchar(150),
pais varchar(150),
LugarTrabajo varchar(150),
AreaTrabajo varchar(150),
Estado char(1),
FechaBusqueda date
)
----------DATOS:



select *from av_baselinkedin_razonsocial where estado = 0


---ALTER TABLE  av_baselinkedin_razonsocial  ADD LinkReferencia varchar(150)
-----tablas usadas
 select * from av_base_linkedin 
 where estado = 0
 -----------
 select top 10 *from mae_titular_uba 
 ---------
 select *from Parque_Linkedin where rev = 1
 --and id_cuenta = 1679


'''----- ''' 
 ---------------------
 ---PRINCIPAL---------
 ---------------------
SELECT a.numdoc,b.idencuenta, a.fecha_busqueda, b.nombre1,b.nombre2, b.apPaterno,b.apMaterno , a.nombre, a.lugar_trabajo,b.RazonSocial_Empresa, Area_trabajo, Institucion, a.Estado
 FROM Av_base_linkedin A LEFT JOIN Mae_titular_uba b on A.numdoc = b.numdoc 
 where a.estado = 0
 order by a.fecha_busqueda desc

 ----update de estado 1 a estado = 0
 update av_base_linkedin set estado = 0
 where numdoc in('07203342','41306652','07951049','41063304','29313018','06604146','10273566','40600642','22071048','16713653','43715201','000191593','08877433','40629331','07541974')

 ---Eliminar no cumplen:---7 perfiles
 delete from av_base_linkedin 
 where numdoc in(
 '42809032',
 '06986286','06011897','45432506','10265919','04024003','07809216','40429337','07873652','06683667','08200427','42757734','07240796','29730868')
 ----update parque a rev = 0 para volver a revisar - 3p
 update parque_linkedin set rev = 0
 where id_cuenta = '167954'

 -----Para actualizar los que ya han sido revisados
update Parque_Linkedin set rev = 0
where id_cuenta not in (SELECT b.idencuenta
 FROM Av_baselinkedin_razonsocial A LEFT JOIN Mae_titular_uba b on A.numdoc = b.numdoc)

 ---
 select *from AV_BaseLinkedin_RAZONSOCIAL

 