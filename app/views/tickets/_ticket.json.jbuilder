json.extract! ticket, :id, :descripcion, :user_id, :historial_uso_id, :monto, :created_at, :updated_at
json.url ticket_url(ticket, format: :json)
