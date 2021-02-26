module ApplicationHelper
  def navbar_current_class?(test_path)
    return 'bg-gray-50 text-gray-800 border-indigo-500' if request.path == test_path
    ''
  end

  def link_to_add_fields(name, f, association, style)
    if association && name && f
      new_object = f.object.send(association).klass.new

      id = new_object.object_id
      fields = f.fields_for(association, new_object, child_index: id) do |builder|

        render(association.to_s.singularize + "_fields", f: builder)
      end

      link_to(name, '#', class: "add_fields " + style[:class].to_s, data: {id: id, fields: fields.gsub("\n", "")})
    end
  end

  def can_create_level?
    Exam.all.count < 9
  end
end
