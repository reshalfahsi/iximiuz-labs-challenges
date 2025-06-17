import { json } from '@sveltejs/kit';
import { v4 as uuidv4 } from "uuid";

export function GET() {  
  return json({
    message: "7edf39575c00b9bdd5b5",
    id: uuidv4(),
    timestamp: new Date().toISOString(),
  });
}