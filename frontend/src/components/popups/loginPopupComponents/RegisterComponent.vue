<script setup lang="ts">
  import { ref, watchEffect } from 'vue'
  import { register } from '@/services/AuthService'

  const form = ref<HTMLFormElement | null>(null)
  let minDate = new Date().getFullYear()

  let schema = {
    username: '',
    email: '',
    password: '',
    name: '',
    secondName: '',
    city: '',
    dateOfBirth: new Date()
  }
  const email = ref('')
  const dateOfBirthDay = ref<number>()
  const dateOfBirthMonth = ref<number>()
  const dateOfBirthYear = ref<number>()

  let error = ref(false)

  watchEffect(() => {
    schema.username = email.value
    schema.email = email.value
  })

  watchEffect(() => {
    if (dateOfBirthDay.value && dateOfBirthMonth.value && dateOfBirthYear.value) {
      schema.dateOfBirth = new Date(
        dateOfBirthYear.value, dateOfBirthMonth.value, dateOfBirthMonth.value
      )
    }
  })

  const submitForm = () => {
    if (form.value?.reportValidity()) {
      register(schema).then(() => { props.closeDialog() })
        .catch((e) => { 
        error.value = true
        console.error(e)
      })
    }
  }

  const props = defineProps<{
    closeDialog: Function
  }>()
</script>
<template>
  <form class="shadow" ref="form">
    <p v-if="error">Что-то не так...</p>
    <input placeholder="Имя" v-model="schema.name"
      autocomplete="given-name" required />
    <input type="email" placeholder="Электронная почта" v-model="email"
      autocomplete="email" required />
    <input placeholder="Фамилия" v-model="schema.secondName"
      autocomplete="family-name" required />
    <input type="password" placeholder="Пароль" v-model="schema.password"
      autocomplete="new-password" required />
    <label for="birthday">
      Дата рождения
      <div class="date-input">
        <input type="number" min="1" max="31" placeholder="ДД" 
          class="day" v-model="dateOfBirthDay" autocomplete="bday-day" required />
        <input type="number" min="1" max="12" placeholder="ММ" 
          class="month" v-model="dateOfBirthMonth" autocomplete="bday-month" required />
        <input type="number" min="0" :max="minDate" placeholder="ГГГГ"
          class="year" v-model="dateOfBirthYear" autocomplete="bday-year" required />
      </div>
    </label>
    <fieldset class="radio">
      <legend>Пол</legend>
      <label for="female">
        <input type="radio" id="female" name="floor" />
        Женский
      </label>
      <label for="male">
        <input type="radio" id="male" name="floor" />
        Мужской
      </label>
    </fieldset>
    <input placeholder="Страна" autocomplete="country-name" />
    <input placeholder="Город" v-model="schema.city" required />
    <button class="auth-button" type="button"
      @click="() => { submitForm() }">Зарегистрироваться</button>
  </form>
</template>

<style scoped>
@import '@/assets/styles/forms.css';
@import '@/assets/styles/register-form.css';
</style>
