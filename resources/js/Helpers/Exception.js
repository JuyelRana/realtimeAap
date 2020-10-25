import User from "./User";

class Exception {
    handle(error) {
        this.isExpired(error.response.data.error);
    }

    isExpired(error) {
        if (error === 'Token is expired!') {
            User.logout();
            // window.location = '/login';
        } else if (error === 'Token is invalid!') {
            User.logout();
            // window.location = '/login';
        }
    }
}

export default Exception = new Exception()
