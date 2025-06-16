package routes

import (
        "html/template"
        "log"
        "net/http"
        "path/filepath"
)

var indexTmpl = template.Must(
        template.ParseFiles(filepath.Join("templates", "index.html")),
)

func Index(w http.ResponseWriter, r *http.Request) {
        w.Header().Set("Content-Type", "text/html; charset=utf-8")

        if err := indexTmpl.Execute(w, nil); err != nil {
                log.Printf("Template execution error: %v", err)
                http.Error(w, "Internal Server Error", http.StatusInternalServerError)
                return
        }

        log.Printf("%s HTTP %s %s", r.RemoteAddr, r.Method, r.URL)
}