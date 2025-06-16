package api

import (
    "encoding/json"
    "fmt"
    "log"
    "net/http"
    "time"
)

func Handler8b4a8ceb339bd38551bd(w http.ResponseWriter, r * http.Request) {
    resp, err: = http.Get("https://www.githubstatus.com/api/v2/status.json")
    if err != nil {
        http.Error(w, fmt.Sprintf("Failed to fetch GitHub status: %v", err),
            http.StatusInternalServerError)
        return
    }
    defer resp.Body.Close()

    var githubStatus interface {}
    if err: = json.NewDecoder(resp.Body).Decode( & githubStatus);
    err != nil {
        http.Error(w, fmt.Sprintf("Failed to decode GitHub status: %v", err), http.StatusInternalServerError)
        return
    }

    data: = map[string] interface {} {
        "message": "8b4a8ceb339bd38551bd",
        "time": time.Now().Format(time.RFC3339),
            "GitHubStatus": githubStatus,
    }

    w.Header().Set("Content-Type", "application/json; charset=utf-8")
    if err: = json.NewEncoder(w).Encode(data);
    err != nil {
        http.Error(w, fmt.Sprintf("Failed to encode response: %v", err),
            http.StatusInternalServerError)
        return
    }

    log.Printf("%s HTTP %s %s", r.RemoteAddr, r.Method, r.URL)
}