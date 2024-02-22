<script setup lang="ts">
import { type EventBasic } from '@/types/event'

const props = defineProps<{
  event: EventBasic
}>()
</script>
<template>
  <div class="champion-item shadow">
    <section class="about">
      <p class="title">{{ props.event.name }}</p>

      <div class="info">
        <!--<p>
          <time class="icon" :datetime="props.event.participation_end.toLocaleDateString()">{{
            props.event.participation_end.toLocaleDateString()
          }}</time>
        </p>-->
        <p>
          <span class="icon location">{{ props.event.place.address }}</span>
        </p>
      </div>
      <select class="ticket-select">
        <option>21,1 км</option>
      </select>
    </section>
    <section class="results">
      <div class="result gold">
        <div>
          <p>Дмитрий Крыслов</p>
          <p>№ 2211</p>
        </div>
        <div>
          <p>01:15:05</p>
          <p>+00:00</p>
        </div>
      </div>
      <div class="result silver">
        <div>
          <p>Рустам Музалёв</p>
          <p>№ 2134</p>
        </div>
        <div>
          <p>01:18:25</p>
          <p>+03:19</p>
        </div>
      </div>
      <div class="result bronze">
        <div>
          <p>Радик Латыпов</p>
          <p>№ 2169</p>
        </div>
        <div>
          <p>01:18:26</p>
          <p>+03:20</p>
        </div>
      </div>
    </section>
  </div>
</template>

<style scoped>
@import '@/assets/styles/home.css';
</style>
