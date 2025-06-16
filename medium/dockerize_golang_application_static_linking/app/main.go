package main

import (
        "log"
        "net/http"
        "os"
        "path/filepath"
        "strconv"

        "app/routes"
        "app/routes/api"
)

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

        mux := http.NewServeMux()

        mux.HandleFunc("/", routes.Index)

        mux.HandleFunc("/api/handler-737232eee3357b49c335", api.Handler737232eee3357b49c335)
        mux.HandleFunc("/api/handler-f41044a34bd9756ba27c", api.Handlerf41044a34bd9756ba27c)
        mux.HandleFunc("/api/handler-50b078581664718404ff", api.Handler50b078581664718404ff)
        mux.HandleFunc("/api/handler-8b4a8ceb339bd38551bd", api.Handler8b4a8ceb339bd38551bd)
        mux.HandleFunc("/api/handler-c85d7ae9df8ff2bb68dd", api.Handlerc85d7ae9df8ff2bb68dd)

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