workflow hello_world {

    call say_hi

    output {
        say_hi.message
    }
}

task say_hi {

    String name

    command {
        cowsay "Hello ${name}!"
    }

    output {
        String message = read_string(stdout())
    }

    runtime {
        docker: "docker/whalesay:latest"
    }
}