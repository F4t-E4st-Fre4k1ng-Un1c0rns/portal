import { type RegisterSchema } from '@/types/registerSchema'
import { type LoginSchema } from '@/types/loginSchema'

function register(schema: RegisterSchema) {}
function login(schema: LoginSchema) {}
function getUser(token: string) {}

export { register, login, getUser }
