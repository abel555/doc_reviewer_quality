require 'rails_helper'

RSpec.describe PapersController, type: :controller do
    describe '#CreatePapers' do
        it 'create a paper' do
            expect{
                @user = User.create(name: 'Juan Pablo', lastname: 'Sandóval Alcocer', professional_degree: 'Dr.', role: 'docente', email: 'sandoval@ucb.edu.bo', career: 'exampleCareer', password: '.sandoval.', username: 'sandoval', admin_role: true)
                paper = Paper.new(title: 'Patos', resume: 'los patos saltas de una pata', user_id: @user.email)
                paper.save
            }.to change(Paper,:count).by(1)
            

        end
        it "redirects to the new contact" do
            paper = Paper.create(title: 'Patos', resume: 'los patos saltas de una pata')
            response.should have_http_status(200)
        end 
    end
end
