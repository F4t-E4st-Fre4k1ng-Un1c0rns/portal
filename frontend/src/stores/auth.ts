import { ref, reactive,
  computed, watch } from 'vue'
import { defineStore } from 'pinia'

import { type User } from '@/types/user'
import { fetchUser } from '@/services/AuthService'

export const useAuthStore = defineStore('auth', () => {
  const token = ref(localStorage.getItem('token') || '')
  const user = reactive<User>({
    username: '',
    email: '',
    role: '',
    id: '',
    name: '',
    secondName: '',
    city: '',
    dateOfBirth: new Date()
  })
  const age = computed(() => {
    return new Date(new Date().valueOf() - user.dateOfBirth?.valueOf()).getFullYear() - 1970
  })
  const loggedIn = ref(false)
  
  const $reset = () => {
    localStorage.setItem('token', '')
    token.value = ''
    loggedIn.value = false
  }

  const updateUser = () => {
    if (token.value.length > 0) {
      loggedIn.value = true
      fetchUser(token.value).then((fetchedUser: User) => {
        Object.assign(user, fetchedUser)
      })
    }
  }
  
  watch(token, (token: string) => {
    localStorage.setItem('token', token)
    updateUser()
  })
  
  updateUser()
  
  return { token, user, loggedIn, age, $reset }
})
