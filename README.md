1. Plik dockerfile zawarty jest w tym repozytorium

2. Polecenie budowy obrazu 
    docker build --build-arg VERSION=2.4.0 -t readyapp:2.4.0 .

3. Polecenie uruchamiające serwer
    a) polecenie uruchomienia kontenera
        docker run -d -p 3000:8080 readyapp:2.4.0

    b) polecenie uruchamiające serwer node zawarte w pliku Dockerfile
        CMD [ "sh", "-c", "nginx & node /app/index.js"] 

4. Polecenie potwierdzające działanie kontenera i poprawne funkcjonowanie aplikacji
    a) polecenie "docker ps" wyświetla informacje "healthy"
    b) nalezy wpisac w adres przegladarki http://localhost:3000

5. Zrzut ekranu przegladarki internetowej zawarty jako oddzielny plik w tym repozytorium