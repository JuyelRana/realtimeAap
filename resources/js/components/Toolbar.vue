<template>
    <div>
        <v-app-bar color="deep-purple accent-4" dense dark>
            <v-app-bar-nav-icon></v-app-bar-nav-icon>

            <v-toolbar-title>Juyel Rana</v-toolbar-title>

            <v-spacer></v-spacer>

            <v-btn depressed v-for="(option,index) in options" :key="index" color="deep-purple accent-4"
                   :to="option.route">
                <span>{{ option.name }}</span>
            </v-btn>


            <v-menu left bottom>
                <template v-slot:activator="{ on }">
                    <v-btn icon v-on="on">
                        <v-icon>mdi-dots-vertical</v-icon>
                    </v-btn>
                </template>


                <v-list>
                    <v-list-item v-for="(option,index) in options" :key="index" @click="() => {}">
                        <v-list-item-title :to="option.route">
                            {{ option.name }}
                        </v-list-item-title>
                    </v-list-item>
                </v-list>
            </v-menu>
        </v-app-bar>
    </div>

</template>

<script>
    export default {
        data: () => ({
            options: [
                {name: 'Forum', route: '/forum'},
                {name: 'Ask Question', route: '/question'},
                {name: 'Category', route: '/category'},
                {name: 'Login', route: '/login'}
            ],
        }),
    }
</script>

<style>

</style>
