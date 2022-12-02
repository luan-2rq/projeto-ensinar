require_relative '../lib/populator_fix.rb'

User.create(name: 'Professor Padrão', email: 'professor@mail.com', role: 'professor', status: true, password: '123456', password_confirmation: '123456')

Classroom.create(name: 'Classe Padrão', code: '123456', enabled: true, professor_id: User.last.id)

#user = User.create(name: 'Aluno Padrão', email: 'aluno@mail.com', role: 'student', profile: 'student', status: true, password: '123456', password_confirmation: '123456')

#exam = Exam.create(name: 'Exact zamine vista', description: 'Lorem ipsum tantrum tatru some hing hinges nova instrucchion...', start_date: Date.current(), due_date: Date.tomorrow(), duration: 2, time_limit: true, user_id: user.id)

#UsersExam.create(user_id: user.id, exam_id: exam.id)

#Closed Question
#Question.populate 5 do |q|
   # q.exam_id = exam.id
   # q.correct_alternative = 'A'
   # q.isClosed = true
   # q.description = 'Lorem ipsum tantrum tatru some hing hinges nova instrucchion. Somes ant hive beasty horara?'
   # q.difficulty = 2
   # q.alternatives = 
  #end

#Opened question
#Question.populate 5 do |q|
    #q.exam_id = exam.id
   # q.correct_alternative = 'A'
   # q.isClosed = true
   # q.description = 'Lorem ipsum tantrum tatru some hing hinges nova instrucchion. Somes ant hive beasty horara?'
   # q.difficulty = 2
   # q.correct_alternative = 'Lorem ipsum tantrum tatru some hing hinges nova instrucchion...'
#end
# @question = Question.create(:description => "Qual a cor do mar?", :difficulty => 0)
# @question.close_ended_questions.create(alternatives: { a: "Alternativa A", b: "Alternativa B" }, correct_alternative: 'b')
# @question.open_ended_questions.create(possible_reply: 'Azul')
