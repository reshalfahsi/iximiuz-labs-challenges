import { createServer } from 'http';                                             
                                                                                 
export function startServer(port) {                                              
    const server = createServer((req, res) => {                                  
        res.writeHead(200, { 'Content-Type': 'text/plain' });                    
        res.end('Welcome to iximiuz Labs!\n');                                   
    });                                                                          
                                                                                 
    server.listen(port, () => {                                                  
        console.log(`Server running at http://localhost:${port}/`);              
    });                                                                          
                                                                                 
    return server;                                                               
}; 