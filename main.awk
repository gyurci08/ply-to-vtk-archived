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

			printf("# vtk DataFile Version 2.0\n");
			printf("ASCII\n");
			printf("DATASET POLYDATA\n");
			printf("POINTS %d float\n",vertices);

			for (i=0; i<vertices;i++)
			{
				getline;
				print $1, $2, $3;
			}
	
			printf("POLYGONS %d 3\n", faces);

            for (i=0; i<faces;i++)
            {
                getline;
                print $1, $2, $3;
            }


			
		}
}


END{

}
