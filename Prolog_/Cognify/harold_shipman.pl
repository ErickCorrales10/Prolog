% Datos del caso
acusado(2, "Harold Shipman", "Doctor Muerte").
crimen(2, asesinato_en_serie).
crimen(2, falsificacion_documentos).
crimen(2, abuso_confianza_medica).
nivel_empatia(2, muy_bajo).

% Recuerdos disponibles
recuerdo_disponible("dolor de las familias").
recuerdo_disponible("sufrimiento de las victimas").
recuerdo_disponible("perdida irreparable").

% Resultados esperados
resultado_esperado(2, "remordimiento y conciencia moral").

% Selección de recuerdos basada en el crimen y nivel de empatía
seleccionar_recuerdo(Crimen, Empatia, Recuerdo) :-
    crimen(_, Crimen),
    nivel_empatia(_, Empatia),
    (
        (Crimen = asesinato_en_serie, Empatia = muy_bajo, Recuerdo = "sufrimiento de las victimas");
        (Crimen = falsificacion_documentos, Empatia = muy_bajo, Recuerdo = "dolor de las familias");
    	(Crimen = abuso_confianza_medica, Empatia = muy_bajo, Recuerdo = "perdida irreparable")
    ).

% Evaluar impacto del recuerdo
evaluar_impacto(Recuerdo, Impacto) :-
    (
        Recuerdo = "sufrimiento de las victimas", Impacto = "generacion de empatia";
        Recuerdo = "dolor de las familias", Impacto = "reflexion emocional";
        Recuerdo = "perdida irreparable", Impacto = "remordimiento profundo"
    ).

% Proceso de rehabilitación
rehabilitacion(Acusado, Resultado) :-
    acusado(Acusado, _, _),
    seleccionar_recuerdo(_, muy_bajo, Recuerdo),
    evaluar_impacto(Recuerdo, Impacto),
    Impacto = "remordimiento profundo",
    Resultado = "rehabilitacion parcial".

% Define los recuerdos apropiados según el crimen y el nivel de empatía
recuerdo_apropiado(Crimen, NivelEmpatia, Recuerdo) :-
    (Crimen == asesinato_en_serie, NivelEmpatia == muy_bajo, 
     member(Recuerdo, ["sufrimiento de las victimas"]));
    (Crimen == falsificacion_documentos, NivelEmpatia == muy_bajo, 
     member(Recuerdo, ["dolor de las familias"]));
    (Crimen == abuso_confianza_medica, NivelEmpatia == muy_bajo, 
     member(Recuerdo, ["perdida irreparable"])).

% Evaluar si el recuerdo asociado a un crimen produce el resultado esperado
evaluar_resultado(Crimen, Recuerdo, ResultadoEsperado) :-
    crimen(2, Crimen),
    recuerdo_apropiado(Crimen, muy_bajo, Recuerdo),
    resultado_esperado(2, ResultadoEsperado),
    ResultadoEsperado == "remordimiento y conciencia moral".

% Recomendar recuerdos de rehabilitación basados en el crimen y nivel de empatía
recomendar_rehabilitacion(Crimen, NivelEmpatia, RecuerdosRecomendados) :-
    findall(Recuerdo, recuerdo_apropiado(Crimen, NivelEmpatia, Recuerdo), RecuerdosRecomendados).
