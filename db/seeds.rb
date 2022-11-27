User.create(name: 'Professor Padrão', email: 'professor@mail.com', profile: 'professor', status: true, password: '123456', password_confirmation: '123456')

Classroom.create(name: 'Classe Padrão', code: '123456', enabled: true, professor_id: User.last.id)
# @question = Question.create(:description => "Qual a cor do mar?", :difficulty => 0)
# @question.close_ended_questions.create(alternatives: { a: "Alternativa A", b: "Alternativa B" }, correct_alternative: 'b')
# @question.open_ended_questions.create(possible_reply: 'Azul')
