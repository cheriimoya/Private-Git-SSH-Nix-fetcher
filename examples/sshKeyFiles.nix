{ pkgs, ... }:
{
  key1 = pkgs.writeTextFile {
    name = "Key 1 for project xyz";
    text = ''
      -----BEGIN OPENSSH PRIVATE KEY-----
      b3BlbnNzaC1rZXktdjEAAAAABG5vbmUAAAAEbm9uZQAAAAAAAAABAAAAMwAAAAtzc2gtZW
      QyNTUxOQAAACB1e2DEEU6t4oonSwGm4sFiZMBQ5gqQO7ngCzIh5WGqsAAAAJA17s0iNe7N
      IgAAAAtzc2gtZWQyNTUxOQAAACB1e2DEEU6t4oonSwGm4sFiZMBQ5gqQO7ngCzIh5WGqsA
      AAAEBj0gx0vn4RbsEWTbhJAB3VDtBk+4De+iA/QQrgB+8xiHV7YMQRTq3iiidLAabiwWJk
      wFDmCpA7ueALMiHlYaqwAAAADG1heEBwYXVsYW5lcgE=
      -----END OPENSSH PRIVATE KEY-----
    '';
  };
}
