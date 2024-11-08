//
//  MINI OPTION.swift
//  Projet
//
//  Created by Sylvain Fowo on 02/11/2024.
//
import SwiftUI

struct MINI_OPTION: View {
    @State private var selectedDate = Date()
    @State private var events: [Event] = []
    @State private var newEventTitle = ""
    @State private var showAddEventAlert = false
    var listeDoption: listeDoption

    var body: some View {
        ZStack {
            // Fondo con degradado
            LinearGradient(gradient: Gradient(colors: [Color.green.opacity(0.3), Color.brown.opacity(0.5)]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()

            VStack(spacing: 16) {
                // Selector de fecha
                DatePicker("Choisissez une date:", selection: $selectedDate, displayedComponents: .date)
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .padding()
                    .background(Color.green.opacity(0.1))
                    .cornerRadius(10)
                    .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.green.opacity(0.5), lineWidth: 1))

                // Mostrar los días del mes
                let daysInMonth = daysInSelectedMonth(for: selectedDate)
                
                Text("Jours en \(formattedMonth(for: selectedDate)):")
                    .font(.headline)
                    .foregroundColor(Color.green.opacity(0.9))

                List(daysInMonth, id: \.self) { day in
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Jour \(day)")
                            .fontWeight(.semibold)
                            .foregroundColor(.green)

                        // Mostrar eventos del día
                        let eventsForDay = events.filter { Calendar.current.isDate($0.date, inSameDayAs: dateForDay(day)) }
                        ForEach(eventsForDay) { event in
                            Text("• \(event.title)")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                    .padding(.vertical, 5)
                }
                .listStyle(PlainListStyle())

                // Campo para agregar un nuevo evento
                HStack {
                    TextField("Titre de l'événement", text: $newEventTitle)
                        .padding()
                        .background(Color.white.opacity(0.9))
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.green.opacity(0.5), lineWidth: 1)
                        )
                        .shadow(radius: 2)

                    Button(action: addEvent) {
                        Text("Ajouter")
                            .padding(.vertical, 10)
                            .padding(.horizontal, 20)
                            .background(newEventTitle.isEmpty ? Color.gray.opacity(0.6) : Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .shadow(radius: 2)
                    }
                    .disabled(newEventTitle.isEmpty)
                }
                .padding(.top, 10)
            }
            .padding()
            .background(
                LinearGradient(gradient: Gradient(colors: [Color.green.opacity(0.3), Color.brown.opacity(0.1)]), startPoint: .top, endPoint: .bottom)
            )
            .cornerRadius(15)
            .shadow(radius: 5)
            .padding(.horizontal)
            .frame(maxWidth: .infinity, maxHeight: .infinity) // Centra el contenido
        }
    }

    // Función para agregar un evento
    private func addEvent() {
        let newEvent = Event(date: selectedDate, title: newEventTitle)
        events.append(newEvent)
        newEventTitle = ""
    }

    // Función para obtener los días del mes
    private func daysInSelectedMonth(for date: Date) -> [Int] {
        let calendar = Calendar.current
        let range = calendar.range(of: .day, in: .month, for: date)!
        return Array(range)
    }

    // Función para formatear el mes y el año
    private func formattedMonth(for date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy"
        return formatter.string(from: date)
    }

    // Función para obtener la fecha correspondiente a un día específico
    private func dateForDay(_ day: Int) -> Date {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month], from: selectedDate)
        return calendar.date(byAdding: .day, value: day - 1, to: calendar.date(from: components)!)!
    }
}

#Preview {
    MINI_OPTION(listeDoption: listeDoption(name: "depart", flag: "", img: "depart", description: ""))
}

 

