import { json } from '@sveltejs/kit';
import { v4 as uuidv4 } from "uuid";

export function GET() {  
  return json({
    message: "1dffe70ce97187b92aca",
    id: uuidv4(),
    timestamp: new Date().toISOString(),
  });
}