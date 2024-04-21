import datetime


class Tarea:
    def __init__(self, nombre, descripcion, estado, prioridad, fecha_vencimiento):
        self.nombre = nombre
        self.descripcion = descripcion
        self.estado = estado
        self.prioridad = prioridad
        self.fecha_vencimiento = fecha_vencimiento


    def __str__(self):
        return f"{self.nombre} - {self.estado} - {self.prioridad} - {self.fecha_vencimiento}"


class GestionTareas:
    def __init__(self):
        self.tareas = []


    def agregar_tarea(self, tarea):
        self.tareas.append(tarea)


    def mostrar_tareas(self):
        for tarea in self.tareas:
            print(tarea)


    def filtrar_tareas_por_estado(self, estado):
        return [tarea for tarea in self.tareas if tarea.estado == estado]


    def filtrar_tareas_por_prioridad(self, prioridad):
        return [tarea for tarea in self.tareas if tarea.prioridad == prioridad]


    def filtrar_tareas_por_fecha_vencimiento(self, fecha_vencimiento):
        return [tarea for tarea in self.tareas if tarea.fecha_vencimiento == fecha_vencimiento]


def obtener_entrada_usuario(mensaje):
    entrada = input(mensaje)
    return entrada.strip()


def main():
    gestion_tareas = GestionTareas()


    while True:
        print("\nBienvenido a GestiónTareas S.A.")
        print("1. Agregar tarea")
        print("2. Mostrar tareas")
        print("3. Filtrar tareas por estado")
        print("4. Filtrar tareas por prioridad")
        print("5. Filtrar tareas por fecha de vencimiento")
        print("6. Salir")


        opcion = obtener_entrada_usuario("Elija una opción: ")


        if opcion == "1":
            nombre = obtener_entrada_usuario("Ingrese el nombre de la tarea: ")
            descripcion = obtener_entrada_usuario("Ingrese la descripción de la tarea: ")
            estado = obtener_entrada_usuario("Ingrese el estado de la tarea (pendiente, en progreso, completada): ")
            prioridad = obtener_entrada_usuario("Ingrese la prioridad de la tarea (alta, media, baja): ")
            fecha_vencimiento = obtener_entrada_usuario("Ingrese la fecha de vencimiento de la tarea (formato: dd/mm/yyyy): ")
            fecha_vencimiento = datetime.datetime.strptime(fecha_vencimiento, "%d/%m/%Y").date()
            tarea = Tarea(nombre, descripcion, estado, prioridad, fecha_vencimiento)
            gestion_tareas.agregar_tarea(tarea)


        elif opcion == "2":
            gestion_tareas.mostrar_tareas()


        elif opcion == "3":
            estado = obtener_entrada_usuario("Ingrese el estado de las tareas a filtrar: ")
            tareas_filtradas = gestion_tareas.filtrar_tareas_por_estado(estado)
            for tarea in tareas_filtradas:
                print(tarea)


        elif opcion == "4":
            prioridad = obtener_entrada_usuario("Ingrese la prioridad de las tareas a filtrar: ")
            tareas_filtradas = gestion_tareas.filtrar_tareas_por_prioridad(prioridad)
            for tarea in tareas_filtradas:
                print(tarea)


        elif opcion == "5":
            fecha_vencimiento = obtener_entrada_usuario("Ingrese la fecha de vencimiento de las tareas a filtrar (formato: dd/mm/yyyy): ")
            fecha_vencimiento = datetime.datetime.strptime(fecha_vencimiento, "%d/%m/%Y").date()
            tareas_filtradas = gestion_tareas.filtrar_tareas_por_fecha_vencimiento(fecha_vencimiento)
            for tarea in tareas_filtradas:
                print(tarea)


        elif opcion == "6":
            break


        else:
            print("Opción inválida, por favor elija una opción válida.")


if __name__ == "__main__":
    main()
