import { type User } from '@/types/user'

async function fetchData(ticket_id: string): Promise<User[]> {
  return [
    {
      "id": "string",
      "username": "string",
      "email": "string",
      "role": "string",
      "name": "string",
      "secondName": "string",
      "city": "string",
      "dateOfBirth": new Date("2024-02-24T01:47:22.951Z"),
    },
    {
      "id": "a",
      "username": "a",
      "email": "a@a",
      "role": "string",
      "name": "a",
      "secondName": "a",
      "city": "a",
      "dateOfBirth": new Date("2024-02-24T01:47:22.951Z"),
    },
  ]
}

export { fetchData }


