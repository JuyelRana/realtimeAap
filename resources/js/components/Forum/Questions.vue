<template>
    <v-card class="mt-2">
        <v-card-title primary-title>
            <div>
                <h3>
                    <h3 class="headline mb-0">
                        <router-link :to="question.path">
                            {{ question.title }}
                        </router-link>
                    </h3>
                    <div class="grey--text">
                        {{ question.user }} said
                        {{ question.created_at }}
                    </div>
                </h3>
            </div>
        </v-card-title>
        <v-card-text v-html="body"></v-card-text>

    </v-card>
</template>

<script>
    export default {
        name: "Questions",
        props: ['question'],
        computed: {
            body() {
                return md.parse(this.question.body);
            },
        }
    }
</script>

<style scoped>
    a {
        text-decoration: none;
    }
</style>
