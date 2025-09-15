package resources

#Probe: {
	...
}

#Env: {
	...
}

#Service: {
	image!: #Image
	env?: [...#Env]
	
	probes? : {
		health?: #Probe
		ready?: #Probe
	}
}
