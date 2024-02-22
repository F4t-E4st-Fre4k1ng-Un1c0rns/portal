<template>
  <footer>
    <nav>
      <div class="group">
        <router-link to="/"><img src="@/assets/images/logo.svg" class="logo" /></router-link>
        <p>© 2024</p>
      </div>

      <div class="group">
        <a href="">Новости</a>
        <a href="">Блог</a>
      </div>
      <div class="group">
        <a href="">Служба поддержки</a>
        <a href="">Контакты</a>
      </div>
      <div class="group">
        <a href="">Партнерам</a>
        <a href="">Вакансии</a>
      </div>
      <div class="social-link-group">
        <a class="social-link vk" href="https://vk.com/memy_pro_kotow">
          <img src="@/assets/images/icons/vk.svg" alt="Ссылка на VK" />
        </a>
        <a class="social-link telegram" href="https://t.me/memyprokotow">
          <img src="@/assets/images/icons/telegram.svg" alt="Ссылка на Telegram" />
        </a>
      </div>
    </nav>
  </footer>
</template>

<style scoped>
@import '@/assets/styles/footer.css';
</style>
