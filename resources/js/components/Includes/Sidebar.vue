<template>
    <v-card>
        <v-toolbar color="deep-purple accent-4" dense dark>
            <v-toolbar-title>Categories</v-toolbar-title>
        </v-toolbar>
        <v-list>
            <!--            <v-list-item v-for="category in categories" :key="category.id" :to="category.path">-->
            <v-list-item v-for="category in categories" :key="category.id" @click="singleCategory(category)">
                <v-list-item-content>
                    <v-list-item-title>{{category.name}}</v-list-item-title>
                </v-list-item-content>
            </v-list-item>
        </v-list>


    </v-card>
</template>

<script>
    export default {
        name: "Sidebar",
        data: () => ({
            categories: []
        }),
        methods: {
            singleCategory(category) {
                EventBus.$emit('questionsByCategory', category);
            }
        },

        created() {
            axios.get('/api/categories/')
                .then(res => {
                    res.data.data.forEach(category => {
                        this.categories.push(category);
                    });
                }).catch(error => {
                console.log(error.response.data)
            })
        },
    }
</script>

<style scoped>

</style>
