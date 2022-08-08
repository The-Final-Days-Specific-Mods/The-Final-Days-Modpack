require "fhqExpandedVehSpawns"

if getActivatedMods():contains("KVsNearlyNew") and VehicleZoneDistribution then

	--------------------------------New spawn zones--------------------------------

	---Collectors: Rare spawn zones with a high chance for rare cars. Cars here should be exotics, and especially rare vintage cars. High end cars can also be included, but at a lower spawn rate than exotics---

	VehicleZoneDistribution.collectors.vehicles["Base.30president"] = {index = -1, spawnChance = 25};
	VehicleZoneDistribution.collectors.vehicles["Base.amphicar"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.collectors.vehicles["Base.30hotrod"] = {index = -1, spawnChance = 20};

	---Barn Find: Rare spawn zone usually near barns. Prioritize classics, especially rare ones, here. Cars in this list will almost be wrecked and may be undrivable, requiring towing. High key chance ---

	VehicleZoneDistribution.barnfind.vehicles["Base.30president"] = {index = -1, spawnChance = 25};
	VehicleZoneDistribution.barnfind.vehicles["Base.amphicar"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.barnfind.vehicles["Base.fiat500"] = {index = -1, spawnChance = 15};
	VehicleZoneDistribution.barnfind.vehicles["Base.30hotrod"] = {index = -1, spawnChance = 20};

	---Expo Car Show: These zones will be near expo centers, or other places where there may be large car shows. Here you will find exotics, race cars, and vintage classics---

	VehicleZoneDistribution.expocarshow.vehicles["Base.30president"] = {index = -1, spawnChance = 10};
	VehicleZoneDistribution.expocarshow.vehicles["Base.amphicar"] = {index = -1, spawnChance = 15};
	VehicleZoneDistribution.expocarshow.vehicles["Base.30hotrod"] = {index = -1, spawnChance = 10};

	---Special Dealer: Specialty car dealer zone. This should contain exotics and imports mostly, as well as restored classics. Possibility for a race/concept car as a display car. HIgher condition and key chance ---

	VehicleZoneDistribution.specialdealer.vehicles["Base.30president"] = {index = -1, spawnChance = 10};
	VehicleZoneDistribution.specialdealer.vehicles["Base.amphicar"] = {index = -1, spawnChance = 10};
	VehicleZoneDistribution.specialdealer.vehicles["Base.fiat500"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.specialdealer.vehicles["Base.30hotrod"] = {index = -1, spawnChance = 10};

	---Amateur Mechanic: Amateur mechanic style house. Should contain special custom variants of vehicles, as well as a lower chance for their stock counterparts. Could also contain restored classics---

	VehicleZoneDistribution.amateurmechanic.vehicles["Base.30president"] = {index = -1, spawnChance = 7};
	VehicleZoneDistribution.amateurmechanic.vehicles["Base.30hotrod"] = {index = -1, spawnChance = 15};

	---Import: Cars unavailable in the US, but available elsewhere. Near shipping areas, such as docks, railyards, and airports.---

	VehicleZoneDistribution.import.vehicles["Base.amphicar"] = {index = -1, spawnChance = 30};
	VehicleZoneDistribution.import.vehicles["Base.fiat500"] = {index = -1, spawnChance = 40};

	---Used Dealer: Zone for used car dealers. Should contain older cars, but newer cars can also be included as well. Higher key chance, lower condition.---

	VehicleZoneDistribution.useddealer.vehicles["Base.fiat500"] = {index = -1, spawnChance = 5};

	---Racing: Race cars and other track-based vehicles should go here.---

	VehicleZoneDistribution.racing.vehicles["Base.30hotrod"] = {index = -1, spawnChance = 10};

	
end

if getActivatedMods():contains("FRUsedCars") and VehicleZoneDistribution then

	VehicleZoneDistribution.collectors.vehicles["Base.79datsun280z"] = {index = -1, spawnChance = 15};
	VehicleZoneDistribution.collectors.vehicles["Base.77transam"] = {index = -1, spawnChance = 15};
	VehicleZoneDistribution.collectors.vehicles["Base.69chargerdaytona"] = {index = -1, spawnChance = 20};

	VehicleZoneDistribution.barnfind.vehicles["Base.51chevy3100old"] = {index = -1, spawnChance = 10};
	VehicleZoneDistribution.barnfind.vehicles["Base.64mustang"] = {index = -1, spawnChance = 10};
	VehicleZoneDistribution.barnfind.vehicles["Base.69charger"] = {index = -1, spawnChance = 10};
	VehicleZoneDistribution.barnfind.vehicles["Base.65gto"] = {index = -1, spawnChance = 10};
	VehicleZoneDistribution.barnfind.vehicles["Base.69chargerdaytona"] = {index = -1, spawnChance = 20};

	VehicleZoneDistribution.expocarshow.vehicles["Base.generallee"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.expocarshow.vehicles["Base.pursuitspecial"] = {index = -1, spawnChance = 10};
	VehicleZoneDistribution.expocarshow.vehicles["Base.92wranglerjurassic"] = {index = -1, spawnChance = 10};
	VehicleZoneDistribution.expocarshow.vehicles["Base.93explorerjurassic"] = {index = -1, spawnChance = 10};

	VehicleZoneDistribution.specialdealer.vehicles["Base.pursuitspecial"] = {index = -1, spawnChance = 3};
	VehicleZoneDistribution.specialdealer.vehicles["Base.73falcon"] = {index = -1, spawnChance = 35};

	VehicleZoneDistribution.newdealer.vehicles["Base.90corolla"] = {index = -1, spawnChance = 30};
	VehicleZoneDistribution.newdealer.vehicles["Base.91celica"] = {index = -1, spawnChance = 17};
	VehicleZoneDistribution.newdealer.vehicles["Base.91wagoneer"] = {index = -1, spawnChance = 25};
	VehicleZoneDistribution.newdealer.vehicles["Base.92crownvic"] = {index = -1, spawnChance = 25};
	VehicleZoneDistribution.newdealer.vehicles["Base.92wrangler"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.newdealer.vehicles["Base.93explorer"] = {index = -1, spawnChance = 25};
	VehicleZoneDistribution.newdealer.vehicles["Base.93jeepcherokee"] = {index = -1, spawnChance = 25};
	VehicleZoneDistribution.newdealer.vehicles["Base.91chevys10"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.newdealer.vehicles["Base.91chevys10ext"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.newdealer.vehicles["Base.91crx"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.newdealer.vehicles["Base.astrovan"] = {index = -1, spawnChance = 25};
	VehicleZoneDistribution.newdealer.vehicles["Base.90ramlb"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.newdealer.vehicles["Base.90ramsb"] = {index = -1, spawnChance = 20};

	VehicleZoneDistribution.amateurmechanic.vehicles["Base.pursuitspecial"] = {index = -1, spawnChance = 15};
	VehicleZoneDistribution.amateurmechanic.vehicles["Base.73falcon"] = {index = -1, spawnChance = 10};
	VehicleZoneDistribution.amateurmechanic.vehicles["Base.69chargerdaytona"] = {index = -1, spawnChance = 15};
	VehicleZoneDistribution.amateurmechanic.vehicles["Base.51chevy3100"] = {index = -1, spawnChance = 15};
	VehicleZoneDistribution.amateurmechanic.vehicles["Base.51chevy3100old"] = {index = -1, spawnChance = 10};
	VehicleZoneDistribution.amateurmechanic.vehicles["Base.64mustang"] = {index = -1, spawnChance = 15};
	VehicleZoneDistribution.amateurmechanic.vehicles["Base.65gto"] = {index = -1, spawnChance = 15};

	VehicleZoneDistribution.import.vehicles["Base.73falcon"] = {index = -1, spawnChance = 35};

	VehicleZoneDistribution.useddealer.vehicles["Base.65gto"] = {index = -1, spawnChance = 7};
	VehicleZoneDistribution.useddealer.vehicles["Base.77transam"] = {index = -1, spawnChance = 5};
	VehicleZoneDistribution.useddealer.vehicles["Base.69charger"] = {index = -1, spawnChance = 8};
	VehicleZoneDistribution.useddealer.vehicles["Base.64mustang"] = {index = -1, spawnChance = 6};
	VehicleZoneDistribution.useddealer.vehicles["Base.79brougham"] = {index = -1, spawnChance = 12};
	VehicleZoneDistribution.useddealer.vehicles["Base.73pinto"] = {index = -1, spawnChance = 12};
	VehicleZoneDistribution.useddealer.vehicles["Base.72beetle"] = {index = -1, spawnChance = 10};
	VehicleZoneDistribution.useddealer.vehicles["Base.71impala"] = {index = -1, spawnChance = 15};
	VehicleZoneDistribution.useddealer.vehicles["Base.70chevelle"] = {index = -1, spawnChance = 15};
	VehicleZoneDistribution.useddealer.vehicles["Base.70elcamino"] = {index = -1, spawnChance = 10};
	VehicleZoneDistribution.useddealer.vehicles["Base.68wildcat"] = {index = -1, spawnChance = 10};
	VehicleZoneDistribution.useddealer.vehicles["Base.68wildcatconvert"] = {index = -1, spawnChance = 10};
	VehicleZoneDistribution.useddealer.vehicles["Base.68elcamino"] = {index = -1, spawnChance = 15};
	VehicleZoneDistribution.useddealer.vehicles["Base.80f350"] = {index = -1, spawnChance = 15};
	VehicleZoneDistribution.useddealer.vehicles["Base.83hilux"] = {index = -1, spawnChance = 15};
	VehicleZoneDistribution.useddealer.vehicles["Base.85vicsed"] = {index = -1, spawnChance = 30};
	VehicleZoneDistribution.useddealer.vehicles["Base.85vicwag"] = {index = -1, spawnChance = 30};
	VehicleZoneDistribution.useddealer.vehicles["Base.85vicwag2"] = {index = -1, spawnChance = 30};
	VehicleZoneDistribution.useddealer.vehicles["Base.86econoline"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.useddealer.vehicles["Base.86yugo"] = {index = -1, spawnChance = 10};
	VehicleZoneDistribution.useddealer.vehicles["Base.87blazer"] = {index = -1, spawnChance = 15};
	VehicleZoneDistribution.useddealer.vehicles["Base.87c10lb"] = {index = -1, spawnChance = 10};
	VehicleZoneDistribution.useddealer.vehicles["Base.87c10sb"] = {index = -1, spawnChance = 10};
	VehicleZoneDistribution.useddealer.vehicles["Base.87caprice"] = {index = -1, spawnChance = 25};
	VehicleZoneDistribution.useddealer.vehicles["Base.87suburban"] = {index = -1, spawnChance = 15};
	VehicleZoneDistribution.useddealer.vehicles["Base.90corolla"] = {index = -1, spawnChance = 10};
	VehicleZoneDistribution.useddealer.vehicles["Base.90ramlb"] = {index = -1, spawnChance = 10};
	VehicleZoneDistribution.useddealer.vehicles["Base.90ramsb"] = {index = -1, spawnChance = 10};
	VehicleZoneDistribution.useddealer.vehicles["Base.astrovan"] = {index = -1, spawnChance = 10};
	VehicleZoneDistribution.useddealer.vehicles["Base.volvo244"] = {index = -1, spawnChance = 7};
	VehicleZoneDistribution.useddealer.vehicles["Base.91crx"] = {index = -1, spawnChance = 10};
	VehicleZoneDistribution.useddealer.vehicles["Base.92crownvic"] = {index = -1, spawnChance = 15};
	VehicleZoneDistribution.useddealer.vehicles["Base.71chevyc10stepside"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.useddealer.vehicles["Base.71chevyc10lb"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.useddealer.vehicles["Base.71chevyc10sb"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.useddealer.vehicles["Base.91chevys10"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.useddealer.vehicles["Base.91chevys10ext"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.useddealer.vehicles["Base.86montecarlo"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.useddealer.vehicles["Base.91wagoneer"] = {index = -1, spawnChance = 15};
	VehicleZoneDistribution.useddealer.vehicles["Base.86econolinerv"] = {index = -1, spawnChance = 10};

	VehicleZoneDistribution.utility.vehicles["Base.87c10lb"] = {index = -1, spawnChance = 25};
	VehicleZoneDistribution.utility.vehicles["Base.87c10sb"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.utility.vehicles["Base.90ramlb"] = {index = -1, spawnChance = 25};
	VehicleZoneDistribution.utility.vehicles["Base.90ramsb"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.utility.vehicles["Base.91chevys10"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.utility.vehicles["Base.91chevys10ext"] = {index = -1, spawnChance = 25};
	VehicleZoneDistribution.utility.vehicles["Base.80f350"] = {index = -1, spawnChance = 25};
	VehicleZoneDistribution.utility.vehicles["Base.80f350quad"] = {index = -1, spawnChance = 25};
	VehicleZoneDistribution.utility.vehicles["Base.83hilux"] = {index = -1, spawnChance = 15};
	VehicleZoneDistribution.utility.vehicles["Base.51chevy3100"] = {index = -1, spawnChance = 5};
	VehicleZoneDistribution.utility.vehicles["Base.51chevy3100old"] = {index = -1, spawnChance = 5};
	VehicleZoneDistribution.utility.vehicles["Base.70elcamino"] = {index = -1, spawnChance = 7};
	VehicleZoneDistribution.utility.vehicles["Base.86econoline"] = {index = -1, spawnChance = 15};
	VehicleZoneDistribution.utility.vehicles["Base.86econolineflorist"] = {index = -1, spawnChance = 25};
	VehicleZoneDistribution.utility.vehicles["Base.f700propane"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.utility.vehicles["Base.moveurself"] = {index = -1, spawnChance = 5};
	VehicleZoneDistribution.utility.vehicles["Base.Trailermovingmedium"] = {index = -1, spawnChance = 5};
	VehicleZoneDistribution.utility.vehicles["Base.Trailermovingbig"] = {index = -1, spawnChance = 5};
	VehicleZoneDistribution.utility.vehicles["Base.Trailer51chevy"] = {index = -1, spawnChance = 5};
	VehicleZoneDistribution.utility.vehicles["Base.Trailerfuelmedium"] = {index = -1, spawnChance = 5};
	VehicleZoneDistribution.utility.vehicles["Base.Trailerfuelsmall"] = {index = -1, spawnChance = 5};

	VehicleZoneDistribution.commercial.vehicles["Base.isuzubox"] = {index = -1, spawnChance = 30};
	VehicleZoneDistribution.commercial.vehicles["Base.isuzuboxfood"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.commercial.vehicles["Base.isuzuboxmccoy"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.commercial.vehicles["Base.86econoline"] = {index = -1, spawnChance = 15};
	VehicleZoneDistribution.commercial.vehicles["Base.chevystepvan"] = {index = -1, spawnChance = 20};

	VehicleZoneDistribution.commerciallarge.vehicles["Base.isuzubox"] = {index = -1, spawnChance = 15};
	VehicleZoneDistribution.commerciallarge.vehicles["Base.f700box"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.commerciallarge.vehicles["Base.chevystepvan"] = {index = -1, spawnChance = 15};
	VehicleZoneDistribution.commerciallarge.vehicles["Base.f700flatbed"] = {index = -1, spawnChance = 17};
	VehicleZoneDistribution.commerciallarge.vehicles["Base.isuzuboxmccoy"] = {index = -1, spawnChance = 10};

	VehicleZoneDistribution.trailerutility.vehicles["Base.Trailermovingmedium"] = {index = -1, spawnChance = 7};
	VehicleZoneDistribution.trailerutility.vehicles["Base.Trailermovingbig"] = {index = -1, spawnChance = 5};
	VehicleZoneDistribution.trailerutility.vehicles["Base.Trailerfuelsmall"] = {index = -1, spawnChance = 5};
	VehicleZoneDistribution.trailerutility.vehicles["Base.Trailer51chevy"] = {index = -1, spawnChance = 7};
	VehicleZoneDistribution.trailerutility.vehicles["Base.Trailercamperscamp"] = {index = -1, spawnChance = 7};
	
	VehicleZoneDistribution.construction.vehicles["Base.f700dump"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.construction.vehicles["Base.f700propane"] = {index = -1, spawnChance = 10};
	VehicleZoneDistribution.construction.vehicles["Base.isuzuboxmccoy"] = {index = -1, spawnChance = 15};
	
	VehicleZoneDistribution.movers.vehicles["Base.86econoline"] = {index = -1, spawnChance = 10};
	VehicleZoneDistribution.movers.vehicles["Base.moveurself"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.movers.vehicles["Base.Trailermovingbig"] = {index = -1, spawnChance = 15};
	VehicleZoneDistribution.movers.vehicles["Base.Trailermovingmedium"] = {index = -1, spawnChance = 15};
	VehicleZoneDistribution.movers.vehicles["Base.chevystepvan"] = {index = -1, spawnChance = 10};

	VehicleZoneDistribution.racing.vehicles["Base.69chargerdaytona"] = {index = -1, spawnChance = 15};

	VehicleZoneDistribution.policelarge.vehicles["Base.chevystepvanswat"] = {index = -1, spawnChance = 20};

	VehicleZoneDistribution.policeonly.vehicles["Base.85vicsheriff"] = {index = -1, spawnChance = 50};
	VehicleZoneDistribution.policeonly.vehicles["Base.87capricePD"] = {index = -1, spawnChance = 40};
	VehicleZoneDistribution.policeonly.vehicles["Base.91blazerpd"] = {index = -1, spawnChance = 25};
	VehicleZoneDistribution.policeonly.vehicles["Base.92crownvicPD"] = {index = -1, spawnChance = 25};
	VehicleZoneDistribution.policeonly.vehicles["Base.chevystepvanswat"] = {index = -1, spawnChance = 5};

	VehicleZoneDistribution.ambulanceonly.vehicles["Base.80f350ambulance"] = {index = 0, spawnChance = 200};
	VehicleZoneDistribution.ambulanceonly.vehicles["Base.86econolineambulance"] = {index = 0, spawnChance = 150};

	VehicleZoneDistribution.fireonly.vehicles["Base.87c10fire"] = {index = 0, spawnChance = 100};
	VehicleZoneDistribution.fireonly.vehicles["Base.firepumper"] = {index = 0, spawnChance = 50};
	
	VehicleZoneDistribution.firelarge.vehicles["Base.firepumper"] = {index = 0, spawnChance = 100};
	
end

if getActivatedMods():contains("67commando") and VehicleZoneDistribution then

	VehicleZoneDistribution.policelarge.vehicles["Base.67commandoPolice"] = {index = -1, spawnChance = 10};

	VehicleZoneDistribution.policeonly.vehicles["Base.67commandoPolice"] = {index = -1, spawnChance = 3};
	
end

if getActivatedMods():contains("82oshkoshM911") and VehicleZoneDistribution then

	VehicleZoneDistribution.commerciallarge.vehicles["Base.82oshkoshM911"] = {index = -1, spawnChance = 7};
	VehicleZoneDistribution.commerciallarge.vehicles["Base.82oshkoshM911B"] = {index = -1, spawnChance = 9};
	VehicleZoneDistribution.commerciallarge.vehicles["Base.TrailerM127stake"] = {index = -1, spawnChance = 3};
	VehicleZoneDistribution.commerciallarge.vehicles["Base.TrailerM128van"] = {index = -1, spawnChance = 3};
	VehicleZoneDistribution.commerciallarge.vehicles["Base.TrailerM129van"] = {index = -1, spawnChance = 3};
	VehicleZoneDistribution.commerciallarge.vehicles["Base.TrailerM747lowbed"] = {index = -1, spawnChance = 3};
	VehicleZoneDistribution.commerciallarge.vehicles["Base.TrailerM967tanker"] = {index = -1, spawnChance = 2};

	VehicleZoneDistribution.trailerhuge.vehicles["Base.TrailerM127stake"] = {index = -1, spawnChance = 7};
	VehicleZoneDistribution.trailerhuge.vehicles["Base.TrailerM128van"] = {index = -1, spawnChance = 7};
	VehicleZoneDistribution.trailerhuge.vehicles["Base.TrailerM129van"] = {index = -1, spawnChance = 7};
	VehicleZoneDistribution.trailerhuge.vehicles["Base.TrailerM747lowbed"] = {index = -1, spawnChance = 7};
	VehicleZoneDistribution.trailerhuge.vehicles["Base.TrailerM967tanker"] = {index = -1, spawnChance = 3};
	
end

if getActivatedMods():contains("P.A.R.C") and VehicleZoneDistribution then

	VehicleZoneDistribution.commercial.vehicles["Base.GAZEL_VAN"] = {index = -1, spawnChance = 10};
	VehicleZoneDistribution.commercial.vehicles["Base.GAZEL_TENT"] = {index = -1, spawnChance = 10};
	VehicleZoneDistribution.commercial.vehicles["Base.GAZEL"] = {index = -1, spawnChance = 10};

	VehicleZoneDistribution.commerciallarge.vehicles["Base.KAMAZ"] = {index = -1, spawnChance = 10};
	
end

if getActivatedMods():contains("rSemiTruck") and VehicleZoneDistribution then

	VehicleZoneDistribution.commercial.vehicles["Rotators.SemiTruckBox"] = {index = -1, spawnChance = 30};

	VehicleZoneDistribution.commerciallarge.vehicles["Rotators.SemiTruckBox"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.commerciallarge.vehicles["Rotators.SemiTruck"] = {index = -1, spawnChance = 10};
	VehicleZoneDistribution.commerciallarge.vehicles["Rotators.SemiTruckLite"] = {index = -1, spawnChance = 10};
	VehicleZoneDistribution.commerciallarge.vehicles["Rotators.SemiTrailerVan"] = {index = -1, spawnChance = 4};
	VehicleZoneDistribution.commerciallarge.vehicles["Rotators.SemiTrailerCistern"] = {index = -1, spawnChance = 2};

	VehicleZoneDistribution.trailerhuge.vehicles["Rotators.SemiTrailerVan"] = {index = -1, spawnChance = 15};
	VehicleZoneDistribution.trailerhuge.vehicles["Rotators.SemiTrailerCistern"] = {index = -1, spawnChance = 8};
	
end

if getActivatedMods():contains("DeLoreanDMC-12") and VehicleZoneDistribution then

	VehicleZoneDistribution.collectors.vehicles["Base.deloreandmc12"] = {index = -1, spawnChance = 15};
	
end

if getActivatedMods():contains("1989Porsche911Turbo") and VehicleZoneDistribution then

	VehicleZoneDistribution.specialdealer.vehicles["Base.89porshce911turbo"] = {index = -1, spawnChance = 20};

	VehicleZoneDistribution.newdealer.vehicles["Base.89porshce911turbo"] = {index = -1, spawnChance = 10};

	VehicleZoneDistribution.collectors.vehicles["Base.89porshce911turbo"] = {index = -1, spawnChance = 20};
	
end

if getActivatedMods():contains("93lorevehiclepack") and VehicleZoneDistribution then

	VehicleZoneDistribution.collectors.vehicles["Base.93dodgeviper"] = {index = -1, spawnChance = 15};
	VehicleZoneDistribution.collectors.vehicles["Base.92typhoon"] = {index = -1, spawnChance = 10};

	VehicleZoneDistribution.specialdealer.vehicles["Base.93dodgeviper"] = {index = -1, spawnChance = 30};
	VehicleZoneDistribution.specialdealer.vehicles["Base.92typhoon"] = {index = -1, spawnChance = 30};

	VehicleZoneDistribution.newdealer.vehicles["Base.92premiersts"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.newdealer.vehicles["Base.93grandamsedan"] = {index = -1, spawnChance = 25};
	VehicleZoneDistribution.newdealer.vehicles["Base.93fleetwood"] = {index = -1, spawnChance = 25};
	VehicleZoneDistribution.newdealer.vehicles["Base.93markviii"] = {index = -1, spawnChance = 25};
	VehicleZoneDistribution.newdealer.vehicles["Base.93lhs"] = {index = -1, spawnChance = 25};
	VehicleZoneDistribution.newdealer.vehicles["Base.92Jimmy"] = {index = -1, spawnChance = 25};
	VehicleZoneDistribution.newdealer.vehicles["Base.93yukon"] = {index = -1, spawnChance = 25};
	VehicleZoneDistribution.newdealer.vehicles["Base.93tahoe"] = {index = -1, spawnChance = 25};
	VehicleZoneDistribution.newdealer.vehicles["Base.93suburban"] = {index = -1, spawnChance = 25};
	VehicleZoneDistribution.newdealer.vehicles["Base.93gmcsuburban"] = {index = -1, spawnChance = 25};
	VehicleZoneDistribution.newdealer.vehicles["Base.93continental"] = {index = -1, spawnChance = 25};
	VehicleZoneDistribution.newdealer.vehicles["Base.92bronco"] = {index = -1, spawnChance = 25};
	VehicleZoneDistribution.newdealer.vehicles["Base.92typhoon"] = {index = -1, spawnChance = 15};
	VehicleZoneDistribution.newdealer.vehicles["Base.93gmcblazer"] = {index = -1, spawnChance = 25};
	VehicleZoneDistribution.newdealer.vehicles["Base.93blazer"] = {index = -1, spawnChance = 25};
	VehicleZoneDistribution.newdealer.vehicles["Base.93aurora"] = {index = -1, spawnChance = 30};
	VehicleZoneDistribution.newdealer.vehicles["Base.92vision"] = {index = -1, spawnChance = 30};
	VehicleZoneDistribution.newdealer.vehicles["Base.92grandmarquis"] = {index = -1, spawnChance = 30};
	VehicleZoneDistribution.newdealer.vehicles["Base.92intrepid"] = {index = -1, spawnChance = 30};
	VehicleZoneDistribution.newdealer.vehicles["Base.92concord"] = {index = -1, spawnChance = 30};
	VehicleZoneDistribution.newdealer.vehicles["Base.91oldsmobilecustomcrusier"] = {index = -1, spawnChance = 30};
	VehicleZoneDistribution.newdealer.vehicles["Base.91dynasty"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.newdealer.vehicles["Base.91caprice"] = {index = -1, spawnChance = 25};
	VehicleZoneDistribution.newdealer.vehicles["Base.91buickroadmaster"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.newdealer.vehicles["Base.93sevillests"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.newdealer.vehicles["Base.92deville"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.newdealer.vehicles["Base.90crownvictoria"] = {index = -1, spawnChance = 25};
	VehicleZoneDistribution.newdealer.vehicles["Base.90caprice"] = {index = -1, spawnChance = 25};
	VehicleZoneDistribution.newdealer.vehicles["Base.92crownvictoria"] = {index = -1, spawnChance = 25};
	VehicleZoneDistribution.newdealer.vehicles["Base.93crownvictoria"] = {index = -1, spawnChance = 30};
	VehicleZoneDistribution.newdealer.vehicles["Base.93capriceLTZ"] = {index = -1, spawnChance = 30};
	VehicleZoneDistribution.newdealer.vehicles["Base.93capriceclassic"] = {index = -1, spawnChance = 30};
	VehicleZoneDistribution.newdealer.vehicles["Base.93fordthunderbird"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.newdealer.vehicles["Base.93taurus"] = {index = -1, spawnChance = 30};
	VehicleZoneDistribution.newdealer.vehicles["Base.93lumiasedan"] = {index = -1, spawnChance = 25};
	VehicleZoneDistribution.newdealer.vehicles["Base.90regalsedan"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.newdealer.vehicles["Base.90supreme"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.newdealer.vehicles["Base.90tornado"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.newdealer.vehicles["Base.93transam"] = {index = -1, spawnChance = 15};
	VehicleZoneDistribution.newdealer.vehicles["Base.93elderado"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.newdealer.vehicles["Base.92grandprix"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.newdealer.vehicles["Base.90laser"] = {index = -1, spawnChance = 15};
	VehicleZoneDistribution.newdealer.vehicles["Base.92lumiacoupe"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.newdealer.vehicles["Base.93camaro"] = {index = -1, spawnChance = 15};
	VehicleZoneDistribution.newdealer.vehicles["Base.93corvette"] = {index = -1, spawnChance = 15};
	VehicleZoneDistribution.newdealer.vehicles["Base.90beretta"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.newdealer.vehicles["Base.93dodgeviper"] = {index = -1, spawnChance = 10};

	VehicleZoneDistribution.useddealer.vehicles["Base.87fordthunderbird"] = {index = -1, spawnChance = 10};
	VehicleZoneDistribution.useddealer.vehicles["Base.88riviera"] = {index = -1, spawnChance = 10};
	VehicleZoneDistribution.useddealer.vehicles["Base.89fury"] = {index = -1, spawnChance = 10};
	VehicleZoneDistribution.useddealer.vehicles["Base.89diplomat"] = {index = -1, spawnChance = 12};
	VehicleZoneDistribution.useddealer.vehicles["Base.89cougar"] = {index = -1, spawnChance = 12};
	VehicleZoneDistribution.useddealer.vehicles["Base.85delta88"] = {index = -1, spawnChance = 10};
	VehicleZoneDistribution.useddealer.vehicles["Base.85lesabre"] = {index = -1, spawnChance = 15};
	VehicleZoneDistribution.useddealer.vehicles["Base.85fifthavenue"] = {index = -1, spawnChance = 15};
	VehicleZoneDistribution.useddealer.vehicles["Base.85impala"] = {index = -1, spawnChance = 25};
	VehicleZoneDistribution.useddealer.vehicles["Base.90caprice"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.useddealer.vehicles["Base.90crownvictoria"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.useddealer.vehicles["Base.91oldsmobilecustomcrusier"] = {index = -1, spawnChance = 15};
	VehicleZoneDistribution.useddealer.vehicles["Base.93capricewagon"] = {index = -1, spawnChance = 15};
	VehicleZoneDistribution.useddealer.vehicles["Base.90regalsedan"] = {index = -1, spawnChance = 25};
	VehicleZoneDistribution.useddealer.vehicles["Base.93blazer"] = {index = -1, spawnChance = 15};
	VehicleZoneDistribution.useddealer.vehicles["Base.92bronco"] = {index = -1, spawnChance = 15};

	VehicleZoneDistribution.commerciallarge.vehicles["Base.93fl70box"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.commerciallarge.vehicles["Base.87macktrucklflatbed"] = {index = -1, spawnChance = 15};
	VehicleZoneDistribution.commerciallarge.vehicles["Base.87macktruckbox"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.commerciallarge.vehicles["Base.93fl70flatbed"] = {index = -1, spawnChance = 13};

	VehicleZoneDistribution.policelarge.vehicles["Base.87macktruckswat"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.policelarge.vehicles["Base.93FL70swat"] = {index = -1, spawnChance = 20};

	VehicleZoneDistribution.policeonly.vehicles["Base.90crownvictorialtdpolice"] = {index = -1, spawnChance = 50};
	VehicleZoneDistribution.policeonly.vehicles["Base.92crownvictoriap71police"] = {index = -1, spawnChance = 40};
	VehicleZoneDistribution.policeonly.vehicles["Base.93interceptorp71"] = {index = -1, spawnChance = 35};
	VehicleZoneDistribution.policeonly.vehicles["Base.93interceptor2p71"] = {index = -1, spawnChance = 25};
	VehicleZoneDistribution.policeonly.vehicles["Base.87macktruckswat"] = {index = -1, spawnChance = 5};
	VehicleZoneDistribution.policeonly.vehicles["Base.86caprice9c1police"] = {index = -1, spawnChance = 10};
	VehicleZoneDistribution.policeonly.vehicles["Base.90caprice9c1police"] = {index = -1, spawnChance = 10};
	VehicleZoneDistribution.policeonly.vehicles["Base.939c1policecruiser"] = {index = -1, spawnChance = 50};
	VehicleZoneDistribution.policeonly.vehicles["Base.939c1policecruiser2"] = {index = -1, spawnChance = 50};
	VehicleZoneDistribution.policeonly.vehicles["Base.93FL70swat"] = {index = -1, spawnChance = 5};
	VehicleZoneDistribution.policeonly.vehicles["Base.919c1police"] = {index = -1, spawnChance = 50};
	VehicleZoneDistribution.policeonly.vehicles["Base.85impalacruiser"] = {index = -1, spawnChance = 25};
	VehicleZoneDistribution.policeonly.vehicles["Base.85lesabrepolice"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.policeonly.vehicles["Base.85delta88police"] = {index = -1, spawnChance = 40};
	VehicleZoneDistribution.policeonly.vehicles["Base.89diplomatpolice"] = {index = -1, spawnChance = 40};
	VehicleZoneDistribution.policeonly.vehicles["Base.89furypolice"] = {index = -1, spawnChance = 40};
	VehicleZoneDistribution.policeonly.vehicles["Base.93tahoepolice"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.policeonly.vehicles["Base.92intrepidpolice"] = {index = -1, spawnChance = 40};
	VehicleZoneDistribution.policeonly.vehicles["Base.92broncopolice"] = {index = -1, spawnChance = 20};
	VehicleZoneDistribution.policeonly.vehicles["Base.93yukonpolice"] = {index = -1, spawnChance = 20};

	VehicleZoneDistribution.ambulanceonly.vehicles["Base.93frieghtlignerambulance"] = {index = 0, spawnChance = 100};
	VehicleZoneDistribution.ambulanceonly.vehicles["Base.93frieghtlignerambulancefire"] = {index = 0, spawnChance = 100};

	VehicleZoneDistribution.fireonly.vehicles["Base.93frieghtlignerambulancefire"] = {index = 0, spawnChance = 40};
	VehicleZoneDistribution.fireonly.vehicles["Base.939c1fire"] = {index = 0, spawnChance = 50};
	VehicleZoneDistribution.fireonly.vehicles["Base.93capricewagonfire"] = {index = 0, spawnChance = 50};
	
	VehicleZoneDistribution.firelarge.vehicles["Base.93frieghtlignerambulancefire"] = {index = 0, spawnChance = 75};
	
end

if getActivatedMods():contains("RidingMower") and VehicleZoneDistribution then

	VehicleZoneDistribution.vehicletiny.vehicles["Base.RidingMower"] = {index = -1, spawnChance = 50};
	VehicleZoneDistribution.vehicletiny.vehicles["Base.RidingMower_Trailer"] = {index = -1, spawnChance = 20};

	VehicleZoneDistribution.mower.vehicles["Base.RidingMower"] = {index = -1, spawnChance = 50};
	VehicleZoneDistribution.mower.vehicles["Base.RidingMower_Trailer"] = {index = -1, spawnChance = 20};

	VehicleZoneDistribution.trailertiny.vehicles["Base.RidingMower_Trailer"] = {index = -1, spawnChance = 20};
	
end

if getActivatedMods():contains("GoKart") and VehicleZoneDistribution then

VehicleZoneDistribution.vehicletiny.vehicles["Base.GoKart"] = {index = -1, spawnChance = 50};

end

--------Credit to Funnypig for the following mod integrations--------

--------Skizot's Vehicles--------

if getActivatedMods():contains("SprinterAE86") and VehicleZoneDistribution then

    VehicleZoneDistribution.amateurmechanic.vehicles["Base.SprinterAE86"] = {index = -1, spawnChance = 10};
    VehicleZoneDistribution.amateurmechanic.vehicles["Base.SprinterAE86_InitialD"] = {index = -1, spawnChance = 10};

    VehicleZoneDistribution.expocarshow.vehicles["Base.SprinterAE86_InitialD"] = {index = -1, spawnChance = 10};

    VehicleZoneDistribution.import.vehicles["Base.SprinterAE86"] = {index = -1, spawnChance = 10};
end

if getActivatedMods():contains("GarbageTruck") and VehicleZoneDistribution then

    VehicleZoneDistribution.utility.vehicles["Base.GarbageTruck"] = {index = -1, spawnChance = 2};

    VehicleZoneDistribution.commerciallarge.vehicles["Base.GarbageTruck"] = {index = -1, spawnChance = 5};
	
	VehicleZoneDistribution.wasteservice.vehicles["Base.GarbageTruck"] = {index = -1, spawnChance = 20};
end

if getActivatedMods():contains("IceCreamTruckFreezer") and VehicleZoneDistribution then

    VehicleZoneDistribution.commercial.vehicles["Base.StepVanIceCreamFreeze"] = {index = -1, spawnChance = 1};
end

--------Misc Mods--------

if getActivatedMods():contains("toyotasupraa70") and VehicleZoneDistribution then

    VehicleZoneDistribution.newdealer.vehicles["Base.toyotasupraa70"] = {index = -1, spawnChance = 10};
	
	VehicleZoneDistribution.useddealer.vehicles["Base.toyotasupraa70"] = {index = -1, spawnChance = 10};
	
end

if getActivatedMods():contains("rx7fc") and VehicleZoneDistribution then

    VehicleZoneDistribution.newdealer.vehicles["Base.rx7fc"] = {index = -1, spawnChance = 10};
	
	VehicleZoneDistribution.useddealer.vehicles["Base.rx7fc"] = {index = -1, spawnChance = 10};

end

if getActivatedMods():contains("sputnik26") and VehicleZoneDistribution then

    VehicleZoneDistribution.barnfind.vehicles["Base.SputnikSedan"] = {index = -1, spawnChance = 3};
    VehicleZoneDistribution.barnfind.vehicles["Base.SputnikUniversal"] = {index = -1, spawnChance = 2};

    VehicleZoneDistribution.collectors.vehicles["Base.SputnikSedan"] = {index = -1, spawnChance = 1};
    VehicleZoneDistribution.collectors.vehicles["Base.SputnikUniversal"] = {index = -1, spawnChance = 1};

    VehicleZoneDistribution.import.vehicles["Base.SputnikSedan"] = {index = -1, spawnChance = 2};
    VehicleZoneDistribution.import.vehicles["Base.SputnikUniversal"] = {index = -1, spawnChance = 1};
end

if getActivatedMods():contains("T3") and VehicleZoneDistribution then

    VehicleZoneDistribution.amateurmechanic.vehicles["Base.T3"] = {index = -1, spawnChance = 2};
    VehicleZoneDistribution.amateurmechanic.vehicles["Base.T3Cargo"] = {index = -1, spawnChance = 1};
    VehicleZoneDistribution.amateurmechanic.vehicles["Base.T3Roof"] = {index = -1, spawnChance = 1};

    VehicleZoneDistribution.barnfind.vehicles["Base.T3"] = {index = -1, spawnChance = 3};
    VehicleZoneDistribution.barnfind.vehicles["Base.T3Cargo"] = {index = -1, spawnChance = 2};
    VehicleZoneDistribution.barnfind.vehicles["Base.T3Roof"] = {index = -1, spawnChance = 2};

    VehicleZoneDistribution.import.vehicles["Base.T3"] = {index = -1, spawnChance = 2};
    VehicleZoneDistribution.import.vehicles["Base.T3Cargo"] = {index = -1, spawnChance = 1};
    VehicleZoneDistribution.import.vehicles["Base.T3Roof"] = {index = -1, spawnChance = 1};
end

--------ATA and Tsar's--------

if getActivatedMods():contains("ATA_Petyarbuilt") and VehicleZoneDistribution then
    
    VehicleZoneDistribution.commerciallarge.vehicles["Base.ATAPetyarbuilt"] = {index = -1, spawnChance = 10};
    VehicleZoneDistribution.commerciallarge.vehicles["Base.ATAPetyarbuiltSleeper"] = {index = -1, spawnChance = 10};
    VehicleZoneDistribution.commerciallarge.vehicles["Base.ATAPetyarbuiltSleeperLong"] = {index = -1, spawnChance = 10};
end

if getActivatedMods():contains("ATA_Dadge") and VehicleZoneDistribution then

    VehicleZoneDistribution.newdealer.vehicles["Base.ATADodge"] = {index = -1, spawnChance = 10};

    VehicleZoneDistribution.useddealer.vehicles["Base.ATADodge"] = {index = -1, spawnChance = 5};

    VehicleZoneDistribution.racing.vehicles["Base.ATADodgePpg"] = {index = -1, spawnChance = 5};
	
	VehicleZoneDistribution.pacecar.vehicles["Base.ATADodgePpg"] = {index = -1, spawnChance = 20};
end

if getActivatedMods():contains("autotsartrailers") and VehicleZoneDistribution then

    VehicleZoneDistribution.trailerutility.vehicles["Base.TrailerFirst"] = {index = -1, spawnChance = 20};
    VehicleZoneDistribution.trailerutility.vehicles["Base.TrailerSecond"] = {index = -1, spawnChance = 15};
    VehicleZoneDistribution.trailerutility.vehicles["Base.TrailerHome"] = {index = -1, spawnChance = 10};
    VehicleZoneDistribution.trailerutility.vehicles["Base.TrailerHomeHartman"] = {index = -1, spawnChance = 8};
    VehicleZoneDistribution.trailerutility.vehicles["Base.TrailerHomeExplorer"] = {index = -1, spawnChance = 5};
    VehicleZoneDistribution.trailerutility.vehicles["Base.TrailerKbacRSWater"] = {index = -1, spawnChance = 2};
    VehicleZoneDistribution.trailerutility.vehicles["Base.Rotators.TrailerWaterSmall"] = {index = -1, spawnChance = 2};
    VehicleZoneDistribution.trailerutility.vehicles["Base.TrailerGenerator"] = {index = -1, spawnChance = 2};
	
	VehicleZoneDistribution.construction.vehicles["Base.TrailerGenerator"] = {index = -1, spawnChance = 10};
	
end

if getActivatedMods():contains("rWaterTrailer") and VehicleZoneDistribution then

    VehicleZoneDistribution.trailerutility.vehicles["Base.Rotators.TrailerWaterSmall"] = {index = -1, spawnChance = 2};
    VehicleZoneDistribution.trailerutility.vehicles["Base.Rotators.Rotators.TrailerWaterBig"] = {index = -1, spawnChance = 1};
end

--------Danny's--------

if getActivatedMods():contains("1970FordMustangBoss302") and VehicleZoneDistribution then

    VehicleZoneDistribution.barnfind.vehicles["Base.70fordmustang302boss"] = {index = -1, spawnChance = 5};
    VehicleZoneDistribution.barnfind.vehicles["Base.70fordmustang302bossfully"] = {index = -1, spawnChance = 5};

    VehicleZoneDistribution.collectors.vehicles["Base.70fordmustang302boss"] = {index = -1, spawnChance = 5};
    VehicleZoneDistribution.collectors.vehicles["Base.70fordmustang302bossfull"] = {index = -1, spawnChance = 5};

    VehicleZoneDistribution.amateurmechanic.vehicles["Base.70fordmustang302boss"] = {index = -1, spawnChance = 7};
    VehicleZoneDistribution.amateurmechanic.vehicles["Base.70fordmustang302bossfull"] = {index = -1, spawnChance = 7};
end

if getActivatedMods():contains("1969FordMustangBoss429") and VehicleZoneDistribution then

    VehicleZoneDistribution.barnfind.vehicles["Base.fordmustang429boss"] = {index = -1, spawnChance = 2};
    VehicleZoneDistribution.barnfind.vehicles["Base.fordmustang429bossfull"] = {index = -1, spawnChance = 2};
    VehicleZoneDistribution.barnfind.vehicles["Base.fordmustang429bosscheap"] = {index = -1, spawnChance = 2};

    VehicleZoneDistribution.collectors.vehicles["Base.fordmustang429boss"] = {index = -1, spawnChance = 2};
    VehicleZoneDistribution.collectors.vehicles["Base.fordmustang429bossfull"] = {index = -1, spawnChance = 3};

    VehicleZoneDistribution.amateurmechanic.vehicles["Base.fordmustang429boss"] = {index = -1, spawnChance = 2};
    VehicleZoneDistribution.amateurmechanic.vehicles["Base.fordmustang429bossfull"] = {index = -1, spawnChance = 1};
    VehicleZoneDistribution.amateurmechanic.vehicles["Base.fordmustang429bosscheap"] = {index = -1, spawnChance = 3};
end

if getActivatedMods():contains("1967ChevroletImpala") and VehicleZoneDistribution then

    VehicleZoneDistribution.barnfind.vehicles["Base.67chevroletimpala"] = {index = -1, spawnChance = 10};

    VehicleZoneDistribution.collectors.vehicles["Base.67chevroletimpala"] = {index = -1, spawnChance = 5};

    VehicleZoneDistribution.amateurmechanic.vehicles["Base.67chevroletimpala"] = {index = -1, spawnChance = 5};
end

if getActivatedMods():contains("1967ChevroletImpalaStationWagon") and VehicleZoneDistribution then

    VehicleZoneDistribution.barnfind.vehicles["Base.67chevroletimpalaSW"] = {index = -1, spawnChance = 2};
    VehicleZoneDistribution.barnfind.vehicles["Base.67chevroletimpalaSWRR"] = {index = -1, spawnChance = 2};
    VehicleZoneDistribution.barnfind.vehicles["Base.67chevroletimpalaSWItems"] = {index = -1, spawnChance = 2};

    VehicleZoneDistribution.amateurmechanic.vehicles["Base.67chevroletimpalaSW"] = {index = -1, spawnChance = 2};
    VehicleZoneDistribution.amateurmechanic.vehicles["Base.67chevroletimpalaSWRR"] = {index = -1, spawnChance = 2};
    VehicleZoneDistribution.amateurmechanic.vehicles["Base.67chevroletimpalaSWItems"] = {index = -1, spawnChance = 2};
end

--------KI5's--------

if getActivatedMods():contains("59meteor") and VehicleZoneDistribution then

    VehicleZoneDistribution.collectors.vehicles["Base.59meteor"] = {index = -1, spawnChance = 15};
    VehicleZoneDistribution.collectors.vehicles["Base.59ambulance"] = {index = -1, spawnChance = 10};

    VehicleZoneDistribution.expocarshow.vehicles["Base.59meteor"] = {index = -1, spawnChance = 5};
    VehicleZoneDistribution.expocarshow.vehicles["Base.59ambulance"] = {index = -1, spawnChance = 5};

    VehicleZoneDistribution.barnfind.vehicles["Base.59meteor"] = {index = -1, spawnChance = 10};
    VehicleZoneDistribution.barnfind.vehicles["Base.59ambulance"] = {index = -1, spawnChance = 10};
end

if getActivatedMods():contains("ECTO1") and VehicleZoneDistribution then

    VehicleZoneDistribution.expocarshow.vehicles["Base.ECTO1"] = {index = -1, spawnChance = 10};
	
	VehicleZoneDistribution.specialdealer.vehicles["Base.ECTO1"] = {index = -1, spawnChance = 3};
	
end

if getActivatedMods():contains("84merc") and VehicleZoneDistribution then

    VehicleZoneDistribution.collectors.vehicles["Base.84mercSWB"] = {index = -1, spawnChance = 2};
    VehicleZoneDistribution.collectors.vehicles["Base.84mercLWB2"] = {index = -1, spawnChance = 2};
    VehicleZoneDistribution.collectors.vehicles["Base.84mercLWB4"] = {index = -1, spawnChance = 2};

    VehicleZoneDistribution.import.vehicles["Base.84mercSWB"] = {index = -1, spawnChance = 5};
    VehicleZoneDistribution.import.vehicles["Base.84mercLWB2"] = {index = -1, spawnChance = 5};
    VehicleZoneDistribution.import.vehicles["Base.84mercLWB4"] = {index = -1, spawnChance = 5};

    VehicleZoneDistribution.useddealer.vehicles["Base.84mercSWB"] = {index = -1, spawnChance = 5};
    VehicleZoneDistribution.useddealer.vehicles["Base.84mercLWB2"] = {index = -1, spawnChance = 5};
    VehicleZoneDistribution.useddealer.vehicles["Base.84mercLWB4"] = {index = -1, spawnChance = 5};
	
end

if getActivatedMods():contains("85merc") and VehicleZoneDistribution then

    VehicleZoneDistribution.collectors.vehicles["Base.85mercSedan"] = {index = -1, spawnChance = 2};
    VehicleZoneDistribution.collectors.vehicles["Base.85mercWagon"] = {index = -1, spawnChance = 2};
    VehicleZoneDistribution.collectors.vehicles["Base.85mercWagon2"] = {index = -1, spawnChance = 2};

    VehicleZoneDistribution.import.vehicles["Base.85mercSedan"] = {index = -1, spawnChance = 5};
    VehicleZoneDistribution.import.vehicles["Base.85mercWagon"] = {index = -1, spawnChance = 5};
    VehicleZoneDistribution.import.vehicles["Base.85mercWagon2"] = {index = -1, spawnChance = 5};

    VehicleZoneDistribution.useddealer.vehicles["Base.85mercSedan"] = {index = -1, spawnChance = 5};
    VehicleZoneDistribution.useddealer.vehicles["Base.85mercWagon"] = {index = -1, spawnChance = 5};
    VehicleZoneDistribution.useddealer.vehicles["Base.85mercWagon2"] = {index = -1, spawnChance = 5};
	
end

if getActivatedMods():contains("87cruiser") and VehicleZoneDistribution then

    VehicleZoneDistribution.useddealer.vehicles["Base.87cruiserLights"] = {index = -1, spawnChance = 10};
    VehicleZoneDistribution.useddealer.vehicles["Base.87cruiserRoofrack"] = {index = -1, spawnChance = 10};
	
end

if getActivatedMods():contains("88golfMk2") and VehicleZoneDistribution then

    VehicleZoneDistribution.useddealer.vehicles["Base.88golf2doorMk2"] = {index = -1, spawnChance = 10};
    VehicleZoneDistribution.useddealer.vehicles["Base.88golf4doorMk2"] = {index = -1, spawnChance = 10};
	
end

if getActivatedMods():contains("88jettaMk2") and VehicleZoneDistribution then

    VehicleZoneDistribution.useddealer.vehicles["Base.88jetta2doorMk2"] = {index = -1, spawnChance = 10};
    VehicleZoneDistribution.useddealer.vehicles["Base.88jetta4doorMk2"] = {index = -1, spawnChance = 10};
	
end

if getActivatedMods():contains("89def90") and VehicleZoneDistribution then

    VehicleZoneDistribution.collectors.vehicles["Base.89def90"] = {index = -1, spawnChance = 5};

    VehicleZoneDistribution.import.vehicles["Base.89def90"] = {index = -1, spawnChance = 5};

    VehicleZoneDistribution.useddealer.vehicles["Base.89def90"] = {index = -1, spawnChance = 5};
	
end

if getActivatedMods():contains("89def110") and VehicleZoneDistribution then

    VehicleZoneDistribution.collectors.vehicles["Base.89def110"] = {index = -1, spawnChance = 5};
    VehicleZoneDistribution.collectors.vehicles["Base.89def110op"] = {index = -1, spawnChance = 5};

    VehicleZoneDistribution.import.vehicles["Base.89def110"] = {index = -1, spawnChance = 5};
    VehicleZoneDistribution.import.vehicles["Base.89def110op"] = {index = -1, spawnChance = 5};

    VehicleZoneDistribution.useddealer.vehicles["Base.89def110"] = {index = -1, spawnChance = 5};
    VehicleZoneDistribution.useddealer.vehicles["Base.89def110op"] = {index = -1, spawnChance = 5};
	
end

if getActivatedMods():contains("90niva") and VehicleZoneDistribution then

    VehicleZoneDistribution.import.vehicles["Base.90niva"] = {index = -1, spawnChance = 5};
end

if getActivatedMods():contains("91range") and VehicleZoneDistribution then

    VehicleZoneDistribution.collectors.vehicles["Base.91range"] = {index = -1, spawnChance = 5};
    VehicleZoneDistribution.collectors.vehicles["Base.91range2"] = {index = -1, spawnChance = 5};

    VehicleZoneDistribution.import.vehicles["Base.91range"] = {index = -1, spawnChance = 5};
    VehicleZoneDistribution.import.vehicles["Base.91range2"] = {index = -1, spawnChance = 5};

    VehicleZoneDistribution.useddealer.vehicles["Base.91range"] = {index = -1, spawnChance = 5};
    VehicleZoneDistribution.useddealer.vehicles["Base.91range2"] = {index = -1, spawnChance = 5};
end

if getActivatedMods():contains("amclub") and VehicleZoneDistribution then

    VehicleZoneDistribution.barnfind.vehicles["Base.AMC_bmw_classic"] = {index = -1, spawnChance = 10};
    VehicleZoneDistribution.barnfind.vehicles["Base.AMC_bmw_custom"] = {index = -1, spawnChance = 1};
    VehicleZoneDistribution.barnfind.vehicles["Base.AMC_harley"] = {index = -1, spawnChance = 10};

    VehicleZoneDistribution.collectors.vehicles["Base.AMC_bmw_classic"] = {index = -1, spawnChance = 5};
    VehicleZoneDistribution.collectors.vehicles["Base.AMC_bmw_custom"] = {index = -1, spawnChance = 3};
    VehicleZoneDistribution.collectors.vehicles["Base.AMC_harley"] = {index = -1, spawnChance = 10};

    VehicleZoneDistribution.racing.vehicles["Base.AMC_bmw_custom"] = {index = -1, spawnChance = 5};

    VehicleZoneDistribution.import.vehicles["Base.AMC_bmw_classic"] = {index = -1, spawnChance = 10};

    VehicleZoneDistribution.useddealer.vehicles["Base.AMC_bmw_classic"] = {index = -1, spawnChance = 5};
    VehicleZoneDistribution.useddealer.vehicles["Base.AMC_harley"] = {index = -1, spawnChance = 5};
	
end

--------cyt and Shark's--------

if getActivatedMods():contains("SL500") and VehicleZoneDistribution then

    VehicleZoneDistribution.collectors.vehicles["Base.SL500"] = {index = -1, spawnChance = 2};

    VehicleZoneDistribution.specialdealer.vehicles["Base.SL500"] = {index = -1, spawnChance = 20};

    VehicleZoneDistribution.newdealer.vehicles["Base.SL500"] = {index = -1, spawnChance = 10};
	
end

if getActivatedMods():contains("290GD") and VehicleZoneDistribution then

    VehicleZoneDistribution.collectors.vehicles["Base.290D2Door"] = {index = -1, spawnChance = 1};
    VehicleZoneDistribution.collectors.vehicles["Base.290D2DoorSmall"] = {index = -1, spawnChance = 1};
    VehicleZoneDistribution.collectors.vehicles["Base.290GD4Door"] = {index = -1, spawnChance = 1};
    VehicleZoneDistribution.collectors.vehicles["Base.290GDOpenTop"] = {index = -1, spawnChance = 1};

    VehicleZoneDistribution.import.vehicles["Base.290D2Door"] = {index = -1, spawnChance = 2};
    VehicleZoneDistribution.import.vehicles["Base.290D2DoorSmall"] = {index = -1, spawnChance = 2};
    VehicleZoneDistribution.import.vehicles["Base.290GD4Door"] = {index = -1, spawnChance = 2};
    VehicleZoneDistribution.import.vehicles["Base.290GDOpenTop"] = {index = -1, spawnChance = 2};

    VehicleZoneDistribution.newdealer.vehicles["Base.290D2Door"] = {index = -1, spawnChance = 10};
    VehicleZoneDistribution.newdealer.vehicles["Base.290D2DoorSmall"] = {index = -1, spawnChance = 10};
    VehicleZoneDistribution.newdealer.vehicles["Base.290GD4Door"] = {index = -1, spawnChance = 10};
    VehicleZoneDistribution.newdealer.vehicles["Base.290GDOpenTop"] = {index = -1, spawnChance = 10};
end

if getActivatedMods():contains("GWagen") and VehicleZoneDistribution then

    VehicleZoneDistribution.collectors.vehicles["Base.GWagen"] = {index = -1, spawnChance = 1};
    VehicleZoneDistribution.collectors.vehicles["Base.GWagen2"] = {index = -1, spawnChance = 1};

    VehicleZoneDistribution.import.vehicles["Base.GWagen"] = {index = -1, spawnChance = 2};
    VehicleZoneDistribution.import.vehicles["Base.GWagen2"] = {index = -1, spawnChance = 2};

    VehicleZoneDistribution.newdealer.vehicles["Base.GWagen"] = {index = -1, spawnChance = 10};
    VehicleZoneDistribution.newdealer.vehicles["Base.GWagen2"] = {index = -1, spawnChance = 10};
	
end

if getActivatedMods():contains("FJ75C") and VehicleZoneDistribution then

    VehicleZoneDistribution.newdealer.vehicles["Base.FJ75PC"] = {index = -1, spawnChance = 15};

    VehicleZoneDistribution.useddealer.vehicles["Base.FJ75PC"] = {index = -1, spawnChance = 5};
end

if getActivatedMods():contains("SCKCO") and VehicleZoneDistribution then

    VehicleZoneDistribution.newdealer.vehicles["Base.SC_BlazerSCCiv"] = {index = -1, spawnChance = 15};
    VehicleZoneDistribution.newdealer.vehicles["Base.SC_K5BlazerCiv"] = {index = -1, spawnChance = 15};


    VehicleZoneDistribution.useddealer.vehicles["Base.SC_FordCountrySquire"] = {index = -1, spawnChance = 15};
    VehicleZoneDistribution.useddealer.vehicles["Base.SC_CapriceCiv"] = {index = -1, spawnChance = 25};
    VehicleZoneDistribution.useddealer.vehicles["Base.SC_BlazerSCCiv"] = {index = -1, spawnChance = 15};
    VehicleZoneDistribution.useddealer.vehicles["Base.SC_K5BlazerCiv"] = {index = -1, spawnChance = 15};

    VehicleZoneDistribution.policelarge.vehicles["Base.SC_StepVanP30Police"] = {index = -1, spawnChance = 20};

    VehicleZoneDistribution.policeonly.vehicles["Base.Base.SC_Caprice9C1LVPD"] = {index = -1, spawnChance = 10};
    VehicleZoneDistribution.policeonly.vehicles["Base.Base.SC_Caprice9C1StatePolice"] = {index = -1, spawnChance = 5};
    VehicleZoneDistribution.policeonly.vehicles["Base.Base.SC_CrownVictoriaLVPD"] = {index = -1, spawnChance = 10};
    VehicleZoneDistribution.policeonly.vehicles["Base.Base.SC_CrownVictoriaStatePolice"] = {index = -1, spawnChance = 5};

    VehicleZoneDistribution.fireonly.vehicles["Base.SC_CrownFireCoach "] = {index = 0, spawnChance = 100};
	
	VehicleZoneDistribution.firelarge.vehicles["Base.SC_CrownFireCoach "] = {index = 0, spawnChance = 100};
end