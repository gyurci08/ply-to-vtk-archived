BEGIN{

}

# Loop

/^element vertex/ { vertices = $3 }
/^element face/ { faces = $3 }

{
	if ($1 == "end_header")
		{
			#getline;
			#printf("Vertices: %d, Faces: %d\n", vertices, faces);

			printf("# vtk DataFile Version 2.0\nASCII\nDATASET POLYDATA\n");
			printf("POINTS %d float\n",vertices);

			i = 0;
			while (i<vertices)
			{
				getline;
				if ($0 == "" || $0 == "#")
				{
					# Nothing
				}
				else
				{
					print $1, $2, $3;
					i++;
				}
			}
	
			printf("POLYGONS %d 3\n", faces);

			i = 0;
         	while (i<faces)
            {
                getline;
                if ($0 == "")
                {
                    # Nothing
                }
                else
                {
                    print $1, $2, $3;
                    i++;
                }
            }


			exit;
		}
}


END{

}
