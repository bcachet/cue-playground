package resources

#Probe: {
	...
}

#Env: {
	...
}

#File: {
	data!: string
	destination!: string
}

#Service: {
	image!: #Image
	args?: {...}
	env?: [...#Env]
	files?: [...#File]
	
	probes? : {
		health?: #Probe
		ready?: #Probe
	}
}
