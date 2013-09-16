node(:status) { response.status }
node(:error)  { @error.to_json.html_safe }

node(:result) do
    case content_type
    when :json
        Yajl::Parser.parse(yield)
    when :xml
        Nori.new.parse(yield)
    end
end