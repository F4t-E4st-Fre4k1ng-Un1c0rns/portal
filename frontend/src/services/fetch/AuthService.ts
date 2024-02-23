import { type RegisterSchema } from '@/types/registerSchema'
import { type LoginSchema } from '@/types/loginSchema'
import { type User } from '@/types/user'

async function register(schema: RegisterSchema): string {
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

async function login(schema: LoginSchema): string {
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
  return await request.json()
}

export { register, login, getUser }

