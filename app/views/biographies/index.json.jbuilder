# frozen_string_literal: true

json.array!(@biographies, partial: 'biographies/biography', as: :biography)
