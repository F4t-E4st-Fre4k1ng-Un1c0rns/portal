<script setup lang="ts">
  import { ref } from 'vue'

  const form = ref<HTMLFormElement | null>(null)
</script>

<template>
  <h2>Моя анкета</h2>
  <div class="profile">
    TODO: профиль (когда появятся сервисы авторизации)
  </div>
  
  <form ref="form">
    <fieldset>
      <legend>Контакты</legend>
      
      <label for="phone">Номер телефона</label>
      <input type="phone" autocomplete="tel" id="phone"
        placeholder="+7 (XXX) XXX-XX-XX" required />

      <label for="emergency-phone">Номер телефона</label>
      <input type="phone" autocomplete="tel" id="emergency-phone"
        placeholder="+7 (XXX) XXX-XX-XX" required />
    </fieldset>
    <fieldset>
      <legend>Дополнительно</legend>
      <label for="club">Клуб</label>
      <input type="text" id="club" placeholder="Введите название" />
      <label for="no-club">
        <input type="checkbox" id="no-club">
        Я не состою в клубе
      </label>
    </fieldset>
    <fieldset>
      <label for="certificate">
        <input type="checkbox" id="certificate">
        С необходимостью предоставления медицинской справки ознакомлен
      </label>
      <label for="terms">
        <input type="checkbox" id="terms">
        С условиями предоставления услуг и положением о соревновании 
        ознакомлен и согласен
      </label>
    </fieldset>
    <button class="auth-button" type="button"
      @click="() => { submitForm() }" :disabled="form?.checkValidity()">
      Продолжить
    </button>
  </form>
</template>

<style scoped>
@import '@/assets/styles/popups/event-registration-form.css';
</style>