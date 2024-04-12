1. Plik dockerfile zawarty jest w tym repozytorium

2. Polecenie budowy obrazu 
    docker build --secret id=ssh,src=id_ed25519 --progress=plain -t lab6 .

Niestety podczas budowania obrazu otrzymuję błąd:
Dockerfile:13
--------------------
  11 |     # RUN ssh-add ~/.ssh/id_ed25519
  12 |
  13 | >>>  RUN git clone git@github.com:BartoszSkowyra22/pawcho6.git .
  14 |
  15 |     # Etap 1 - Budowanie obrazu opartego o scratch
--------------------
ERROR: failed to solve: process "/bin/sh -c git clone git@github.com:BartoszSkowyra22/pawcho6.git ." did not complete successfully: exit code: 128