<script setup lang="ts">
  defineProps<{
    goNext: Function
  }>()
</script>
<template>
  <form ref="form" class="shadow">
  <h1>Вы оплачиваете участие своей душой.</h1>
  <p>Другой возможности не предусмотренно.</p>
  <button class="auth-button" type="button"
    @click="() => { goNext() }" :disabled="form?.checkValidity()">
    Продолжить
  </button>
  </form>
</template>

<style scoped>
@import '@/assets/styles/forms.css';
</style>