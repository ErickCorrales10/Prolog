% Datos del caso
acusado(4, "Thanos", "El Titan Loco").
crimen(4, genocidio).
crimen(4, destruccion_masiva).
crimen(4, coercion).
nivel_empatia(4, muy_bajo).

% Recuerdos disponibles
recuerdo_disponible("dolor de los sobrevivientes").
recuerdo_disponible("sufrimiento de las victimas").
recuerdo_disponible("impacto en ecosistemas destruidos").

% Resultados esperados
resultado_esperado(4, "desarrollo de empatia y reflexion etica").

% Selección de recuerdos basada en el crimen y nivel de empatía
seleccionar_recuerdo(Crimen, Empatia, Recuerdo) :-
    crimen(_, Crimen),
    nivel_empatia(_, Empatia),
    (
        (Crimen = genocidio, Empatia = muy_bajo, Recuerdo = "sufrimiento de las victimas");
        (Crimen = destruccion_masiva, Empatia = muy_bajo, Recuerdo = "impacto en ecosistemas destruidos");
    	(Crimen = coercion, Empatia = muy_bajo, Recuerdo = "dolor de los sobrevivientes")
    ).

% Evaluar impacto del recuerdo
evaluar_impacto(Recuerdo, Impacto) :-
    (
        Recuerdo = "sufrimiento de las victimas", Impacto = "generacion de empatia";
        Recuerdo = "dolor de los sobrevivientes", Impacto = "reflexion emocional";
        Recuerdo = "impacto en ecosistemas destruidos", Impacto = "conciencia ecologica"
    ).

% Proceso de rehabilitación
rehabilitacion(Acusado, Resultado) :-
    acusado(Acusado, _, _),
    seleccionar_recuerdo(_, muy_bajo, Recuerdo),
    evaluar_impacto(Recuerdo, Impacto),
    Impacto = "reflexion emocional",
    Resultado = "rehabilitacion moderada".

% Define los recuerdos apropiados según el crimen y el nivel de empatía
recuerdo_apropiado(Crimen, NivelEmpatia, Recuerdo) :-
    (
        (Crimen == genocidio, NivelEmpatia == muy_bajo, 
         member(Recuerdo, ["sufrimiento de las victimas"]));
        (Crimen == destruccion_masiva, NivelEmpatia == muy_bajo, 
         member(Recuerdo, ["impacto en ecosistemas destruidos"]));
        (Crimen == coercion, NivelEmpatia == muy_bajo, 
         member(Recuerdo, ["dolor de los sobrevivientes"]))
    ).

% Evaluar si el recuerdo asociado a un crimen produce el resultado esperado
evaluar_resultado(Crimen, Recuerdo, ResultadoEsperado) :-
    crimen(4, Crimen),
    recuerdo_apropiado(Crimen, muy_bajo, Recuerdo),
    resultado_esperado(4, ResultadoEsperado),
    ResultadoEsperado == "desarrollo de empatia y reflexion etica".

% Recomendar recuerdos de rehabilitación basados en el crimen y nivel de empatía
recomendar_rehabilitacion(Crimen, NivelEmpatia, RecuerdosRecomendados) :-
    findall(Recuerdo, recuerdo_apropiado(Crimen, NivelEmpatia, Recuerdo), RecuerdosRecomendados).
