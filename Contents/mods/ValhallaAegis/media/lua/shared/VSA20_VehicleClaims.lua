-- moddata management


function Valhalla:getMulePart(vehicle)
	if vehicle
	then
		for i, partId in ipairs(Valhalla.VehicleClaims.muleParts)
		do
            if vehicle["getPartById"]
            then
                local part = vehicle:getPartById(partId);

                if part
                then
                    return part;
                end
            end
		end

		--print("mule part not found");
	--else
		--print("vehicle not found");
	end

	return nil;
end


-- format helpers


function Valhalla.VehicleClaims:getVehiclePositionString(vehicle, x, y)
	return math.floor(x or vehicle:getX()) .. ", " .. math.floor(y or vehicle:getY());
end


-- data handling


function Valhalla.VehicleClaims:vehicleStringToObject(vehicleString)
	local vehicleData = Valhalla:splitArrayString(vehicleString);

	return {
		id = vehicleData[1],
		name = vehicleData[2],
		location = vehicleData[3]
	};
end
