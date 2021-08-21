package com.redhat.idaas.datasynthesis.dtos;

import java.io.StringReader;

import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonObjectBuilder;
import javax.json.bind.JsonbBuilder;
import javax.json.bind.serializer.JsonbSerializer;
import javax.json.bind.serializer.SerializationContext;
import javax.json.stream.JsonGenerator;

public class DataStructureSerializer implements JsonbSerializer<DataStructure> {

    @Override
    public void serialize(DataStructure obj, JsonGenerator generator, SerializationContext ctx) {
        // Combine objects in DataStructure into one object
        JsonObjectBuilder result = Json.createObjectBuilder();
        for (Object o : obj.object) {
            String jsonString = JsonbBuilder.create().toJson(o);
            JsonObject jobj = Json.createReader(new StringReader(jsonString)).readObject();
            jobj.entrySet().forEach(s -> result.add(s.getKey(), s.getValue()));
        }
        generator.write(result.build());
    }
    
}
