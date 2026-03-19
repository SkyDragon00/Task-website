class Task < ApplicationRecord

  # =========================
  # VALIDACIONES
  # =========================
  validates :title, presence: true, length: { maximum: 100 }
  validates :due_date, presence: true

  # =========================
  # SCOPES
  # =========================
  scope :completed, -> { where(completed: true) }
  scope :not_completed, -> { where(completed: false) }

  # =========================
  # MÉTODOS
  # =========================

  # ¿Está completada?
  def completed?
    completed
  end

  # Cambia estado
  def toggle_complete
    update(completed: !completed)
  end

  # Días restantes
  def days_to_complete
    return nil unless due_date

    (due_date - Date.today).to_i
  end

  # Print bonito en consola
  def console_print
    status = completed? ? "✅ COMPLETADA" : "❌ PENDIENTE"
    days = days_to_complete

    puts "⭐========================⭐"
    puts "📌 Título: #{title}"
    puts "📅 Fecha límite: #{due_date}"
    puts "⏳ Días restantes: #{days}"
    puts "📊 Estado: #{status}"
    puts "⭐========================⭐"
  end

end