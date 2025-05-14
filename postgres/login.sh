# Main menu function
main_menu() {

    echo "Choose an option:"
    echo "1) Login to container"
    echo "2) Login to DB"
    read -p "Enter your choice [1 or 2]: " choice

    case "$choice" in
    1) login_container ;;
    2) login_db ;;
    esac
}
# Login to container function
login_container() {
    container=$(docker ps | grep postgres | awk '{ print $1 }')
    docker exec -it $container /bin/bash
}
# Login to DB function
login_db() {
    PG_USERNAME=$(cat files/secret | awk '{ print $1 }')
    PGPASSWORD=$(cat files/secret | awk '{ print $2 }')
    echo "Connecting to database ... "
    echo "$PG_USERNAME"
    echo "$PGPASSWORD"
    psql postgresql://$PG_USERNAME:$PGPASSWORD@127.0.0.1:5432
}

# Hey, lets start
main_menu