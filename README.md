# Desarrollo Web Full Stack con Java

Trabajo Práctico Integrador - Polo Tic Misiones
## Escenario

Un prestigioso hotel desea llevar a cabo un sistema para la informatización de las reservas de sus diferentes habitaciones que tiene disponibles.

Cada habitación cuenta con un número identificatorio, el piso donde se encuentra, un nombre según su temática, el tipo (single, doble, triple o múltiple) y el precio por noche.

Para poder realizar una reserva de una habitación es necesario contar con la fecha de check-in (ingreso al hotel) y fecha de check-out (egreso del hotel). Antes de confirmar una reserva, el sistema deberá verificar que la habitación solicitada no esté reservada en el período de tiempo que se haya elegido. Por ejemplo, si la habitación está reservada del 14/07 al 21/07 y la nueva reserva es del 12/07 al 15/07 no deberá permitir realizar la misma, dado que la fecha de check-out interfiere con fechas en la que se encuentra ocupada la habitación.

A partir de la cantidad de días que se hospede la persona y del tipo de habitación que haya elegido, el sistema deberá devolver el monto total de la estadía; al mismo tiempo, se deberá verificar que la cantidad de personas que se hospedarán no supere la cantidad establecida por el tipo de habitación; estas cantidades se detallan a continuación:

Tipo de Habitación y cantidad de personas permitidas
( Single 1 sola persona / 
Doble 2 personas como máximo /
Triple 3 personas como máximo / 
Múltiple 1,2,3,4 personas o más)

Además de verificar las fechas de reservación, la cantidad de personas a hospedarse, etc, es necesario registrar los datos del huésped que se hará cargo de la reserva. Entre estos datos es necesario solicitar:
dni, nombre, apellido, fecha de nacimiento, dirección y profesión. Por cuestiones de privacidad del hotel, no se registrarán los datos de los acompañantes.

El sistema está pensado para ser utilizado únicamente por los EMPLEADOS del hotel, por lo que la interfaz gráfica y la utilización debe ser pensada de esta manera (no como un sistema de reservas online).

Para la administración de los empleados, cada uno de ellos contará con un usuario y contraseña que le permitirá ingresar al sistema; para ello, cada uno de ellos deberá de estar registrado en el sistema con sus correspondientes datos personales (dni, nombre, apellido, fecha de nacimiento, dirección y cargo). Cabe destacar que los empleados reciben bonificaciones monetarias por cantidad de reservas realizadas por día, por lo que cada reserva debe tener asignada el usuario que la dio de alta.

Por otra parte, el sistema deberá poder permitir visualizar las siguientes consultas/informes:

a. Todas las reservas realizadas en un determinado día.

b. Todos los huéspedes registrados en el sistema.

c. Lista de las reservas realizadas por un determinado empleado.

d. Listas de todas las reservas realizadas por un determinado huésped en un período desde/hasta.

## Preparación

Se debe crear un usuario en la tabla 'usuario' para poder acceder al sistema.
Para ingresar se solicita el correo electrónico y una contraseña.
