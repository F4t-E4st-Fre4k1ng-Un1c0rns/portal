import { type RegisterSchema } from '@/types/registerSchema'
import { type LoginSchema } from '@/types/loginSchema'
import { type User } from '@/types/user'

async function register(schema: RegisterSchema): Promise<string> {
  let request = await fetch(`${import.meta.env.VITE_AUTH_BASE_API}/register`, {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify(schema), 
  })

  if (!request.ok) {
    throw Error
  }
  return login({
    username: schema.username,
    password: schema.password
  })
}

async function login(schema: LoginSchema): Promise<string> {
  let request = await fetch(`${import.meta.env.VITE_AUTH_BASE_API}/login`, {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify(schema), 
  })
  if (!request.ok) {
    throw Error
  }
  const json = await request.json()
  return json?.token
}

async function getUser(token: string): Promise<User> {
  let request = await fetch(`${import.meta.env.VITE_AUTH_BASE_API}/authenticateToken`, {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify({
      token
    }), 
  })
  if (!request.ok) {
    throw Error
  }
  let json = await request.json()
  json.dateOfBirth = new Date(json.dateOfBirth)
  return await json
}

async function registerOnEvent(ticket_id: string, token: string) {
  let request = await fetch(`${import.meta.env.VITE_EVENTS_BASE_API}/events/register`, {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
      "Authorization": token
    },
    body: JSON.stringify({
      ticket_id
    }), 
  })
  if (!request.ok) {
    throw Error
  }
}

export { register, login, getUser, registerOnEvent }

