db.createCollection("policy_wording", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      required: ["product_code", "version", "language", "wording_html", "effective_from"],
      properties: {
        product_code:    { bsonType: "string" },
        version:         { bsonType: "string" },
        language:        { bsonType: "string" },
        wording_html:    { bsonType: "string" },
        effective_from:  { bsonType: "date" },
        effective_to:    { bsonType: ["date","null"] }
      }
    }
  }
});
db.policy_wording.createIndex({ product_code: 1, version: 1, language: 1 }, { unique: true });
db.policy_wording.createIndex({ product_code: 1, effective_from: -1 });

db.createCollection("claim_file", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      required: ["claim_id", "items"],
      properties: {
        claim_id: { bsonType: "string" },
        items:    { bsonType: "array" }
      }
    }
  }
});
db.claim_file.createIndex({ claim_id: 1 }, { unique: true });

db.createCollection("ocr_result", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      required: ["document_id", "text", "fields", "confidence"],
      properties: {
        document_id: { bsonType: "string" },
        text:        { bsonType: "string" },
        fields:      { bsonType: "object" },
        confidence:  { bsonType: "double" }
      }
    }
  }
});
db.ocr_result.createIndex({ document_id: 1 }, { unique: true });
