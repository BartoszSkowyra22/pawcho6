1. Plik dockerfile zawarty jest w tym repozytorium

2. Polecenie budowy obrazu 
    docker build --secret id=ssh,src=id_ed25519 --progress=plain -t lab6 .

Niestety podczas budowania obrazu otrzymuję błąd, pomimo i uprawnienia dostępu są prawidłowe i repozytorium istnieje:


 > [clone 6/6] RUN git clone git@github.com:BartoszSkowyra22/pawcho6.git:
0.208 Cloning into 'pawcho6'...
0.588 Host key verification failed.
0.589 fatal: Could not read from remote repository.
0.589
0.589 Please make sure you have the correct access rights
0.589 and the repository exists.
------
Dockerfile:13
--------------------
  11 |     # RUN ssh-add ~/.ssh/id_ed25519
  12 |
  13 | >>>  RUN git clone git@github.com:BartoszSkowyra22/pawcho6.git .
  14 |
  15 |     # Etap 1 - Budowanie obrazu opartego o scratch
--------------------
ERROR: failed to solve: process "/bin/sh -c git clone git@github.com:BartoszSkowyra22/pawcho6.git ." did not complete successfully: exit code: 128