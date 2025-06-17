package main

import (
  "net/http"
  "os"

  "github.com/go-chi/chi/v5"
  "github.com/go-chi/chi/v5/middleware"
)

func main() {
  port := os.Getenv("PORT")
  if port == "" {
    port = "8080"
  }

  r := chi.NewRouter()
  r.Use(middleware.RequestID)
  r.Use(middleware.Logger)
  r.Use(middleware.Recoverer)

  r.Get("/", func(w http.ResponseWriter, r *http.Request) {
    w.Write([]byte("Hello iximiuz Labs!"))
  })

  http.ListenAndServe(":"+port, r)
}