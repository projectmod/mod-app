module NestedFormsHelper

  def add_nested_form_fields(f, association)
    new_object = f.object.send(association).klass.new

    f.fields_for(association, new_object) do |builder|
      render( "partials/form/" + association.to_s, builder: builder)
    end
  end
end
