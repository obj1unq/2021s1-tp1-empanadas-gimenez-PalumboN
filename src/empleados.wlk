object gimenez {

	var fondo = 300000

	method fondo() {
		return fondo
	}

	method pagarSueldo(empleado) {
		fondo -= empleado.sueldo()
		empleado.cobrar(empleado.sueldo())
	}
	// La interfaz del empleado para poder ser usado por gimenez.
	// Deben entender los mensajes:
	// sueldo() -> Consulta, retorna el sueldo a pagar
	// cobrar(monto) -> Acción
	

}

object baigorria {

	// ¿Empanadas vendidas se calcula o se guarda?
	// Se guarda en un atributo
	var empanadasVendidas = 0
	var totalCobrado = 0
	
	// ¿Sueldo se calcula o se guarda?
	// Calcularlo en un método de consulta, entonces no hace falta el atributo.
//	var sueldo = 0

	method sueldo() {
		return empanadasVendidas * 15
	}

	method vender(cantidad) {
		empanadasVendidas += cantidad
	}

	method totalCobrado() {
		return totalCobrado
	}

	method cobrar(monto) {
		totalCobrado += monto
		empanadasVendidas = 0
	}

}

object galvan2 {

	var sueldo = 15000
	// Dos atributos
	var deuda = 0
	var dinero = 0

	method sueldo() {
		return sueldo
	}

	method sueldo(_sueldo) {
		sueldo = _sueldo
	}

	method cobrar(monto) {
		
		if (deuda >= monto) {
			deuda -= monto
		} else {
			dinero += monto - deuda
			deuda = 0
		}
		
		////////
		// Se puede sumar expresividad delegando en métodos más chicos
//		if (self.tieneDeuda()) {
//			self.pagarDeudaYQuedarseConElResto()
//		} else {
//			self.guardarTodo()
//		}
		
		
	}

	method gastar(monto) {
		if (dinero >= monto) {
			dinero -= monto
		} else {
			deuda += monto - dinero
			dinero = 0
		}
	}

	method deuda() {
		return deuda
	}

	method dinero() {
		return dinero
	}

}

object galvan {

	var sueldo = 15000
	// Un solo atributo
	var balance = 0

	method sueldo() {
		return sueldo
	}

	method sueldo(_sueldo) {
		sueldo = _sueldo
	}
	
	method cobrar(monto) {
		balance += monto
	}
	
	method gastar(monto) {
		balance -= monto
	}
	
	method deuda() {
//		return -(balance.min(0))
		return if (balance < 0) -balance else 0 
	}

	method dinero() {
		return balance.max(0)
	}

}
