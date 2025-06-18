package routes

import (
        "database/sql"
        "html/template"
        "log"
        "net/http"
        "path/filepath"

        _ "github.com/mattn/go-sqlite3"
)

var indexTmpl = template.Must(
        template.ParseFiles(filepath.Join("templates", "index.html")),
)

func Index(db *sql.DB) func(w http.ResponseWriter, r *http.Request) {
        return func(w http.ResponseWriter, r *http.Request) {
                w.Header().Set("Content-Type", "text/html; charset=utf-8")

                // Increment visitor count
                if _, err := db.Exec("UPDATE visitors SET count = count + 1 WHERE rowid = 1"); err != nil {
                        log.Printf("Failed to update visitor count: %v", err)
                        http.Error(w, "Internal Server Error", http.StatusInternalServerError)
                        return
                }

                // Get current count
                var count int
                if err := db.QueryRow("SELECT count FROM visitors WHERE rowid = 1").Scan(&count); err != nil {
                        log.Printf("Failed to get visitor count: %v", err)
                        http.Error(w, "Internal Server Error", http.StatusInternalServerError)
                        return
                }

                if err := indexTmpl.Execute(w, map[string]int{"VisitorCount": count}); err != nil {
                        log.Printf("Template execution error: %v", err)
                        http.Error(w, "Internal Server Error", http.StatusInternalServerError)
                        return
                }

                log.Printf("%s HTTP %s %s (visitor #%d)", r.RemoteAddr, r.Method, r.URL, count)
        }
}