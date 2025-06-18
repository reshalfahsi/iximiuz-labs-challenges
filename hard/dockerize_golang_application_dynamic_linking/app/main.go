package main

import (
        "database/sql"
        "log"
        "net/http"
        "os"
        "path/filepath"
        "strconv"

        "app/routes"
        "app/routes/api"
)

var db *sql.DB

func initDB() error {
        var err error
        db, err = sql.Open("sqlite3", "visitors.db")
        if err != nil {
                return err
        }

        // Create visitors table if it doesn't exist
        if _, err := db.Exec(`
                CREATE TABLE IF NOT EXISTS visitors (
                        count INTEGER NOT NULL DEFAULT 0
                )
        `); err != nil {
                return err
        }

        // Insert initial count if table is empty
        if _, err := db.Exec(`
                INSERT OR IGNORE INTO visitors (rowid, count)
                SELECT 1, 0 WHERE NOT EXISTS (SELECT 1 FROM visitors)
        `); err != nil {
                return err
        }

        return nil
}

func main() {
        tempDir, err := os.MkdirTemp("", "app-")
        if err != nil {
                log.Fatalf("Could not create temp directory: %v", err)
        }

        pidFilePath := filepath.Join(tempDir, "app.pid")
        pid := strconv.Itoa(os.Getpid())
        if err := os.WriteFile(pidFilePath, []byte(pid), 0644); err != nil {
                log.Fatalf("Could not write PID file: %v", err)
        }

        log.Printf("Created temp dir: %s and wrote PID: %s", tempDir, pid)

        if err := initDB(); err != nil {
                log.Fatalf("Could not initialize database: %v", err)
        }

        mux := http.NewServeMux()

        mux.HandleFunc("/", routes.Index(db))

        mux.HandleFunc("/api/handler-cd4777b61971f77231cb", api.Handlercd4777b61971f77231cb)
        mux.HandleFunc("/api/handler-1857e6190bee3b26437c", api.Handler1857e6190bee3b26437c)
        mux.HandleFunc("/api/handler-f7d1b8e7619972664624", api.Handlerf7d1b8e7619972664624)
        mux.HandleFunc("/api/handler-60405faddee1a9dea54b", api.Handler60405faddee1a9dea54b)
        mux.HandleFunc("/api/handler-9efcfdb0b7d59d1e1f94", api.Handler9efcfdb0b7d59d1e1f94)

        fs := http.FileServer(http.Dir("static"))
        mux.Handle("/static/", http.StripPrefix("/static/", fs))

        port := os.Getenv("PORT")
        if port == "" {
                port = "3000"
        }

        log.Printf("Server listening on port %s...", port)
        if err := http.ListenAndServe(":"+port, mux); err != nil {
                log.Fatal(err)
        }
}