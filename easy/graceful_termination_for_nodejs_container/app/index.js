import { startServer } from './server.js';                                       
                                                                                
const PORT = process.env.PORT || 3000;                                           
                                                                                
const server = startServer(PORT);                                                
                                                                                 
function gracefulShutdown() {                                                    
  console.log('Received termination signal. Shutting down gracefully...');       
                                                                                 
  server.close(() => {                                                           
      console.log('Server closed. Exiting process.');                            
      process.exit(0);                                                           
  });                                                                            
};                                                                               
                                                                                
process.on('SIGINT', gracefulShutdown);                                          
process.on('SIGTERM', gracefulShutdown); 