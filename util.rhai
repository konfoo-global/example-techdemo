fn layers_code(layers, by_id) {
    not_null(layers);

    let buf = "";
    for layer_ref in layers {
        let layer = by_id[layer_ref];
        if layer.fields.position == () || layer.fields.type == () {
            continue;
        }

        // Lookup glass material by name
        let glass_material = unique("glass", "name", layer.fields.type);
        if glass_material == () {
            continue;
        }

        buf += `${layer.fields.position[0]}: ${glass_material.Code} `;
    }

    buf.trim();
    return buf;
}


fn example_parse_code(code) {
    not_null(code);
    code.trim();
    let tokens = code.split("-");
    if tokens.len() != 2 || tokens[0].is_empty() || tokens[1].is_empty() {
        throw "Code must be in format PREFIX-NUMBER";
    }
    return tokens;
}