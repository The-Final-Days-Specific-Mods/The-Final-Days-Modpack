xof 0303txt 0032

Frame Root {
  FrameTransformMatrix {
     1.000000, 0.000000, 0.000000, 0.000000,
     0.000000, 1.000000, 0.000000, 0.000000,
     0.000000, 0.000000, 1.000000, 0.000000,
     0.000000, 0.000000, 0.000000, 1.000000;;
  }
  Frame Cube {
    FrameTransformMatrix {
       1.000000, 0.000000, 0.000000, 0.000000,
       0.000000, 1.000000, 0.000000, 0.000000,
       0.000000, 0.000000, 1.000000, 0.000000,
       0.000000, 0.000000, 0.000000, 1.000000;;
    }
    Mesh { // Cube mesh
      8;
      -0.008000;-0.000002; 0.073338;,
      -0.008000;-0.004877; 0.113040;,
      -0.008000; 0.029774; 0.076994;,
      -0.008000; 0.024899; 0.116696;,
       0.008000;-0.000002; 0.073338;,
       0.008000;-0.004877; 0.113040;,
       0.008000; 0.029774; 0.076994;,
       0.008000; 0.024899; 0.116696;;
      6;
      4;0,1,3,2;,
      4;2,3,7,6;,
      4;6,7,5,4;,
      4;4,5,1,0;,
      4;2,6,4,0;,
      4;7,3,1,5;;
      MeshNormals { // Cube normals
        6;
        -1.000000;-0.000000; 0.000000;,
         0.000000; 0.992546; 0.121869;,
         1.000000;-0.000000; 0.000000;,
         0.000000;-0.992546;-0.121869;,
         0.000000; 0.121869;-0.992546;,
         0.000000;-0.121869; 0.992546;;
        6;
        4;0,0,0,0;,
        4;1,1,1,1;,
        4;2,2,2,2;,
        4;3,3,3,3;,
        4;4,4,4,4;,
        4;5,5,5,5;;
      } // End of Cube normals
    } // End of Cube mesh
  } // End of Cube
} // End of Root
