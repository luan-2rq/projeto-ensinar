module NavbarHelper
    def render_navbar(user)
        if user.role == "Professor"
            render partial: 'layouts/navbar_professor'
        elsif user.role == "Student"
            render partial: 'layouts/navbar_student'
        else
            render partial: 'layouts/navbar_admin'
        end
    end
end