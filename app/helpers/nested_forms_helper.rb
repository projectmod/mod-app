module NestedFormsHelper

  def add_nested_form_fields(f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id

    new_field = f.fields_for(association, new_object, child_index: id) do |builder|
      render( "partials/form/" + association.to_s, builder: builder)
    end

    link = link_to "<i class='fa fa-plus-circle fa-2x'></i>".html_safe, '#', class: 'add_fields', data: { id: id, fields: new_field.gsub("\n", "")}

    link.html_safe
  end
end
