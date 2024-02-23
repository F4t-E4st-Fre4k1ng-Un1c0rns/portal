<script setup lang="ts">
  import { ref } from 'vue'
  import { useAuthStore } from '@/stores/auth'

  const authStore = useAuthStore()
  const form = ref<HTMLFormElement | null>(null)
  
  const props = defineProps<{
    goNext: Function
  }>()

  const submit = () => {
    if (form.value?.reportValidity()) {
      props.goNext()
    }
  }
</script>

<template>
  <form ref="form" class="shadow">
    <h2>Моя анкета</h2>
    <div class="profile">
      <svg width="62" height="62" viewBox="0 0 62 62" fill="none" xmlns="http://www.w3.org/2000/svg">
        <circle cx="31" cy="31" r="31"/>
      </svg>
      <p>{{ authStore.user.name }} {{ authStore.user.secondName }}</p>
      <div class="small-tags">
        <p>{{ authStore.age }} лет</p>
        <p>{{ authStore.user.email }}</p>
      </div>
    </div>
  
    <fieldset>
      <legend>Контакты</legend>
      
      <label for="phone">Номер телефона</label>
      <input type="tel" autocomplete="tel" id="phone"
        placeholder="+7 (XXX) XXX-XX-XX" required />

      <label for="emergency-phone">Телефон для экстренной связи</label>
      <input type="tel" autocomplete="tel" id="emergency-phone"
        placeholder="+7 (XXX) XXX-XX-XX" required />
    </fieldset>
    <fieldset>
      <legend>Дополнительно</legend>
      <label for="club">Клуб</label>
      <input type="text" id="club" placeholder="Введите название" />
      <label for="no-club" class="right">
        <input type="checkbox" id="no-club">
        Я не состою в клубе
      </label>
    </fieldset>
    <fieldset>
      <label for="certificate" class="full-width">
        <input type="checkbox" id="certificate">
        С необходимостью предоставления медицинской справки ознакомлен
      </label>
      <label for="terms" class="full-width">
        <input type="checkbox" id="terms">
        С условиями предоставления услуг и положением о соревновании 
        ознакомлен и согласен
      </label>
    </fieldset>
    <div class="child-right">
      <button class="auth-button" type="button"
        @click="() => { submit() }" :disabled="form?.checkValidity()">
        Продолжить
      </button>
    </div>
  </form>
</template>

<style scoped>
@import '@/assets/styles/forms.css';
@import '@/assets/styles/popups/event-registration-form.css';
</style>