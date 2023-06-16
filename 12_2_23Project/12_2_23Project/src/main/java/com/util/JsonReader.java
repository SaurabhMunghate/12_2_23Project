package com.util;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.File;
import java.io.IOException;

public class JsonReader {
    public static void main(String[] args) {
        	
    }
    public static void JsonDatacall() throws IOException {
        ObjectMapper objectMapper = new ObjectMapper();

        // Read JSON from a file
        File jsonFile = new File("src/main/webapp/text/premise_bounds");
        JsonNode jsonNode = objectMapper.readTree(jsonFile);

        // Access and use the JSON data
        String the_geom = jsonNode.get("the_geom").asText();
        int T4A = jsonNode.get("T4A").asInt();

        System.out.println("the_geom: " + the_geom);
        System.out.println("T4A: " + T4A);
    }
}
