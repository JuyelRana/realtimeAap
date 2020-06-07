<template>
    <div class="text-center">
        <v-menu offset-y>
            <template v-slot:activator="{ on }">
                <v-btn text v-on="on">
                    <v-icon :color="color">add_alert</v-icon>
                    <span>
                        {{ unReadCount}}
                    </span>
                </v-btn>
            </template>
            <v-list>
                <v-list-item
                    v-for="(item, index) in unRead"
                    :key="item.id"
                    @click="readNotification(item)"
                    :to="item.path">
                    <v-list-item-title class="red--text">{{ item.question }}</v-list-item-title>
                </v-list-item>
                <v-divider></v-divider>

                <!--                <v-list-item-->
                <!--                    v-for="(item, index) in read"-->
                <!--                    :key="item.id">-->
                <!--                    <v-list-item-title class="green&#45;&#45;text">{{ item.question }}</v-list-item-title>-->
                <!--                </v-list-item>-->
            </v-list>
        </v-menu>
    </div>
</template>

<script>
    export default {
        name: "AppNotification",
        data() {
            return {
                read: {},
                unRead: {},
                unReadCount: 0,
            }
        },

        created() {
            if (User.loggedIn()) {
                this.getNotifications();
                this.notifyUser();
            }
        },
        computed: {
            color() {
                return this.unReadCount > 0 ? 'red' : 'red lighten-4';
            }
        },
        methods: {
            getNotifications() {
                axios.post('/api/notifications')
                    .then(response => {
                        // console.log(response.data.unRead)
                        this.read = response.data.read;
                        this.unRead = response.data.unRead;
                        this.unReadCount = response.data.unRead.length;
                    })
            },

            readNotification(notification) {
                axios.post('/api/markAsRead', {id: notification.id})
                    .then(response => {
                        this.unRead.splice(notification, 1);
                        this.read.push(notification);
                        this.unReadCount--;
                        // this.$router.push(notification.path);
                    }).catch(error => {
                    console.log(error.response.data);
                })
            },
            // Notify to the user
            notifyUser() {
                Echo.private('App.User.' + User.userId())
                    .notification((notification) => {
                        this.unRead.unshift(notification);
                        this.unReadCount++;
                    });
            }
        }
    }
</script>

<style scoped>

</style>
