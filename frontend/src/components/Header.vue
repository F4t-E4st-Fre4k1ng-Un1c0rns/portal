<script setup lang="ts">
  import LoginDialog from '@/components/popups/LoginDialog.vue'
</script>
<template>
  <header>
    <nav>
      <router-link to="/"><img src="../assets/images/logo.svg" class="logo" /></router-link>

      <div class="group">
        <router-link :to="{ name: 'events-list' }">События</router-link>
        <a href="#" class="unpleasant">Результаты</a>
        <a href="#" class="unpleasant">Клубы</a>
        <a href="#" class="unpleasant">Блог</a>
        <a href="#" class="unpleasant">Организаторам</a>
        <a href="#" class="unpleasant">Контакты</a>
      </div>

      <div class="group">
        <a href="#">RUS</a>
        <LoginDialog />
      </div>
    </nav>
  </header>
</template>

<style scoped>
@import '@/assets/styles/header.css';
</style>
