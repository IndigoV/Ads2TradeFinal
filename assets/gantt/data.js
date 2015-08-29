var ganttData = [
	{
		id: 1, name: "246452 Hans Schoeman Street...", series: [
			{ name: "Reserved", start: new Date(2015,00,01), end: new Date(2015,00,06), color: "yellow" },
			{ name: "Booked", start: new Date(2015,00,06), end: new Date(2015,00,15), color: "blue" },
			{ name: "Available", start: new Date(2015,00,16), end: new Date(2015,00,30), color: "green" }
		]
	}, 
	{
		id: 2, name: "246453 Hans Schoeman Street...", series: [
			{ name: "Unavailable", start: new Date(2015,00,05), end: new Date(2015,00,20), color: "grey" },
			{ name: "Reserved", start: new Date(2015,00,06), end: new Date(2015,00,17), color: "yellow" },
			{ name: "Running", start: new Date(2015,00,06), end: new Date(2015,00,17), color: "red" }
		]
	}, 
	{
		id: 3, name: "246454 Hans Schoeman Street...", series: [
			{ name: "Unavailable", start: new Date(2015,00,11), end: new Date(2015,01,03), color: "grey" },
			{ name: "Running", start: new Date(2015,00,15), end: new Date(2015,01,03), color: "red" }
		]
	}, 
	{
		id: 4, name: "246455 Hans Schoeman Street...", series: [
			{ name: "Reserved", start: new Date(2015,01,01), end: new Date(2015,01,03), color: "yellow" },
			{ name: "Running", start: new Date(2015,01,01), end: new Date(2015,01,05), color: "red" }
		]
	},
	{
		id: 5, name: "Campaign 5", series: [
			{ name: "Reserved", start: new Date(2015,02,01), end: new Date(2015,03,20) },
			{ name: "Running", start: new Date(2015,02,01), end: new Date(2015,03,26), color: "#f0f0f0" }
		]
	}, 
	{
		id: 6, name: "Campaign 6", series: [
			{ name: "Reserved", start: new Date(2015,00,05), end: new Date(2015,00,20) },
			{ name: "Running", start: new Date(2015,00,06), end: new Date(2015,00,17), color: "#f0f0f0" },
			{ name: "Projected", start: new Date(2015,00,06), end: new Date(2015,00,20), color: "#e0e0e0" }
		]
	}, 
	{
		id: 7, name: "Campaign 7", series: [
			{ name: "Reserved", start: new Date(2015,00,11), end: new Date(2015,01,03) }
		]
	}, 
	{
		id: 8, name: "Campaign 8", series: [
			{ name: "Reserved", start: new Date(2015,01,01), end: new Date(2015,01,03) },
			{ name: "Running", start: new Date(2015,01,01), end: new Date(2015,01,05), color: "#f0f0f0" }
		]
	}
];