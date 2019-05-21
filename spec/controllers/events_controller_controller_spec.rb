require 'rails_helper'

RSpec.describe EventsController, type: :controller do
    describe '#CreateEvents' do
        it 'create an event' do

            expect{
                event = Event.new(semester: 'Juan Pablo', year: 2019, name: 'Dr.', career: 'docente')
                event.save
            }.to change(Event,:count).by(1)
            

        end
        it "redirects to the new contact" do
            event = Event.create(semester: 'Juan Pablo', year: 2019, name: 'Dr.', career: 'docente')
            response.should have_http_status(200)
        end 
    end

end
