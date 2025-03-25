package sql_injection

import (
	"database/sql"
	"fmt"
	"log"
	"os"

	_ "github.com/go-sql-driver/mysql"
	"github.com/joho/godotenv"
)

func Print_User(user string) {

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

	// Iteramos sobre los resultados de la consulta
	rows, err := db.Query("SELECT user_id, name, email FROM users WHERE name = ?", user)
	if err != nil {
		log.Fatal("Error querying the database", err)
	}

	fmt.Println("Query: SELECT user_id, name, email FROM users WHERE name = ?", user)

	defer rows.Close()

	fmt.Println("\nList of users:")
	for rows.Next() {
		var user_id int
		var name string
		var email sql.NullString // Permite manejar valores nulos en email

		// Escanear los valores de cada fila
		if err := rows.Scan(&user_id, &name, &email); err != nil {
			log.Fatal("Error scanning row", err)
		}

		// Si el email es NULL, asignamos un valor por defecto
		emailValue := email.String
		if !email.Valid {
			emailValue = "(without email)"
		}

		// Imprimir los datos del usuario
		fmt.Printf("ID: %d | Username: %s | Email: %s\n", user_id, name, emailValue)
	}

	// Verificar si hubo errores durante la iteración
	if err := rows.Err(); err != nil {
		log.Fatal("Error iterating over rows", err)
	}

}
