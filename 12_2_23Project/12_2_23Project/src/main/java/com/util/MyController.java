package com.util;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import java.io.IOException;
import java.util.List;

@RestController
public class MyController {
    private final JsonReader jsonReader;

    public MyController(JsonReader jsonReader) {
        this.jsonReader = jsonReader;
    }

    @GetMapping("/data")
    public List<MyDataObject> getData() throws IOException {
        return jsonReader.readJsonFile();
    }
}
