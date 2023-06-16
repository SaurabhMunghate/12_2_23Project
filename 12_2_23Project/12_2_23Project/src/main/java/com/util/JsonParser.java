package com.util;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.File;
import java.io.IOException;

public class JsonParser {
    public static void main(String[] args) {

    }

    public static void call() {
        try {
            // Read JSON data from a text file
            File txtFile = new File("webapp/txt/premise_bounds.txt");
            String jsonData = readFileContent(txtFile);

            // Parse JSON
            ObjectMapper objectMapper = new ObjectMapper();
            JsonNode jsonNode = objectMapper.readTree(jsonData);

            // Access and use the JSON data
            String the_geom = jsonNode.get("the_geom").asText();
//            int age = jsonNode.get("age").asInt();

            System.out.println("the_geom: " + the_geom);
//            System.out.println("Age: " + age);
        } catch (IOException e) {
            e.printStackTrace();
        }
	}
    private static String readFileContent(File file) throws IOException {
        StringBuilder content = new StringBuilder();
        try (java.util.Scanner scanner = new java.util.Scanner(file)) {
            while (scanner.hasNextLine()) {
                content.append(scanner.nextLine());
            }
        }
        return content.toString();
    }
}
