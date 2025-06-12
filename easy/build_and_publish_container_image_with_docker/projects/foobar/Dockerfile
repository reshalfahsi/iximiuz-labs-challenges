FROM golang:1.22-alpine AS builder                                               
                                                                                 
WORKDIR /app                                                                     
                                                                                 
COPY go.mod go.sum ./                                                            
RUN go mod download                                                              
                                                                                 
COPY . .                                                                         
                                                                                 
RUN CGO_ENABLED=0 GOOS=linux go build -o foobar .                                
                                                                                 
FROM alpine:3                                                                    
COPY --from=builder /app/foobar /app/foobar                                      
CMD ["/app/foobar"]  