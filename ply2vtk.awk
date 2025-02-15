BEGIN{
# Initialize: Runs once on startup
}

# Loop:

/^ply/ {format = $1}																# Loading the format of the file
/^element vertex/ { vertices = $3 }													# The number of vertices
/^element face/ { faces = $3 }														# The number of faces

(format == "ply" && $1 == "end_header"){
	printf("# vtk DataFile Version 2.0\nASCII\nDATASET POLYDATA\n");
	printf("POINTS %d float\n",vertices);

    i = 0;
    while (i<vertices)
    {
        getline;																	# Moves on the next line
        if (!/^#/ && NF > 0)                                                        # Checking if line is empty or commented
            {
                print $1, $2, $3;
                i++;
            }
    }

	
	printf("POLYGONS %d 3\n", faces);												# The number "3" is there, because this program is for triangles

    i = 0;
    while (i<faces)
    {
    	getline;
        if (!/^#/ && NF > 0)                                                		# Checking if line is empty or commented
        	{
            	print $1, $2, $3;
                i++;
            }
    }



	exit;																			# Exiting after values printed
}


END{
# End: Runs once on exit
}
