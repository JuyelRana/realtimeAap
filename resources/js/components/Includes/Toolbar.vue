<template>
    <div>
        <v-app-bar color="deep-purple accent-4" dense dark>
            <v-app-bar-nav-icon></v-app-bar-nav-icon>

            <v-toolbar-title>Juyel Rana</v-toolbar-title>

            <v-spacer></v-spacer>

            <AppNotification v-if="loggedIn"></AppNotification>

            <v-btn text v-for="(option,index) in options" :key="index" :to="option.route" v-if="option.show">
                <span>{{ option.name }}</span>
            </v-btn>


            <v-menu left bottom>
                <template v-slot:activator="{ on }">
                    <v-btn icon v-on="on">
                        <v-icon>mdi-dots-vertical</v-icon>
                    </v-btn>
                </template>


                <v-list>
                    <v-list-item
                        v-for="(option,index) in options"
                        :key="index" @click=""
                        :to="option.route"
                        v-if="option.show">
                        <v-list-item-title>
                            {{ option.name }}
                        </v-list-item-title>
                    </v-list-item>
                </v-list>
            </v-menu>
        </v-app-bar>
    </div>

</template>

<script>
    import AppNotification from "./AppNotification";

    export default {
        components: {AppNotification},
        data: () => ({
            options: [
                {name: 'Forum', route: '/forum', show: true},
                {name: 'Ask Question', route: '/create-question', show: User.loggedIn()},
                {name: 'Category', route: '/category', show: User.loggedIn()},
                {name: 'Sign Up', route: '/signup', show: !User.loggedIn()},
                {name: 'Login', route: '/login', show: !User.loggedIn()},
                {name: 'Logout', route: '/logout', show: User.loggedIn()}
            ],
            loggedIn: User.loggedIn(),
        }),

        created() {
            // Listen the event
            EventBus.$on('logout', () => {
                User.logout();
            })
        }
    }
</script>

<style>

</style>
