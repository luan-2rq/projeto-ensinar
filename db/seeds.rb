User.create(name: 'Professor Padrão', email: 'professor@mail.com', profile: 'professor', status: true, password: '123456', password_confirmation: '123456')

Classroom.create(name: 'Classe Padrão', code: '123456', enabled: true, professor_id: User.last.id)

