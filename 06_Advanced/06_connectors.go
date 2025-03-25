package main

import (
	"fmt"
	"log"
	"database/sql"
	"os"

	"github.com/joho/godotenv"
	_ "github.com/go-sql-driver/mysql"
)


func main() {

	// Cargar variables de entorno desde el archivo .env
	err := godotenv.Load()
	if err != nil {
		log.Fatal("Error loading .env file")
	}

	// Obtener las variables de entorno
	dbUser := os.Getenv("DB_USER")
	dbPassword := os.Getenv("DB_PASSWORD")
	dbHost := os.Getenv("DB_HOST")
	dbPort := os.Getenv("DB_PORT")
	dbName := os.Getenv("DB_NAME")

	// Configuración de la conexión (usuario:contraseña@tcp(host:puerto)/nombre_base_datos)
	dsn := fmt.Sprintf("%s:%s@tcp(%s:%s)/%s", dbUser, dbPassword, dbHost, dbPort, dbName) 

	// Abrir la conexión a la base de datos
	db, err := sql.Open("mysql", dsn)
	if err != nil {
		log.Fatal("Error opening the database", err)
	}

	defer db.Close()

	// Verificar la conexión
	err = db.Ping()
	if err != nil {
		log.Fatal("Error connecting to the database", err)
	}

	fmt.Println("Connected to the database successfully!")

}