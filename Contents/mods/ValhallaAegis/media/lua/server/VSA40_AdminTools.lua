-- gas station refuel


function Valhalla.AdminTools:refuelGasStation(object, amount)
	if object
	then
		object:setPipedFuelAmount(amount or 25000);
		object:transmitCompleteItemToClients();
	end
end