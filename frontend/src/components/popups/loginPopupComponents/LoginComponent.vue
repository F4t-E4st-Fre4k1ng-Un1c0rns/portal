<script setup lang="ts">
  import { ref } from 'vue'
  import { login } from '@/services/AuthService'
  
  const form = ref<HTMLFormElement | null>(null)

  let schema = {
    username: '',
    password: ''
  }

  let error = ref(false)
  
  const submitForm = () => {
    if (form.value?.reportValidity()) {
      login(schema).then((a) => { console.log(a) })
        .catch((e) => {
          error.value = true;
          console.error(e) 
        })
    }
  }
</script>
<template>
  <form class="shadow" ref="form">
    <p v-if="error">Что-то не так...</p>
    <input type="email" placeholder="Электронная почта"
      v-model="schema.username" autocomplete="email" required />
    <input type="password" placeholder="Пароль"
      v-model="schema.password" autocomplete="current-password" required />
    <a href="#" class="recover">Восстановить пароль</a>
    <button class="auth-button" type="button"
      @click="() => { submitForm() }">Войти</button>
  </form>
</template>

<style scoped>
@import '@/assets/styles/forms.css';
@import '@/assets/styles/login-form.css';
</style>
