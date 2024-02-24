import { createRouter, createWebHistory } from 'vue-router'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'home',
      component: () => import('@/views/HomeView.vue')
    },
    {
      path: '/event/',
      name: 'events-list',
      component: () => import('@/views/EventsListView.vue')
    },
    {
      path: '/event/:id',
      name: 'event',
      children: [
        {
            path: '', 
            name: 'event-overview',
            component: () => import('@/views/EventOverviewView.vue')
        },
        {
          path: 'participants',
          name: 'event-participants',
          component: () => import('@/views/EventParticipantsView.vue'),
          children: [
            {
              path: ':id',
              name: 'event-participants-list',
              component: () => import('@/views/EventParticipantsView.vue')
            }
          ]
        }
      ],
      component: () => import('@/views/EventView.vue')
    }
  ]
})

export default router
