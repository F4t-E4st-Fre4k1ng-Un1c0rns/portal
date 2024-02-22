<template>
  <header>
    <nav>
      <router-link to="/"><img src="../assets/images/logo.svg" class="logo" /></router-link>

      <div class="group">
        <router-link :to="{ name: 'events-list' }">События</router-link>
        <a href="#">Результаты</a>
        <a href="#">Клубы</a>
        <a href="#">Блог</a>
        <a href="#">Организаторам</a>
        <a href="#">Контакты</a>
      </div>

      <div class="group">
        <a href="#">RUS</a>
        <a href=""><img src="../assets/images/icons/burger.svg" /></a>
      </div>
    </nav>
  </header>
</template>

<style scoped>
@import '@/assets/styles/header.css';
</style>
