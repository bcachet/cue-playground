package resources

#Service: {
	image!: #Image
	args?: [...#Arg]
}

#Arg: {
	name!:  string
	value!: string
}
