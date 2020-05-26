import Token from "./Token";
import AppStorage from "./AppStorage";

class User {
    loginData(data, errors) {

        axios.post('/api/auth/login', data)
            .then(res => this.responseAfterLogin(res))
            .catch(error => {
                errors.push(error.response.data.error);
            });
    }

    responseAfterLogin(res) {

        const access_token = res.data.access_token;
        const username = res.data.user;

        if (Token.isValidToken(access_token)) {
            // console.log(access_token);
            AppStorage.store(username, access_token);
            window.location = '/forum'
        }
    }

    // Checking a token has or not
    hasToken() {
        const storedToken = AppStorage.getToken();
        if (storedToken) {
            return Token.isValidToken(storedToken) ? true : false
        }

        return false;
    }

    // Check a user is logged in or not
    loggedIn() {
        return this.hasToken();
    }

    // Logout a user
    logout() {
        AppStorage.clear();
        window.location = '/forum'
    }

    // get the logged in user name
    username() {
        if (this.loggedIn()) {
            return AppStorage.getUser();
        }
    }

    // Get the logged in user id
    userId() {
        if (this.loggedIn()) {
            const payload = Token.payload(AppStorage.getToken());

            if (payload) {
                return payload.sub;
            }
        }

        return 'Unknown User!';
    }

    own(id) {
        return this.userId() == id;
    }
}

export default User = new User();
