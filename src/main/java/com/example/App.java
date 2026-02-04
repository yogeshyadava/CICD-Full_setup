package com.example;

import static spark.Spark.*;

public class App {

    public static void main(String[] args) {

        port(8080);

        get("/", (req, res) -> "Hello from Java App - Jenkins + Docker CI/CD");
    }
}
