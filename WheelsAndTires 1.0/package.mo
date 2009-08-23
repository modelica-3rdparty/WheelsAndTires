import "BondLib/BondLib.mo";
import "MultiBondLib/MultiBondLib.mo";


package WheelsAndTires

  package UsersGuide "User's Guide"
    annotation (DocumentationClass=true,Documentation(info="<html>

The free <i> Wheels and Tires </i> library models wheels and tires. The contained
models are intended to be used in vehicle simulations where computational performance is
a major concern. Semi-empirical single contact point models are well suited for
this kind of applications and are therefore applied in the presented library. These
models enhance physical aspects by means of empirical equations that represent
measurement results covering e.g. friction and slip characteristics. All featured
tire models are split into seven objects, enabling a convenient customization of all
relevant properties, with the necessary communication structure tailored to the
special needs. Therefore the focus of this research effort concerns itself less with
modeling new tire properties, but more with an improved organization of existing
knowledge.

The <i>Wheels and Tires </i>library provides a tool to quickly build custom tire models. This is
realized by a modular and expandable design system utilizing well established models. In
addition, a set of ready-made models is provided to get a quick insight into the used
modeling structure and to enable a direct application in vehicle models.

</html>", revisions="<html>
</html>"));

    class CloserLook "A Closer Look at Tires"
      annotation (Documentation(info="<html>

In motion dynamics of vehicles, the forces exerted by the tire road contact are of major
importance. This section is intended to provide basic knowledge about tire properties,
buildup and force generation. For more detailed information, the reader  is referred to <span class=\"cite\">[<a href=\"Modelica://WheelsAndTires.UsersGuide.Literature\">Ril07</a>]</span>
for a good compact German presentation of tire modeling, to <span class=\"cite\">[<a href=\"Modelica://WheelsAndTires.UsersGuide.Literature\">Lei09</a>]</span> for a very good and
general German introduction, to <span class=\"cite\">[<a href=\"Modelica://WheelsAndTires.UsersGuide.Literature\">Dix96</a>]</span> for a rather praxis-oriented introduction or to
<span class=\"cite\">[<a href=\"Modelica://WheelsAndTires.UsersGuide.Literature\">Pac06</a>]</span> for probably the most detailed description of tire modeling available, the latter ones
are both in English.
<!--l. 9--></p><p class=\"noindent\">The first historically known wheels had totally different duties compared to today's wheels
and tires. They were attached to vehicles which were dragged by a translational force. Hence
they just had to carry the vertical load and overcome their own rolling resistance. Later on,
first breaking systems were introduced widening the field of requirements of tires without a
major impact on their construction. When tires got driven by torque, a redesign became
necessary in order to transmit great forces to the ground or road. Various alternative ideas
have been investigated, with the rubber-carcass pneumatic tire resulting to be superior to all
competitors.

<!--l. 11--></p><p class=\"noindent\">The modern tire is a complex construction resulting from clashing requirements. Tires
basically have to carry the vertical load, transmit forces to accelerate (and slow down) the
vehicle and generate cornering forces to guide the vehicle trough curves securely. This has
to be fulfilled under a large variety of environmental conditions with a long life
time ensured. The rolling resistance has to be as small as possible, with damping
and acoustic properties suiting modern demands. As one can imagine, there is no
optimal solution to this problem and this leads to a large variety of different tires for
varying demands, especially when peak performance is required as under racing
conditions.
<!--l. 13--></p><p class=\"noindent\">A quite basic design example for a tire is depicted in Figure&nbsp;<a href=\"#x1-17001r1\">1<!--tex4ht:ref: F_TireStructure --></a>. </p><hr class=\"figure\"><div class=\"figure\"><table class=\"figure\"><tbody><tr class=\"figure\"><td class=\"figure\">


<a id=\"x1-17001r1\"></a>


<div class=\"center\">
<!--l. 16--><p class=\"noindent\">
<!--l. 18--></p><p class=\"noindent\"><img src=\"../images/../images/Master_Doku_MarkusAndres1x.png\" alt=\"PIC\" class=\"graphics\" width=\"241.84843pt\" height=\"183.25616pt\"><!--tex4ht:graphics
name=\"../images/Master_Doku_MarkusAndres1x.png\" src=\"pics/TireSturcture.eps\"
--></p></div>
<br> <div class=\"caption\"><table class=\"caption\"><tbody><tr style=\"vertical-align: baseline;\" class=\"caption\"><td class=\"id\">Figure&nbsp;1: </td><td class=\"content\">The basic elements of a tire.</td></tr></tbody></table></div><!--tex4ht:label?: x1-17001r1 -->



<!--l. 23--><p class=\"noindent\"></p></td></tr></tbody></table></div><hr class=\"endfigure\">
<!--l. 25--><p class=\"noindent\">For today's passenger cars steel-belt tires are used exclusively, which differ in construction
only marginally so that differences do not have to be mentioned in such a compact
introduction. On the inside of the tire a coating (not depicted in Figure&nbsp;<a href=\"#x1-17001r1\">1<!--tex4ht:ref: F_TireStructure --></a>) inherits the
function of the tube, preventing the over-pressurized air to leak to the outside. The <span class=\"cmti-10x-x-109\">Bead</span>
that is usually built of steel wire with synthetic rubber components ensuring a tight fit of the
tire on the rim enabling a reliable operation under difficult conditions e.g.&nbsp;when driving over
a curbstone. The rubber elements building the sidewall strongly affect the vertical dynamics
of the tire and are important when it comes to handling precision and stability. The
<span class=\"cmti-10x-x-109\">carcass </span>is the element absorbing the tension from the inflation pressure. Therefore, it
has to be protected from damage which is ensured by the <span class=\"cmti-10x-x-109\">side wall</span>. The <span class=\"cmti-10x-x-109\">tread </span>is
responsible for the force generation by establishing a reliable contact to the road and is
therefore a very central element of the tire. Its composition is a major factor when it
comes to the frictional properties of the tire. The <span class=\"cmti-10x-x-109\">tread </span>is reinforced by the steel
<span class=\"cmti-10x-x-109\">belt </span>that enhances mileage and reduces the rolling velocity. Overall a mixture of
more than 20 rubber composites form the tire which makes them quite difficult
to describe as well as enabling the engineer to fit tire models to several different
needs.

<!--l. 27--></p><p class=\"noindent\">For the explanation of the mechanisms that are responsible for the generation of force in the
tread shuffle of the tire, the brush model is quite common <span class=\"cite\">[<a href=\"Modelica://WheelsAndTires.UsersGuide.Literature\">Ril07</a>]</span>, <span class=\"cite\">[<a href=\"Modelica://WheelsAndTires.UsersGuide.Literature\">Pac06</a>]</span>, <span class=\"cite\">[<a href=\"Modelica://WheelsAndTires.UsersGuide.Literature\">Lei09</a>]</span>. Looking at
Figure&nbsp;<a href=\"#x1-17006r2\">2<!--tex4ht:ref: F_ForceGeneration --></a>, </p><hr class=\"figure\"><div class=\"figure\"><table class=\"figure\"><tbody><tr class=\"figure\"><td class=\"figure\">



<a id=\"x1-17006r2\"></a>


<div class=\"center\">
<!--l. 30--><p class=\"noindent\">
<a id=\"x1-17002r1\"></a>
</p><div class=\"subfigure\"><table><tbody><tr><td style=\"text-align: left;\"> <img src=\"../images/Master_Doku_MarkusAndres2x.png\" alt=\"PIC\" class=\"graphics\" width=\"177.82973pt\" height=\"200.86456pt\"><!--tex4ht:graphics
name=\"../images/Master_Doku_MarkusAndres2x.png\" src=\"pics/ForceGeneration1.eps\"
-->
               <div class=\"subfigcaption\"><span class=\"cmr-9\">(a) </span><font face=\"Symbol\">&#969;</font><font face=\"Symbol\">&#215;</font><span class=\"cmmi-9\">r </span>= <span class=\"cmmi-9\">v</span><span class=\"cmr-9\">.</span></div>               </td></tr></tbody></table></div> &nbsp;

<a id=\"x1-17003r2\"></a><div class=\"subfigure\"><table><tbody><tr><td style=\"text-align: left;\"> <img src=\"../images/Master_Doku_MarkusAndres3x.png\" alt=\"PIC\" class=\"graphics\" width=\"177.82973pt\" height=\"200.86456pt\"><!--tex4ht:graphics
name=\"../images/Master_Doku_MarkusAndres3x.png\" src=\"pics/ForceGeneration2.eps\"
-->
               <div class=\"subfigcaption\"><span class=\"cmr-9\">(b) </span><font face=\"Symbol\">&#969;</font><font face=\"Symbol\">&#215;</font><span class=\"cmmi-9\">r </span> &gt; v</span><span class=\"cmr-9\">.</span></div>               </td></tr></tbody></table></div>


<a id=\"x1-17004r3\"></a><div class=\"subfigure\"><table><tbody><tr><td style=\"text-align: left;\"> <img src=\"../images/Master_Doku_MarkusAndres4x.png\" alt=\"PIC\" class=\"graphics\" width=\"177.82973pt\" height=\"202.14397pt\"><!--tex4ht:graphics
name=\"../images/Master_Doku_MarkusAndres4x.png\" src=\"pics/ForceGeneration3.eps\"
-->
               <div class=\"subfigcaption\"><span class=\"cmr-9\">(c) </span><font face=\"Symbol\">&#969;</font><font face=\"Symbol\">&#215;</font><span class=\"cmmi-9\">r </span> &gt;&gt; v</span><span class=\"cmr-9\">.</span></div>               </td></tr></tbody></table></div> &nbsp;

<a id=\"x1-17005r4\"></a><div class=\"subfigure\"><table><tbody><tr><td style=\"text-align: left;\"> <img src=\"../images/Master_Doku_MarkusAndres5x.png\" alt=\"PIC\" class=\"graphics\" width=\"177.82973pt\" height=\"202.14397pt\"><!--tex4ht:graphics
name=\"../images/Master_Doku_MarkusAndres5x.png\" src=\"pics/ForceGeneration4.eps\"
-->
              <div class=\"subfigcaption\"><span class=\"cmr-9\">(d) </span><font face=\"Symbol\">&#969;</font><font face=\"Symbol\">&#215;</font><span class=\"cmmi-9\">r </span> &gt;&gt;&gt; v</span><span class=\"cmr-9\">.</span></div>              </td></tr></tbody></table></div> </div>
<br> <div class=\"caption\"><table class=\"caption\"><tbody><tr style=\"vertical-align: baseline;\" class=\"caption\"><td class=\"id\">Figure&nbsp;2: </td><td class=\"content\">Tire brush model under different driving conditions.</td></tr></tbody></table></div><!--tex4ht:label?: x1-17006r2 -->



<!--l. 48--><p class=\"noindent\"></p></td></tr></tbody></table></div><hr class=\"endfigure\">
<!--l. 50--><p class=\"noindent\">one can see the shuffle being modeled by single spring like elements. These elements generate
a force when getting deflected. The force of these elements is assumed to be proportional to
the deflection. Under the conditions depicted in Figure&nbsp;<a href=\"#x1-17002r1\">2(a)<!--tex4ht:ref: F_ForceGeneration1 --></a>, the tread elements are not
getting deflected and no force is being generated. This is the case when the tire is driven with
a torque that exactly makes it overcome the rolling resistance. If the vehicle accelerates the
tires has to generate a force <span class=\"cmmi-10x-x-109\">F </span>which results in the rotational velocity rising as shown in
Figure&nbsp;<a href=\"#x1-17003r2\">2(b)<!--tex4ht:ref: F_ForceGeneration2 --></a>. Now <font face=\"Symbol\">&#969;</font> x <span class=\"cmmi-10x-x-109\"> <span class=\"cmmi-10x-x-109\">r </span> &gt; v </span>which results in the tread shuffles being deflected.
The elements at the right side generate the bigger part of the overall force due
to the greater deflection and the (assumed) linear characteristics. If the driving
torque rises further, the maximum possible deflection that is determined by the
frictional conditions is reached and the elements partially start to slide. This is
depicted in Figure&nbsp;<a href=\"#x1-17004r3\">2(c)<!--tex4ht:ref: F_ForceGeneration3 --></a>. An even further increase of the driving torque results
in very quick sliding of the elements as shown in Figure&nbsp;<a href=\"#x1-17005r4\">2(d)<!--tex4ht:ref: F_ForceGeneration4 --></a>. Still, there is a
short period of adhesion at the very beginning of the tread shuffle that can be
neglected. Due to the frictional properties, the transmitted force is lower than in
Figure&nbsp;<a href=\"#x1-17004r3\">2(c)<!--tex4ht:ref: F_ForceGeneration3 --></a>.

<!--l. 52--></p><p class=\"noindent\">The difference between the two velocities <font face=\"Symbol\">&#969;</font><font face=\"Symbol\">&#215;</font><span class=\"cmmi-9\">r </span> and <span class=\"cmmi-10x-x-109\">v </span>is called the slip velocity. One could split this slip or slip
velocity into a \"virtual\" slip that is caused by the deformation of the still adhering
components and the \"real\" slip that is caused by the sliding of the tread elements over the
ground. <span class=\"cite\">[<a href=\"#XMitschke\">MW03</a>]</span> discusses this in more detail.

<!--l. 54--></p><p class=\"noindent\">Taking a closer look at the effects, one can find two major reasons for the generation of
frictional forces: adhesion and hysteresis <span class=\"cite\">[<a href=\"Modelica://WheelsAndTires.UsersGuide.Literature\">Lei09</a>]</span>, <span class=\"cite\">[<a href=\"Modelica://WheelsAndTires.UsersGuide.Literature\">Dix96</a>]</span>. Measurements <span class=\"cite\">[<a href=\"Modelica://WheelsAndTires.UsersGuide.Literature\">MW03</a>]</span> show that
for dry surfaces, the adhesion is the main reason for frictional forces. The postulate for the
adhesion to fully apply is a direct contact between the tire's rubber and the road. If this
contact is pretended by a water layer, the adhesion component decreases making the
hysteresis component more important. The hysteresis applies in combination with form
closure that is caused by micro-roughness of the tire and the road. In contrast to the classical
Coulomb friction, there is a dependence on the contact area (the tread shuffle). For the
adhesion component, the frictional coefficient rises with decreasing surface pressure
(force per area). Therefore, a big tread shuffle is of advantage for the adhesion
component of the friction, making wider tires the better alternative on dry surfaces. On
wet surfaces the situation inverses because higher surface pressure enlarges the
expulsion of water and the effect of the hysteresis directly. So, for tires that are used
in dry as well as wet conditions, a compromise has to be found. Another factor
that is very important is the distribution of pressure in the tread shuffle. To make
the situation even more difficult, both of the effects show a dependence on sliding
velocity.


<!--l. 56--></p><p class=\"noindent\">To enable the tire to transmit big forces, the tread area has to have a high damping constant
to enhance both adhesion and hysteresis. This is the only part of the tire that is designed to
have a big damping constant because in all other parts this just causes rising losses. To get
an overview of the tire losses, <span class=\"cite\">[<a href=\"Modelica://WheelsAndTires.UsersGuide.Literature\">MW03</a>]</span> states that about 50% of the losses emerge from the
tread area, 20% arise in the belt, 10% from the carcass and another 10% from the side
walls.
</p>



</html>"));
    end CloserLook;

    class StateOfTheArt "State of the Art Tire Models"
      annotation (Documentation(info="<html>

The following sections quickly introduce the very basics of the tire models used in the development of the Wheels and Tires library.


<ol>
<li><a href=\"Modelica://WheelsAndTires.UsersGuide.StateOfTheArt.Rill\">TMeasy by G. Rill</a>
<li><a href=\"Modelica://WheelsAndTires.UsersGuide.StateOfTheArt.PacejkaMF\">Magic Formula by H.B. Pacejka</a>
<li><a href=\"Modelica://WheelsAndTires.UsersGuide.StateOfTheArt.ZimmerOtter\">OORTM by D. Zimmer and M. Otter</a>
</ol>

</html>"));

    class Rill "TMeasy by G. Rill"
    annotation (Documentation(info="<html>
G. Rill's <span class=\"cmti-10x-x-109\">TMeasy </span>or the <span class=\"cmti-10x-x-109\">Easy to Use </span>tire model is intended to provide a quite accurate but
still simple model <span class=\"cite\">[<a href=\"Modelica://WheelsAndTires.UsersGuide.Literature\">Ril07</a>]</span>. The main emphasis is to make it work with little information
(parameters) of the tire. Based on relatively simple geometric assumptions, piecewise
polynomial equations, slip models are provided to compute
     </p><ul class=\"itemize1\">

     <li class=\"itemize\">frictional forces,
     </li>
     <li class=\"itemize\">force due to camber angle,
     </li>
     <li class=\"itemize\">nonlinear influence of the normal load,
     </li>
     <li class=\"itemize\">self aligning torque,
     </li>
     <li class=\"itemize\">bore torque,
     </li>
     <li class=\"itemize\">overturning torque and
     </li>

     <li class=\"itemize\">roll resistance.</li></ul>

</html>"));
    end Rill;

    class PacejkaMF "Magic Formula by H.B. Pacejka"
    annotation (Documentation(info="<html>

 The probably most popular tire model of today is introduced in <span class=\"cite\">[<a href=\"Modelica://WheelsAndTires.UsersGuide.Literature\">Pac06</a>]</span>. Rather than using
piecewise polynomial equations it is mainly based on a single equation that is called the
magic formula which has the form

</p><table class=\"align\">
                  <tbody><tr><td class=\"align-odd\"><span class=\"cmmi-10x-x-109\">y </span>= <span class=\"cmmi-10x-x-109\">D</span> sin[<span class=\"cmmi-10x-x-109\">C</span> arctan<span class=\"cmsy-10x-x-109\">{</span><span class=\"cmmi-10x-x-109\">Bx </span><span class=\"cmsy-10x-x-109\">- </span><span class=\"cmmi-10x-x-109\">E</span>(<span class=\"cmmi-10x-x-109\">Bx </span><span class=\"cmsy-10x-x-109\">-</span> arctan<span class=\"cmmi-10x-x-109\">Bx</span>)<span class=\"cmsy-10x-x-109\">}</span>]<span class=\"cmmi-10x-x-109\">.</span></td>                  <td class=\"align-even\"></td>                  <td class=\"align-label\"><a id=\"x1-20001r1\"></a>                  </td></tr></tbody></table>

This \"magic formula\" is used to compute
     <ul class=\"itemize1\">
     <li class=\"itemize\">longitudinal force,
     </li>
     <li class=\"itemize\">lateral force and
     </li>
     <li class=\"itemize\">aligning torque.</li></ul>


<!--l. 88--><p class=\"noindent\">The semi-empirical tire model in chapter 4 of <span class=\"cite\">[<a href=\"Modelica://WheelsAndTires.UsersGuide.Literature\">Pac06</a>]</span> additionally introduces equations for
dependence on normal load, overturning couple and rolling resistance as well and therefore
defines a model of about the same complexity as <span class=\"cmti-10x-x-109\">TMeasy</span>. In the subsequent chapters, tire
properties are discussed in extensive detail covering non-steady-state properties, the
shimmy phenomenon, transient behavior, short wavelength models as well as road
unevenness.

<!--l. 90--></p><p class=\"noindent\">Unfortunately, the <span class=\"cmti-10x-x-109\">Magic Formula </span>model was not implemented in the current version of the
<span class=\"cmti-10x-x-109\">Wheels and Tires </span>library due to time constraints.
<!--l. 92--></p>
</html>"));
    end PacejkaMF;

    class ZimmerOtter "OORTM by D. Zimmer and M. Otter"
    annotation (Documentation(info="<html>
 The object-oriented real-rime model presented in <span class=\"cite\">[<a href=\"Modelica://WheelsAndTires.UsersGuide.Literature\">ZO09</a>]</span> is mainly based on <span class=\"cmti-10x-x-109\">TMeasy </span>by G.
Rill with some adjustments made to suit the Modelica environment and to enhance its
properties. A seven level model with increasing complexity is introduced enabling the
modeler to simply choose the level of complexity suiting the current application. As it
is developed for the Modelica environment equations found in <span class=\"cite\">[<a href=\"Modelica://WheelsAndTires.UsersGuide.Literature\">ZO09</a>]</span> are used
as a base for the model presented in this work rather than the <span class=\"cmti-10x-x-109\">Magic Formula</span>
model.

</html>"));
    end ZimmerOtter;

    end StateOfTheArt;

    class Definitions "Definition of Vectors and Coordinate Systems"

      annotation (Documentation(info="<html>
For the modeling of tires, unit vectors describing the position and orientation of the tire are
essential. This is true for the tire's (rim's) center point as well as the contact point. The
center's properties are important to find the contact point and to describe translational
movement. For the contact point, it is important to have longitudinal, lateral and normal
vector forming a coordinate system that is used when forces and torques are applied on the
contact point.
<!--l. 100--></p><p class=\"noindent\">Figure&nbsp;<a href=\"#x1-22001r3\">2.3<!--tex4ht:ref: F_Reifen_Koordinatensysteme --></a> </p><hr class=\"figure\"><div class=\"figure\"><table class=\"figure\"><tbody><tr class=\"figure\"><td class=\"figure\">


<a id=\"x1-22001r3\"></a>


<div class=\"center\">
<!--l. 103--><p class=\"noindent\">
<!--l. 104--></p><p class=\"noindent\"><img src=\"../images/Master_Doku_MarkusAndres6x.png\" alt=\"PIC\" class=\"graphics\" width=\"241.84843pt\" height=\"208.91905pt\"><!--tex4ht:graphics
name=\"Master_Doku_MarkusAndres6x.png\" src=\"pics/Reifen_Koordinatensystem.eps\"
--></p></div>

<br> <div class=\"caption\"><table class=\"caption\"><tbody><tr style=\"vertical-align: baseline;\" class=\"caption\"><td class=\"id\">Figure&nbsp;2.3: </td><td class=\"content\">The unitary vectors of the tire without lean angle.</td></tr></tbody></table></div><!--tex4ht:label?: x1-22001r3 -->


<!--l. 108--><p class=\"noindent\"></p></td></tr></tbody></table></div><hr class=\"endfigure\">
<!--l. 110--><p class=\"noindent\">shows the unitary vectors of the contact point (<span class=\"cmmi-10x-x-109\">e</span><sub><span class=\"cmmi-8\">Long</span></sub>, <span class=\"cmmi-10x-x-109\">e</span><sub><span class=\"cmmi-8\">N</span></sub> and <span class=\"cmmi-10x-x-109\">e</span><sub><span class=\"cmmi-8\">Lat</span></sub>) and the rotational as well
as the (longitudinal) translational velocity (<span class=\"cmmi-10x-x-109\">v</span><sub><span class=\"cmmi-8\">Pitch</span></sub> and <span class=\"cmmi-10x-x-109\">v</span><sub><span class=\"cmmi-8\">Long</span></sub>). Translational velocities always
point in the direction of the corresponding unit vectors. The vector <span class=\"cmmi-10x-x-109\">r</span><sub><span class=\"cmmi-8\">CP</span> </sub> points from the
center of the rim to the contact point and is a fundamentally descriptive element of the
tire.

<!--l. 112--></p><p class=\"noindent\">In Figure&nbsp;<a href=\"#x1-22002r4\">2.4<!--tex4ht:ref: F_Reifen_Koordinatensysteme --></a> </p><hr class=\"figure\"><div class=\"figure\"><table class=\"figure\"><tbody><tr class=\"figure\"><td class=\"figure\">


<a id=\"x1-22002r4\"></a>


<div class=\"center\">
<!--l. 115--><p class=\"noindent\">
<!--l. 116--></p><p class=\"noindent\"><img src=\"../images/Master_Doku_MarkusAndres7x.png\" alt=\"PIC\" class=\"graphics\" width=\"241.84843pt\" height=\"209.86014pt\"><!--tex4ht:graphics
name=\"Master_Doku_MarkusAndres7x.png\" src=\"pics/Reifen_Koordinatensystem_schraeg.eps\"
--></p></div>
<br> <div class=\"caption\"><table class=\"caption\"><tbody><tr style=\"vertical-align: baseline;\" class=\"caption\"><td class=\"id\">Figure&nbsp;2.4: </td><td class=\"content\">The unitary vectors of the tire with lean angle of 10°.</td></tr></tbody></table></div><!--tex4ht:label?: x1-22002r4 -->


<!--l. 120--><p class=\"noindent\"></p></td></tr></tbody></table></div><hr class=\"endfigure\">

<!--l. 122--><p class=\"noindent\">the same wheel is shown again with a lean angle of <font face=\"Symbol\">&#966;</font> of 10° to show the changes when tilting
the wheel. Additionally the vector <span class=\"cmmi-10x-x-109\">e</span><sub><span class=\"cmmi-8\">Plane</span></sub> is added to the figure that was not shown in
Figure&nbsp;<a href=\"#x1-22001r3\">2.3<!--tex4ht:ref: F_Reifen_Koordinatensysteme --></a> to enhance clarity.
<!--l. 124--></p><p class=\"noindent\">For the forces generated by the tire, slip and sliding velocity are major factors.

</p><hr class=\"figure\"><div class=\"figure\"><table class=\"figure\"><tbody><tr class=\"figure\"><td class=\"figure\">


<a id=\"x1-22003r5\"></a>


<div class=\"center\">
<!--l. 127--><p class=\"noindent\">
<!--l. 128--></p><p class=\"noindent\"><img src=\"../images/Master_Doku_MarkusAndres8x.png\" alt=\"PIC\" class=\"graphics\" width=\"241.84843pt\" height=\"199.48845pt\"><!--tex4ht:graphics
name=\"Master_Doku_MarkusAndres8x.png\" src=\"pics/Reifen_Kontaktpunkt.eps\"
--></p></div>
<br> <div class=\"caption\"><table class=\"caption\"><tbody><tr style=\"vertical-align: baseline;\" class=\"caption\"><td class=\"id\">Figure&nbsp;2.5: </td><td class=\"content\">An enlarged view of the contact point with vectors for longitudinal speed
<span class=\"cmmi-10x-x-109\">v</span><sub><span class=\"cmmi-8\">Long</span></sub>, rotational speed <span class=\"cmmi-10x-x-109\">v</span><sub><span class=\"cmmi-8\">Pitch</span></sub> and longitudinal slip velocity <span class=\"cmmi-10x-x-109\">v</span><sub><span class=\"cmmi-8\">Pitch</span></sub> <span class=\"cmsy-10x-x-109\">× </span><span class=\"cmmi-10x-x-109\">r</span><sub><span class=\"cmmi-8\">CP</span> </sub> + <span class=\"cmmi-10x-x-109\">v</span><sub><span class=\"cmmi-8\">Long</span></sub>.</td></tr></tbody></table></div><!--tex4ht:label?: x1-22003r5 -->



<!--l. 132--><p class=\"noindent\"></p></td></tr></tbody></table></div><hr class=\"endfigure\">
<!--l. 134--><p class=\"noindent\">depicts the sliding velocity that is caused by <font face=\"Symbol\">&#969;</font><sub><span class=\"cmmi-8\">Pitch</span></sub> x <span class=\"cmmi-10x-x-109\">r</span><sub><span class=\"cmmi-8\">CP</span> </sub> <span class=\"cmmi-10x-x-109\">&gt; v</span><sub><span class=\"cmmi-8\">Long</span></sub>. This leads to a term
<font face=\"Symbol\">&#969;</font><sub><span class=\"cmmi-8\">Pitch</span></sub> x <span class=\"cmmi-10x-x-109\">r</span><sub><span class=\"cmmi-8\">CP</span> </sub> + <span class=\"cmmi-10x-x-109\">v</span><sub><span class=\"cmmi-8\">Long</span></sub>=0 that represents the longitudinal sliding velocity. There is a lateral
sliding velocity as well that has the size and direction of the lateral velocity <span class=\"cmmi-10x-x-109\">v</span><sub><span class=\"cmmi-8\">Lat</span></sub>. It
was not depicted in the figure for the sake of clarity. The overall slip velocity is
then computed from the two longitudinal and lateral components by Pythagoras?
rule as they are orthogonal. The computation of the unit vectors is presented in
Section&nbsp;<a href=\"#x1-610003.6.1\">3.6.1<!--tex4ht:ref: GeometryBase --></a>.

<!--l. 136--></p><p class=\"noindent\">Figure&nbsp;<a href=\"#x1-22004r6\">2.6<!--tex4ht:ref: F_OmegaPhi --></a> </p><hr class=\"figure\"><div class=\"figure\"><table class=\"figure\"><tbody><tr class=\"figure\"><td class=\"figure\">


<a id=\"x1-22004r6\"></a>


<div class=\"center\">
<!--l. 139--><p class=\"noindent\">
<!--l. 140--></p><p class=\"noindent\"><img src=\"../images/Master_Doku_MarkusAndres9x.png\" alt=\"PIC\" class=\"graphics\" width=\"241.84843pt\" height=\"208.91905pt\"><!--tex4ht:graphics
name=\"Master_Doku_MarkusAndres9x.png\" src=\"pics/Reifen_Winkel.eps\"
--></p></div>
<br> <div class=\"caption\"><table class=\"caption\"><tbody><tr style=\"vertical-align: baseline;\" class=\"caption\"><td class=\"id\">Figure&nbsp;2.6: </td><td class=\"content\">Standardized names of the angles and angular velocities.</td></tr></tbody></table></div><!--tex4ht:label?: x1-22004r6 -->


<!--l. 144--><p class=\"noindent\"></p></td></tr></tbody></table></div><hr class=\"endfigure\">

<!--l. 146--><p class=\"noindent\">depicts the standardized names of angles as well as angular velocities used in this
work.
<!--l. 148--></p><p class=\"noindent\">The coordinate system was chosen this way in order to suit the simulation environment
Dymola. DIN (Deutsche Industie Norm) defines the coordinates differently as well as
the SOE (Society of Automotive Engineers), whereas these differ from each other
also.


<!--l. 1--></p>
</html>"));
    end Definitions;

    class Defintions "Definition of Vectors and Coordinate Systems"

      annotation (Documentation(info="<html>
For the modeling of tires, unit vectors describing the position and orientation of the tire are
essential. This is true for the tire's (rim's) center point as well as the contact point. The
center's properties are important to find the contact point and to describe translational
movement. For the contact point, it is important to have longitudinal, lateral and normal
vector forming a coordinate system that is used when forces and torques are applied on the
contact point.
<!--l. 100--></p><p class=\"noindent\">Figure&nbsp;<a href=\"#x1-22001r3\">1<!--tex4ht:ref: F_Reifen_Koordinatensysteme --></a> </p><hr class=\"figure\"><div class=\"figure\"><table class=\"figure\"><tbody><tr class=\"figure\"><td class=\"figure\">


<a id=\"x1-22001r3\"></a>


<div class=\"center\">
<!--l. 103--><p class=\"noindent\">
<!--l. 104--></p><p class=\"noindent\"><img src=\"../images/Master_Doku_MarkusAndres6x.png\" alt=\"PIC\" class=\"graphics\" width=\"241.84843pt\" height=\"208.91905pt\"><!--tex4ht:graphics
name=\"Master_Doku_MarkusAndres6x.png\" src=\"pics/Reifen_Koordinatensystem.eps\"
--></p></div>

<br> <div class=\"caption\"><table class=\"caption\"><tbody><tr style=\"vertical-align: baseline;\" class=\"caption\"><td class=\"id\">Figure&nbsp;1: </td><td class=\"content\">The unitary vectors of the tire without lean angle.</td></tr></tbody></table></div><!--tex4ht:label?: x1-22001r3 -->


<!--l. 108--><p class=\"noindent\"></p></td></tr></tbody></table></div><hr class=\"endfigure\">
<!--l. 110--><p class=\"noindent\">shows the unitary vectors of the contact point (<span class=\"cmmi-10x-x-109\">e</span><sub><span class=\"cmmi-8\">Long</span></sub>, <span class=\"cmmi-10x-x-109\">e</span><sub><span class=\"cmmi-8\">N</span></sub> and <span class=\"cmmi-10x-x-109\">e</span><sub><span class=\"cmmi-8\">Lat</span></sub>) and the rotational as well
as the (longitudinal) translational velocity (<span class=\"cmmi-10x-x-109\">v</span><sub><span class=\"cmmi-8\">Pitch</span></sub> and <span class=\"cmmi-10x-x-109\">v</span><sub><span class=\"cmmi-8\">Long</span></sub>). Translational velocities always
point in the direction of the corresponding unit vectors. The vector <span class=\"cmmi-10x-x-109\">r</span><sub><span class=\"cmmi-8\">CP</span> </sub> points from the
center of the rim to the contact point and is a fundamentally descriptive element of the
tire.

<!--l. 112--></p><p class=\"noindent\">In Figure&nbsp;<a href=\"#x1-22002r4\">2<!--tex4ht:ref: F_Reifen_Koordinatensysteme --></a> </p><hr class=\"figure\"><div class=\"figure\"><table class=\"figure\"><tbody><tr class=\"figure\"><td class=\"figure\">


<a id=\"x1-22002r4\"></a>


<div class=\"center\">
<!--l. 115--><p class=\"noindent\">
<!--l. 116--></p><p class=\"noindent\"><img src=\"../images/Master_Doku_MarkusAndres7x.png\" alt=\"PIC\" class=\"graphics\" width=\"241.84843pt\" height=\"209.86014pt\"><!--tex4ht:graphics
name=\"Master_Doku_MarkusAndres7x.png\" src=\"pics/Reifen_Koordinatensystem_schraeg.eps\"
--></p></div>
<br> <div class=\"caption\"><table class=\"caption\"><tbody><tr style=\"vertical-align: baseline;\" class=\"caption\"><td class=\"id\">Figure&nbsp;2: </td><td class=\"content\">The unitary vectors of the tire with lean angle of 10°.</td></tr></tbody></table></div><!--tex4ht:label?: x1-22002r4 -->


<!--l. 120--><p class=\"noindent\"></p></td></tr></tbody></table></div><hr class=\"endfigure\">

<!--l. 122--><p class=\"noindent\">the same wheel is shown again with a lean angle of <font face=\"Symbol\">&#966;</font> of 10° to show the changes when tilting
the wheel. Additionally the vector <span class=\"cmmi-10x-x-109\">e</span><sub><span class=\"cmmi-8\">Plane</span></sub> is added to the figure that was not shown in
Figure&nbsp;<a href=\"#x1-22001r3\">1<!--tex4ht:ref: F_Reifen_Koordinatensysteme --></a> to enhance clarity.
<!--l. 124--></p><p class=\"noindent\">For the forces generated by the tire, slip and sliding velocity are major factors.

</p><hr class=\"figure\"><div class=\"figure\"><table class=\"figure\"><tbody><tr class=\"figure\"><td class=\"figure\">


<a id=\"x1-22003r5\"></a>


<div class=\"center\">
<!--l. 127--><p class=\"noindent\">
<!--l. 128--></p><p class=\"noindent\"><img src=\"../images/Master_Doku_MarkusAndres8x.png\" alt=\"PIC\" class=\"graphics\" width=\"241.84843pt\" height=\"199.48845pt\"><!--tex4ht:graphics
name=\"Master_Doku_MarkusAndres8x.png\" src=\"pics/Reifen_Kontaktpunkt.eps\"
--></p></div>
<br> <div class=\"caption\"><table class=\"caption\"><tbody><tr style=\"vertical-align: baseline;\" class=\"caption\"><td class=\"id\">Figure&nbsp;3: </td><td class=\"content\">An enlarged view of the contact point with vectors for longitudinal speed
<span class=\"cmmi-10x-x-109\">v</span><sub><span class=\"cmmi-8\">Long</span></sub>, rotational speed <span class=\"cmmi-10x-x-109\">v</span><sub><span class=\"cmmi-8\">Pitch</span></sub> and longitudinal slip velocity <span class=\"cmmi-10x-x-109\">v</span><sub><span class=\"cmmi-8\">Pitch</span></sub> <span class=\"cmsy-10x-x-109\">× </span><span class=\"cmmi-10x-x-109\">r</span><sub><span class=\"cmmi-8\">CP</span> </sub> + <span class=\"cmmi-10x-x-109\">v</span><sub><span class=\"cmmi-8\">Long</span></sub>.</td></tr></tbody></table></div><!--tex4ht:label?: x1-22003r5 -->



<!--l. 132--><p class=\"noindent\"></p></td></tr></tbody></table></div><hr class=\"endfigure\">
<!--l. 134--><p class=\"noindent\">depicts the sliding velocity that is caused by <font face=\"Symbol\">&#969;</font><sub><span class=\"cmmi-8\">Pitch</span></sub> x <span class=\"cmmi-10x-x-109\">r</span><sub><span class=\"cmmi-8\">CP</span> </sub> <span class=\"cmmi-10x-x-109\">&gt; v</span><sub><span class=\"cmmi-8\">Long</span></sub>. This leads to a term
<font face=\"Symbol\">&#969;</font><sub><span class=\"cmmi-8\">Pitch</span></sub> x <span class=\"cmmi-10x-x-109\">r</span><sub><span class=\"cmmi-8\">CP</span> </sub> + <span class=\"cmmi-10x-x-109\">v</span><sub><span class=\"cmmi-8\">Long</span></sub>=0 that represents the longitudinal sliding velocity. There is a lateral
sliding velocity as well that has the size and direction of the lateral velocity <span class=\"cmmi-10x-x-109\">v</span><sub><span class=\"cmmi-8\">Lat</span></sub>. It
was not depicted in the figure for the sake of clarity. The overall slip velocity is
then computed from the two longitudinal and lateral components by Pythagoras'
rule as they are orthogonal.

<!--l. 136--></p><p class=\"noindent\">Figure&nbsp;<a href=\"#x1-22004r6\">4<!--tex4ht:ref: F_OmegaPhi --></a> </p><hr class=\"figure\"><div class=\"figure\"><table class=\"figure\"><tbody><tr class=\"figure\"><td class=\"figure\">


<a id=\"x1-22004r6\"></a>


<div class=\"center\">
<!--l. 139--><p class=\"noindent\">
<!--l. 140--></p><p class=\"noindent\"><img src=\"../images/Master_Doku_MarkusAndres9x.png\" alt=\"PIC\" class=\"graphics\" width=\"241.84843pt\" height=\"208.91905pt\"><!--tex4ht:graphics
name=\"Master_Doku_MarkusAndres9x.png\" src=\"pics/Reifen_Winkel.eps\"
--></p></div>
<br> <div class=\"caption\"><table class=\"caption\"><tbody><tr style=\"vertical-align: baseline;\" class=\"caption\"><td class=\"id\">Figure&nbsp;4: </td><td class=\"content\">Standardized names of the angles and angular velocities.</td></tr></tbody></table></div><!--tex4ht:label?: x1-22004r6 -->


<!--l. 144--><p class=\"noindent\"></p></td></tr></tbody></table></div><hr class=\"endfigure\">

<!--l. 146--><p class=\"noindent\">depicts the standardized names of angles as well as angular velocities used in this
work.
<!--l. 148--></p><p class=\"noindent\">The coordinate system was chosen this way in order to suit the simulation environment
Dymola. DIN (Deutsche Industie Norm) defines the coordinates differently as well as
the SOE (Society of Automotive Engineers), whereas these differ from each other
also.


<!--l. 1--></p>
</html>"));
    end Defintions;

    class Decomposition "Decomposition into Objects"

      annotation (Documentation(info="<html>

This section focuses on demonstrating the considerations that lead to
the actual structure of the model.

<!--l. 5--></p><p class=\"noindent\">Thinking about wheels, the first division of the model is quite obvious, as there are two
physical components: the rim and the tire. The rim does not need to be split up
into further objects, as the important properties for the overall wheel are very
limited in a semi-empirical tire model. This is characteristic is shown in Figure&nbsp;<a href=\"#x1-24001r1\">1<!--tex4ht:ref: F_WheelDecomposition --></a>,
</p><hr class=\"figure\"><div class=\"figure\"><table class=\"figure\"><tbody><tr class=\"figure\"><td class=\"figure\">


<a id=\"x1-24001r1\"></a>


<div class=\"center\">
<!--l. 8--><p class=\"noindent\">
</p><div class=\"colorbox\" id=\"colorbox1\"> <img src=\"../images/Master_Doku_MarkusAndres10x.png\" alt=\"PIC\" class=\"graphics\"><!--tex4ht:graphics
name=\"Master_Doku_MarkusAndres10x.png\" src=\"pics/WheelDecomposition.eps\"
--> </div>
</div>
<br> <div class=\"caption\"><table class=\"caption\"><tbody><tr style=\"vertical-align: baseline;\" class=\"caption\"><td class=\"id\">Figure&nbsp;1: </td><td class=\"content\">Composition of wheels and properties of tires. Properties depicted in gray
are neglected in the tire model.</td></tr></tbody></table></div><!--tex4ht:label?: x1-24001r1 -->



<!--l. 15--><p class=\"noindent\"></p></td></tr></tbody></table></div><hr class=\"endfigure\">
<!--l. 17--><p class=\"noindent\">which also lists the most important properties of tires split up into different groups. The
model of the rim is quite simple basically just modeling its mass and inertia tensor.
<!--l. 19--></p><p class=\"noindent\">The tire does require a much closer look concerning its properties, as they are of much bigger
importance for the overall behavior of the wheel than the ones of the rim. Modeling every
single of the properties shown in Figure&nbsp;<a href=\"#x1-24001r1\">1<!--tex4ht:ref: F_WheelDecomposition --></a> by an own class is infeasible task, suggesting a
certain grouping of properties. Due to the semi-empirical single contact point model
certain constraints are fixed. There has to be a contact point as part of the model
somewhere, on which forces and torques are acting. The model realizing the contact
point is named <span class=\"cmti-10x-x-109\">Contact Physics.

<!--l. 21--></p><p class=\"noindent\">One of the most challenging tasks of a tire model is to calculate the forces the tire excites in
different driving situations. There are plenty of different models trying to describe the
relation resulting in the forces that act on the contact point. Hence, a decision was made
to create a class that gathers the different effects which are responsible for the
generation of forces and torques acting on the contact point. Due to its origin is it is
called the <span class=\"cmti-10x-x-109\">Friction </span>class. As one can imagine this is a rather complex class covering
multiple effects. Hence, a further breakdown into different sub-classes is made, for
the model to be well manageable with a structure which is simple to adapt and
expand.

<!--l. 23--></p><p class=\"noindent\">Figure&nbsp;<a href=\"#x1-24002r2\">2<!--tex4ht:ref: F_TireDecompositionNotFinished --></a> </p><hr class=\"figure\"><div class=\"figure\"><table class=\"figure\"><tbody><tr class=\"figure\"><td class=\"figure\">


<a id=\"x1-24002r2\"></a>



<div class=\"center\">
<!--l. 26--><p class=\"noindent\">
</p><div class=\"colorbox\" id=\"colorbox2\"> <img src=\"../images/Master_Doku_MarkusAndres11x.png\" alt=\"PIC\" class=\"graphics\" width=\"355.65945pt\" height=\"2124179pt\"><!--tex4ht:graphics
name=\"Master_Doku_MarkusAndres11x.png\" src=\"pics/TireDecompositionNotFinished.eps\"
--> </div>
</div>
<br> <div class=\"caption\"><table class=\"caption\"><tbody><tr style=\"vertical-align: baseline;\" class=\"caption\"><td class=\"id\">Figure&nbsp;2: </td><td class=\"content\">Properties from Figure&nbsp;<a href=\"#x1-24001r1\">1<!--tex4ht:ref: F_WheelDecomposition --></a> shown in relation to the corresponding <span class=\"cmti-10x-x-109\">Tire</span>
<span class=\"cmti-10x-x-109\">Component  </span>classes which are closely related with the semi-empirical contact point
model. Properties depicted in gray are simplified in the model.</td></tr></tbody></table></div><!--tex4ht:label?: x1-24002r2 -->



<!--l. 33--><p class=\"noindent\"></p></td></tr></tbody></table></div><hr class=\"endfigure\">
<!--l. 35--><p class=\"noindent\">depicts the status of modeling, including the restriction by the single contact point model
and the reasonable introduction of the <span class=\"cmti-10x-x-109\">Friction </span>class. One can easily identify that absolutely
basic properties of a tire are not yet part of the model. The probably first to catch the
reader's eye are the <span class=\"cmti-10x-x-109\">Tire Diameter </span>and the <span class=\"cmti-10x-x-109\">Cross-Section</span>. These properties basically define
the geometry of the tire, which shall be changeable conveniently in the final tire model,
allowing basically different geometric properties of the tire. Therefore a <span class=\"cmti-10x-x-109\">Geometry </span>class is
introduced, defining the positional relation between the tire hub and the contact point and
some other properties.

<!--l. 37--></p><p class=\"noindent\">The next very basic duty the tire has to fulfill, which is not yet modeled, is the <span class=\"cmti-10x-x-109\">Carrying of</span>
<span class=\"cmti-10x-x-109\">normal Load</span>. Depending on the tire model different techniques are utilized to realize this
functionality. These range from the holonomic constraints defining ideal tires to more
complex models including a certain <span class=\"cmti-10x-x-109\">Damping of Surface Unevenness </span>by the introduction of
more complex models. Due to the changing requirements to these aspects, the effects were
gathered in a class named <span class=\"cmti-10x-x-109\">Vertical Dynamics</span>. It basically determines how the tire reacts
on normal load and if the ideally stiff <span class=\"cmti-10x-x-109\">Geometry </span>it is able to penetrate into the
ground<span class=\"footnote-mark\"><a href=\"Master_Doku_MarkusAndres2.html#fn1x3\"><sup class=\"textsuperscript\"></sup></a></span><a id=\"x1-24003f1\"></a>
and lift from it.

<!--l. 39--></p><p class=\"noindent\">Until now all possible tire models would be totally rigid. To enable a certain deformation of
the tire, the <span class=\"cmti-10x-x-109\">Belt Dynamics </span>class is introduced. It allows a flexibility of the still rigid
tire, defined by the <span class=\"cmti-10x-x-109\">Geometry </span>class, related to the tire's hub. The part of the tire
that would best suite the ideal geometry is the belt. Hence, this class is called
<span class=\"cmti-10x-x-109\">Belt Dynamics</span>.

<!--l. 41--></p><p class=\"noindent\">The tire is now modularized into six classes including the <span class=\"cmti-10x-x-109\">Rim </span>class which is not depicted in
Figure&nbsp;<a href=\"#x1-24004r3\">3<!--tex4ht:ref: F_TireDecomposition --></a>, </p><hr class=\"figure\"><div class=\"figure\"><table class=\"figure\"><tbody><tr class=\"figure\"><td class=\"figure\">



<a id=\"x1-24004r3\"></a>


<div class=\"center\">
<!--l. 44--><p class=\"noindent\">
</p><div class=\"colorbox\" id=\"colorbox3\"> <img src=\"../images/Master_Doku_MarkusAndres12x.png\" alt=\"PIC\" class=\"graphics\" width=\"355.65945pt\" height=\"220.98805pt\"><!--tex4ht:graphics
name=\"Master_Doku_MarkusAndres12x.png\" src=\"pics/TireDecomposition.eps\"
--> </div>
</div>
<br> <div class=\"caption\"><table class=\"caption\"><tbody><tr style=\"vertical-align: baseline;\" class=\"caption\"><td class=\"id\">Figure&nbsp;3: </td><td class=\"content\">Final decomposition of the tire. Properties depicted in gray are simplified
in the model.</td></tr></tbody></table></div><!--tex4ht:label?: x1-24004r3 -->


<!--l. 51--><p class=\"noindent\"></p></td></tr></tbody></table></div><hr class=\"endfigure\">
<!--l. 53--><p class=\"noindent\">as it was shown in Figure&nbsp;<a href=\"#x1-24001r1\">1<!--tex4ht:ref: F_WheelDecomposition --></a>. The following Section explains the implemented version of this classes
from the modelers point of view. It also explains why the final model of the tire contains
seven classes, introducing a <span class=\"cmti-10x-x-109\">Center to Contact Point </span>class.

<!--l. 55--></p><p class=\"noindent\">All the classes mentioned above are calculating variables that are at least partially used by
other objects for further computations. As there are quite a few of these variables passed to
other objects, considerable effort was put into the development of a communication structure
enabling the user to understand the connection between the objects just from looking at
the graphical view of the models.
<!--l. 57--></p><p class=\"noindent\">Still there is one class found in Figure&nbsp;<a href=\"#x1-24004r3\">3<!--tex4ht:ref: F_TireDecomposition --></a> that has not been introduced until now. This is
justified as it is an <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">inner</span></span></span> model and is no part of the actual tire model. It realizes uneven
surfaces and enables a position-depending friction coefficient.
</p>

The implemented version of the tire model is presented in <a href=\"Modelica://WheelsAndTires.UsersGuide.StructureTL.Tire\">Tire Model Structure</a>.

</html>"));
    end Decomposition;

    class StructureTL "Structure of the Tire and Library"
      annotation (Documentation(info="<html>

The following sections are intended to give an broad overview of the implemented version of the tire model and the Modelica library.

<ol>
<li><a href=\"Modelica://WheelsAndTires.UsersGuide.StructureTL.Tire\">Tire Model Structure</a>
<li><a href=\"Modelica://WheelsAndTires.UsersGuide.StructureTL.Library\">Library Structure</a>
</ol>

</html>"));

    class Tire "Tire Model Structure"
    annotation (Documentation(info="<html>

The connection to the superordinate vehicle model is realized by the three dimensional frame named <span class=\"cmti-10x-x-109\">Tire Hub</span>

depicted in Figure&nbsp;<a href=\"#x1-26002r4\">1<!--tex4ht:ref: F_CommunicationStructureTopLevel --></a><a id=\"x1-26001f2\"></a> .
</p><hr class=\"figure\"><div class=\"figure\"><table class=\"figure\"><tbody><tr class=\"figure\"><td class=\"figure\">


<a id=\"x1-26002r4\"></a>


<div class=\"center\">
<!--l. 10--><p class=\"noindent\">
</p><div class=\"colorbox\" id=\"colorbox4\"> <img src=\"../images/Master_Doku_MarkusAndres13x.png\" alt=\"PIC\" class=\"graphics\" width=\"355.65945pt\" height=\"213.7922pt\"><!--tex4ht:graphics
name=\"Master_Doku_MarkusAndres13x.png\" src=\"pics/IdealTireModel.eps\"
--> </div>
</div>
<br> <div class=\"caption\"><table class=\"caption\"><tbody><tr style=\"vertical-align: baseline;\" class=\"caption\"><td class=\"id\">Figure&nbsp;1: </td><td class=\"content\">Model of the ideal tire showing the communication structure on the top
level of the tire model.</td></tr></tbody></table></div><!--tex4ht:label?: x1-26002r4 -->



<!--l. 17--><p class=\"noindent\"></p></td></tr></tbody></table></div><hr class=\"endfigure\">
<!--l. 19--><p class=\"noindent\">The <span class=\"cmti-10x-x-109\">Tire Hub </span>is rigidly connected to the model of the <span class=\"cmti-10x-x-109\">Rim</span>. The frame connected to the <span class=\"cmti-10x-x-109\">Tire</span>
<span class=\"cmti-10x-x-109\">Hub </span>therefore is placed at the center-point of the rim. The \"output\" of the <span class=\"cmti-10x-x-109\">Rim</span>
models the center-point of the <span class=\"cmti-10x-x-109\">Rim</span>, which is connected to the <span class=\"cmti-10x-x-109\">Belt Dynamics </span>model.
In this model the relative movement between the rigid belt and the rim can be
described. The \"output\" of the <span class=\"cmti-10x-x-109\">Belt Dynamics </span>is again positioned at the center-point
of the belt. Therefore an element is needed to realize the translation from this
point to the contact point. As this can not be modeled by a standard element, the

<span class=\"cmti-10x-x-109\">Center To Contact Point </span>model has been created. It connects the <span class=\"cmti-10x-x-109\">Contact Physics</span>
model that applies forces and torques to the contact point as well as measuring its
velocities. This lower part of the model represents the mechanically connected part of
the model. The upper three classes are not directly connected by a mechanical
connector, although the <span class=\"cmti-10x-x-109\">Contact Point Connector </span>implies kind of a mechanical
connection. It can be found connecting <span class=\"cmti-10x-x-109\">Contact Physics</span>, <span class=\"cmti-10x-x-109\">Vertical Dynamics </span>and
<span class=\"cmti-10x-x-109\">Friction </span>classes. The <span class=\"cmti-10x-x-109\">Vertical Dynamics </span>class determines if and how the tire is
able to lift from the ground and how it responds to normal load. The <span class=\"cmti-10x-x-109\">Friction</span>

class determines the longitudinal and lateral forces as well as the torques that act
on the contact point. Finally, the <span class=\"cmti-10x-x-109\">Geometry </span>class determines the unitary vectors
shown in Figure&nbsp;<a href=\"Modelica://WheelsAndTires.UsersGuide.Definitions\">1<!--tex4ht:ref: F_Reifen_Koordinatensysteme --></a> and the position of the contact point depending on the actual
geometry.
<!--l. 23--></p><p class=\"noindent\">In order to be able to identify different tires easily, the visualization of the single parts is
done in the corresponding objects. So e.g.&nbsp;the rim is visualized in the <span class=\"cmti-10x-x-109\">Rim Class</span>, the tire's
geometry is visualized in the <span class=\"cmti-10x-x-109\">Geometry Class </span>and contact forces are visualized in
the <span class=\"cmti-10x-x-109\">Contact Physics </span>class. Therefore, changing the <span class=\"cmti-10x-x-109\">Rim </span>class leads to a changed
visualization.
</p>

</html>"));
    end Tire;

    class Library "Library Structure"
    annotation (Documentation(info="<html>

This section is intended to give a shallow overview of the library?s structure. The top level
packages of the library are depicted in Figure&nbsp;<a href=\"#x1-27001r5\">1<!--tex4ht:ref: F_LibraryStructure --></a>. </p><hr class=\"figure\"><div class=\"figure\"><table class=\"figure\"><tbody><tr class=\"figure\"><td class=\"figure\">


<a id=\"x1-27001r5\"></a>


<div class=\"centerline\">   <img src=\"../images/Master_Doku_MarkusAndres14x.png\" alt=\"PIC\" class=\"graphics\" width=\"355.65945pt\" height=\"61.24422pt\"><!--tex4ht:graphics
name=\"Master_Doku_MarkusAndres14x.png\" src=\"pics/LibraryStructureHorizontal.eps\"
-->   </div>
<br> <div class=\"caption\"><table class=\"caption\"><tbody><tr style=\"vertical-align: baseline;\" class=\"caption\"><td class=\"id\">Figure&nbsp;1: </td><td class=\"content\">The library?s top level packages</td></tr></tbody></table></div><!--tex4ht:label?: x1-27001r5 -->


<!--l. 33--><p class=\"noindent\"></p></td></tr></tbody></table></div><hr class=\"endfigure\">

<!--l. 35--><p class=\"noindent\">The <span class=\"cmti-10x-x-109\">Tire Components </span>package covers the classes the <span class=\"cmti-10x-x-109\">Tires </span>are built of. The <span class=\"cmti-10x-x-109\">Tire</span>
<span class=\"cmti-10x-x-109\">Components </span>are described in detail in the corresponding models. Both <span class=\"cmti-10x-x-109\">Tires </span>and <span class=\"cmti-10x-x-109\">Tire</span>

<span class=\"cmti-10x-x-109\">Components </span>are colored in green, in the library as well as in Figure&nbsp;<a href=\"#x1-27001r5\">1<!--tex4ht:ref: F_LibraryStructure --></a>, as they have
the same basis. The <span class=\"cmti-10x-x-109\">Environment </span>package contains the <span class=\"cmti-10x-x-109\">Surface Base </span>as well as a
exemplary implementation for even and uneven surfaces. It is described in the Environment Package precisley. To check basic functionality of <span class=\"cmti-10x-x-109\">Elevation </span>and <span class=\"cmti-10x-x-109\">Friction </span>classes as well as
the <span class=\"cmti-10x-x-109\">Surface</span>, the <span class=\"cmti-10x-x-109\">Test Bench </span>package has been created. The <span class=\"cmti-10x-x-109\">Examples </span>package
demonstrates how tire models can be used as part of a vehicle model. <span class=\"cmti-10x-x-109\">Examples</span>

and <span class=\"cmti-10x-x-109\">Test Bench </span>are described in the corresponding packages. Finally the <span class=\"cmti-10x-x-109\">Visualization </span>package
gathers a few models used to enable the animation of all necessary parts of the
library.
<!--l. 37--></p>

</html>"));
    end Library;

    end StructureTL;

    class Tires "Provided Tire Models"
      annotation (Documentation(info="<html>

All tires presented here are basically built up like the ideal tire in Figure&nbsp;<a href=\"Modelica://WheelsAndTires.UsersGuide.Tires.Predefined\">1<!--tex4ht:ref: F_CommunicationStructureTopLevel --></a> in <a href=\"Modelica://WheelsAndTires.UsersGuide.StructureTL.Tire\">Tire Model Structure<!--tex4ht:ref: F_CommunicationStructureTopLevel --></a>. All connect seven objects defining all of the tire's properties with three different
connectors. Two of these are the customized bus connections described in the <a href=\"Modelica://WheelsAndTires.TireComponents.Communication\">Communications Structure<!--tex4ht:ref: F_CommunicationStructureTopLevel --></a> package, the
other is the rigid connection between frames defined by the <span class=\"cmti-10x-x-109\">MultiBondLib</span>. These rigid
connections transfer mechanical properties and describe an ideal connection between the two
connected frames. Different properties can simply be realized by choosing different classes. As
the interfaces between the classes are standardized, no further adaptation is necessary.
If no parameter passing from the top level is realized, the tire is usable already.
Although for convenient use parameter passing combined with a well engineered
initialization is a postulate. How parameters can be aggregated is shown in <a href=\"Modelica://WheelsAndTires.UsersGuide.Tires.Parameter\">Parameter Aggregation<!--tex4ht:ref: F_CommunicationStructureTopLevel --></a>,
whereas the different strategies of initialization are demonstrated in Section&nbsp;<a href=\"Modelica://WheelsAndTires.UsersGuide.Tires.Initialization\">Parameter Initialization<!--tex4ht:ref: F_CommunicationStructureTopLevel --></a>. The
ready-made tire models delivered with the library are presented in the following
section.

<ol>
<li><a href=\"Modelica://WheelsAndTires.UsersGuide.Tires.Predefined\">Predefined Models</a>
<li><a href=\"Modelica://WheelsAndTires.UsersGuide.Tires.Parameter\">Parameter Aggregation</a>
<li><a href=\"Modelica://WheelsAndTires.UsersGuide.Tires.Initialization\">Initialization</a>
<li><a href=\"Modelica://WheelsAndTires.UsersGuide.Tires.Defining\">Defining New Tires</a>
</ol>

</html>"));

    class Predefined "Predefined Models"
    annotation (Documentation(info="<html>
Figure&nbsp;<a href=\"#x1-103001r1\">1<!--tex4ht:ref: F_TireTypes --></a> </p><hr class=\"figure\"><div class=\"figure\"><table class=\"figure\"><tbody><tr class=\"figure\"><td class=\"figure\">


<a id=\"x1-103001r1\"></a>


<div class=\"center\">
<!--l. 17--><p class=\"noindent\">
<!--l. 18--></p><p class=\"noindent\"><img src=\"../images/Master_Doku_MarkusAndres160x.png\" alt=\"PIC\" class=\"graphics\" width=\"412.56496pt\" height=\"405.12755pt\"><!--tex4ht:graphics
name=\"Master_Doku_MarkusAndres160x.png\" src=\"pics/TireTypes_v02.eps\"
--></p></div>
<br> <div class=\"caption\"><table class=\"caption\"><tbody><tr style=\"vertical-align: baseline;\" class=\"caption\"><td class=\"id\">Figure&nbsp;1: </td><td class=\"content\">Predefined tires available in the Wheels and Tires Library.</td></tr></tbody></table></div><!--tex4ht:label?: x1-103001r1 -->


<!--l. 22--><p class=\"noindent\"></p></td></tr></tbody></table></div><hr class=\"endfigure\">

<!--l. 24--><p class=\"noindent\">shows the different tire models and the components they utilize.
<!--l. 27--></p><p class=\"noindent\">For different combinations of frictional components, a class has to be created. Therefore, the
amount of combinations of different frictional components was kept as small as possible,
creating the following frictional classes.
     </p><ul class=\"itemize1\">
     <li class=\"itemize\"><span class=\"cmti-10x-x-109\">Ideal Friction </span> - <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">IdealFriction</span></span></span>, modeling ideal frictional behavior.
     </li>
     <li class=\"itemize\"><span class=\"cmti-10x-x-109\">Dry Friction with Roll Resistance </span> - <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">DryFrictionRollRes</span></span></span>, adding slip based on
     the sliding dry friction model and constant rolling resistance.
     </li>
     <li class=\"itemize\"><span class=\"cmti-10x-x-109\">Advanced Friction </span> - <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">AdvancedFriction</span></span></span>, the most advanced version of friction
     possible with the current version of the library including all covered frictional
     effects.</li></ul>

<!--l. 34--><p class=\"noindent\">Looking at Figure <a href=\"#x1-103001r1\">1<!--tex4ht:ref: F_TireTypes --></a>, two elements in brackets are found for the <span class=\"cmti-10x-x-109\">Linear Overturning Torque</span>.
These models will compute the overturning torque to be zero because a width of the tire is
required to get an overturning stiffness not equal to 0.
</p>

</html>"));
    end Predefined;

    class Parameter "Parameter Aggregation"
    annotation (Documentation(info="<html>

Many of the parameters are commonly used in every tire model, a <span class=\"cmti-10x-x-109\">Commons </span>package has
been created to gather all these parameters. The different tire models can then simply
extend these files and will feature all the parameters from these files. So there is
a central place to change parameters in one go, instead of doing it in every tire
model.
<!--l. 40--></p><p class=\"noindent\">The created \"parameter\" files are the following.
     </p><ul class=\"itemize1\">
     <li class=\"itemize\"><span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">ParametersCommon</span></span></span> - <span class=\"cmti-10x-x-109\">Parameters Common</span>

     </li>
     <li class=\"itemize\"><span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">ParametersDryRollRes</span></span></span> - <span class=\"cmti-10x-x-109\">Parameters Dry Friction with Roll Resistance</span>
     </li>
     <li class=\"itemize\"><span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">ParametersAdvancedFriction</span></span></span> - <span class=\"cmti-10x-x-109\">Parameters Advanced Friction</span></li></ul>



<!--l. 47--><p class=\"noindent\">The first of these gathers the parameters that are common for every tire model, like the rim
mass or different variables for the visualization. <span class=\"cmti-10x-x-109\">Parameters Dry Friction with Roll Resistance</span>
contains all the parameters used by the <span class=\"cmti-10x-x-109\">Dry Friction with Roll Resistance </span>as the last
(partial) model does for the <span class=\"cmti-10x-x-109\">Advanced Friction </span>class. As one can imagine, the latter two
models are used in combination with the corresponding frictional class, as they have the same
parameters independent of the other used classes. No further gathering was made because the
cost-benefit ratio is inadequate.
<!--l. 49--></p><p class=\"noindent\">Generally, it has to be mentioned that some of the parameters have to be adapted to
suit the actual application. But as the user is expected to be familiar with tire
modeling or will even add own models to the library, that is not considered to be a
problem.
<!--l. 51--></p>

</html>"));
    end Parameter;

    class Initialization "Initialization"
    annotation (Documentation(info="<html>

The initialization is quite different for ideal models and their slipping counterparts. The
major differences regarding initialization are that predefined ideal models are not able to lift
from the ground and obviously do not slip. Therefore, two different initialization strategies
have been implemented, which unfortunately could not be aggregated for all models as is
possible with the parameters. This is not possible due to the fact that variables can not be
initialized in a different model than they are used in. For this reason, every tire has its own
equations for initialization.
<!--l. 55--></p><p class=\"noindent\">Another very important aspect of the initialization is that every model adding
dynamics to the system like the <span class=\"cmti-10x-x-109\">Contact Point Dynamics </span>or some kind of belt
dynamics is initialized in a way suitable for the unloaded steady state directly in
the model adding the dynamics. That makes it possible to just have two different
initializations. So every tire provided in this library will initialize with a penetration
depth of 0 then start to penetrate the ground to build up the necessary normal
force.

<!--l. 57--></p><p class=\"noindent\">
</p><h4 class=\"subsectionHead\">Initialization of Non-Slipping Tires</h4>


<!--l. 59--><p class=\"noindent\">The initialization of the tires with ideal slip behavior is relatively straightforward.
The approach used in the <span class=\"cmti-10x-x-109\">Wheels and Tires </span>Library is based on the models of
the ideal tire from the <span class=\"cmti-10x-x-109\">Multi Bond Library </span><span class=\"cite\">[<a href=\"Modelica://WheelsAndTires.UsersGuide.Literature\">Zim06</a>]</span>. It can be done by setting the
rotational speed of the rim mass. The holonomic constraint caused by the ideal
slip behavior and the <span class=\"cmti-10x-x-109\">Center to Contact Point </span>model directly converts this into a
translational velocity of the rim mass. As it can be more convenient to set the
translational velocity, an option called <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">use</span></span></span><span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">Transla</span></span></span><span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">tio</span></span></span><span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">nal</span></span></span><span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">Velocities</span></span></span> was added
to the initialization, enabling the user to set the translational velocities directly.
Again the model converts the translational velocity into rotational speed by the
model geometry automatically when setting the translational velocity of the rim
mass.

<!--l. 61--></p><p class=\"noindent\">There are a couple of restrictions to these ideal models that become obvious when looking at
the code more closely. The first is the <span class=\"cmti-10x-x-109\">No Elevation </span>class fixing the contact point somewhere
in the x-z-plane. Therefore, the initialization just sets coordinates in x and z direction not
considering inputs that would put the tire above the surface in the air or penetrating in
the ground as this is not possible. This also applies for the translational speed in
vertical direction, as the tire can not move in this direction. Another thing important
to notice is that for the usage of translational velocities in the initialization, the
rotational speed about the z axis is set to 0 to ensure a reasonable start of the
tire.
<!--l. 63--></p><p class=\"noindent\">
</p><h4 class=\"subsectionHead\">Initialization of Slipping Tires</h4>
<!--l. 64--><p class=\"noindent\">Tires that can slip have to be initialized in a more complex way in order to cover
all possible combinations of translational velocities, sliding velocities and angular
velocities. A tire that is initialized with a speed about its rotational axis will directly
transform this rotational speed to sliding velocity as the rim mass is initialized with a
translational speed of 0 in that particular case. This will make the tire slip for some time,
transforming the rotational energy to translational with losses due to the slip. This
is not convenient in general, as the user usually wants to initialize a model with
an exact translational speed e.g.&nbsp;for stability analysis of a bicycle. Therefore a
more complex version of initialization was implemented. To enable the user to
switch from ideal models to this more complex conveniently, an additional variable
<span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">use</span></span></span><span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">Advanced</span></span></span><span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">Initialization</span></span></span> was added. This disables the simple initialization that is
possible for the slipping tires as well. The user is now able to set two of the possible


velocities<span class=\"footnote-mark\"><a href=\"Master_Doku_MarkusAndres15.html#fn1x4\"></a></span><a id=\"x1-107001f1\"></a>

manually, letting the model determine the third automatically. So the user can set e.g.&nbsp;the
translational speed to a certain value and the slip to zero, making the model behave as the
ideal version at least during the initialization.
<!--l. 66--></p><p class=\"noindent\">Another option called <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">onSurface</span></span></span> is provided to enable the user to make the tire initialize on
the surface that can be uneven in the event of these models. The tire is initialized with the
rim mass at height 0 by default otherwise. This stretches the spring of the vertical dynamics
to an unrealistically big value making the tire respond to the very big normal force resulting
in a very big acceleration normal to the surface. This can be overcome with the initialization
of the position. Problematic with this version of initialization is that e.g.&nbsp;the positions of
3 of the tires of a simple car model are defined by holonomic constraints from
the position of the fourth tire. Therefore, initializing the position of all tires of
this model can be problematic. In this case the <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">onSurface</span></span></span> option becomes useful.
The option is automatically ignored if the position is initialized directly by the
user.
<!--l. 68--></p><p class=\"noindent\">There are two more properties that have to be kept in mind with the advanced initialization.
The first is that the normal component is ignored in the initialization of translational
velocities. Secondly in the case of setting the rotational speed, the normal component
it is set to 0. Generally, it is suggested to initialize the tire on a flat part of the
surface.
<!--l. 70--></p>

</html>"));
    end Initialization;

    class Defining "Defining New Tires"
    annotation (Documentation(info="<html>

For the user who has to define new tire models, it is suggested to copy the most similar
version of a tire that is available in the library. Afterwards, the user can exchange the objects
that were adapted or created by right-clicking on the object to be replaced and choosing

<span class=\"cmti-10x-x-109\">Change Class </span>from the Dymola context menu. If the used simulation environment does not
support this function the model can also be exchanged in the Modelica code directly
which is equal to the <span class=\"cmti-10x-x-109\">Change Class </span>option. When changing sub-classes a good
approach is to duplicate the most similar class and then modify the equations
or models contained. This way, models are likely to not have basic errors. Thus
all the parameters are left in the code which can be useful and the names in the
model stay the same. Basically, the names of every model can be changed because
the communication structure does not care about the names of the objects, but


the initialization is done utilizing some of the names in the described example
tires. Therefore, difficulties can arise with the initialization when changing object
names.
<!--l. 73--></p><p class=\"noindent\">As mentioned before, the initialization of components adding dynamics to the model is
usually done in the dynamic model directly making them exchangeable, without having to
care about the initialization of the overall model. So it is suggested that future models, which
add dynamics to the model, are initialized in the same way. Although e.g.&nbsp;initializing
everything from a central code section could add some clarity, the initialization structure
would have to be adapted with every change in the tire?s structure which is important for the
initialization.


</p>
</html>"));
    end Defining;
    end Tires;

    class Examples "Examplary Results"
      annotation (Documentation(info="<html>

This section covers the models in the <span class=\"cmti-10x-x-109\">Wheels and Tires </span>library that can be simulated
directly. These are split up into two packages.
     </p><ul class=\"itemize1\">

     <li class=\"itemize\">The <span class=\"cmti-10x-x-109\">Test Bench  </span>covers models that are provided to verify basic functions of
     the  tire.  These  include  the  <span class=\"cmti-10x-x-109\">Elevation</span>,  <span class=\"cmti-10x-x-109\">Friction Effects</span>,  <span class=\"cmti-10x-x-109\">Surfaces  </span>and  <span class=\"cmti-10x-x-109\">Plotting</span>
     <span class=\"cmti-10x-x-109\">Functions</span>.
     </li>
     <li class=\"itemize\">The <span class=\"cmti-10x-x-109\">Examples  </span>package includes simple models that are provided to show the
     usage of the tires in combination with a vehicle.</li></ul>

<h3 class=\"sectionHead\"><a id=\"x1-1220006.1\"></a>The Test Bench</h3>
<!--l. 11--><p class=\"noindent\">Models contained in the <span class=\"cmti-10x-x-109\">Test Bench </span>are designed to verify fundamental properties of the
tested tires. The packages contained are listed and described below.
     </p><ul class=\"itemize1\">
     <li class=\"itemize\"><span class=\"cmti-10x-x-109\">Elevation </span> - Two models to test basic properties of the <span class=\"cmti-10x-x-109\">Elevation </span>objects. The
     first as a rather simple and the latter a little more complex.
     </li>
     <li class=\"itemize\"><span class=\"cmti-10x-x-109\">Friction Effects </span> - Eight models to test the objects of the <span class=\"cmti-10x-x-109\">Friction </span>class.
     </li>

     <li class=\"itemize\"><span class=\"cmti-10x-x-109\">Surfaces </span> - Three models to gain some knowledge about the usage of the <span class=\"cmti-10x-x-109\">Surface</span>
     class and its configuration.
     </li>
     <li class=\"itemize\"><span class=\"cmti-10x-x-109\">Plotting Functions  </span> - One function to plot the behavior of different frictional
     classes. </li></ul>


<!--l. 32--></p><p class=\"noindent\">The models provided are suited to the tire models used and should be self-explainatory. When changing tire parameters or
objects of the tire, one will have to reconfigure at least the parameters of the test bench
models as well.
<!--l. 34--></p><p class=\"noindent\">To give an impression of how the simulation results look like, Figures&nbsp;<a href=\"#x1-122002r2\">1<!--tex4ht:ref: F_ElevationAdvancedResult --></a> </p><hr class=\"figure\"><div class=\"figure\"><table class=\"figure\"><tbody><tr class=\"figure\"><td class=\"figure\">



<a id=\"x1-122002r2\"></a>


<div class=\"center\">
<!--l. 37--><p class=\"noindent\">
<!--l. 38--></p><p class=\"noindent\"><img src=\"../images/Master_Doku_MarkusAndres183x.png\" alt=\"PIC\" class=\"graphics\" width=\"355.65945pt\" height=\"190.375pt\"><!--tex4ht:graphics
name=\"../images/Master_Doku_MarkusAndres183x.png\" src=\"pics/ElevationAdvancedResult.eps\"
--></p></div>
<br> <div class=\"caption\"><table class=\"caption\"><tbody><tr style=\"vertical-align: baseline;\" class=\"caption\"><td class=\"id\">Figure&nbsp;1: </td><td class=\"content\">Tire elevating from the ground while driving a curve. Result of <span class=\"cmti-10x-x-109\">Elevation</span>
<span class=\"cmti-10x-x-109\">Advanced</span>.</td></tr></tbody></table></div><!--tex4ht:label?: x1-122002r2 -->


<!--l. 42--><p class=\"noindent\"></p></td></tr></tbody></table></div><hr class=\"endfigure\">
<!--l. 44--><p class=\"noindent\"></p><hr class=\"figure\"><div class=\"figure\"><table class=\"figure\"><tbody><tr class=\"figure\"><td class=\"figure\">



<a id=\"x1-122003r3\"></a>


<div class=\"center\">
<!--l. 45--><p class=\"noindent\">
<!--l. 46--></p><p class=\"noindent\"><img src=\"../images/Master_Doku_MarkusAndres184x.png\" alt=\"PIC\" class=\"graphics\" width=\"355.65945pt\" height=\"160.5358pt\"><!--tex4ht:graphics
name=\"../images/Master_Doku_MarkusAndres184x.png\" src=\"pics/OverturningResult.eps\"
--></p></div>
<br> <div class=\"caption\"><table class=\"caption\"><tbody><tr style=\"vertical-align: baseline;\" class=\"caption\"><td class=\"id\">Figure&nbsp;2: </td><td class=\"content\">Tire?s overturning torque <span class=\"cmti-10x-x-109\">test bench </span>result.</td></tr></tbody></table></div><!--tex4ht:label?: x1-122003r3 -->


<!--l. 50--><p class=\"noindent\"></p></td></tr></tbody></table></div><hr class=\"endfigure\">
<!--l. 52--><p class=\"noindent\"></p><hr class=\"figure\"><div class=\"figure\"><table class=\"figure\"><tbody><tr class=\"figure\"><td class=\"figure\">



<a id=\"x1-122004r4\"></a>


<div class=\"center\">
<!--l. 53--><p class=\"noindent\">
<!--l. 54--></p><p class=\"noindent\"><img src=\"../images/Master_Doku_MarkusAndres185x.png\" alt=\"PIC\" class=\"graphics\" width=\"355.65945pt\" height=\"165.2304pt\"><!--tex4ht:graphics
name=\"../images/Master_Doku_MarkusAndres185x.png\" src=\"pics/UnevenSurfaceRotatinTireResult.eps\"
--></p></div>
<br> <div class=\"caption\"><table class=\"caption\"><tbody><tr style=\"vertical-align: baseline;\" class=\"caption\"><td class=\"id\">Figure&nbsp;3: </td><td class=\"content\">A tire rolling up an uneven surface with an initial lean angle (resulted
from <span class=\"cmti-10x-x-109\">Uneven Surface Rotating Tire</span>).</td></tr></tbody></table></div><!--tex4ht:label?: x1-122004r4 -->


<!--l. 58--><p class=\"noindent\"></p></td></tr></tbody></table></div><hr class=\"endfigure\">
<!--l. 60--><p class=\"noindent\"></p><hr class=\"figure\"><div class=\"figure\"><table class=\"figure\"><tbody><tr class=\"figure\"><td class=\"figure\">


<a id=\"x1-122005r5\"></a>



<div class=\"center\">
<!--l. 61--><p class=\"noindent\">
<!--l. 62--></p><p class=\"noindent\"><img src=\"../images/Master_Doku_MarkusAndres186x.png\" alt=\"PIC\" class=\"graphics\" width=\"355.65945pt\" height=\"1829566pt\"><!--tex4ht:graphics
name=\"../images/Master_Doku_MarkusAndres186x.png\" src=\"pics/UnevenSurfaceDroppingTireResult.eps\"
--></p></div>
<br> <div class=\"caption\"><table class=\"caption\"><tbody><tr style=\"vertical-align: baseline;\" class=\"caption\"><td class=\"id\">Figure&nbsp;4:  </td><td class=\"content\">Tire  dropping  on  an  uneven  surface  (resulted  from  <span class=\"cmti-10x-x-109\">Uneven  Surface</span>
<span class=\"cmti-10x-x-109\">Dropping Tire</span>).</td></tr></tbody></table></div><!--tex4ht:label?: x1-122005r5 -->


<!--l. 66--><p class=\"noindent\"></p></td></tr></tbody></table></div><hr class=\"endfigure\">
<!--l. 68--><p class=\"noindent\">to <a href=\"#x1-122005r5\">4<!--tex4ht:ref: F_UnevenSurfaceDroppingTireResult --></a> provide some screen shots of simulation results from the <span class=\"cmti-10x-x-109\">Test Bench </span>files.
The ?history frames? option in the ?Animation Setup? was turned on to provide
some idea of the behavior of the tires during the simulation. Unfortunately the
transparency setting of the surface becomes deactivated when combined with the history
frames. A transparent surface would make it possible to see the reaction forces of the
tire.

</p><h3 class=\"sectionHead\"><a id=\"x1-1230001\"></a>Provided Examples</h3>
<!--l. 72--><p class=\"noindent\">Six examples are provided with the library. Five of the Examples are two-wheeled
(single-track) vehicles, whereas three are unsprung bicycle models composed of rigid
elements exclusively. The other two model sprung motorcycles including front and rear
suspension. For both vehicles, models are provided to analyze the uncontrolled stability,
e.g.&nbsp;with different tire properties for geometry and friction as shown in Figures&nbsp;<a href=\"#x1-123001r6\">5<!--tex4ht:ref: F_UncontrolledBicycleIdealFricionResultHistory --></a>
</p><hr class=\"figure\"><div class=\"figure\"><table class=\"figure\"><tbody><tr class=\"figure\"><td class=\"figure\">


<a id=\"x1-123001r6\"></a>


<div class=\"center\">
<!--l. 75--><p class=\"noindent\">
<!--l. 76--></p><p class=\"noindent\"><img src=\"../images/Master_Doku_MarkusAndres187x.png\" alt=\"PIC\" class=\"graphics\" width=\"241.84843pt\" height=\"58.85207pt\"><!--tex4ht:graphics
name=\"../images/Master_Doku_MarkusAndres187x.png\" src=\"pics/UncontrolledBicycleIdealFricionResultHistory.eps\"
--></p></div>
<br> <div class=\"caption\"><table class=\"caption\"><tbody><tr style=\"vertical-align: baseline;\" class=\"caption\"><td class=\"id\">Figure&nbsp;5: </td><td class=\"content\">Two similar bicycles with non-slipping tires differing in their geometric
properties. The upper bicycle is equipped with ideally slim tires whereas the lower one
has a belted tire having a width of 2cm.</td></tr></tbody></table></div><!--tex4ht:label?: x1-123001r6 -->



<!--l. 80--><p class=\"noindent\"></p></td></tr></tbody></table></div><hr class=\"endfigure\">
<!--l. 82--><p class=\"noindent\">and <a href=\"#x1-123002r7\">6<!--tex4ht:ref: F_UncontrolledBicycleSlimResultHistory --></a> </p><hr class=\"figure\"><div class=\"figure\"><table class=\"figure\"><tbody><tr class=\"figure\"><td class=\"figure\">


<a id=\"x1-123002r7\"></a>


<div class=\"center\">
<!--l. 85--><p class=\"noindent\">
<!--l. 86--></p><p class=\"noindent\"><img src=\"../images/Master_Doku_MarkusAndres188x.png\" alt=\"PIC\" class=\"graphics\" width=\"241.84843pt\" height=\"115.90346pt\"><!--tex4ht:graphics
name=\"../images/Master_Doku_MarkusAndres188x.png\" src=\"pics/UncontrolledBicycleSlimResultHistory.eps\"
--></p></div>
<br> <div class=\"caption\"><table class=\"caption\"><tbody><tr style=\"vertical-align: baseline;\" class=\"caption\"><td class=\"id\">Figure&nbsp;6:  </td><td class=\"content\">Two  similar  bicycles  with  slipping  tires  differing  in  their  frictional
properties. The one driving the inner circle is equipped with the <span class=\"cmti-10x-x-109\">Advanced Friction</span>

class, whereas the outer bicycle is equipped with the <span class=\"cmti-10x-x-109\">Dry Fricition with Constant Roll</span>
<span class=\"cmti-10x-x-109\">Resistance </span>class.</td></tr></tbody></table></div><!--tex4ht:label?: x1-123002r7 -->


<!--l. 90--><p class=\"noindent\"></p></td></tr></tbody></table></div><hr class=\"endfigure\">
<!--l. 92--><p class=\"noindent\">for the bicycle. The other two models are ?nice to show? models with the bicycle being
accelerated by a strong torque to make the front wheel lift from the ground as shown in
Figure&nbsp;<a href=\"#x1-123003r8\">7<!--tex4ht:ref: F_UncontrolledBicycleResult --></a> </p><hr class=\"figure\"><div class=\"figure\"><table class=\"figure\"><tbody><tr class=\"figure\"><td class=\"figure\">


<a id=\"x1-123003r8\"></a>


<div class=\"center\">
<!--l. 95--><p class=\"noindent\">

<!--l. 96--></p><p class=\"noindent\"><img src=\"../images/Master_Doku_MarkusAndres189x.png\" alt=\"PIC\" class=\"graphics\" width=\"355.65945pt\" height=\"152.12178pt\"><!--tex4ht:graphics
name=\"../images/Master_Doku_MarkusAndres189x.png\" src=\"pics/UncontrolledBicycleResult.eps\"
--></p></div>
<br> <div class=\"caption\"><table class=\"caption\"><tbody><tr style=\"vertical-align: baseline;\" class=\"caption\"><td class=\"id\">Figure&nbsp;7: </td><td class=\"content\">A bicycle with non-ideal tires accelerated by a torque on the rear tire, with
the front tire lifting from the ground.</td></tr></tbody></table></div><!--tex4ht:label?: x1-123003r8 -->


<!--l. 100--><p class=\"noindent\"></p></td></tr></tbody></table></div><hr class=\"endfigure\">
<!--l. 102--><p class=\"noindent\">and the motorcycle jumping over a gap as depicted in Figure&nbsp;<a href=\"#x1-123004r9\">8<!--tex4ht:ref: F_UncontrolledMotorcycleTorqueResult --></a>.
<!--l. 104--></p><p class=\"noindent\"></p><hr class=\"figure\"><div class=\"figure\"><table class=\"figure\"><tbody><tr class=\"figure\"><td class=\"figure\">


<a id=\"x1-123004r9\"></a>


<div class=\"center\">
<!--l. 105--><p class=\"noindent\">

<!--l. 106--></p><p class=\"noindent\"><img src=\"../images/Master_Doku_MarkusAndres190x.png\" alt=\"PIC\" class=\"graphics\" width=\"412.56496pt\" height=\"570954pt\"><!--tex4ht:graphics
name=\"../images/Master_Doku_MarkusAndres190x.png\" src=\"pics/UncontrolledMotorcycleTorqueResult.eps\"
--></p></div>
<br> <div class=\"caption\"><table class=\"caption\"><tbody><tr style=\"vertical-align: baseline;\" class=\"caption\"><td class=\"id\">Figure&nbsp;8: </td><td class=\"content\">A motorcycle jumping over a gap.</td></tr></tbody></table></div><!--tex4ht:label?: x1-123004r9 -->


<!--l. 110--><p class=\"noindent\"></p></td></tr></tbody></table></div><hr class=\"endfigure\">
<!--l. 112--><p class=\"noindent\">In contrast to the motorcycle the bicycle example has a proper visualization. For the
motorcycle (and the four-wheeled vehicle), no further effort was spent regarding the
visualization, as it is not the crucial aspect of the examples. Both two-wheeled models (found
in the <span class=\"cmti-10x-x-109\">Used Models </span>package) were provided by Thomas Schmitt and were part of the
development of the <span class=\"cmti-10x-x-109\">Motorcycle Library </span><span class=\"cite\">[<a href=\"Modelica://WheelsAndTires.UsersGuide.Literature\">Sch09</a>]</span>.
<!--l. 114--></p><p class=\"noindent\">The sixth example is a very basic undamped model of a four-wheeled vehicle with a
predefined steering angle profile and driving torques acting on the rear tires. The result of the
quite simple input signals is a rather curious behavior of the vehicle with the car drifting at
the end of the simulation, due to an impulse in the driving torque (shown in Figure&nbsp;<a href=\"#x1-123005r10\">9<!--tex4ht:ref: F_FourWheeledVehicleResult --></a>).

</p><hr class=\"figure\"><div class=\"figure\"><table class=\"figure\"><tbody><tr class=\"figure\"><td class=\"figure\">


<a id=\"x1-123005r10\"></a>


<div class=\"center\">
<!--l. 117--><p class=\"noindent\">
<!--l. 118--></p><p class=\"noindent\"><img src=\"../images/Master_Doku_MarkusAndres191x.png\" alt=\"PIC\" class=\"graphics\" width=\"355.65945pt\" height=\"325.543pt\"><!--tex4ht:graphics
name=\"../images/Master_Doku_MarkusAndres191x.png\" src=\"pics/FourWheeledVehicleResult.eps\"
--></p></div>
<br> <div class=\"caption\"><table class=\"caption\"><tbody><tr style=\"vertical-align: baseline;\" class=\"caption\"><td class=\"id\">Figure&nbsp;9: </td><td class=\"content\">Result of the <span class=\"cmti-10x-x-109\">Four Wheeled Vehicle </span>example after 22.5s (vehicle is drifting)</td></tr></tbody></table></div><!--tex4ht:label?: x1-123005r10 -->


<!--l. 122--><p class=\"noindent\"></p></td></tr></tbody></table></div><hr class=\"endfigure\">
<!--l. 124--><p class=\"noindent\">This is \"reacted\" on by a full breaking of all wheels marking the wheels slide to standstill of
the vehicle.

<!--l. 126--></p>

</html>"));
    end Examples;

    class Literature "Literature"
      annotation (Documentation(info="<html>
The <i> Wheels and Tires </i> library is described in the corresponding master thesis. Big parts of the documentation are excerpted from there.

[AJ02]   <span class=\"bibsp\">&nbsp;&nbsp;&nbsp;</span></span><a id=\"XModularisedTires\"></a>J.&nbsp;Andreasson  and  J.&nbsp;Jarlmark.     Modularised  tyre  modelling  in
          modelica. In <span class=\"cmti-10x-x-109\">Proceedings of the Second International Modelica Conference,</span>
          <span class=\"cmti-10x-x-109\">Oberpfaffenhofen, Germany</span>, pages 267-274, 2002.
          </p>
          <p class=\"bibitem\"><span class=\"biblabel\">
 [And03]  <span class=\"bibsp\">&nbsp;&nbsp;&nbsp;</span></span><a id=\"XVehicleDynamics\"></a>Johan Andreasson. Vehicledynamics library. In <span class=\"cmti-10x-x-109\">Proceedings of the Third</span>

          <span class=\"cmti-10x-x-109\">International Modelica Conference, Link</span><span class=\"cmti-10x-x-109\">öping, Sweden</span>, pages 11?18, 2003.
          </p>
          <p class=\"bibitem\"><span class=\"biblabel\">
 [AS93]   <span class=\"bibsp\">&nbsp;&nbsp;&nbsp;</span></span><a id=\"XInterpolation\"></a>G.&nbsp;Aumann  and  K.&nbsp;Spitzmüller.     <span class=\"cmti-10x-x-109\">Computerorientierte  Geometrie</span>.
          BI-Wiss.-Verl, 1993.
          </p>
          <p class=\"bibitem\"><span class=\"biblabel\">

 [Ass07]   <span class=\"bibsp\">&nbsp;&nbsp;&nbsp;</span></span><a id=\"XModelica\"></a>Modelica   Association.        Modelica   3.0   language   specification.
          <a href=\"http://www.modelica.org/documents/ModelicaSpec30.pdf\" class=\"url\"><span class=\"cmtt-10x-x-109\">http://www.modelica.org/documents/ModelicaSpec30.pdf</span></a>, 2007.
          </p>
          <p class=\"bibitem\"><span class=\"biblabel\">
 [Ass09]   <span class=\"bibsp\">&nbsp;&nbsp;&nbsp;</span></span><a id=\"XModelicaStandardLib\"></a>Modelica      Associantion.               Modelica      standard      library.
          <a href=\"http://www.modelica.org/libraries/Modelica\" class=\"url\"><span class=\"cmtt-10x-x-109\">http://www.modelica.org/libraries/Modelica</span></a>, 2009.
          </p>
          <p class=\"bibitem\"><span class=\"biblabel\">
 [BA03]   <span class=\"bibsp\">&nbsp;&nbsp;&nbsp;</span></span><a id=\"XWheelLibrary\"></a>Mats Beckmann and Johan Andreasson. Wheel model library for use in
          vehicle dynamic studies.  In <span class=\"cmti-10x-x-109\">Proceedings of the third Modelica Conference,</span>

          <span class=\"cmti-10x-x-109\">Link</span><span class=\"cmti-10x-x-109\">öping, Sweden</span>, pages 385-392, 2003.
          </p>


          <p class=\"bibitem\"><span class=\"biblabel\">
 [BSGR08]<span class=\"bibsp\">&nbsp;&nbsp;&nbsp;</span></span><a id=\"XFEA\"></a>P.&nbsp;Bohara,  A.&nbsp;Saha,  P.&nbsp;Ghosh,  and  M.&nbsp;Roopak.   Tyre  perfomance
          prediction through fea.  Hasetri - Hari Shankar Singhania Elasotmer and
          Tyre Research Institute, 2008.
          </p>
          <p class=\"bibitem\"><span class=\"biblabel\">

 [Cel91]   <span class=\"bibsp\">&nbsp;&nbsp;&nbsp;</span></span><a id=\"XCellierRed\"></a>Francois&nbsp;E. Cellier. <span class=\"cmti-10x-x-109\">Continuous System Modeling</span>. Springer, 1991.
          </p>
          <p class=\"bibitem\"><span class=\"biblabel\">
 [Cel07]   <span class=\"bibsp\">&nbsp;&nbsp;&nbsp;</span></span><a id=\"XBondLib\"></a>Francois&nbsp;E.                                                                     Cellier.
          Bondlib 2.3. <a href=\"http://www.modelica.org/libraries/BondLib\" class=\"url\"><span class=\"cmtt-10x-x-109\">http://www.modelica.org/libraries/BondLib</span></a>, 2007. date:
          06.05.2009.
          </p>
          <p class=\"bibitem\"><span class=\"biblabel\">

 [Cra89]  <span class=\"bibsp\">&nbsp;&nbsp;&nbsp;</span></span><a id=\"XCraig\"></a>John&nbsp;J. Craig. <span class=\"cmti-10x-x-109\">Introduction to Robotics Mechanics and Control</span>. Addison
          Wesley Longman, 1989. Second Edition.
          </p>
          <p class=\"bibitem\"><span class=\"biblabel\">
 [Dix96]   <span class=\"bibsp\">&nbsp;&nbsp;&nbsp;</span></span><a id=\"XTires\"></a>John&nbsp;C. Dixon. <span class=\"cmti-10x-x-109\">Tires, Suspension and Handling</span>. Cambridge University
          Press, 1996. Second Edition.
          </p>
          <p class=\"bibitem\"><span class=\"biblabel\">

 [Lei09]   <span class=\"bibsp\">&nbsp;&nbsp;&nbsp;</span></span><a id=\"XFahrzeugreifen\"></a>Günter Leister.   <span class=\"cmti-10x-x-109\">Fahrzeugreifen und Fahrwerkentwicklung</span>.   Vieweg +
          Teubner, 2009. 1. Auflage.
          </p>
          <p class=\"bibitem\"><span class=\"biblabel\">
 [McB05] <span class=\"bibsp\">&nbsp;&nbsp;&nbsp;</span></span><a id=\"XMcBride\"></a>Robert&nbsp;Thomas  McBride.     <span class=\"cmti-10x-x-109\">System  Analysis  through  Bond  Graph</span>
          <span class=\"cmti-10x-x-109\">Modeling</span>. PhD thesis, University of Arizona, 2005.
          </p>

          <p class=\"bibitem\"><span class=\"biblabel\">
 [MW03]  <span class=\"bibsp\">&nbsp;&nbsp;&nbsp;</span></span><a id=\"XMitschke\"></a>Manfred   Mitschke   and   Henning   Wallentowitz.       <span class=\"cmti-10x-x-109\">Dynamik   der</span>
          <span class=\"cmti-10x-x-109\">Kraftfahrzeuge</span>. Springer Verlag, VDI, 2003. 4. Auflage.
          </p>


          <p class=\"bibitem\"><span class=\"biblabel\">
 [Pac06]  <span class=\"bibsp\">&nbsp;&nbsp;&nbsp;</span></span><a id=\"XPacejka\"></a>Hans&nbsp;B. Pacejka. <span class=\"cmti-10x-x-109\">Tyre and Vehicle Dynamics</span>. Butterworth-Heinemann,
          2006. Second Edition.
          </p>

          <p class=\"bibitem\"><span class=\"biblabel\">
 [Ril07]   <span class=\"bibsp\">&nbsp;&nbsp;&nbsp;</span></span><a id=\"XRill\"></a>Georg  Rill.   <span class=\"cmti-10x-x-109\">Simulation  von  Kraftfahrzeugen</span>.   Vieweg-Verlag,  2007.
          genehmigter Nachdruck.
          </p>
          <p class=\"bibitem\"><span class=\"biblabel\">
 [Sch09]   <span class=\"bibsp\">&nbsp;&nbsp;&nbsp;</span></span><a id=\"XMotorcycleLib\"></a>Thomas  Schmitt.    Modeling  of  a  motorcycle  in  dymola/modelica.
          Master's thesis, Vorarlberg University of Applied Sciences, 2009.
          </p>
          <p class=\"bibitem\"><span class=\"biblabel\">
 [Zim06]  <span class=\"bibsp\">&nbsp;&nbsp;&nbsp;</span></span><a id=\"XMultiBondLib\"></a>Dirk  Zimmer.    A  modelica  library  for  multibond  graphs  and  its
          application in 3d-mechanics. Master's thesis, ETH Zürich, 2006.
          </p>

          <p class=\"bibitem\"><span class=\"biblabel\">
 [ZO09]   <span class=\"bibsp\">&nbsp;&nbsp;&nbsp;</span></span><a id=\"XDLR\"></a>Dirk Zimmer<sup><span class=\"cmmi-8\">a</span></sup>  and Martin Otter<sup><span class=\"cmmi-8\">b</span></sup>.   Real-time models for wheels and
          tires in an object-oriented modeling framework. Accepted for publication in
          Vehicle Dynamics, 2009.
</p>
</html>"));
    end Literature;

    annotation (Documentation(info="<html>
This overview contains the following sections: <p>

<ol>
<li><a href=\"Modelica://MultiBondLib.UsersGuide.Overview.BGM\">Bondgraphic modeling</a>
<li><a href=\"Modelica://MultiBondLib.UsersGuide.Overview.MBGM\">Multibondgraphic modeling</a>
<li><a href=\"Modelica://MultiBondLib.UsersGuide.Overview.Wrapping\">Wrapping multibond graphs</a>
<li><a href=\"Modelica://MultiBondLib.UsersGuide.Overview.planarMechLib\">The planar mechanics library</a>
<li><a href=\"Modelica://MultiBondLib.UsersGuide.Overview.MechLib\">The 3D mechanics library</a>
<li><a href=\"Modelica://MultiBondLib.UsersGuide.Overview.HybridMechLib\">The hybrid 3D mechanics library</a>
<li><a href=\"Modelica://MultiBondLib.UsersGuide.Overview.Examples\">Examples</a>
<li><a href=\"Modelica://MultiBondLib.UsersGuide.Overview.Literature\">Literature</a>
</ol>
</html>"));

    class ReleaseNotes "Release notes"

      annotation (Documentation(info="<html>
<p>
This section summarizes the changes that have been performed
on the Wheels and Tires library.
</p>
<ul>
<li><a href=\"Modelica://WheelsAndTires.UsersGuide.ReleaseNotes.Version_10\">Version 1.0</a>
    (September 23, 2009)
</ul>
</html>
"));

    class Version_10 "Version 1.0"
    annotation (Documentation(info="<html>

Version 1.0 is the first release of the <i>Wheels and Tires</i> Library. The documentation consists of the User's Guide, the description of the single models and the corresponding Master's Thesis \"Object-Oriented Modeling of Wheels and Tires in Dymola/Modelica\".

</html>
"));
    end Version_10;
    end ReleaseNotes;
  end UsersGuide;

  package TireComponents
    "Contains the objects the tire models contained in the Tires package are built of."

  extends WheelsAndTires.TireComponents.Utilities.Icons.TireComponentsPackage;

    package Communication
      "elements used to exchange variables between the objects."
    annotation(preferedView="info");

    extends WheelsAndTires.TireComponents.Utilities.Icons.TireComponentsPackage;

      connector TireBus
        "contains the generally used variables (Unit Vectors, Contact Properties and Sensor Values)"
        WheelsAndTires.TireComponents.Communication.Signals.UnitVectorsSignal
          UV "containts the unit vectors";
        WheelsAndTires.TireComponents.Communication.Signals.ContactPropertiesSignal
          CP "containts contact properties";
        WheelsAndTires.TireComponents.Communication.Signals.SensorValuesSignal
          SV "contains sensor values";
        annotation (Icon(
            Rectangle(extent=[-100,100; 100,-100], style(
                color=42,
                rgbcolor={127,0,0},
                fillColor=7,
                rgbfillColor={255,255,255})),
            Rectangle(extent=[-100,100; 100,0],  style(
                color=42,
                rgbcolor={127,0,0},
                fillColor=42,
                rgbfillColor={127,0,0},
                fillPattern=1))), Documentation(info="<html>

For further information see the documentation of the <a href=\"Modelica://WheelsAndTires.TireComponents.Communication\">Communication</a> package and the one of the defined <a href=\"Modelica://WheelsAndTires.TireComponents.Communication.Signals\">Signals</a>.

</html>"));
      end TireBus;

      connector ContactPointConnector
        "contains informations of the contact point (velocity, forces and torques)"
        import SI = Modelica.SIunits;
        import Modelica.Blocks.Interfaces.RealSignal;

        RealSignal vLong(redeclare type SignalType = SI.Velocity)
          "translational velocity in longitudinal direction";
        RealSignal vLat(redeclare type SignalType = SI.Velocity)
          "translational velocity in lateral direction";
        RealSignal vN(redeclare type SignalType = SI.Velocity)
          "translational velocity in normal direction";

        RealSignal fLong(redeclare type SignalType = SI.Force)
          "force acting in longitudinal direction";
        RealSignal fLat(redeclare type SignalType = SI.Force)
          "force acting in lateral direction";
        RealSignal fN(redeclare type SignalType = SI.Force)
          "force acting in normal direction";

        RealSignal tLong(redeclare type SignalType = SI.Torque)
          "torque acting about the longitudinal direction";
        RealSignal tLat(redeclare type SignalType = SI.Torque)
          "torque acting about the lateral direction";
        RealSignal tN(redeclare type SignalType = SI.Torque)
          "torque acting about the normal direction";

        annotation (Icon(                 Rectangle(extent=[-100,-100; 100,100],
                style(
                color=58,
                rgbcolor={0,127,0},
                fillColor=7,
                rgbfillColor={255,255,255})),
                         Rectangle(extent=[-100,100; 100,0], style(
                color=58,
                rgbcolor={0,127,0},
                fillColor=58,
                rgbfillColor={0,127,0}))), Documentation(info="<html>

For further information see the documentation of the <a href=\"Modelica://WheelsAndTires.TireComponents.Communication\">Communication</a> package and the one of the defined <a href=\"Modelica://WheelsAndTires.TireComponents.Communication.Signals\">Signals</a>.

</html>"));
      end ContactPointConnector;
      annotation (Icon, Documentation(info="<html>

The <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">TireBus</span></span></span> gathers
the variables used in most of the objects. For a better understanding of the model structure a
further splitting ensures that not too many variables are directly on the top level of the bus.
The division was made into <span class=\"cmti-10x-x-109\">Unit Vectors</span>, <span class=\"cmti-10x-x-109\">Contact Properties </span>and <span class=\"cmti-10x-x-109\">Sensor Values.

For each of these sets of variables, separate inputs and outputs have been created. This makes it
possible to show in which objects variables are computed or just used. To conveniently
connect these inputs and outputs (containing multiple variables) to the <span class=\"cmti-10x-x-109\">Tire Bus </span>a record for
each of these set of variables is created in the <span class=\"cmti-10x-x-109\">Tire Bus</span>. This enables the user to connect the
records directly instead of connecting each single variable, although this would be possible as
well<span class=\"footnote-mark\"><a href=\"Master_Doku_MarkusAndres4.html#fn3x3\"></span><a id=\"x1-28002f3\"></a> .


<!--l. 54--></p><p class=\"noindent\">The second communication structure is the connector that contains the velocities as well as
the forces and torques that act on the contact point. It is named <span class=\"cmti-10x-x-109\">Contact Point Connector</span>.
This connector is implemented in a acausal manner due to the requirements of this
connection. No inputs and output are defined here, because depending on the used classes
there are either forces or velocities set and therefore the causality can change depending on
the model. As well there is no second level that further splits the contained variables as there
are just nine variables contained in the connector. </span>

One thing that has to be mentioned about the communication structure is that
lots of vectors are used inside of different connectors. Connecting them is a little
inconvenient, as Dymola 6.1 does not recognize that the variables used in the bus are
vectors. Therefore, connecting a <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">Real[3]</span></span></span> to a vector in the bus has to be done
in two steps. First, the connection is done graphically with the typical Dymola
window appearing when connecting vectored variables. In the window, one has to
choose a single item from the vector of the <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">Real[3]</span></span></span>. That will make Dymola accept
the connection. Then switching to the code view reveals some kind of equation
like


</p><div class=\"verbatim\">
connect(eLong[1],&nbsp;UV.eLong)
</div>
<!--l. 98--><p class=\"nopar\"> This equation then has to be manually changed into


</p><div class=\"verbatim\">
connect(eLong[:],&nbsp;UV.eLong[:])
</div>

<!--l. 102--><p class=\"nopar\"> to make the connection work. The reason for this behavior seems to be that Dymola does
not recognize the variable in the bus to be a vector. This could be because of a wrong
definition in the records that are the base for the connectors, but during this work no
working solution could be found, so this workaround has to be applied.
</p>

</html>"));

      connector UnitVectorInput =  input
          WheelsAndTires.TireComponents.Communication.Signals.UnitVectorsSignal
        "output of all unitVecotrs"
         annotation (defaultComponentName="UV",
         Icon(Polygon(points=[-100,100;100,0; -100,-100; -100,100],
              style(
              color=58,
              rgbcolor={0,127,0},
              fillColor=58,
              rgbfillColor={0,127,0})), Text(
            extent=[0,-160; 0,-100],
            string="%name",
            style(
              color=58,
              rgbcolor={0,127,0},
              fillColor=45,
              rgbfillColor={255,128,0},
              fillPattern=1))),
        Coordsys(scale=0.06),
        Documentation(info="<html>

For further information see the documentation of the <a href=\"Modelica://WheelsAndTires.TireComponents.Communication\">Communication</a> package and the one of the defined <a href=\"Modelica://WheelsAndTires.TireComponents.Communication.Signals\">Signals</a>.

</html>"));

      connector UnitVectorsOutput = output
          WheelsAndTires.TireComponents.Communication.Signals.UnitVectorsSignal
        "output of all unitVecotrs"
        annotation (defaultComponentName="UV",
              Icon(Polygon(points=[-100,100;
              100,0; -100,-100; -100,100], style(
              color=58,
              rgbcolor={0,127,0},
              fillColor=7,
              rgbfillColor={255,255,255})), Text(
            extent=[0,-160; 0,-100],
            string="%name",
            style(
              color=58,
              rgbcolor={0,127,0},
              fillColor=45,
              rgbfillColor={255,128,0},
              fillPattern=1))),
        Coordsys(scale=0.06),
        Documentation(info="<html>

For further information see the documentation of the <a href=\"Modelica://WheelsAndTires.TireComponents.Communication\">Communication</a> package and the one of the defined <a href=\"Modelica://WheelsAndTires.TireComponents.Communication.Signals\">Signals</a>.

</html>"));

      connector ContactPropertiesInput = input
          WheelsAndTires.TireComponents.Communication.Signals.ContactPropertiesSignal
        "input of the contact properties"
          annotation (defaultComponentName="CP",
              Icon(Polygon(points=[-100,
              100; 100,0; -100,-100; -100,100], style(
              color=78,
              rgbcolor={127,0,127},
              fillColor=78,
              rgbfillColor={127,0,127})), Text(
            extent=[0,-160; 0,-100],
            string="%name",
            style(
              color=78,
              rgbcolor={127,0,127},
              fillColor=45,
              rgbfillColor={255,128,0},
              fillPattern=1))),
        Coordsys(scale=0.06),
        Documentation(info="<html>

For further information see the documentation of the <a href=\"Modelica://WheelsAndTires.TireComponents.Communication\">Communication</a> package and the one of the defined <a href=\"Modelica://WheelsAndTires.TireComponents.Communication.Signals\">Signals</a>.

</html>"));
      connector ContactPropertiesOutput = output
          WheelsAndTires.TireComponents.Communication.Signals.ContactProperties
        "output of the contact properties"
              annotation (defaultComponentName="CP",
              Icon(Polygon(points=[
              -100,100; 100,0; -100,-100; -100,100], style(
              color=78,
              rgbcolor={127,0,127},
              fillColor=7,
              rgbfillColor={255,255,255})), Text(
            extent=[0,-160; 0,-100],
            string="%name",
            style(
              color=78,
              rgbcolor={127,0,127},
              fillColor=45,
              rgbfillColor={255,128,0},
              fillPattern=1))),
        Coordsys(scale=0.06),
        Documentation(info="<html>

For further information see the documentation of the <a href=\"Modelica://WheelsAndTires.TireComponents.Communication\">Communication</a> package and the one of the defined <a href=\"Modelica://WheelsAndTires.TireComponents.Communication.Signals\">Signals</a>.

</html>"));
      connector SensorValuesInput = input
          WheelsAndTires.TireComponents.Communication.Signals.SensorValues
        "input of the contact properties"
      annotation (defaultComponentName="SV",
              Icon(Polygon(points=[-100,
              100; 100,0; -100,-100; -100,100], style(
              color=45,
              rgbcolor={255,128,0},
              fillColor=45,
              rgbfillColor={255,128,0})), Text(
            extent=[0,-160; 0,-100],
            string="%name",
            style(
              color=45,
              rgbcolor={255,128,0},
              fillColor=45,
              rgbfillColor={255,128,0},
              fillPattern=1))),
        Coordsys(scale=0.06),
        Documentation(info="<html>

For further information see the documentation of the <a href=\"Modelica://WheelsAndTires.TireComponents.Communication\">Communication</a> package and the one of the defined <a href=\"Modelica://WheelsAndTires.TireComponents.Communication.Signals\">Signals</a>.

</html>"));
      connector SensorValuesOutput = output
          WheelsAndTires.TireComponents.Communication.Signals.SensorValues
        "output of the contact properties"
      annotation (defaultComponentName="SV",
              Icon(Polygon(points=[
              -100,100; 100,0; -100,-100; -100,100], style(
              color=45,
              rgbcolor={255,128,0},
              fillColor=7,
              rgbfillColor={255,255,255})), Text(
            extent=[0,-160; 0,-100],
            string="%name",
            style(
              color=45,
              rgbcolor={255,128,0},
              fillColor=45,
              rgbfillColor={255,128,0},
              fillPattern=1))),
        Coordsys(scale=0.06),
        Documentation(info="<html>

For further information see the documentation of the <a href=\"Modelica://WheelsAndTires.TireComponents.Communication\">Communication</a> package and the one of the defined <a href=\"Modelica://WheelsAndTires.TireComponents.Communication.Signals\">Signals</a>.

</html>"));

      package Signals "defines the signals used in the Tire Bus."
        annotation(preferedView="info");

      extends
          WheelsAndTires.TireComponents.Utilities.Icons.TireComponentsPackage;

        connector UnitVectorsSignal = UnitVectors
          "defines the unit vector record to be a signal."
                                     annotation (Icon);
        record UnitVectors "defines the content of the unit vector record."
          import Modelica.Blocks.Interfaces.RealSignal;

          RealSignal eLong[3] "Unit vector in longitudinal direction";
          RealSignal eLat[3] "Unit vector in lateral direction";
          RealSignal eN[3] "Unit vector normal to the surface";
          RealSignal ePlane[3] "Unit vector in the tire plane";
          RealSignal eAxis[3] "Unit vector in the rotation axis";
        end UnitVectors;

        connector ContactPropertiesSignal = ContactProperties
          "defines the contact properties record to be a signal."
                                     annotation (Icon);
        record ContactProperties
          "defines the content of the contact properties record."
          import SI = Modelica.SIunits;
          import Modelica.Blocks.Interfaces.RealSignal;
          import Modelica.Blocks.Interfaces.BooleanSignal;

          // Contact Patch Properties
          RealSignal xCP[3](redeclare type SignalType = SI.Position)
            "Absolut position of the contact point";
          RealSignal rCP[3](redeclare type SignalType = SI.Radius)
            "Vector from the rim's center to the contact point";
          RealSignal lCR(redeclare type SignalType = SI.Length)
            "Length of the contact patch.";
          RealSignal bCR(redeclare type SignalType = SI.Length)
            "Width of the contact patch";
          RealSignal penetrationDepth(redeclare type SignalType = SI.Distance)
            "Penetration normal to the surface plane";
          BooleanSignal Contact "= true if contact to the ground";
        end ContactProperties;

        connector SensorValuesSignal = SensorValues
          "defines the sensor values record to be a signal."
                                     annotation (Icon);
        record SensorValues "defines the content of the sensor values record."
          import SI = Modelica.SIunits;
          import Modelica.Blocks.Interfaces.RealSignal;
          import Modelica.Blocks.Interfaces.BooleanSignal;

          // Contact Patch Properties
          RealSignal eAxis[3] "Unit vector in the rotation axis";
          RealSignal RBelt[3,3] "Rotation matrix of the Belt";
          RealSignal wBelt[3](redeclare type SignalType = SI.AngularVelocity)
            "Angular velocity of the Belt";
          RealSignal xBelt[3](redeclare type SignalType = SI.Position)
            "Absolute position of the Belt";
        end SensorValues;
      end Signals;
    end Communication;

    package BeltDynamics
      "models between the rim and the center to contact point enabling a flexibility of the tire."
      annotation(preferedView="info");
    extends WheelsAndTires.TireComponents.Utilities.Icons.TireComponentsPackage;

      partial model BeltDynamicsBase
        "partial base model that is extended by the 'real' belt dynamics modles."
        import MultiBondLib;
        import SI = Modelica.SIunits;

        extends WheelsAndTires.TireComponents.Utilities.Icons.TireComponents;

        parameter Boolean visBeltDynamicsEnabled = false
          "true: visualize the elements of the Belt Dynamics model";
        SI.Position x_Belt[3] = frame_a.P.x;

        MultiBondLib.Mechanics3D.Interfaces.Frame_b frame_b
          "connect to the model of the rim."
          annotation (extent=[100,-10; 120,10]);
        MultiBondLib.Mechanics3D.Interfaces.Frame_a frame_a
          "connect to the Center to Contact Point model."
          annotation (extent=[-120,-10; -100,10]);
        annotation (Diagram(            Rectangle(extent=[-100,60; 100,100],
                style(
                color=51,
                rgbcolor={255,255,170},
                fillColor=51,
                rgbfillColor={255,255,170}))),
                             Icon(
            Text(
              extent=[-100,-100; 100,-68],
              style(
                color=10,
                rgbcolor={135,135,135},
                fillPattern=1),
              string="%name"),
            Ellipse(extent=[-74,84; 74,-64], style(
                color=30,
                rgbcolor={215,215,215},
                fillColor=30,
                rgbfillColor={215,215,215})),
            Ellipse(extent=[-72,82; 72,-62], style(
                color=30,
                rgbcolor={215,215,215},
                fillColor=7,
                rgbfillColor={255,255,255})),
            Ellipse(extent=[-40,50; 40,-30], style(
                color=30,
                rgbcolor={215,215,215},
                fillColor=30,
                rgbfillColor={215,215,215})),
            Ellipse(extent=[-38,48; 38,-28], style(
                color=30,
                rgbcolor={215,215,215},
                fillColor=7,
                rgbfillColor={255,255,255})),
            Rectangle(extent=[1,48; -1,-30],style(
                color=30,
                rgbcolor={215,215,215},
                fillColor=30,
                rgbfillColor={215,215,215})),
            Rectangle(extent=[38,11; -38,9],  style(
                color=30,
                rgbcolor={215,215,215},
                fillColor=30,
                rgbfillColor={215,215,215})),
            Polygon(points=[-27,-18; 28,36; 28,38; -27,-16; -27,-18],
                                                                   style(
                color=30,
                rgbcolor={215,215,215},
                fillColor=30,
                rgbfillColor={215,215,215})),
            Polygon(points=[28,-18; 28,-16; -28,38; -28,36; 28,-18],
                                                                  style(
                color=30,
                rgbcolor={215,215,215},
                fillColor=30,
                rgbfillColor={215,215,215}))),
          Documentation(info="<html>

The base model defines the used connections to the <span class=\"cmti-10x-x-109\">Tire Bus </span>necessary sensors and <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">UV</span></span></span> as an
input. The basic elements of the icon are defined in the base as well. Nothing more is done
here.

</html>"));
        annotation (extent=[-10,-110; 10,-90]);
        annotation (extent=[-8,-110; 12,-90]);
        Communication.TireBus tireBus "connect to the Tire Bus."
          annotation (extent=[-10,90; 10,110]);

      protected
        Utilities.AddititionalMBG.AbsoluteSensor getX(               get_r_abs=true)
                          annotation (extent=[-96,70; -84,82],
                                                             rotation=90);
        WheelsAndTires.TireComponents.Utilities.AddititionalMBG.AbsoluteSensor
          getR(                                                      get_R=true,get_r_abs=false)
                          annotation (extent=[-76,70; -64,82],
                                                             rotation=90);
        WheelsAndTires.TireComponents.Utilities.AddititionalMBG.AbsoluteSensor
          getW(                                                      get_w_abs=true,get_r_abs=false)
                          annotation (extent=[-56,70; -44,82],
                                                             rotation=90);
        Communication.UnitVectorInput UV
          annotation (extent=[34,70; 46,82], rotation=270);

      equation
        connect(getX.out[:], tireBus.SV.xBelt[:]) annotation (points=[-90,82.6;
              -90,86; 0,86; 0,100], style(color=74, rgbcolor={0,0,127}));
        connect(getR.out[1:3], tireBus.SV.RBelt[1,1:3]) annotation (points=[-70,82.6;
              -70,86; 0,86; 0,100],       style(color=74, rgbcolor={0,0,127}));
        connect(getR.out[4:6], tireBus.SV.RBelt[2,1:3]) annotation (points=[-70,82.6;
              -70,86; 0,86; 0,100],       style(color=74, rgbcolor={0,0,127}));
        connect(getR.out[7:9], tireBus.SV.RBelt[3,1:3]) annotation (points=[-70,82.6;
              -70,86; 0,86; 0,100],       style(color=74, rgbcolor={0,0,127}));
        connect(getW.out[:], tireBus.SV.wBelt[:]) annotation (points=[-50,82.6;
              -50,86; 0,86; 0,100], style(color=74, rgbcolor={0,0,127}));
        connect(getX.frame_a, frame_a) annotation (points=[-90,69.4; -90,0; -110,0],
                       style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2,
            fillColor=7,
            rgbfillColor={255,255,255},
            fillPattern=1));
        connect(getR.frame_a, frame_a) annotation (points=[-70,69.4; -70,66; -90,66;
              -90,0; -110,0],         style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2,
            fillColor=7,
            rgbfillColor={255,255,255},
            fillPattern=1));
        connect(getW.frame_a, frame_a) annotation (points=[-50,69.4; -50,66; -90,66;
              -90,0; -110,0],         style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2,
            fillColor=7,
            rgbfillColor={255,255,255},
            fillPattern=1));
        connect(UV, tireBus.UV) annotation (points=[40,76; 40,86; 0,86; 0,100],
            style(
            color=58,
            rgbcolor={0,127,0},
            fillColor=10,
            rgbfillColor={135,135,135},
            fillPattern=1));
      end BeltDynamicsBase;

      model RigidBelt "defines the belt to be ideally rigid."
        import MultiBondLib;
        extends WheelsAndTires.TireComponents.BeltDynamics.BeltDynamicsBase;
        annotation (Diagram, Icon(
            Rectangle(extent=[-1,82; 1,50],style(
                color=0,
                rgbcolor={0,0,0},
                fillColor=0,
                rgbfillColor={0,0,0})),
            Rectangle(extent=[-72,11; -41,9],  style(
                color=0,
                rgbcolor={0,0,0},
                fillColor=0,
                rgbfillColor={0,0,0})),
            Rectangle(extent=[-1,-30; 1,-62],style(
                color=0,
                rgbcolor={0,0,0},
                fillColor=0,
                rgbfillColor={0,0,0})),
            Rectangle(extent=[41,11; 72,9],  style(
                color=0,
                rgbcolor={0,0,0},
                fillColor=0,
                rgbfillColor={0,0,0}))),
          Documentation(info="<html>

This quite simple model is used to provide an ideal belt for the tire models that do not imply a dynamic belt behavior.

</html>"));

      equation
        connect(frame_b, frame_a) annotation (points=[110,0; 55,0; 55,1.11022e-015;
              0,1.11022e-015; 0,0; -110,0],
            style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2,
            fillColor=7,
            rgbfillColor={255,255,255},
            fillPattern=1));
      end RigidBelt;

      model TorsionBelt
        "a belt that is able to deform about its rotational axis."
        extends WheelsAndTires.TireComponents.BeltDynamics.BeltDynamicsBase;
        import MultiBondLib;
        import SI = Modelica.SIunits;

        parameter Real cBelt(final unit="N.m/rad", final min=0) = 2e5
          "Spring constant";
        parameter Real dBelt(final unit="N.m.s/rad", final min=0) = 1e3
          "Damping constant";
        parameter SI.Inertia IBelt = 1 "Belt inertia around it's spinning axis";
        annotation (Diagram, Icon(
            Rectangle(extent=[42,-6; 16,10],style(
                color=7,
                rgbcolor={255,255,255},
                fillColor=7,
                rgbfillColor={255,255,255},
                fillPattern=1)),
            Rectangle(extent=[50,-34; 0,54], style(
                color=7,
                rgbcolor={255,255,255},
                fillColor=7,
                rgbfillColor={255,255,255})),
            Ellipse(extent=[20,20; 40,0],  style(
                color=0,
                rgbcolor={0,0,0},
                fillColor=7,
                rgbfillColor={255,255,255},
                fillPattern=1)),
            Ellipse(extent=[22,18; 38,2],  style(
                color=0,
                rgbcolor={0,0,0},
                fillColor=7,
                rgbfillColor={255,255,255},
                fillPattern=1)),
            Ellipse(extent=[24,16; 36,4],  style(
                color=0,
                rgbcolor={0,0,0},
                fillColor=7,
                rgbfillColor={255,255,255},
                fillPattern=1)),
            Rectangle(extent=[90,-62; 62,-72], style(
                color=7,
                rgbcolor={255,255,255},
                fillColor=7,
                rgbfillColor={255,255,255},
                fillPattern=1)),
            Polygon(points=[-2,76; -2,90; -58,70; -74,28; -74,-40; -36,-64; -2,
                  -70; -2,-54; -48,-26; -56,20; -44,56; -10,76; -2,76],
                                                                     style(
                color=7,
                rgbcolor={255,255,255},
                fillColor=7,
                rgbfillColor={255,255,255},
                fillPattern=1)),
            Line(points=[100,0; 86,0; 86,10; 76,10],   style(
                color=0,
                rgbcolor={0,0,0},
                fillColor=0,
                rgbfillColor={0,0,0},
                fillPattern=1)),
            Ellipse(extent=[74,12; 78,8],    style(
                color=0,
                rgbcolor={0,0,0},
                fillColor=0,
                rgbfillColor={0,0,0},
                fillPattern=1)),
            Ellipse(extent=[-4,14; 4,6],  style(
                color=0,
                rgbcolor={0,0,0},
                fillColor=0,
                rgbfillColor={0,0,0},
                fillPattern=1)),
            Ellipse(extent=[-42,14; -34,6],
                                          style(
                color=0,
                rgbcolor={0,0,0},
                fillColor=0,
                rgbfillColor={0,0,0},
                fillPattern=1)),
            Line(points=[-40,10; -76,10; -76,0; -100,0],
                                                       style(
                color=0,
                rgbcolor={0,0,0},
                fillColor=0,
                rgbfillColor={0,0,0},
                fillPattern=1)),
            Line(points=[14,10; 14,32; 30,32], style(
                color=0,
                rgbcolor={0,0,0},
                fillColor=7,
                rgbfillColor={255,255,255},
                fillPattern=1)),
            Line(points=[28,36; 34,36; 34,28; 28,28], style(
                color=0,
                rgbcolor={0,0,0},
                fillColor=7,
                rgbfillColor={255,255,255},
                fillPattern=1)),
            Line(points=[34,32; 50,32; 50,10], style(
                color=0,
                rgbcolor={0,0,0},
                fillColor=7,
                rgbfillColor={255,255,255},
                fillPattern=1)),
            Line(points=[40,10; 76,10], style(
                color=0,
                rgbcolor={0,0,0},
                fillColor=7,
                rgbfillColor={255,255,255},
                fillPattern=1)),
            Line(points=[2,10; 20,10], style(
                color=0,
                rgbcolor={0,0,0},
                fillColor=7,
                rgbfillColor={255,255,255},
                fillPattern=1))),
          Documentation(info="<html>

The torsion belt is useful for simulations where just longitudinal properties are of interest. An <span class=\"cmti-10x-x-109\">Actuated Revolute </span>is used to model the flexibility combined with a parallel spring damper
element for the determination of the belt's behavior. As no more precise model than the
parallel spring damper system was found in literature, no more complex models
for the behavior have been added, but expanding the model should not be any
problem.
<!--l. 51--></p><p class=\"noindent\">The initialization was again done simply by setting the initial angle of the revolute <font face=\"Symbol\">&#966;</font> to zero
as well as the angular velocity <font face=\"Symbol\">&#969;</font>.
</p>

</html>"));

      public
        SI.Angle phi = actuatedRevolute.phi "Twist angle";
        SI.AngularVelocity w = actuatedRevolute.w "Twist angle rate";

      protected
        MultiBondLib.Mechanics3D.Joints.ActuatedRevolute actuatedRevolute(
            animation=false)
          annotation (extent=[-10,-10; 10,10]);
        BondLib.Mechanical.Rotational.Passive.SpringDamper springDamper(c=cBelt,
            d=dBelt) annotation (extent=[-10,-44; 10,-24]);

      public
        MultiBondLib.Mechanics3D.Parts.Body BeltMass(
          animation=false,
          m=0,
          I_11=0,
          I_22=0,
          I_33=IBelt) annotation (extent=[-70,22; -50,42], rotation=90);

      initial equation
        phi = 0;
        w = 0;

      equation
        connect(springDamper.flange_a, actuatedRevolute.bearing) annotation (
            points=[-10,-34; -30,-34; -30,-12; -7,-12; -7,-7], style(color=0,
              rgbcolor={0,0,0}));
        connect(actuatedRevolute.axis, springDamper.flange_b) annotation (
            points=[7,-7; 7,-12; 30,-12; 30,-34; 10,-34], style(color=0,
              rgbcolor={0,0,0}));
        connect(actuatedRevolute.frame_a, frame_a) annotation (points=[-11,0;
              -35.75,0; -35.75,1.22125e-015; -60.5,1.22125e-015; -60.5,0; -110,0],
                       style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(actuatedRevolute.frame_b, frame_b) annotation (points=[11,0; 35.75,
              0; 35.75,1.22125e-015; 60.5,1.22125e-015; 60.5,0; 110,0],
                               style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(BeltMass.frame_a, frame_a) annotation (points=[-60,21; -60,0; -110,
              0],      style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2,
            fillColor=0,
            rgbfillColor={0,0,0},
            fillPattern=1));
      end TorsionBelt;

      model LongLatBelt
        "a belt that is able to translate in longitudinal and lateral direction."
        import WheelsAndTires;
        import SI = Modelica.SIunits;

        extends WheelsAndTires.TireComponents.BeltDynamics.BeltDynamicsBase;

        parameter Boolean visBeltDynamicsEnabled = false
          "true: the actuated prismatics realizing the dynamics will be animated";
        parameter SI.Mass mBelt = 5 "The mass of the belt";
        parameter Real cLong(final unit="N/m",final min=0) = 1e5
          "spring constant";
        parameter Real dLong(final unit="N/ (m/s)",final min=0) = 1e4
          "spring constant";
        parameter Real cLat(final unit="N/m",final min=0) = 1e5
          "spring constant";
        parameter Real dLat(final unit="N/ (m/s)",final min=0) = 1e4
          "spring constant";

      public
        SI.Distance s_Long = modulatedActuatedPrismaticLong.s
          "Longitudinal displacement";
        SI.Distance s_Lat = modulatedActuatedPrismaticLat.s
          "Longitudinal displacement";
        SI.Velocity v_Long = modulatedActuatedPrismaticLong.v
          "Longitudinal dispacement velocity";
        SI.Velocity v_Lat = modulatedActuatedPrismaticLat.v
          "Lateral dispacement velocity";

      protected
        outer WheelsAndTires.Environment.Surface Surface;
        MultiBondLib.Interfaces.RealSignal eLat[3]
          annotation (extent=[24,54; 36,66]);
        MultiBondLib.Interfaces.RealSignal eLong[3]
          annotation (extent=[44,54; 56,66]);
        BondLib.Mechanical.Translational.Passive.SpringDamper LongDynamics(c=cLong, d=dLong)
          annotation (extent=[40,-88; 60,-68], rotation=180);
        WheelsAndTires.TireComponents.Utilities.AddititionalMBG.modulatedActuatedPrismatic
          modulatedActuatedPrismaticLong(animation=visBeltDynamicsEnabled)
          annotation (extent=[40,-60; 60,-40],rotation=180);
        BondLib.Mechanical.Translational.Passive.SpringDamper LatDynamics(c=cLat, d=dLat)
          annotation (extent=[-30,-40; -10,-20],
                                             rotation=90);
        WheelsAndTires.TireComponents.Utilities.AddititionalMBG.modulatedActuatedPrismatic
          modulatedActuatedPrismaticLat(animation=visBeltDynamicsEnabled)
          annotation (extent=[-2,-40; 18,-20],
                                             rotation=90);
        annotation (Icon(
            Polygon(points=[-2,76; -2,90; -58,70; -74,28; -74,-40; -36,-64; -2,
                  -70; -2,-54; -48,-26; -56,20; -44,56; -10,76; -2,76],
                                                                     style(
                color=7,
                rgbcolor={255,255,255},
                fillColor=7,
                rgbfillColor={255,255,255},
                fillPattern=1)),
            Rectangle(extent=[50,-34; 0,54], style(
                color=7,
                rgbcolor={255,255,255},
                fillColor=7,
                rgbfillColor={255,255,255})),
            Ellipse(extent=[72,12; 76,8],    style(
                color=0,
                rgbcolor={0,0,0},
                fillColor=0,
                rgbfillColor={0,0,0},
                fillPattern=1)),
            Line(points=[74,10; 68,10; 68,2; 64,2; 62,6; 60,-2; 58,6; 56,-2; 54,
                  6; 52,-2; 50,6; 48,2; 40,2; 40,10; 28,10],
                                     style(
                color=0,
                rgbcolor={0,0,0},
                fillColor=0,
                rgbfillColor={0,0,0},
                fillPattern=1)),
            Line(points=[74,10; 68,10; 68,18; 54,18],    style(
                color=0,
                rgbcolor={0,0,0},
                fillColor=0,
                rgbfillColor={0,0,0},
                fillPattern=1)),
            Line(points=[26,10; 40,10; 40,18; 48,18; 48,22; 58,22; 48,22; 48,14;
                  58,14],                 style(
                color=0,
                rgbcolor={0,0,0},
                fillColor=0,
                rgbfillColor={0,0,0},
                fillPattern=1)),
            Line(points=[26,56; 26,48; 36,48; 36,40; 40,40; 40,30; 40,40; 32,40;
                  32,30],     style(
                color=0,
                rgbcolor={0,0,0},
                fillColor=0,
                rgbfillColor={0,0,0},
                fillPattern=1)),
            Line(points=[26,10; 26,18; 16,18; 16,24; 20,26; 14,28; 20,30; 14,32;
                  20,34; 14,36; 20,38; 16,40; 16,48; 26,48; 26,56],
                style(
                color=0,
                rgbcolor={0,0,0},
                fillColor=0,
                rgbfillColor={0,0,0},
                fillPattern=1)),
            Line(points=[26,12; 26,18; 36,18; 36,36],
                                                    style(
                color=0,
                rgbcolor={0,0,0},
                fillColor=0,
                rgbfillColor={0,0,0},
                fillPattern=1)),
            Ellipse(extent=[-44,14; -36,6],
                                          style(
                color=0,
                rgbcolor={0,0,0},
                fillColor=0,
                rgbfillColor={0,0,0},
                fillPattern=1)),
            Line(points=[-42,10; -78,10; -78,0; -100,0],
                                                       style(
                color=0,
                rgbcolor={0,0,0},
                fillColor=0,
                rgbfillColor={0,0,0},
                fillPattern=1)),
            Line(points=[26,56; 8,56; 8,10; 0,10],     style(
                color=0,
                rgbcolor={0,0,0},
                fillColor=0,
                rgbfillColor={0,0,0},
                fillPattern=1)),
            Ellipse(extent=[-6,14; 2,6],  style(
                color=0,
                rgbcolor={0,0,0},
                fillColor=0,
                rgbfillColor={0,0,0},
                fillPattern=1)),
            Line(points=[100,0; 84,0; 84,10; 74,10],   style(
                color=0,
                rgbcolor={0,0,0},
                fillColor=0,
                rgbfillColor={0,0,0},
                fillPattern=1))), Diagram,
          Documentation(info="<html>

This belt is able to translate in longitudinal
and lateral direction.

<!--l. 68--></p><p class=\"noindent\">For the initialization, the longitudinal and lateral positions as well as the corresponding
velocities for <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">frame_a</span></span></span> and <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">frame_b</span></span></span> have been set to the same value in longitudinal and
lateral direction.
</p>

<p>
This models does not work when an uneven surfaces are used which's function computing the elevation is not derivable analytically.
</p>

</html>"));

      public
        MultiBondLib.Mechanics3D.Parts.Body BeltMass(
          animation=false,
          I_11=0,
          I_22=0,
          m=mBelt,
          I_33=0) annotation (extent=[-80,32; -60,52], rotation=90);
      initial equation
        frame_a.P.x*eLong = frame_b.P.x*eLong;
        frame_a.P.x*eLat = frame_b.P.x*eLat;
        frame_a.P.v*eLong = frame_b.P.v*eLong;
        frame_a.P.v*eLat = frame_b.P.v*eLat;

      equation

        assert(Surface.FlatSurface == true,
          "the 'LongLatBelt'  model just works with Flat Surfaces (Surface.FlatSurface == true). Please change the parameter of the used surface");

        connect(modulatedActuatedPrismaticLong.axis, LongDynamics.flange_b)
                                                                annotation (
           points=[43,-57; 43,-64; 40.1,-64; 40.1,-78],style(
            color=58,
            rgbcolor={0,127,0},
            fillColor=0,
            rgbfillColor={0,0,0},
            fillPattern=1));
        connect(LongDynamics.flange_a, modulatedActuatedPrismaticLong.bearing)
          annotation (points=[60,-78; 60,-64; 56,-64; 56,-57],style(
            color=58,
            rgbcolor={0,127,0},
            fillColor=0,
            rgbfillColor={0,0,0},
            fillPattern=1));
        connect(LatDynamics.flange_b, modulatedActuatedPrismaticLat.axis)
                                                                annotation (
           points=[-20,-20.1; -4,-20; -4,-23; 1,-23],
                                                   style(color=58, rgbcolor=
               {0,127,0}));
        connect(modulatedActuatedPrismaticLat.bearing, LatDynamics.flange_a)
          annotation (points=[1,-36; -4,-36; -4,-40; -20,-40],
                                                          style(color=58,
              rgbcolor={0,127,0}));
        connect(frame_b, modulatedActuatedPrismaticLong.frame_a) annotation (
            points=[110,0; 80,0; 80,-50; 61,-50], style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(modulatedActuatedPrismaticLong.frame_b,
          modulatedActuatedPrismaticLat.frame_a) annotation (points=[39,-50; 8,
              -50; 8,-41],style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(modulatedActuatedPrismaticLat.frame_b, frame_a) annotation (
            points=[8,-19; 8,0; -110,0],                  style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(eLong[:], UV.eLong[:]) annotation (points=[50,60; 50,66; 40,66;
              40,76], style(
            color=3,
            rgbcolor={0,0,255},
            fillColor=51,
            rgbfillColor={255,255,170},
            fillPattern=1));
        connect(eLat[:], UV.eLat[:]) annotation (points=[30,60; 30,66; 40,66;
              40,76],                                                   style(
            color=3,
            rgbcolor={0,0,255},
            fillColor=51,
            rgbfillColor={255,255,170},
            fillPattern=1));
        connect(modulatedActuatedPrismaticLat.r, eLat) annotation (points=[18,-30;
              30,-30; 30,60],style(
            color=3,
            rgbcolor={0,0,255},
            fillColor=10,
            rgbfillColor={135,135,135},
            fillPattern=1));
        connect(modulatedActuatedPrismaticLong.r, eLong) annotation (points=[50,-40;
              50,60],      style(
            color=3,
            rgbcolor={0,0,255},
            fillColor=10,
            rgbfillColor={135,135,135},
            fillPattern=1));
        connect(BeltMass.frame_a, frame_a) annotation (points=[-70,31; -70,0; -110,
              0],
            style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2,
            fillColor=0,
            rgbfillColor={0,0,0},
            fillPattern=1));
      end LongLatBelt;

      model QuadOrder2Belt
        "belt modeled by an ideal rim and an ideally stiff rim connected to an ideally stiff belt by four 3D spring damper systems. To be revised in order to work properly."
        import MultiBondLib;
        import SI = Modelica.SIunits;
        import PI = Modelica.Constants.pi;
        import Modelica.Math.atan2;
        extends WheelsAndTires.TireComponents.BeltDynamics.BeltDynamicsBase;

        parameter Boolean visBeltDynamicsEnabled = false
          "true: the springs and translations realizing the dynamics will be animated";
        parameter SI.Mass mBelt = 5 "Mass of the Belt";
        parameter SI.Inertia I11Belt = 0.1
          "(1,1) element of the inertial tensor of the belt";
        parameter SI.Inertia I22Belt = 0.1
          "(2,2) element of the inertial tensor of the belt";
        parameter SI.Inertia I33Belt = 1
          "(3,3) element of the inertial tensor of the belt";
        parameter Real c(
          final unit="N/m",
          final min=0) = 3e5 "spring constant";
        parameter Real d(
          final unit="N/ (m/s)",
          final min=0) = 1 "damper constant";
        parameter SI.Length s0 = 40e-3
          "Unstreched length of the belt (without internal pressure)";
        parameter SI.Distance rRim = 14/2*2.54e-2 "The rim's radius";
        parameter SI.Distance height = 50e-3 "The belt's height";

        annotation (Diagram, Icon(
            Line(points=[-46,10; -46,0; -48,-6; -50,4; -52,-6; -54,4; -56,-6;
                  -58,4; -60,-6; -62,4; -64,-6; -66,0; -66,10],
                                                             style(
                color=0,
                rgbcolor={0,0,0},
                fillColor=0,
                rgbfillColor={0,0,0},
                fillPattern=1)),
            Line(points=[-72,10; -66,10; -66,22; -58,22; -58,26; -52,26; -58,26;
                  -58,18; -52,18], style(
                color=0,
                rgbcolor={0,0,0},
                fillColor=0,
                rgbfillColor={0,0,0},
                fillPattern=1)),
            Line(points=[-54,22; -46,22; -46,10; -40,10], style(
                color=0,
                rgbcolor={0,0,0},
                fillColor=0,
                rgbfillColor={0,0,0},
                fillPattern=1)),
            Line(points=[0,76; 8,76; 14,74; 4,72; 14,70; 4,68; 14,66; 4,64; 14,
                  62; 4,60; 14,58; 8,56; 0,56],  style(
                color=0,
                rgbcolor={0,0,0},
                fillColor=0,
                rgbfillColor={0,0,0},
                fillPattern=1)),
            Line(points=[0,82; 0,76; -8,76; -8,70; -12,70; -12,64; -12,70; -4,
                  70; -4,64],
                       style(
                color=0,
                rgbcolor={0,0,0},
                fillColor=0,
                rgbfillColor={0,0,0},
                fillPattern=1)),
            Line(points=[-8,66; -8,56; 0,56; 0,50], style(
                color=0,
                rgbcolor={0,0,0},
                fillColor=0,
                rgbfillColor={0,0,0},
                fillPattern=1)),
            Line(points=[66,10; 66,0; 64,-6; 62,4; 60,-6; 58,4; 56,-6; 54,4; 52,
                  -6; 50,4; 48,-6; 46,0; 46,10], style(
                color=0,
                rgbcolor={0,0,0},
                fillColor=0,
                rgbfillColor={0,0,0},
                fillPattern=1)),
            Line(points=[40,10; 46,10; 46,20; 54,20], style(
                color=0,
                rgbcolor={0,0,0},
                fillColor=0,
                rgbfillColor={0,0,0},
                fillPattern=1)),
            Line(points=[52,24; 58,24; 58,16; 52,16; 58,16; 58,20; 66,20; 66,10;
                  72,10], style(
                color=0,
                rgbcolor={0,0,0},
                fillColor=0,
                rgbfillColor={0,0,0},
                fillPattern=1)),
            Line(points=[0,-36; 8,-36; 14,-38; 4,-40; 14,-42; 4,-44; 14,-46; 4,
                  -48; 14,-50; 4,-52; 14,-54; 8,-56; 0,-56],  style(
                color=0,
                rgbcolor={0,0,0},
                fillColor=0,
                rgbfillColor={0,0,0},
                fillPattern=1)),
            Line(points=[0,-30; 0,-36; -8,-36; -8,-46], style(
                color=0,
                rgbcolor={0,0,0},
                fillColor=0,
                rgbfillColor={0,0,0},
                fillPattern=1)),
            Line(points=[0,-62; 0,-56; -8,-56; -8,-50; -12,-50; -12,-44; -12,
                  -50; -4,-50; -4,-44],
                               style(
                color=0,
                rgbcolor={0,0,0},
                fillColor=0,
                rgbfillColor={0,0,0},
                fillPattern=1))),
          Documentation(info="<html>

The model consists of four fixed translations that connect the center of the rim to the outer diameter of
the rim. The pretensioned springs connect the outer radius of the rim with another four fixed
translations that are part of the belt. These again model the ideal connection from the outer
diameter of the belt to the virtual center point of the belt that is the output of the model.
The springs model the belt in a way that their unstretched length is the height of the side
wall without any inside air pressure. The actual tension is reasoned by the inner pressure of
the tire.
<!--l. 85--></p><p class=\"noindent\">The model is probably not a very good description of a real tire though, because a
deformation at the contact point does move the total belt due to the ideal translational
elements in the <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">Belt</span></span></span> model. Additionally for every deformation all the four spring/dampers
combinations respond with a force what is not realistic either. Without the dampers or with
a zero damping constant, the tire will never stop oscillating when there is no contact with the
ground, which is unrealistic as well. So further consideration is necessary to make this model
really useful. It was still left in the library due to the fact that the initialization is non-trivial.
This way the <span class=\"cmti-10x-x-109\">Quad Order Two Belt </span>can be used as a working base for further
extensions.

<!--l. 87--></p>

</html>"));
      protected
        Real[3,3] Ra;
        Real[3] phi;
        Real tol = 1e-3;

        MultiBondLib.Mechanics3D.Forces.Spring spring(c=c, s0=s0, animation=visBeltDynamicsEnabled)
          annotation (extent=[5,40; 25,60]);
        MultiBondLib.Mechanics3D.Forces.Spring spring1(c=c, s0=s0, animation=visBeltDynamicsEnabled)
          annotation (extent=[5,-2; 25,18]);
        MultiBondLib.Mechanics3D.Forces.Spring spring2(c=c, s0=s0, animation=visBeltDynamicsEnabled)
          annotation (extent=[5,-42; 25,-22]);
        MultiBondLib.Mechanics3D.Forces.Spring spring3(c=c, s0=s0, animation=visBeltDynamicsEnabled)
          annotation (extent=[5,-82; 25,-62]);
        MultiBondLib.Mechanics3D.Forces.Damping damper(d=d)
          annotation (extent=[5,18; 25,38]);
        MultiBondLib.Mechanics3D.Forces.Damping damper1(d=d)
          annotation (extent=[5,-22; 25,-2]);
        MultiBondLib.Mechanics3D.Forces.Damping damper2(d=d)
          annotation (extent=[5,-60; 25,-40]);
        MultiBondLib.Mechanics3D.Forces.Damping damper3(d=d)
          annotation (extent=[5,-100; 25,-80]);
        WheelsAndTires.TireComponents.BeltDynamics.UsedModels.QuadBelt Belt(
                                                                           visBeltDynamicsEnabled=visBeltDynamicsEnabled, rBelt=
              rRim + height)
          annotation (extent=[-60,-60; -20,20]);
        WheelsAndTires.TireComponents.BeltDynamics.UsedModels.QuadRim Rim(
                                                                         visBeltDynamicsEnabled=visBeltDynamicsEnabled, rRim=
              rRim)
          annotation (extent=[50,-60; 90,20]);

      public
        MultiBondLib.Mechanics3D.Parts.Body BeltMass(
          animation=false,
          useQuaternions=false,
          m=mBelt,
          I_11=I11Belt,
          I_22=I22Belt,
          I_33=I33Belt)
          annotation (extent=[-86,30; -66,50], rotation=90);

      initial equation
        frame_a.P.x = frame_b.P.x;
        frame_a.P.v = frame_b.P.v;
        frame_a.P.w = frame_b.P.w;
        BeltMass.PotentialFBM1.phi = phi; //phi is calculated in the when{initial()} part

      equation
        when {initial()} then
          Ra = transpose(frame_b.P.R);
          phi[2] = atan2(-Ra[3,1], sqrt(Ra[1,1]^2+Ra[2,1]^2));

          if abs(phi[2]) < PI/2-tol or abs(phi[2]) > PI/2+tol then
            phi[3] = atan2(Ra[2,1]/cos(phi[2]), Ra[1,1]/cos(phi[2]));
            phi[1] = atan2(Ra[3,2]/cos(phi[2]), Ra[3,3]/cos(phi[2]));
          elseif phi[2] > 0 then
            phi[3] = 0;
            phi[1] = atan2(Ra[1,1],Ra[2,2]);
          else
            phi[3] = 0;
            phi[1] = -atan2(Ra[1,1],Ra[2,2]);
          end if;

          assert(abs(phi[2]) < PI/2-tol and abs(phi[2]) < PI/2+tol,
          "The initial position of the belt (in the Belt3D model) can not be determined uniquely. Please turn the tire around the y axis to overcome this problem (e.g. heading longitudinally to the x-Axis)");

          /*  equations are placed here to not have to declare dummy equations in
        the equation section what would be necessary if these eqauations
        were in the initial equations section. Nevertheless the starting
        angle phi of the mass is set there. The elseif and else clause would
        not be necessary as the assert statement stopps the simulation. Yet
        they are left because the could be usefull when deleting the assert.*/
        end when;

        connect(damper.frame_a, spring.frame_a)  annotation (points=[4,28; 4,33.5;
              4,33.5; 4,39; 4,50; 4,50],
                       style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(spring.frame_b, damper.frame_b)  annotation (points=[26,50; 26,
              28],    style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(damper1.frame_a, spring1.frame_a) annotation (points=[4,-12; 4,-7;
              4,-7; 4,-2; 4,8; 4,8],
                   style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(damper1.frame_b, spring1.frame_b) annotation (points=[26,-12;
              26,8],  style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(damper2.frame_a, spring2.frame_a) annotation (points=[4,-50; 4,
              -45.5; 4,-45.5; 4,-41; 4,-32; 4,-32],
                        style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(spring2.frame_b,damper2. frame_b) annotation (points=[26,-32;
              26,-50],  style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(damper3.frame_a, spring3.frame_a) annotation (points=[4,-90; 4,
              -85.5; 4,-85.5; 4,-81; 4,-72; 4,-72],
                                              style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(spring3.frame_b,damper3. frame_b) annotation (points=[26,-72;
              26,-90],                     style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(Belt.upperFrame, spring.frame_a) annotation (points=[-30.4,12; -8,
              12; -8,40; 4,40; 4,50],          style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2,
            fillColor=10,
            rgbfillColor={95,95,95},
            fillPattern=1));
        connect(Belt.leftFrame, spring1.frame_a) annotation (points=[-40,-12; 0,-12;
              0,-2; 4,-2; 4,8],           style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2,
            fillColor=10,
            rgbfillColor={95,95,95},
            fillPattern=1));
        connect(Belt.rightFrame, spring2.frame_a) annotation (points=[-20,-28; 0,
              -28; 0,-40; 4,-40; 4,-32],          style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2,
            fillColor=10,
            rgbfillColor={95,95,95},
            fillPattern=1));
        connect(Belt.lowerFrame, spring3.frame_a) annotation (points=[-29.6,-52; -9,
              -52; -9,-80; 4,-80; 4,-72],          style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2,
            fillColor=10,
            rgbfillColor={95,95,95},
            fillPattern=1));
        connect(Rim.upperFrame, spring.frame_b) annotation (points=[60.4,12; 34,12;
              34,40; 26,40; 26,50],     style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2,
            fillColor=10,
            rgbfillColor={95,95,95},
            fillPattern=1));
        connect(Rim.leftFrame, spring1.frame_b) annotation (points=[50,-12; 30,-12;
              30,-2; 26,-2; 26,8],  style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2,
            fillColor=10,
            rgbfillColor={95,95,95},
            fillPattern=1));
        connect(Rim.rightFrame, spring2.frame_b) annotation (points=[70,-28; 30,-28;
              30,-40; 26,-40; 26,-32],     style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2,
            fillColor=10,
            rgbfillColor={95,95,95},
            fillPattern=1));
        connect(Rim.lowerFrame, spring3.frame_b) annotation (points=[60.4,-52;
              34,-52; 34,-80; 26,-80; 26,-72], style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2,
            fillColor=10,
            rgbfillColor={95,95,95},
            fillPattern=1));
        connect(Rim.frame_b, frame_b) annotation (points=[94,-20; 96,-20; 96,0; 110,
              0],                                                       style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(Belt.Belt, frame_a) annotation (points=[-64,-20; -76,-20; -76,0;
              -110,0],                                                  style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(BeltMass.frame_a, frame_a) annotation (points=[-76,29; -76,0; -110,
              0],      style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
      end QuadOrder2Belt;

      annotation (Icon, Documentation(info="<html>


The models described in this package are intended to provide a dynamically behaving belt. To
be more precise, it shall model the flexibility of the tire. This is realized by connecting an
ideal (virtual) belt to the ideal rim in different ways. All models except the <span class=\"cmti-10x-x-109\">Rigid Belt </span>model
add a considerable amount of complexity to the simulation. This challenges the modeler to
exactly know what is going on in the model.
<!--l. 6--></p><p class=\"noindent\">Every belt model is realized to describe the relationship between the center point of the rim
and the (virtual) center point of the belt. This is considered to be the most general approach
of modeling. This is also the reason for the <span class=\"cmti-10x-x-109\">Center to CP </span>model to be necessary,
because it realizes the translation between the center of the belt to the contact
point.
<!--l. 8--></p>

</html>"));
      package UsedModels "Models used in the Quad Order 2 Belt."
        annotation(preferedView="info");

      extends
          WheelsAndTires.TireComponents.Utilities.Icons.TireComponentsPackage;

        model QuadBelt "models the ideal belt."
          import SI = Modelica.SIunits;

          parameter SI.Radius rBelt = 14/2*2.54e-2 + 5e-2;
          parameter Boolean visBeltDynamicsEnabled=false
            "= true, if animation shall be enabled";

          MultiBondLib.Mechanics3D.Interfaces.Frame_a Belt
            "models the belt's center point."
            annotation (extent=[-120,-10; -100,10]);
          annotation (
            Diagram,
            Icon(
              Rectangle(extent=[-100,100; 0,-100], style(
                  color=10,
                  rgbcolor={95,95,95},
                  fillColor=7,
                  rgbfillColor={255,255,255},
                  fillPattern=1)),
              Ellipse(extent=[-62,92; 0,-94], style(
                  color=10,
                  rgbcolor={95,95,95},
                  fillColor=10,
                  rgbfillColor={95,95,95})),
              Rectangle(extent=[-100,0; -30,2], style(
                  color=10,
                  rgbcolor={95,95,95},
                  fillColor=10,
                  rgbfillColor={95,95,95},
                  fillPattern=1)),
              Ellipse(extent=[-50,70; -10,-68], style(
                  color=10,
                  rgbcolor={95,95,95},
                  fillColor=7,
                  rgbfillColor={255,255,255},
                  fillPattern=1)),
              Text(
                extent=[-100,-100; -52,-76],
                string="%name",
                style(
                  color=10,
                  rgbcolor={95,95,95},
                  fillColor=7,
                  rgbfillColor={255,255,255},
                  fillPattern=1))),
            Coordsys(extent=[-100,-100; 0,100], scale=0.1),
            Documentation(info="<html>

Models a belt by four ideal translational elements.

</html>"));
          MultiBondLib.Mechanics3D.Interfaces.Frame_b upperFrame
            "upper connector"
            annotation (extent=[-36,70; -16,90]);
          MultiBondLib.Mechanics3D.Interfaces.Frame_b rightFrame
            "right connector"
            annotation (extent=[-10,-30; 10,-10]);
          MultiBondLib.Mechanics3D.Interfaces.Frame_b leftFrame
            "left connector"
            annotation (extent=[-60,10; -40,30]);
          MultiBondLib.Mechanics3D.Interfaces.Frame_b lowerFrame
            "lower connector"
            annotation (extent=[-34,-90; -14,-70]);
          MultiBondLib.Mechanics3D.Parts.FixedTranslation upperTranslation(
          r = -{0,1,0}*rBelt,animation=visBeltDynamicsEnabled)
            annotation (extent=[-70,70; -50,90], rotation=0);
          MultiBondLib.Mechanics3D.Parts.FixedTranslation rightTranslation(
          r = {1,0,0}*rBelt,animation=visBeltDynamicsEnabled)
            annotation (extent=[-40,-30; -20,-10], rotation=0);
          MultiBondLib.Mechanics3D.Parts.FixedTranslation leftTranslation(
          r = -{1,0,0}*rBelt,animation=visBeltDynamicsEnabled)
            annotation (extent=[-90,10; -70,30], rotation=0);
          MultiBondLib.Mechanics3D.Parts.FixedTranslation lowerTranslation(
          r = {0,1,0}*rBelt,animation=visBeltDynamicsEnabled)
            annotation (extent=[-70,-90; -50,-70], rotation=0);
        equation
          connect(Belt, leftTranslation.frame_a) annotation (points=[-110,0; -90,0;
                -90,20; -91,20],          style(
              color=0,
              rgbcolor={0,0,0},
              thickness=2,
              fillColor=10,
              rgbfillColor={95,95,95},
              fillPattern=1));
          connect(Belt, rightTranslation.frame_a) annotation (points=[-110,0; -90,0;
                -90,-20; -41,-20],          style(
              color=0,
              rgbcolor={0,0,0},
              thickness=2,
              fillColor=10,
              rgbfillColor={95,95,95},
              fillPattern=1));
          connect(lowerTranslation.frame_a, Belt) annotation (points=[-71,-80; -90,
                -80; -90,0; -110,0],     style(
              color=0,
              rgbcolor={0,0,0},
              thickness=2,
              fillColor=10,
              rgbfillColor={95,95,95},
              fillPattern=1));
          connect(upperTranslation.frame_a, Belt) annotation (points=[-71,80; -90,80;
                -90,0; -110,0],         style(
              color=0,
              rgbcolor={0,0,0},
              thickness=2,
              fillColor=10,
              rgbfillColor={95,95,95},
              fillPattern=1));
          connect(upperTranslation.frame_b, upperFrame) annotation (points=[-49,
                80; -26,80], style(
              color=0,
              rgbcolor={0,0,0},
              thickness=2,
              fillColor=10,
              rgbfillColor={95,95,95},
              fillPattern=1));
          connect(leftTranslation.frame_b, leftFrame) annotation (points=[-69,
                20; -50,20], style(
              color=0,
              rgbcolor={0,0,0},
              thickness=2,
              fillColor=10,
              rgbfillColor={95,95,95},
              fillPattern=1));
          connect(rightTranslation.frame_b, rightFrame) annotation (points=[-19,-20;
                0,-20],      style(
              color=0,
              rgbcolor={0,0,0},
              thickness=2,
              fillColor=10,
              rgbfillColor={95,95,95},
              fillPattern=1));
          connect(lowerTranslation.frame_b, lowerFrame) annotation (points=[-49,
                -80; -24,-80], style(
              color=0,
              rgbcolor={0,0,0},
              thickness=2,
              fillColor=10,
              rgbfillColor={95,95,95},
              fillPattern=1));
        end QuadBelt;

        model QuadRim "models the ideal rim."
          import SI = Modelica.SIunits;

          parameter SI.Radius rRim = 14/2*2.54e-2 "the rim's radius";
          parameter Boolean visBeltDynamicsEnabled=false
            "= true, if animation shall be enabled";

          MultiBondLib.Mechanics3D.Interfaces.Frame_b frame_b
            "models the belt's center point."
            annotation (extent=[100,-10; 120,10]);
          annotation (
            Diagram,
            Icon(
              Rectangle(extent=[0,100; 100,-100], style(
                  color=10,
                  rgbcolor={95,95,95},
                  fillColor=7,
                  rgbfillColor={255,255,255},
                  fillPattern=1)),
              Ellipse(extent=[8,74; 52,-72], style(
                  color=9,
                  rgbcolor={175,175,175},
                  fillColor=9,
                  rgbfillColor={175,175,175},
                  fillPattern=1)),
              Ellipse(extent=[14,64; 46,-62], style(
                  color=7,
                  rgbcolor={255,255,255},
                  fillColor=7,
                  rgbfillColor={255,255,255},
                  fillPattern=1)),
              Rectangle(extent=[32,0; 100,2], style(
                  color=9,
                  rgbcolor={175,175,175},
                  fillColor=9,
                  rgbfillColor={175,175,175})),
              Polygon(points=[30,68; 30,-70; 32,-70; 32,68; 30,68], style(
                  color=9,
                  rgbcolor={175,175,175},
                  fillColor=9,
                  rgbfillColor={175,175,175})),
              Polygon(points=[10,21; 50,-20; 50,-18; 10,24; 10,21], style(
                  color=9,
                  rgbcolor={175,175,175},
                  fillColor=9,
                  rgbfillColor={175,175,175},
                  fillPattern=1)),
              Ellipse(extent=[26,20; 36,-18], style(
                  color=9,
                  rgbcolor={175,175,175},
                  fillColor=9,
                  rgbfillColor={175,175,175},
                  fillPattern=1)),
              Text(
                extent=[52,-100; 100,-76],
                string="%name",
                style(
                  color=10,
                  rgbcolor={95,95,95},
                  fillColor=7,
                  rgbfillColor={255,255,255},
                  fillPattern=1))),
            Coordsys(extent=[0,-100; 100,100], scale=0.1),
            Documentation(info="<html>

Models a rim by four ideal translational elements.

</html>"));
          MultiBondLib.Mechanics3D.Interfaces.Frame_a upperFrame
            "upper connector"
            annotation (extent=[16,70; 36,90]);
          MultiBondLib.Mechanics3D.Interfaces.Frame_a rightFrame
            "right connector"
            annotation (extent=[40,-30; 60,-10]);
          MultiBondLib.Mechanics3D.Interfaces.Frame_a leftFrame
            "left connector"
            annotation (extent=[-10,10; 10,30]);
          MultiBondLib.Mechanics3D.Interfaces.Frame_a lowerFrame
            "lower connector"
            annotation (extent=[16,-90; 36,-70]);
          MultiBondLib.Mechanics3D.Parts.FixedTranslation upperTranslation(
          r = -{0,1,0}*rRim, animation=visBeltDynamicsEnabled)
            annotation (extent=[50,70; 70,90], rotation=180);
          MultiBondLib.Mechanics3D.Parts.FixedTranslation rightTranslation(
          r={1,0,0}*rRim, animation=visBeltDynamicsEnabled)
            annotation (extent=[68,-30; 88,-10], rotation=180);
          MultiBondLib.Mechanics3D.Parts.FixedTranslation leftTranslation(
          r=-{1,0,0}*rRim, animation=visBeltDynamicsEnabled)
            annotation (extent=[20,10; 40,30], rotation=180);
          MultiBondLib.Mechanics3D.Parts.FixedTranslation lowerTranslation(
          r = {0,1,0}*rRim,animation=visBeltDynamicsEnabled)
            annotation (extent=[50,-90; 70,-70], rotation=180);
        equation
          connect(upperTranslation.frame_b, upperFrame) annotation (points=[49,
                80; 26,80], style(
              color=0,
              rgbcolor={0,0,0},
              thickness=2,
              fillColor=45,
              rgbfillColor={255,128,0},
              fillPattern=1));
          connect(upperTranslation.frame_a, frame_b) annotation (points=[71,80; 89,80;
                89,0; 110,0],            style(
              color=0,
              rgbcolor={0,0,0},
              thickness=2,
              fillColor=45,
              rgbfillColor={255,128,0},
              fillPattern=1));
          connect(leftFrame, leftTranslation.frame_b) annotation (points=[0,20; 19,20],
                        style(
              color=0,
              rgbcolor={0,0,0},
              thickness=2,
              fillColor=45,
              rgbfillColor={255,128,0},
              fillPattern=1));
          connect(leftTranslation.frame_a, frame_b) annotation (points=[41,20; 89,20;
                89,0; 110,0],        style(
              color=0,
              rgbcolor={0,0,0},
              thickness=2,
              fillColor=45,
              rgbfillColor={255,128,0},
              fillPattern=1));
          connect(rightFrame, rightTranslation.frame_b) annotation (points=[50,
                -20; 67,-20], style(
              color=0,
              rgbcolor={0,0,0},
              thickness=2,
              fillColor=45,
              rgbfillColor={255,128,0},
              fillPattern=1));
          connect(rightTranslation.frame_a, frame_b) annotation (points=[89,-20; 89,0;
                110,0],                    style(
              color=0,
              rgbcolor={0,0,0},
              thickness=2,
              fillColor=45,
              rgbfillColor={255,128,0},
              fillPattern=1));
          connect(lowerTranslation.frame_a, rightTranslation.frame_a)
            annotation (points=[71,-80; 89,-80; 89,-20],       style(
              color=0,
              rgbcolor={0,0,0},
              thickness=2,
              fillColor=45,
              rgbfillColor={255,128,0},
              fillPattern=1));
          connect(lowerTranslation.frame_b, lowerFrame) annotation (points=[49,
                -80; 26,-80], style(
              color=0,
              rgbcolor={0,0,0},
              thickness=2,
              fillColor=45,
              rgbfillColor={255,128,0},
              fillPattern=1));
        end QuadRim;
        annotation (Icon);
      end UsedModels;
    end BeltDynamics;

    package ContactPhysics
      "models the contact point. Applies forces and torques to the contact point and measures its velocities."
      annotation(preferedView="info");

    extends WheelsAndTires.TireComponents.Utilities.Icons.TireComponentsPackage;

      partial model ContactPhysicsBase
        "The model that delivers the base to measure contact points velocities and apply forces and torques to the contact point."

        import MultiBondLib;
        import MB = Modelica.Mechanics.MultiBody;
        import SI = Modelica.SIunits;

        extends WheelsAndTires.TireComponents.Utilities.Icons.TireComponents;

        parameter Boolean visForcesEnabled = true
          "true if the contact forces shall be shown as arrows"
          annotation(Dialog(tab="Visualization", group="Contact Force Properties"));
        parameter Real forceScaling = 1000
          "Factor to determine the length of the visualization window. length[m] = Force[N]/forceScaling"
          annotation(Dialog(tab="Visualization", group="Contact Force Properties"));
        parameter MB.Types.Color arrowColor= {255,0,0}
          "Color of the arrows visualizing the forces"
          annotation(Dialog(tab="Visualization", group="Contact Force Properties"));
        parameter SI.Length arrowDiameter = 0.01
          "Diameter of the arrow visualizing the forces"
          annotation(Dialog(tab="Visualization", group="Contact Force Properties"));

      public
        Communication.TireBus tireBus "connect to the Tire Bus."
          annotation (extent=[-70,90; -50,110]);
        WheelsAndTires.TireComponents.Communication.ContactPointConnector
          Friction "connect to the Contact Point Connector Bus."
          annotation (extent=[50,90; 70,110]);
        MultiBondLib.Mechanics3D.Interfaces.Frame_b frame_b
          "connect to the Center to Contact Point model."
          annotation (extent=[100,-10; 120,10]);
      protected
        outer MultiBondLib.Mechanics3D.World3D world3D;
        SI.Distance FlangePos[3] = frame_b.P.x;
        annotation (
          Icon(
            Text(
              extent=[-84,-16; -84,-52],
              string="v",
              style(
                color=10,
                rgbcolor={135,135,135},
                fillColor=10,
                rgbfillColor={135,135,135})),
            Polygon(points=[-22,-40; -72,-40; -64,-38; -64,-42; -72,-40; -22,
                  -40], style(
                color=10,
                rgbcolor={135,135,135},
                fillColor=10,
                rgbfillColor={135,135,135})),
            Polygon(points=[-84,-18; -84,58; -86,50; -82,50; -84,58; -84,-18],
                        style(
                color=10,
                rgbcolor={135,135,135},
                fillColor=10,
                rgbfillColor={135,135,135})),
            Polygon(points=[-52,-24; -22,-36; -30,-30; -32,-34; -22,-36; -52,
                  -24], style(
                color=10,
                rgbcolor={135,135,135},
                fillColor=10,
                rgbfillColor={135,135,135})),
            Polygon(points=[-52,60; -52,8; -50,14; -54,14; -52,8; -52,60],       style(
                color=10,
                rgbcolor={135,135,135},
                fillColor=10,
                rgbfillColor={135,135,135},
                fillPattern=1)),
            Text(
              extent=[-100,-100; 100,-68],
              style(
                color=10,
                rgbcolor={135,135,135},
                fillPattern=1),
              string="%name"),
            Text(
              extent=[-52,10; -52,-26],
              style(
                color=10,
                rgbcolor={135,135,135},
                fillColor=10,
                rgbfillColor={135,135,135}),
              string="F,T")),
          Diagram(                      Rectangle(extent=[-100,60; 100,100],
                style(
                color=51,
                rgbcolor={255,255,170},
                fillColor=51,
                rgbfillColor={255,255,170}))),
          Coordsys(extent=[-100,-100; 100,100], scale=0.1),
          Documentation(info="<html>

The contact physics base features the variable definitions and the connections to the tire bus as well as the contact point connector.

</html>"));

      protected
        Communication.UnitVectorInput UV
          annotation (extent=[-66,72; -54,84],
                                             rotation=270);
        inner MultiBondLib.Interfaces.RealSignal fLong
          annotation (extent=[8,54; 20,66]);
        inner MultiBondLib.Interfaces.RealSignal fLat
          annotation (extent=[20,54; 32,66]);
        inner MultiBondLib.Interfaces.RealSignal fN
          annotation (extent=[32,54; 44,66]);
        inner MultiBondLib.Interfaces.RealSignal tN
          annotation (extent=[32,86; 44,98]);
        inner MultiBondLib.Interfaces.RealSignal tLat
          annotation (extent=[20,86; 32,98]);
        inner MultiBondLib.Interfaces.RealSignal tLong
          annotation (extent=[8,86; 20,98]);
        inner MultiBondLib.Interfaces.RealSignal vLong
          annotation (extent=[8,70; 20,82]);
        inner MultiBondLib.Interfaces.RealSignal vLat
          annotation (extent=[20,70; 32,82]);
        inner MultiBondLib.Interfaces.RealSignal vN
          annotation (extent=[32,70; 44,82]);
        inner MultiBondLib.Interfaces.RealSignal eLat[3]
          annotation (extent=[-38,52; -22,68], rotation=270);
        inner MultiBondLib.Interfaces.RealSignal eLong[3]
          annotation (extent=[-58,52; -42,68],   rotation=270);
        MultiBondLib.Interfaces.RealSignal eN[3]
          annotation (extent=[-98,52; -82,68],     rotation=270);
        MultiBondLib.Interfaces.RealSignal eAxis[3]
          annotation (extent=[-78,52; -62,68],   rotation=270);

      // visualization
      WheelsAndTires.Visualization.Arrow normalForce(
          each r=FlangePos-(fN*eN)/forceScaling,
          each r_tail=zeros(3),
          each r_head=(fN*eN)/forceScaling,
          each diameter=arrowDiameter,
          each color=arrowColor,
          each specularCoefficient = 0,
          each R=MB.Frames.Orientation(T=identity(3),w=zeros(3))) if visForcesEnabled and world3D.enableAnimation;

      WheelsAndTires.Visualization.Arrow lateralForce(
          each r=FlangePos-(fLat*eLat)/forceScaling,
          each r_tail=zeros(3),
          each r_head=(fLat*eLat)/forceScaling,
          each diameter=arrowDiameter,
          each color=arrowColor,
          each specularCoefficient = 0,
          each R=MB.Frames.Orientation(T=identity(3),w=zeros(3))) if visForcesEnabled and world3D.enableAnimation;

      WheelsAndTires.Visualization.Arrow longitudinalForce(
          each r=FlangePos-(fLong*eLong)/forceScaling,
          each r_tail=zeros(3),
          each r_head=(fLong*eLong)/forceScaling,
          each diameter=arrowDiameter,
          each color=arrowColor,
          each specularCoefficient = 0,
          each R=MB.Frames.Orientation(T=identity(3),w=zeros(3))) if visForcesEnabled and world3D.enableAnimation;

        inner MultiBondLib.Defaults MBG_defaults(n=3)
                                         annotation (extent=[80,80; 100,100]);
      equation
        connect(UV, tireBus.UV) annotation (points=[-60,78; -60,92], style(
            color=58,
            rgbcolor={0,127,0},
            pattern=0,
            fillColor=51,
            rgbfillColor={255,255,170},
            fillPattern=1));
        connect(eLat[:], UV.eLat[:]) annotation (points=[-30,54.6667; -30,70;
              -60,70; -60,78], style(
            color=3,
            rgbcolor={0,0,255},
            pattern=0,
            fillColor=51,
            rgbfillColor={255,255,170},
            fillPattern=1));
        connect(eLong[:], UV.eLong[:]) annotation (points=[-50,60; -50,70; -60,
              70; -60,74], style(
            color=3,
            rgbcolor={0,0,255},
            pattern=0,
            fillColor=51,
            rgbfillColor={255,255,170},
            fillPattern=1));
        connect(eAxis[:], UV.eAxis[:]) annotation (points=[-70,60; -70,70; -60,
              70], style(
            color=3,
            rgbcolor={0,0,255},
            pattern=0,
            fillColor=51,
            rgbfillColor={255,255,170},
            fillPattern=1));
        connect(eN[:], UV.eN[:]) annotation (points=[-90,60; -90,70; -60,70;
              -60,76], style(
            color=3,
            rgbcolor={0,0,255},
            pattern=0,
            fillColor=51,
            rgbfillColor={255,255,170},
            fillPattern=1));
        connect(vLat, Friction.vLat) annotation (points=[26,76; 26,84; 60,84;
              60,100], style(
            color=3,
            rgbcolor={0,0,255},
            pattern=0,
            fillColor=51,
            rgbfillColor={255,255,170},
            fillPattern=1));
        connect(vLong, Friction.vLong) annotation (points=[14,76; 14,86; 60,86;
              60,100],
                    style(
            color=3,
            rgbcolor={0,0,255},
            pattern=0,
            fillColor=51,
            rgbfillColor={255,255,170},
            fillPattern=1));
        connect(fLong, Friction.fLong) annotation (points=[14,60; 14,70; 60,70;
              60,100], style(
            color=3,
            rgbcolor={0,0,255},
            pattern=0,
            fillColor=51,
            rgbfillColor={255,255,170},
            fillPattern=1));
        connect(fLat, Friction.fLat) annotation (points=[26,60; 26,68; 60,68;
              60,100], style(
            color=3,
            rgbcolor={0,0,255},
            pattern=0,
            fillColor=51,
            rgbfillColor={255,255,170},
            fillPattern=1));
        connect(fN, Friction.fN) annotation (points=[38,60; 38,66; 60,66; 60,
              100], style(
            color=3,
            rgbcolor={0,0,255},
            pattern=0,
            fillColor=51,
            rgbfillColor={255,255,170},
            fillPattern=1));
        connect(vN, Friction.vN) annotation (points=[38,76; 38,82; 60,82; 60,
              100],                                                 style(
            color=3,
            rgbcolor={0,0,255},
            pattern=0,
            fillColor=51,
            rgbfillColor={255,255,170},
            fillPattern=1));
        connect(tLong, Friction.tLong) annotation (points=[14,92; 14,100; 60,
              100],    style(
            color=3,
            rgbcolor={0,0,255},
            pattern=0,
            fillColor=51,
            rgbfillColor={255,255,170},
            fillPattern=1));
        connect(tLat, Friction.tLat) annotation (points=[26,92; 26,98; 60,98;
              60,100],style(
            color=3,
            rgbcolor={0,0,255},
            pattern=0,
            fillColor=51,
            rgbfillColor={255,255,170},
            fillPattern=1));
        connect(tN, Friction.tN) annotation (points=[38,92; 50,92; 50,100; 60,
              100],
            style(
            color=3,
            rgbcolor={0,0,255},
            pattern=0,
            fillColor=51,
            rgbfillColor={255,255,170},
            fillPattern=1));
      end ContactPhysicsBase;

      model ContactBondNoDynamics
        "The model that measures contact points velocities and applies forces and torques to the contact point, based on Multi-Bond-Graph technique."

        extends WheelsAndTires.TireComponents.ContactPhysics.ContactPhysicsBase;
        import MultiBondLib;
        import SI = Modelica.SIunits;

      public
        SI.Velocity v_Long = vLong
          "Velocity of the contact point in longitudinal direction";
        SI.Velocity v_Lat = vLat
          "Velocity of the contact point in lateral direction";
        SI.Velocity v_N = vN
          "Velocity of the contact point normal to the surface";
        SI.Force f_Long = fLong
          "Longitudinal force acting at the contact point";
        SI.Force f_Lat = fLat "Lateral force acting at the contact point";
        SI.Force f_N = fN "Normal force acting at the contact point";
        SI.Torque t_Long = tLong
          "Torque acting around the longitudinal axis at the contact point";
        SI.Torque t_Lat = tLat
          "Torque acting around the lateral axis at the contact point";
        SI.Torque t_N = tN
          "Torque acting around the axis normal to the surface at the contact point";
        Real R[3,3];

      protected
        MultiBondLib.Junctions.J1 J0_1
                          annotation (extent=[-38,-20; -18,0]);
        MultiBondLib.Bonds.MultiBond MultiBond2
                                   annotation (extent=[22,-20; 42,0]);
        MultiBondLib.Bonds.MultiBond MultiBond5
                                   annotation (extent=[22,-80; 42,-60], rotation=0);
        MultiBondLib.Bonds.MultiBond MultiBond4
                                    annotation (extent=[-58,-20; -38,0],   rotation=0);
        MultiBondLib.Sources.mSe fSource
          annotation (extent=[-78,-20; -58,0], rotation=180);
        MultiBondLib.Passive.mTF_effort mTF
          annotation (extent=[2,0; 22,-20],    rotation=180);
        MultiBondLib.Sensors.Df vSens
          annotation (extent=[-38,-60; -18,-40],
                                               rotation=270);
        MultiBondLib.Bonds.MultiBond MultiBond1
                                    annotation (extent=[-38,-40; -18,-20], rotation=270);
        MultiBondLib.Sources.mSe tSource
          annotation (extent=[2,-80; 22,-60],  rotation=180);
        MultiBondLib.Bonds.MultiBond MultiBond8
                                   annotation (extent=[-18,-20; 2,0]);

        WheelsAndTires.TireComponents.ContactPhysics.ContactPointDynamics.CPNoDynamics
          cPNoDynamics                        annotation (extent=[72,-48; 88,
              -32]);

      public
        MultiBondLib.Mechanics3D.Interfaces.MBG2Mech MBG2Mech1
                                      annotation (extent=[42,-80; 62,0]);

      equation
      //defineRoot(frame_b);

        mTF.M = R;
        MBG2Mech1.R = R;

        vSens.f[1] = vLong;
        vSens.f[2] = vN;
        vSens.f[3] = vLat;

        fSource.e[1] = fLong;
        fSource.e[2] = fN;
        fSource.e[3] = fLat;

        tSource.e[1] = tLong;
        tSource.e[2] = tN;
        tSource.e[3] = tLat;

        R = transpose([eLong, eN, eLat]);

        annotation (Diagram(
            Text(
              extent=[-66,-56; -50,-66],
              style(
                color=10,
                rgbcolor={135,135,135},
                fillColor=85,
                rgbfillColor={255,0,128},
                fillPattern=1),
              string="v[3]"),
            Text(
              extent=[4,30; 20,20],
              style(
                color=10,
                rgbcolor={135,135,135},
                fillColor=85,
                rgbfillColor={255,0,128},
                fillPattern=1),
              string="F[3]"),
            Text(
              extent=[-46,-70; -30,-80],
              style(
                color=10,
                rgbcolor={135,135,135},
                fillColor=85,
                rgbfillColor={255,0,128},
                fillPattern=1),
              string="T[3]"),
            Rectangle(extent=[4,-58; 20,-42],
                                            style(
                color=10,
                rgbcolor={135,135,135},
                fillColor=7,
                rgbfillColor={255,255,255},
                fillPattern=1)),
            Text(
              extent=[8,-54; 16,-46],
              style(
                color=10,
                rgbcolor={135,135,135},
                fillColor=7,
                rgbfillColor={255,255,255},
                fillPattern=1),
              string="e2R"),
            Line(points=[12,-24; 12,-42], style(
                color=10,
                rgbcolor={135,135,135},
                arrow=2,
                fillColor=10,
                rgbfillColor={135,135,135})),
            Line(points=[-80,-10; -86,-10; -86,2; 4,2; 4,60; 8,60], style(color=
                   10, rgbcolor={135,135,135})),
            Line(points=[-28,-62; -28,-66; -90,-66; -90,6; 0,6; 0,76; 8,76],
                style(color=10, rgbcolor={135,135,135})),
            Line(points=[0,-70; -94,-70; -94,10; -4,10; -4,92; 6,92], style(
                  color=10, rgbcolor={135,135,135})),
            Line(points=[38,-50; 20,-50], style(
                color=10,
                rgbcolor={135,135,135},
                arrow=2,
                fillColor=10,
                rgbfillColor={135,135,135}))),
                            Icon(
            Bitmap(extent=[-22,48; 22,-44], name="images/CPDynamics.png"),
            Polygon(points=[0,78; -4,62; 4,62; 0,78], style(
                color=10,
                rgbcolor={135,135,135},
                fillColor=10,
                rgbfillColor={135,135,135})),
            Polygon(points=[40,2; 50,6; 46,-2; 40,2], style(
                color=10,
                rgbcolor={135,135,135},
                fillColor=10,
                rgbfillColor={135,135,135})),
            Line(points=[0,-38; 0,64], style(
                color=10,
                rgbcolor={135,135,135},
                fillColor=10,
                rgbfillColor={135,135,135})),
            Line(points=[0,-38; 80,-38], style(
                color=10,
                rgbcolor={135,135,135},
                fillColor=10,
                rgbfillColor={135,135,135})),
            Line(points=[0,-38; 44,0], style(
                color=10,
                rgbcolor={135,135,135},
                fillColor=10,
                rgbfillColor={135,135,135})),
            Ellipse(extent=[-4,-34; 4,-42], style(
                pattern=0,
                gradient=3,
                fillColor=1,
                rgbfillColor={255,0,0})),
            Polygon(points=[72,-34; 72,-42; 86,-38; 72,-34], style(
                color=10,
                rgbcolor={135,135,135},
                fillColor=10,
                rgbfillColor={135,135,135})),
            Line(points=[16,66; 74,66; 52,88; 62,78; 16,78],      style(
                color=3,
                rgbcolor={0,0,255},
                fillColor=7,
                rgbfillColor={255,255,255}))),
          Documentation(info="<html>

The <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">mSe</span></span></span> elements <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">fSource</span></span></span> and <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">tSource</span></span></span> act as sources of force or torque respectively. The <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">Df</span></span></span>

element <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">vSens</span></span></span> measures the speed of the contact point in three dimensions. What is
important to now is, that these bond graphic elements are acausal. This means that e.g.&nbsp;a
velocity sensor can apply a velocity to the bond as well as measure one. The main
difference between the two items is that the sensor contains more equations that
set the not measured quantity (in the actual case of the <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">Df</span></span></span> element the effort) to
zero.
</html>"));
        connect(MultiBond2.MultiBondCon2, MBG2Mech1.MultiBondConTrans)
          annotation (points=[42,-10; 42,-10], style(
            color=71,
            rgbcolor={85,170,255},
            fillColor=85,
            rgbfillColor={255,0,128},
            fillPattern=1));
        connect(MBG2Mech1.MultiBondConRot, MultiBond5.MultiBondCon2)
          annotation (points=[42,-70; 42,-70],   style(color=71, rgbcolor={85,
                170,255}));
        connect(J0_1.MultiBondCon1, MultiBond4.MultiBondCon2) annotation (
            points=[-38,-10; -38,-10],
                                   style(color=71, rgbcolor={85,170,255}));
        connect(fSource.MultiBondCon1, MultiBond4.MultiBondCon1) annotation (
            points=[-58,-10; -58,-10],
                                     style(color=71, rgbcolor={85,170,255}));
        connect(vSens.MultiBondCon1, MultiBond1.MultiBondCon2)
          annotation (points=[-28,-40; -28,-40],
                                             style(color=71, rgbcolor={85,170,
                255}));
        connect(J0_1.MultiBondCon2, MultiBond8.MultiBondCon1) annotation (
            points=[-18,-10; -18,-10],
                                   style(color=71, rgbcolor={85,170,255}));
        connect(tSource.MultiBondCon1, MultiBond5.MultiBondCon1)
                                                                annotation (points=[22,-70;
              22,-70], style(color=71, rgbcolor={85,170,255}));
        connect(MultiBond8.MultiBondCon2, mTF.MultiBondCon2)
          annotation (points=[2,-10; 2,-10; 2,-10; 2,-10],
                                             style(color=71, rgbcolor={85,170,255}));
        connect(MultiBond2.MultiBondCon1, mTF.MultiBondCon1)
          annotation (points=[22,-10; 22,-10],
                                             style(color=71, rgbcolor={85,170,255}));
        connect(J0_1.MultiBondCon3, MultiBond1.MultiBondCon1) annotation (points=[-28,-20;
              -28,-20],
                   style(color=71, rgbcolor={85,170,255}));
        connect(MBG2Mech1.frame_b, cPNoDynamics.frame_b) annotation (points=[61,-40;
              71.2,-40],  style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(cPNoDynamics.frame_a, frame_b) annotation (points=[88.8,-40; 92,-40;
              92,0; 110,0],
                  style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));

      end ContactBondNoDynamics;

      model ContactBondWithDynamics
        "The model that measures contact points velocities and applies forces and torques to the contact point, based on Multi-Bond-Graph technique."

        extends WheelsAndTires.TireComponents.ContactPhysics.ContactPhysicsBase;
        import MultiBondLib;
        import SI = Modelica.SIunits;

        parameter Real cLong(
          final unit="N/m",
          final min=0) = 1e5
          "Longitudinal stiffness of the contact point dynamics";
        parameter Real dLong(
          final unit="N/ (m/s)",
          final min=0) = 1e4
          "Longitudinal damping constant of the contact point dynamics";
        parameter Real cLat(
          final unit="N/m",
          final min=0) = 1e5 "Lateral stiffness of the contact point dynamics";
        parameter Real dLat(
          final unit="N/ (m/s)",
          final min=0) = 1e4
          "Lateral damping constant of the contact point dynamics";
        parameter SI.Mass BeltMass = 5 "Mass of the contact point";
        parameter Boolean visCPDynamics = false
          "Show the prismatic elements that realize the dynamic behaviour";

      public
        SI.Velocity v_Long = vLong
          "Velocity of the contact point in longitudinal direction";
        SI.Velocity v_Lat = vLat
          "Velocity of the contact point in lateral direction";
        SI.Velocity v_N = vN
          "Velocity of the contact point normal to the surface";
        SI.Force f_Long = fLong
          "Longitudinal force acting at the contact point";
        SI.Force f_Lat = fLat "Lateral force acting at the contact point";
        SI.Force f_N = fN "Normal force acting at the contact point";
        SI.Torque t_Long = tLong
          "Torque acting around the longitudinal axis at the contact point";
        SI.Torque t_Lat = tLat
          "Torque acting around the lateral axis at the contact point";
        SI.Torque t_N = tN
          "Torque acting around the axis normal to the surface at the contact point";
        Real R[3,3];

      protected
        outer WheelsAndTires.Environment.Surface Surface;
        MultiBondLib.Junctions.J1 J0_1
                          annotation (extent=[-38,-20; -18,0]);
        MultiBondLib.Bonds.MultiBond MultiBond2
                                   annotation (extent=[22,-20; 42,0]);
        MultiBondLib.Bonds.MultiBond MultiBond5
                                   annotation (extent=[22,-80; 42,-60], rotation=0);
        MultiBondLib.Bonds.MultiBond MultiBond4
                                    annotation (extent=[-58,-20; -38,0],   rotation=0);
        MultiBondLib.Sources.mSe fSource
          annotation (extent=[-78,-20; -58,0], rotation=180);
        MultiBondLib.Passive.mTF_effort mTF
          annotation (extent=[2,0; 22,-20],    rotation=180);
        MultiBondLib.Sensors.Df vSens
          annotation (extent=[-38,-60; -18,-40],
                                               rotation=270);
        MultiBondLib.Bonds.MultiBond MultiBond1
                                    annotation (extent=[-38,-40; -18,-20], rotation=270);
        MultiBondLib.Sources.mSe tSource
          annotation (extent=[2,-80; 22,-60],  rotation=180);
        MultiBondLib.Bonds.MultiBond MultiBond8
                                   annotation (extent=[-18,-20; 2,0]);

        ContactPointDynamics.CP2ndOrder cPNoDynamics(
          cLong=cLong,
          dLong=dLong,
          cLat=cLat,
          dLat=dLat,
          BeltMass=BeltMass,
          visCPDynamics=visCPDynamics)        annotation (extent=[72,-48; 88,
              -32]);

      public
        MultiBondLib.Mechanics3D.Interfaces.MBG2Mech MBG2Mech1
                                      annotation (extent=[42,-80; 62,0]);

      equation
      //defineRoot(frame_b);

        assert(Surface.FlatSurface == true,
          "the 'ContactBondWithDynamics'  model just works with Flat Surfaces (Surface.FlatSurface == true). Please change the parameter of the used surface");

        mTF.M = R;
        MBG2Mech1.R = R;

        vSens.f[1] = vLong;
        vSens.f[2] = vN;
        vSens.f[3] = vLat;

        fSource.e[1] = fLong;
        fSource.e[2] = fN;
        fSource.e[3] = fLat;

        tSource.e[1] = tLong;
        tSource.e[2] = tN;
        tSource.e[3] = tLat;

        R = transpose([eLong, eN, eLat]);

        annotation (Diagram(
            Text(
              extent=[-66,-56; -50,-66],
              style(
                color=10,
                rgbcolor={135,135,135},
                fillColor=85,
                rgbfillColor={255,0,128},
                fillPattern=1),
              string="v[3]"),
            Text(
              extent=[4,30; 20,20],
              style(
                color=10,
                rgbcolor={135,135,135},
                fillColor=85,
                rgbfillColor={255,0,128},
                fillPattern=1),
              string="F[3]"),
            Text(
              extent=[-46,-70; -30,-80],
              style(
                color=10,
                rgbcolor={135,135,135},
                fillColor=85,
                rgbfillColor={255,0,128},
                fillPattern=1),
              string="T[3]"),
            Rectangle(extent=[4,-58; 20,-42],
                                            style(
                color=10,
                rgbcolor={135,135,135},
                fillColor=7,
                rgbfillColor={255,255,255},
                fillPattern=1)),
            Text(
              extent=[8,-54; 16,-46],
              style(
                color=10,
                rgbcolor={135,135,135},
                fillColor=7,
                rgbfillColor={255,255,255},
                fillPattern=1),
              string="e2R"),
            Line(points=[12,-24; 12,-42], style(
                color=10,
                rgbcolor={135,135,135},
                arrow=2,
                fillColor=10,
                rgbfillColor={135,135,135})),
            Line(points=[-80,-10; -86,-10; -86,2; 4,2; 4,60; 8,60], style(color=
                   10, rgbcolor={135,135,135})),
            Line(points=[-28,-62; -28,-66; -90,-66; -90,6; 0,6; 0,76; 8,76],
                style(color=10, rgbcolor={135,135,135})),
            Line(points=[0,-70; -94,-70; -94,10; -4,10; -4,92; 6,92], style(
                  color=10, rgbcolor={135,135,135})),
            Line(points=[38,-50; 20,-50], style(
                color=10,
                rgbcolor={135,135,135},
                arrow=2,
                fillColor=10,
                rgbfillColor={135,135,135}))),
                            Icon(
            Bitmap(extent=[28,62; 72,-30],  name="images/CPDynamics.png",
              style(color=0, rgbcolor={0,0,0})),
            Polygon(points=[0,78; -4,62; 4,62; 0,78], style(
                color=10,
                rgbcolor={135,135,135},
                fillColor=10,
                rgbfillColor={135,135,135})),
            Polygon(points=[40,2; 50,6; 46,-2; 40,2], style(
                color=10,
                rgbcolor={135,135,135},
                fillColor=10,
                rgbfillColor={135,135,135})),
            Line(points=[0,-38; 0,64], style(
                color=10,
                rgbcolor={135,135,135},
                fillColor=10,
                rgbfillColor={135,135,135})),
            Line(points=[0,-38; 80,-38], style(
                color=10,
                rgbcolor={135,135,135},
                fillColor=10,
                rgbfillColor={135,135,135})),
            Line(points=[0,-38; 44,0], style(
                color=10,
                rgbcolor={135,135,135},
                fillColor=10,
                rgbfillColor={135,135,135})),
            Ellipse(extent=[-4,-34; 4,-42], style(
                pattern=0,
                gradient=3,
                fillColor=1,
                rgbfillColor={255,0,0})),
            Polygon(points=[72,-34; 72,-42; 86,-38; 72,-34], style(
                color=10,
                rgbcolor={135,135,135},
                fillColor=10,
                rgbfillColor={135,135,135})),
            Line(points=[16,66; 74,66; 52,88; 62,78; 16,78],      style(
                color=3,
                rgbcolor={0,0,255},
                fillColor=7,
                rgbfillColor={255,255,255})),
            Line(points=[0,-38; 8,-38; 10,-32; 12,-42; 14,-32; 16,-42; 18,-32;
                  20,-42; 22,-32; 24,-42; 26,-32; 28,-42; 30,-32; 32,-38; 36,
                  -38; 38,-36; 34,-34; 44,-34; 38,-30; 50,-30; 42,-26; 48,-26;
                  50,-24], style(color=0, rgbcolor={0,0,0}))),
          Documentation(info="<html>

The only difference between the <span class=\"cmti-10x-x-109\">contact bond with dynamics </span>and the one without
is the model for the contact point dynamics. In this model, the rigid connection
from <span class=\"cmti-10x-x-109\">Contact Bond No Dynamics </span>is replaced by the <i>CP2ndOrder</i> model.


<p>
This models does not work when an uneven surfaces are used which's function computing the elevation is not derivable analytically.
</p>

</html>"));
        connect(MultiBond2.MultiBondCon2, MBG2Mech1.MultiBondConTrans)
          annotation (points=[42,-10; 42,-10], style(
            color=71,
            rgbcolor={85,170,255},
            fillColor=85,
            rgbfillColor={255,0,128},
            fillPattern=1));
        connect(MBG2Mech1.MultiBondConRot, MultiBond5.MultiBondCon2)
          annotation (points=[42,-70; 42,-70],   style(color=71, rgbcolor={85,
                170,255}));
        connect(J0_1.MultiBondCon1, MultiBond4.MultiBondCon2) annotation (
            points=[-38,-10; -38,-10],
                                   style(color=71, rgbcolor={85,170,255}));
        connect(fSource.MultiBondCon1, MultiBond4.MultiBondCon1) annotation (
            points=[-58,-10; -58,-10],
                                     style(color=71, rgbcolor={85,170,255}));
        connect(vSens.MultiBondCon1, MultiBond1.MultiBondCon2)
          annotation (points=[-28,-40; -28,-40],
                                             style(color=71, rgbcolor={85,170,
                255}));
        connect(J0_1.MultiBondCon2, MultiBond8.MultiBondCon1) annotation (
            points=[-18,-10; -18,-10],
                                   style(color=71, rgbcolor={85,170,255}));
        connect(tSource.MultiBondCon1, MultiBond5.MultiBondCon1)
                                                                annotation (points=[22,-70;
              22,-70], style(color=71, rgbcolor={85,170,255}));
        connect(MultiBond8.MultiBondCon2, mTF.MultiBondCon2)
          annotation (points=[2,-10; 2,-10; 2,-10; 2,-10],
                                             style(color=71, rgbcolor={85,170,255}));
        connect(MultiBond2.MultiBondCon1, mTF.MultiBondCon1)
          annotation (points=[22,-10; 22,-10],
                                             style(color=71, rgbcolor={85,170,255}));
        connect(J0_1.MultiBondCon3, MultiBond1.MultiBondCon1) annotation (points=[-28,-20;
              -28,-20],
                   style(color=71, rgbcolor={85,170,255}));
        connect(MBG2Mech1.frame_b, cPNoDynamics.frame_b) annotation (points=[61,-40;
              71.2,-40],  style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(cPNoDynamics.frame_a, frame_b) annotation (points=[88.8,-40; 92,-40;
              92,0; 110,0],
                  style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));

      end ContactBondWithDynamics;
      annotation (Icon, Documentation(info="<html>

The <span class=\"cmti-10x-x-109\">Contact Physics </span>model applies forces and torques on the contact point, as well as
measuring its velocities. All these physical quantities get transferred via the <span class=\"cmti-10x-x-109\">Contact Point</span>
<span class=\"cmti-10x-x-109\">Connector </span>to the models determining friction and vertical dynamic properties. Measuring
and setting of speeds and forces has to be done in an acasual way as ideal models set
velocities rather then applying forces.
<!--l. 6--></p><p class=\"noindent\">The second thing determined by the <span class=\"cmti-10x-x-109\">Contact Physics </span>class is the dynamic behavior of the
contact point. Some models developed <span class=\"cite\">[<a href=\"Modelica://WheelsAndTires.UsersGuide.Literature\">Pac06</a>]</span> introduce a flexibility of the contact point in
longitudinal and lateral direction. Two different models are implemented, both described in
the following sections.

<!--l. 8--></p>

</html>"));

      package ContactPointDynamics
        "can enable a flexibility of the contact point."
        annotation(preferedView="info");

      extends
          WheelsAndTires.TireComponents.Utilities.Icons.TireComponentsPackage;

        partial model CPDynamicsBase
          "partial base model that is extended by the Contact Point Dynamics classes."
          import MultiBondLib;
          MultiBondLib.Mechanics3D.Interfaces.Frame_b frame_a
            "connect to the input of the contact physics model."
            annotation (extent=[100,-10; 120,10]);
          MultiBondLib.Mechanics3D.Interfaces.Frame_a frame_b
            "connect to the frame that is getting split up into multi bond elements."
            annotation (extent=[-120,-10; -100,10]);
          annotation (Diagram, Icon(
                 Rectangle(extent=[-100,-100; 100,100], style(
                  color=74,
                  rgbcolor={0,0,127},
                  fillColor=7,
                  rgbfillColor={255,255,255})),
              Text(
                extent=[-100,-90; 100,-58],
                style(
                  color=10,
                  rgbcolor={135,135,135},
                  fillPattern=1),
                string="%name")),
            Documentation(info="<html>

Base model for the Contact Point Dynamics.

</html>"));
        end CPDynamicsBase;

        model CPNoDynamics "models a stiff contact point."
          extends
            WheelsAndTires.TireComponents.ContactPhysics.ContactPointDynamics.CPDynamicsBase;
        equation

          annotation (Icon(Line(points=[-98,0; 98,0], style(color=74, rgbcolor=
                      {0,0,127}))),        Diagram,
            Documentation(info="<html>

Rigid model for the contact point dynamics.

</html>"));
          connect(frame_b, frame_a) annotation (points=[-110,0; -55,0; -55,
                1.11022e-015; 0,1.11022e-015; 0,0; 110,0],              style(
              color=0,
              rgbcolor={0,0,0},
              thickness=2,
              fillColor=0,
              rgbfillColor={0,0,0},
              fillPattern=1));
        end CPNoDynamics;

        model CP2ndOrder
          "models a contact point with flexiblity in longitudinal and lateral direction."

          import SI = Modelica.SIunits;

          extends
            WheelsAndTires.TireComponents.ContactPhysics.ContactPointDynamics.CPDynamicsBase;

          parameter Real cLong(
            final unit="N/m",
            final min=0) = 1e5
            "Longitudinal stiffness of the contact point dynamics";
          parameter Real dLong(
            final unit="N/ (m/s)",
            final min=0) = 1e4
            "Longitudinal damping constant of the contact point dynamics";
          parameter Real cLat(
            final unit="N/m",
            final min=0) = 1e5
            "Lateral stiffness of the contact point dynamics";
          parameter Real dLat(
            final unit="N/ (m/s)",
            final min=0) = 1e4
            "Lateral damping constant of the contact point dynamics";
          parameter SI.Mass BeltMass = 5 "Mass of the contact point";
          parameter Boolean visCPDynamics = false
            "Show the prismatic elements that realize the dynamic behaviour";

          BondLib.Mechanical.Translational.Passive.SpringDamper LongDynamics(c=cLong, d=
               dLong)
            annotation (extent=[40,-38; 60,-18], rotation=180);
          WheelsAndTires.TireComponents.Utilities.AddititionalMBG.modulatedActuatedPrismatic
            modulatedActuatedPrismaticLong
            annotation (extent=[40,-10; 60,10], rotation=180);
          BondLib.Mechanical.Translational.Passive.SpringDamper LatDynamics(c=cLat, d=
                dLat)
            annotation (extent=[-20,50; 0,70], rotation=90);
          WheelsAndTires.TireComponents.Utilities.AddititionalMBG.modulatedActuatedPrismatic
            modulatedActuatedPrismaticLat(                                   animation=
                visCPDynamics)
            annotation (extent=[10,50; 30,70], rotation=90);
          annotation (Icon(
              Line(points=[100,0; 58,0; 58,-26; 44,-26], style(
                  color=0,
                  rgbcolor={0,0,0},
                  fillColor=0,
                  rgbfillColor={0,0,0},
                  fillPattern=1)),
              Ellipse(extent=[38,-22; 46,-30], style(
                  color=0,
                  rgbcolor={0,0,0},
                  fillColor=0,
                  rgbfillColor={0,0,0},
                  fillPattern=1)),
              Ellipse(extent=[-38,-22; -30,-30], style(
                  color=0,
                  rgbcolor={0,0,0},
                  fillColor=0,
                  rgbfillColor={0,0,0},
                  fillPattern=1)),
              Line(points=[44,-26; 32,-26; 32,-42; 24,-42; 22,-34; 16,-50; 10,
                    -34; 4,-50; -2,-34; -6,-50; -12,-34; -14,-42; -22,-42;
                    -22,-26; -34,-26], style(
                  color=0,
                  rgbcolor={0,0,0},
                  fillColor=0,
                  rgbfillColor={0,0,0},
                  fillPattern=1)),
              Line(points=[40,-26; 32,-26; 32,-12; 4,-12], style(
                  color=0,
                  rgbcolor={0,0,0},
                  fillColor=0,
                  rgbfillColor={0,0,0},
                  fillPattern=1)),
              Line(points=[-34,-26; -22,-26; -22,-12; -2,-12; -2,-4; 10,-4;
                    -2,-4; -2,-20; 10,-20], style(
                  color=0,
                  rgbcolor={0,0,0},
                  fillColor=0,
                  rgbfillColor={0,0,0},
                  fillPattern=1)),
              Line(points=[2,90; 2,84; 20,84; 20,64; 28,64; 28,50; 28,64; 12,
                    64; 12,50], style(
                  color=0,
                  rgbcolor={0,0,0},
                  fillColor=0,
                  rgbfillColor={0,0,0},
                  fillPattern=1)),
              Line(points=[2,14; 2,26; -14,26; -14,38; -6,42; -24,46; -6,52;
                    -24,58; -6,62; -24,68; -6,72; -14,76; -14,84; 2,84; 2,90],
                  style(
                  color=0,
                  rgbcolor={0,0,0},
                  fillColor=0,
                  rgbfillColor={0,0,0},
                  fillPattern=1)),
              Line(points=[2,14; 2,26; 20,26; 20,56], style(
                  color=0,
                  rgbcolor={0,0,0},
                  fillColor=0,
                  rgbfillColor={0,0,0},
                  fillPattern=1)),
              Ellipse(extent=[-2,18; 6,10], style(
                  color=0,
                  rgbcolor={0,0,0},
                  fillColor=0,
                  rgbfillColor={0,0,0},
                  fillPattern=1)),
              Ellipse(extent=[-2,96; 6,88], style(
                  color=0,
                  rgbcolor={0,0,0},
                  fillColor=0,
                  rgbfillColor={0,0,0},
                  fillPattern=1)),
              Line(points=[-36,-26; -52,-26; -52,14; -4,14; 0,14], style(
                  color=0,
                  rgbcolor={0,0,0},
                  fillColor=0,
                  rgbfillColor={0,0,0},
                  fillPattern=1)),
              Line(points=[4,92; -76,92; -76,0; -100,0], style(
                  color=0,
                  rgbcolor={0,0,0},
                  fillColor=0,
                  rgbfillColor={0,0,0},
                  fillPattern=1))), Diagram,
            Documentation(info="<html>

The <span class=\"cmti-10x-x-109\">contact point second order </span>model features two <span class=\"cmti-10x-x-109\">modulated actuated prismatic </span>elements
that apply forces computed by the connected spring damper elements. The modulated
actuated prismatic elements are different to the usual prismatic elements as their direction of
operation is determined by a vector that is an input to the model.  The main purpose of these
elements is to ensure that the dynamics point to the lateral and longitudinal direction
regardless of what happens during initialization or with dynamic elements in the <span class=\"cmti-10x-x-109\">Belt</span>
<span class=\"cmti-10x-x-109\">Dynamics</span>.


</html>"));
        protected
          outer MultiBondLib.Interfaces.RealSignal eLat[3]
            annotation (extent=[42,52; 58,68],   rotation=270);
          outer MultiBondLib.Interfaces.RealSignal eLong[3]
            annotation (extent=[42,22; 58,38],     rotation=270);

        public
          MultiBondLib.Mechanics3D.Parts.Body body(
            animation=false,
            m=BeltMass,
            I_11=0,
            I_22=0,
            I_33=0) annotation (extent=[-90,40; -70,60], rotation=90);
        initial equation
          modulatedActuatedPrismaticLong.s = 0;
          modulatedActuatedPrismaticLat.s = 0;
          modulatedActuatedPrismaticLong.v = 0;
          modulatedActuatedPrismaticLat.v = 0;

        equation
          connect(modulatedActuatedPrismaticLong.frame_a, frame_a)
                                                       annotation (points=[61,
                -1.34707e-015; 82.5,-1.34707e-015; 82.5,0; 110,0], style(
              color=0,
              rgbcolor={0,0,0},
              thickness=2,
              fillColor=0,
              rgbfillColor={0,0,0},
              fillPattern=1));
          connect(modulatedActuatedPrismaticLong.axis, LongDynamics.flange_b)
                                                                  annotation (
             points=[43,-7; 43,-14; 40.1,-14; 40.1,-28], style(
              color=58,
              rgbcolor={0,127,0},
              fillColor=0,
              rgbfillColor={0,0,0},
              fillPattern=1));
          connect(LongDynamics.flange_a, modulatedActuatedPrismaticLong.bearing)
            annotation (points=[60,-28; 60,-14; 56,-14; 56,-7], style(
              color=58,
              rgbcolor={0,127,0},
              fillColor=0,
              rgbfillColor={0,0,0},
              fillPattern=1));
          connect(LatDynamics.flange_b, modulatedActuatedPrismaticLat.axis)
                                                                  annotation (
             points=[-10,69.9; 6,69.9; 6,67; 13,67], style(color=58, rgbcolor=
                 {0,127,0}));
          connect(modulatedActuatedPrismaticLat.bearing, LatDynamics.flange_a)
            annotation (points=[13,54; 6,54; 6,50; -10,50], style(color=58,
                rgbcolor={0,127,0}));
          connect(modulatedActuatedPrismaticLat.frame_a, modulatedActuatedPrismaticLong.frame_b)
            annotation (points=[20,49; 20,1.34707e-015; 39,1.34707e-015],
              style(
              color=0,
              rgbcolor={0,0,0},
              thickness=2));
          connect(modulatedActuatedPrismaticLat.frame_b, frame_b)
                                                      annotation (points=[20,71; 20,
                90; -50,90; -50,0; -110,0],        style(
              color=0,
              rgbcolor={0,0,0},
              thickness=2));
          connect(modulatedActuatedPrismaticLat.r, eLat) annotation (points=[30,
                60; 50,60], style(color=3, rgbcolor={0,0,255}));
          connect(eLong, modulatedActuatedPrismaticLong.r) annotation (points=[50,30;
                50,10],        style(color=3, rgbcolor={0,0,255}));
          connect(body.frame_a, frame_b) annotation (points=[-80,39; -80,0; -110,0],
              style(
              color=0,
              rgbcolor={0,0,0},
              thickness=2));
        end CP2ndOrder;

        annotation (Icon);
      end ContactPointDynamics;
    end ContactPhysics;

    package Center2ContactPoint
      "contains modles to realize the translation from the belt's output (at the virutal center point) to the contact point."
      annotation(preferedView="info");

    extends WheelsAndTires.TireComponents.Utilities.Icons.TireComponentsPackage;

      partial model Center2CPBase
        "partial base model for the translation from the belt's center point to the contact pointfixed translational element (massles rod)"
        import SI = Modelica.SIunits;
        //import MB = Modelica.Mechanics.MultiBody;
        import MultiBondLib;

        extends WheelsAndTires.TireComponents.Utilities.Icons.TireComponents;

                                           annotation(Evaluate=true,
          Diagram(                      Rectangle(extent=[-100,60; 100,100], style(
                color=51,
                rgbcolor={255,255,170},
                fillColor=51,
                rgbfillColor={255,255,170}))),
          Icon(
            Text(
              extent=[-140,-100; 140,-60],
              string="%name",
              style(
                color=10,
                rgbcolor={135,135,135},
                fillColor=0,
                rgbfillColor={0,0,0},
                fillPattern=1))),
          Coordsys(extent=[-100,-100; 100,100], scale=0.1),
          Documentation(info="<html>

The base does not feature much more than the connections to the needed tire bus and the definition of the variables needed from the communication structure, as well as the two frames.

</html>"));
        annotation (Icon(
            Rectangle(extent=[-100,10; 100,-1],  style(color=0, fillColor=0)),
            Text(
              extent=[-100,40; -60,10],
              style(color=10),
              string="a"),
            Text(
              extent=[60,40; 100,10],
              style(color=10),
              string="b"),
            Text(extent=[-114,100; 116,42], string="%name")), Diagram,
          Documentation(info="<html>
This is the model of a massless rod. It defines a fixed translation between the two connected frames.
<p>
<img src=\"../Images/Transl.png\">
</p>
<h3>General parameter</h3>
The rod can be specified by a parameter vector r.
r is resolved in the body system and points from frame a to frame b.
<h3>Visualization</h3>
The element is normally visualized as cylinder. Anyhow the visualization can be changed by the according parameters.
</html>"));
        replaceable MultiBondLib.Mechanics3D.Interfaces.Frame_a frame_a
          "connect to the Belt Dynamics model."
                                   annotation (extent=[-120,-20; -100,20],Dialog(tab="Advanced"));
        replaceable MultiBondLib.Mechanics3D.Interfaces.Frame_b frame_b
          "connect to the Contact Physics model."
                                   annotation (extent=[100,-20; 120,20],Dialog(tab="Advanced"));

      protected
        MultiBondLib.Interfaces.RealSignal r[3]
          annotation (extent=[-8,52; 8,68],   rotation=0);
        Communication.ContactPropertiesInput CP
          annotation (extent=[-6,72; 6,84], rotation=270);
      public
        Communication.TireBus tireBus "connect to the Tire Bus."
                                      annotation (extent=[-10,90; 10,110]);
      equation

        connect(CP, tireBus.CP) annotation (points=[0,78; 0,96], style(
            color=78,
            rgbcolor={127,0,127},
            pattern=0,
            fillColor=51,
            rgbfillColor={255,255,170},
            fillPattern=1));
        connect(r[:], CP.rCP[:]) annotation (points=[0,54.6667; 0,78], style(
            color=3,
            rgbcolor={0,0,255},
            pattern=0,
            fillColor=51,
            rgbfillColor={255,255,170},
            fillPattern=1));
      end Center2CPBase;

      annotation (Icon, Documentation(info="<html>

The <span class=\"cmti-10x-x-109\">Center To Contact Point </span>model is a model without a nice physical interpretation. It is
kind of a <span class=\"cmti-10x-x-109\">Fixed Translation </span>element known from the <span class=\"cmti-10x-x-109\">Modelica Standard Library </span><span class=\"cite\">[<a href=\"Modelica://WheelsAndTires.UsersGuide.Literature\">Ass09</a>]</span>. This
model is built on multi bond techniques and therefore derived from the <span class=\"cmti-10x-x-109\">fixed translation </span>in
the <span class=\"cmti-10x-x-109\">Multi Bond Lib </span><span class=\"cite\">[<a href=\"Modelica://WheelsAndTires.UsersGuide.Literature\">Zim06</a>]</span>. It shall describe the connection between the contact point and
the belt?s center point.

</html>"));
      model Center2CPBond
        "a non-physical element realizting the translation from the belt's center point to the contact point."
        extends Center2CPBase;
        import SI = Modelica.SIunits;
        import MB = Modelica.Mechanics.MultiBody;
        import MultiBondLib;
        parameter Boolean visCenter2CPEnabled = false
          "= true, if animation of the center2CP 'rod' shall be enabled"
          annotation(Dialog(tab="Visualization"));
        parameter MB.Types.Color center2CPColor= {128,128,128}
          "Color of the rod"
          annotation(Dialog(tab="Visualization"));
        SI.Length length = sqrt(r*r);
                                           annotation(Evaluate=true,
          Diagram(Line(points=[-90,-58; -90,-48; -82,-48; -82,-34], style(
                color=10,
                rgbcolor={135,135,135},
                arrow=2,
                fillColor=10,
                rgbfillColor={135,135,135},
                fillPattern=1))),
          Icon(Polygon(points=[-88,6; -88,-6; 64,-6; 64,-14; 92,0; 64,14; 64,6; -88,6],
                style(
                color=0,
                rgbcolor={0,0,0},
                fillColor=0,
                rgbfillColor={0,0,0})), Line(points=[0,92; 0,34; 0,6], style(
                color=3,
                rgbcolor={0,0,255},
                fillColor=0,
                rgbfillColor={0,0,0},
                fillPattern=1)),
            Text(
              extent=[-140,-100; 140,-60],
              string="%name",
              style(
                color=10,
                rgbcolor={135,135,135},
                fillColor=0,
                rgbfillColor={0,0,0},
                fillPattern=1)),
            Line(points=[34,62; 92,62; 70,84; 80,74; 34,74],      style(
                color=3,
                rgbcolor={0,0,255},
                fillColor=7,
                rgbfillColor={255,255,255}))),
          Coordsys(extent=[-100,-100; 100,100], scale=0.1),
          Documentation(info="<html>
There are three main differences between the <span class=\"cmti-10x-x-109\">Center To Contact Point </span>model and the <span class=\"cmti-10x-x-109\">Fixed</span>
<span class=\"cmti-10x-x-109\">Translation</span>. The first of which is that the <span class=\"cmti-10x-x-109\">Center To Contact Point </span>model does not have
fixed dimensions as the vector <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">rCP</span></span></span> depends on the <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">penetrationDepth</span></span></span> as
well as the normal vectors <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">ePlane</span></span></span> and <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">eN</span></span></span>. The second difference is that is must not rotate
even if <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">frame_a</span></span></span> is connected to a frame with a pitch angle velocity. The last is that the two
frames have different rotation matrices. Therefore, a special model was created.
To realize the required feature mentioned at the beginning of this section, two new multi
bond elements had to be created. These are the <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">mTranslationalTF_r</span></span></span> (modulated
translational transformer radius) and the <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">mTranslation_r</span></span></span> (modulated translation
radius). The first one adds a variable vector to a positional vector of the <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">frame_a</span></span></span>

setting the geometrical relation between <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">frame_a</span></span></span> and <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">frame_b</span></span></span>. The <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">mTranslationalTF_r</span></span></span> is an element
computing the relation between torques and forces acting on a translational element
depending on the radius of the element.
<!--l. 34--></p><p class=\"noindent\">The second requirement to not rotate with the pitch angle velocity is fulfilled by the <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">mSF</span></span></span>
element on the lower left of the model. Measuring the angular velocity around the <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">z</span></span></span> axis
described by <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\"> eAxis</span></span></span> and subtracts it from the speeds at the following <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">0</span></span></span> junction. This results
in an element that does not react on pitch angle velocity but does so for the other two
angular velocities.
</p>

<p>
<!--l. 36--></p><p class=\"noindent\">The different rotation matrices emerge from the contact bond (<span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">frame_b</span></span></span>) and from the rim
(<span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">frame_a</span></span></span>)<span class=\"footnote-mark\"><a .
Different matrices are used to enable a more plausible description of the two frames. It was
considered to have a single rotation matrix solution for which the frame of the contact point
would be described by the same rotational matrix as the rim. This would lead to a rotating
frame of the contact point, which is inconvenient as the frame of the contact point would
rotate around the unit vector <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">eAxis</span></span></span>. Additionally, this structure is likely to cause higher
computational effort during simulation. Therefore, the two rotation matrix solution was
chosen and thus the <span class=\"cmti-10x-x-109\">Center to Contact Point </span>model has to handle these two rotation
matrices. The <span class=\"cmti-10x-x-109\">Modulated Effort Transformer </span><span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">mTF_efford</span></span></span> calculates the rotational
quantities from the belt?s body coordinate system to the world system. The same is
done by <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">mTF_efford1</span></span></span> for the quantities of the contact point. Additionally, the

<span class=\"cmti-10x-x-109\">Modulated Translational Transformer </span><span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">translational</span></span></span> connects the rotational and
translational quantities (both in the world coordinate system) as in the <span class=\"cmti-10x-x-109\">Fixed Translation</span>
model.
</p>

</html>"));
        annotation (Icon(
            Rectangle(extent=[-100,10; 100,-1],  style(color=0, fillColor=0)),
            Text(
              extent=[-100,40; -60,10],
              style(color=10),
              string="a"),
            Text(
              extent=[60,40; 100,10],
              style(color=10),
              string="b"),
            Text(extent=[-114,100; 116,42], string="%name")), Diagram,
          Documentation(info="<html>
This is the model of a massless rod. It defines a fixed translation between the two connected frames.
<p>
<img src=\"../Images/Transl.png\">
</p>
<h3>General parameter</h3>
The rod can be specified by a parameter vector r.
r is resolved in the body system and points from frame a to frame b.
<h3>Visualization</h3>
The element is normally visualized as cylinder. Anyhow the visualization can be changed by the according parameters.
</html>"));

      protected
        outer MultiBondLib.Mechanics3D.World3D world3D;
        inner MultiBondLib.Defaults MBG_defaults(n=3)
                                         annotation (extent=[80,80; 100,100]);

      public
        replaceable MultiBondLib.Mechanics3D.Interfaces.Mech2MBG Mech2MBG1
          "to split properties into multi bond elements."
                                      annotation (extent=[-100,-40; -80,40]);
        replaceable MultiBondLib.Mechanics3D.Interfaces.MBG2Mech MBG2Mech1
          "to split properties into multi bond elements."
                                      annotation (extent=[80,-40; 100,40]);

      protected
        Utilities.AddititionalMBG.mTranslationalTF_r mtranslationalTF1
          annotation (extent=[18,-10; 38,10], rotation=0);
        MultiBondLib.Junctions.J0 J0_1
                          annotation (extent=[40,20; 60,40]);
        MultiBondLib.Junctions.J1 J1_1
                          annotation (extent=[8,-40; 28,-20]);
        MultiBondLib.Bonds.MultiBond MultiBond1
                                        annotation (extent=[20,20; 40,40]);
        MultiBondLib.Bonds.MultiBond MultiBond2
                                        annotation (extent=[60,20; 80,40]);
        MultiBondLib.Bonds.MultiBond MultiBond3
                                        annotation (extent=[-8,-40; 8,-20]);
        MultiBondLib.Bonds.MultiBond MultiBond4
                                        annotation (extent=[64,-40; 80,-20]);
        MultiBondLib.Bonds.MultiBond MultiBond6
                                        annotation (extent=[-2,-10; 18,10],
            rotation=0);
        MultiBondLib.Bonds.MultiBond MultiBond7
                                        annotation (extent=[40,0; 60,20], rotation=90);
        MultiBondLib.Bonds.Utilities.MultiBondTail MultiBondTail1
                                           annotation (extent=[-76,20; 26,40]);
        MultiBondLib.Bonds.Utilities.MultiBondTail MultiBondTail2
                                           annotation (extent=[48,-10; 38,10],
            rotation=180);
        Utilities.AddititionalMBG.mTranslation_r Translation1
          annotation (extent=[-70,0; -50,20]);
        MultiBondLib.Passive.mTF_effort mTF_effort
          annotation (extent=[-28,-40; -8,-20],  rotation=180);
        MultiBondLib.Passive.mTF_effort mTF_effort1
          annotation (extent=[64,-40; 44,-20], rotation=180);
        MultiBondLib.Bonds.MultiBond MultiBond5
                                        annotation (extent=[28,-40; 44,-20]);
        MultiBondLib.Bonds.MultiBond MultiBond8
                                        annotation (extent=[-44,-40; -28,-20]);
        MultiBondLib.Bonds.MultiBond MultiBond9
                                        annotation (extent=[-80,-40; -64,-20]);
        MultiBondLib.Junctions.J0 J0_2
                          annotation (extent=[-64,-40; -44,-20]);
        MultiBondLib.Bonds.Utilities.MultiBondTail MultiBondTail6
                                           annotation (extent=[8,-18; -12,-2],
            rotation=90);
        MultiBondLib.Bonds.Utilities.MultiBondTail MultiBondTail3
                                           annotation (extent=[-56,-70; -70,-50],
            rotation=180);
        MultiBondLib.Sources.mSf mSf
          annotation (extent=[-90,-70; -70,-50],   rotation=180);
        MultiBondLib.Bonds.MultiBond MultiBond10
                                        annotation (extent=[-64,-60; -44,-40],
            rotation=90);
        MultiBondLib.Bonds.Utilities.MultiBondTail MultiBondTail4
                                           annotation (extent=[18,-30; 0,-10],
            rotation=180);

        MB.Visualizers.Advanced.Shape rod(
          each shapeType="cylinder",
          each color=center2CPColor,
          each length=length,
          each width=length/20,
          each height=length/20,
          each lengthDirection=r,
          each widthDirection={0,0,1},
          each r_shape={0,0,0},
          each r=Mech2MBG1.x,
          each R=MB.Frames.Orientation(T=identity(3),w=zeros(3))) if visCenter2CPEnabled and world3D.enableAnimation;

      equation
        defineBranch(frame_a.P,frame_b.P);
        mSf.s = {0,0,-Mech2MBG1.MultiBondConRot.f[3]};

        connect(MultiBond2.MultiBondCon2,MBG2Mech1. MultiBondConTrans)
          annotation (points=[80,30; 80,30], style(color=71, rgbcolor={85,170,255}));
        connect(MultiBond1.MultiBondCon1,Mech2MBG1. MultiBondConTrans) annotation (
            points=[20,30; -30,30; -30,30; -80,30],
                                    style(color=71, rgbcolor={85,170,255}));
        connect(MultiBond4.MultiBondCon2,MBG2Mech1. MultiBondConRot) annotation (
            points=[80,-30; 80,-30], style(color=71, rgbcolor={85,170,255}));
        connect(J0_1.MultiBondCon2,MultiBond2. MultiBondCon1)
          annotation (points=[60,30; 60,30], style(color=71, rgbcolor={85,170,255}));
        connect(MultiBond1.MultiBondCon2,J0_1. MultiBondCon1)
          annotation (points=[40,30; 40,30], style(color=71, rgbcolor={85,170,255}));
        connect(MultiBond6.MultiBondCon1,J1_1. MultiBondCon4) annotation (points=[-2,0; -2,
              -20; 18,-20],style(color=71, rgbcolor={85,170,255}));
        connect(MultiBond7.MultiBondCon2,J0_1. MultiBondCon3)
          annotation (points=[50,20; 50,20], style(color=71, rgbcolor={85,170,255}));
        connect(J1_1.MultiBondCon1,MultiBond3. MultiBondCon2) annotation (points=[8,-30; 8,
              -30],          style(color=71, rgbcolor={85,170,255}));
        connect(mtranslationalTF1.r, r) annotation (points=[28,10; 28,44; 0,44; 0,
              60],
            style(color=3, rgbcolor={0,0,255}));
        connect(MultiBond5.MultiBondCon1,J1_1. MultiBondCon2) annotation (points=[28,-30;
              28,-30],     style(
            color=71,
            rgbcolor={85,170,255},
            fillColor=0,
            rgbfillColor={0,0,0},
            fillPattern=1));
        connect(Translation1.r, r) annotation (points=[-60,20; -60,44; 0,44; 0,60],
            style(
            color=3,
            rgbcolor={0,0,255},
            fillColor=0,
            rgbfillColor={0,0,0},
            fillPattern=1));
        connect(Mech2MBG1.x,Translation1. x1) annotation (points=[-80,10; -75,10;
              -75,10; -70,10],
            style(
            color=3,
            rgbcolor={0,0,255},
            fillColor=0,
            rgbfillColor={0,0,0},
            fillPattern=1));
        connect(Translation1.x2,MBG2Mech1. x) annotation (points=[-50,10; 10,10; 10,
              14; 68,14; 68,10; 80,10], style(
            color=3,
            rgbcolor={0,0,255},
            fillColor=0,
            rgbfillColor={0,0,0},
            fillPattern=1));
        connect(frame_a,Mech2MBG1. frame_a) annotation (points=[-110,0; -107.25,0;
              -107.25,4.10782e-015; -104.5,4.10782e-015; -104.5,0; -99,0],      style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2,
            fillColor=0,
            rgbfillColor={0,0,0},
            fillPattern=1));
        connect(MBG2Mech1.frame_b, frame_b) annotation (points=[99,0; 101.75,0;
              101.75,4.10782e-015; 104.5,4.10782e-015; 104.5,0; 110,0],       style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2,
            fillColor=0,
            rgbfillColor={0,0,0},
            fillPattern=1));
        connect(MBG2Mech1.R,mTF_effort1. M) annotation (points=[80,-10; 54,-10; 54,
              -20],         style(
            color=3,
            rgbcolor={0,0,255},
            fillColor=0,
            rgbfillColor={0,0,0},
            fillPattern=1));
        connect(Mech2MBG1.R,mTF_effort. M) annotation (points=[-80,-10; -18,-10;
              -18,-20],                        style(
            color=3,
            rgbcolor={0,0,255},
            fillColor=0,
            rgbfillColor={0,0,0},
            fillPattern=1));
        connect(MultiBond3.MultiBondCon1,mTF_effort. MultiBondCon1)
          annotation (points=[-8,-30; -8,-30],   style(color=71, rgbcolor={85,
                170,255}));
        connect(mTF_effort.MultiBondCon2,MultiBond8. MultiBondCon2)
          annotation (points=[-28,-30; -28,-30], style(color=71, rgbcolor={85,
                170,255}));
        connect(mTF_effort1.MultiBondCon1,MultiBond5. MultiBondCon2)
          annotation (points=[44,-30; 44,-30], style(color=71, rgbcolor={85,
                170,255}));
        connect(mTF_effort1.MultiBondCon2,MultiBond4. MultiBondCon1)
          annotation (points=[64,-30; 64,-30], style(color=71, rgbcolor={85,
                170,255}));
        connect(mtranslationalTF1.MultiBondCon1,MultiBond6. MultiBondCon2)
          annotation (points=[18,0; 18,0], style(color=71, rgbcolor={85,170,
                255}));
        connect(mtranslationalTF1.MultiBondCon2,MultiBond7. MultiBondCon1)
          annotation (points=[38,0; 41,0; 41,5.55115e-017; 44,5.55115e-017; 44,0;
              50,0],                       style(color=71, rgbcolor={85,170,
                255}));
        connect(MultiBond9.MultiBondCon1,Mech2MBG1. MultiBondConRot)
          annotation (points=[-80,-30; -79.8,-30],   style(color=71, rgbcolor=
               {85,170,255}));
        connect(J0_2.MultiBondCon1,MultiBond9. MultiBondCon2) annotation (
            points=[-64,-30; -64,-30], style(color=71, rgbcolor={85,170,255}));
        connect(MultiBond8.MultiBondCon1,J0_2. MultiBondCon2) annotation (
            points=[-44,-30; -44,-30], style(color=71, rgbcolor={85,170,255}));
        connect(mSf.MultiBondCon1,MultiBond10. MultiBondCon1) annotation (points=[-70,-60;
              -54,-60],           style(color=71, rgbcolor={85,170,255}));
        connect(J0_2.MultiBondCon3,MultiBond10. MultiBondCon2) annotation (
            points=[-54,-40; -54,-40], style(color=71, rgbcolor={85,170,255}));
      end Center2CPBond;
    end Center2ContactPoint;

    package VerticalDynamics
      "enables the tire to lift from the ground and determines its reaction to normal load."
      annotation(preferedView="info");

    extends WheelsAndTires.TireComponents.Utilities.Icons.TireComponentsPackage;

      partial model ElevationBase
        "partial base model that is exended by the the vertical dynamics models."
        import SI = Modelica.SIunits;
        import WheelsAndTires;

        extends WheelsAndTires.TireComponents.Utilities.Icons.TireComponents;

        annotation (Icon(
            Text(
              extent=[-100,68; 100,100],
              style(
                color=10,
                rgbcolor={135,135,135},
                fillPattern=1),
              string="%name"),
            Line(points=[-90,-38; 92,-38], style(color=0, rgbcolor={0,0,0}))),
                                Diagram(Rectangle(extent=[-100,-100; 100,-60], style(
                color=51,
                rgbcolor={255,255,170},
                fillColor=51,
                rgbfillColor={255,255,170}))),
          Documentation(info="<html>

The base class just defines the two bus connections to the <span class=\"cmti-10x-x-109\">Tire Bus </span>and the <span class=\"cmti-10x-x-109\">Contact Point</span>
<span class=\"cmti-10x-x-109\">Properties</span>. Nothing more is defined here due to the essentially different structure of the
models extending the base.

</html>"));
      public
        Communication.TireBus tireBus "connect to the Tire Bus."
                                      annotation (extent=[-70,-110; -50,-90]);
        WheelsAndTires.TireComponents.Communication.ContactPointConnector
          contactPhysics "connect tot the Contact Point Connector Bus."
          annotation (extent=[50,-110; 70,-90]);

      end ElevationBase;

      model NoElevation
        "allows neither elevation from the ground nor penetration into it. Only usable with the FlatSurface option of the Surface enabled."
        import WheelsAndTires;
        extends WheelsAndTires.TireComponents.VerticalDynamics.ElevationBase;
        import SI = Modelica.SIunits;

        annotation (Icon(
            Ellipse(extent=[-48,62; 48,-38], style(
                color=10,
                rgbcolor={135,135,135},
                gradient=3,
                fillColor=7,
                rgbfillColor={255,255,255})),
            Polygon(points=[0,-62; 0,-38; -4,-46; 4,-46; 0,-38; 0,-62],
                style(
                color=0,
                rgbcolor={0,0,0},
                fillColor=0,
                rgbfillColor={0,0,0},
                fillPattern=1)),
            Ellipse(extent=[-34,48; 34,-24], style(
                color=7,
                rgbcolor={255,255,255},
                fillColor=7,
                rgbfillColor={255,255,255})),
            Polygon(points=[0,-10; 0,-38; 4,-30; -4,-30; 0,-38; 0,-10],
                                                                    style(
                color=0,
                rgbcolor={0,0,0},
                fillColor=0,
                rgbfillColor={0,0,0})),
            Text(
              extent=[0,-66; 100,-90],
              style(
                color=0,
                rgbcolor={0,0,0},
                fillColor=0,
                rgbfillColor={0,0,0},
                fillPattern=1),
              string="no")),     Diagram,
          Documentation(info="<html>

This class differs from the other elevation classes due to the fact that not a normal force is computed as a
function of the penetration depth and speed. It imposes a holonomic constraint, that defines
the values of <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">penetrationDepth</span></span></span> and therefore also its derivative the penetration speed to be
zero. This implies that there is contact at all time. The necessary force is then calculated
from that holonomic constraint.
<!--l. 22--></p><p class=\"noindent\">An important characteristic of this model is that is has to derive the <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">penetrationDepth</span></span></span> that
depends on the <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">get_elevation</span></span></span> function. As this function is not derivable analytically, it is
not possible to use this model on uneven surfaces. To be more precise, the parameter
<span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">flat</span></span></span><span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">Surface</span></span></span> has to be <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">true</span></span></span>.

</p>

</html>"));

      protected
        outer WheelsAndTires.Environment.Surface Surface;

        Modelica.Blocks.Sources.Constant noPenetration(k=0)
          annotation (extent=[-70,0; -50,20], rotation=270);

        MultiBondLib.Interfaces.RealSignal penetrationDepth
          annotation (extent=[-68,-68; -52,-52], rotation=0);
        WheelsAndTires.TireComponents.Communication.ContactPropertiesOutput CP
          annotation (extent=[-66,-86; -54,-74], rotation=270);
      equation
        assert(Surface.FlatSurface == true,
          "the 'NoElevation'  model just works with Flat Surfaces (Surface.FlatSurface == true). Please change the parameter of the used surface");

        connect(noPenetration.y, penetrationDepth)
          annotation (points=[-60,-1; -60,-60], style(color=74, rgbcolor={0,0,127}));
        connect(CP, tireBus.CP) annotation (points=[-60,-80; -60,-100], style(color=78,
              rgbcolor={127,0,127}));
        connect(penetrationDepth, tireBus.CP.penetrationDepth) annotation (
            points=[-60,-60; -60,-100],                   style(color=3,
              rgbcolor={0,0,255}));
        connect(tireBus, tireBus) annotation (points=[-60,-100; -60,-100],
            style(color=42, rgbcolor={127,0,0}));
      end NoElevation;

      model KelvinElevation
        "enables the tire to lift from the ground with a parallel spring damper system determining the penetration into the ground. Can 'stick' to the ground."

        extends WheelsAndTires.TireComponents.VerticalDynamics.ElevationBase;
        import WheelsAndTires;
        import SI = Modelica.SIunits;
        import MultiBondLib.Mechanics3D.World3D;

        parameter Real cR(
          final unit="N/m",
          final min=0) = 10e5 "spring constant";
        parameter Real dR(
          final unit="N/ (m/s)",
          final min=0) = 10e3 "damping constant";

      public
        SI.Distance penetration_depth = penetrationDepth
          "Position of the contact point relative to the surface";

      protected
        outer World3D world3D;
        outer WheelsAndTires.Environment.Surface Surface;

        WheelsAndTires.TireComponents.Utilities.AdditionalBG.ElevationGap
          elevationGap
          annotation (extent=[-20,20; 20,60]);
        BondLib.Mechanical.Translational.Passive.Spring spring(c=cR)
          annotation (extent=[-6,-30; 14,-10]);
        BondLib.Mechanical.Translational.Passive.Damper Damper(d=dR)
          annotation (extent=[-6,-50; 14,-30]);
        BondLib.Mechanical.Translational.Passive.Fixed fixed
          annotation (extent=[80,-10; 100,10], rotation=90);
        BondLib.Mechanical.Translational.Sensors.ForceSensor forceSensor
          annotation (extent=[66,-10; 86,10], rotation=180);
        WheelsAndTires.TireComponents.Utilities.AdditionalBG.PositionWithS
          position
          annotation (extent=[-70,30; -50,50]);

      protected
        MultiBondLib.Interfaces.RealSignal fN
          annotation (extent=[52,-68; 68,-52],   rotation=0);
        MultiBondLib.Interfaces.RealSignal penetrationDepth
          annotation (extent=[-88,-68; -72,-52], rotation=0);
        WheelsAndTires.TireComponents.Communication.ContactPropertiesInput CP
          annotation (extent=[-66,-86; -54,-74], rotation=90);
        WheelsAndTires.TireComponents.Utilities.AddititionalMBG.BooleanSignal
          Contact
          annotation (extent=[-48,-68; -32,-52], rotation=0);
      initial equation
        //xN = -(mRim * g + fRim[2])/cR;
        //penetrationDepth = -mRim * g/cR;

        annotation (Icon(
            Polygon(points=[-2,12; -2,-16; 2,-8; -6,-8; -2,-16; -2,12],
                                                                    style(
                color=0,
                rgbcolor={0,0,0},
                fillColor=0,
                rgbfillColor={0,0,0})),
            Text(
              extent=[0,-66; 100,-90],
              style(
                color=0,
                rgbcolor={0,0,0},
                fillColor=0,
                rgbfillColor={0,0,0},
                fillPattern=1),
              string="Kelvin"),
            Line(points=[-80,-38; -80,-46; -74,-48; -84,-50; -74,-52; -84,-54;
                  -74,-56; -84,-58; -74,-60; -84,-62; -74,-64; -84,-66; -78,-68;
                  -78,-74], style(
                color=0,
                rgbcolor={0,0,0},
                fillColor=58,
                rgbfillColor={0,127,0},
                fillPattern=1)),
            Line(points=[-58,-38; -58,-52; -62,-52; -62,-60; -62,-52; -54,-52;
                  -54,-60], style(
                color=0,
                rgbcolor={0,0,0},
                fillColor=58,
                rgbfillColor={0,127,0},
                fillPattern=1)),
            Line(points=[-58,-56; -58,-74; -78,-74; -70,-74; -70,-74], style(
                color=0,
                rgbcolor={0,0,0},
                fillColor=58,
                rgbfillColor={0,127,0},
                fillPattern=1)),
            Ellipse(extent=[-48,70; 48,-30], style(
                color=10,
                rgbcolor={135,135,135},
                gradient=3,
                fillColor=7,
                rgbfillColor={255,255,255})),
            Polygon(points=[0,-62; 0,-38; -4,-46; 4,-46; 0,-38; 0,-62],
                style(
                color=0,
                rgbcolor={0,0,0},
                fillColor=0,
                rgbfillColor={0,0,0},
                fillPattern=1)),
            Ellipse(extent=[-34,56; 34,-16], style(
                color=7,
                rgbcolor={255,255,255},
                fillColor=7,
                rgbfillColor={255,255,255})),
            Polygon(points=[0,-2; 0,-30; 4,-22; -4,-22; 0,-30; 0,-2],
                                                                    style(
                color=0,
                rgbcolor={0,0,0},
                fillColor=0,
                rgbfillColor={0,0,0})),
            Line(points=[0,-30; 0,-38], style(
                color=9,
                rgbcolor={175,175,175},
                gradient=3,
                fillColor=7,
                rgbfillColor={255,255,255}))),
                                  Diagram,
          Documentation(info="<html>

This class is the first one to enable the tire to lift from the ground. The model compensates
the force of the connected mechanical system, when there is no contact to the
ground. The external mechanical system is connected via the lower two mechanical
connectors <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">flange_a_extension</span></span></span> and <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">flange_b_extension</span></span></span>.

</html>"));
      equation

        connect(spring.flange_a, elevationGap.flange_a_extention) annotation (
            points=[-6,-20; -12,-20; -12,20; -4,20],              style(
            color=58,
            rgbcolor={0,127,0},
            fillColor=58,
            rgbfillColor={0,127,0},
            fillPattern=1));
        connect(Damper.flange_a, spring.flange_a)             annotation (
            points=[-6,-40; -12,-40; -12,-20; -6,-20],   style(color=58,
              rgbcolor={0,127,0}));
        connect(Damper.flange_b, spring.flange_b)             annotation (
            points=[13.9,-40; 20,-40; 20,-20; 13.9,-20], style(color=58,
              rgbcolor={0,127,0}));
        annotation (Diagram);
        connect(forceSensor.f, fN) annotation (points=[76,10; 76,20; 60,20; 60,-60],
                    style(color=74, rgbcolor={0,0,127}));
        connect(forceSensor.flange_a, fixed.flange_b) annotation (points=[86,
              -1.22461e-015; 86,0; 90,0], style(color=58, rgbcolor={0,127,0}));
        connect(elevationGap.flange_b_extention, spring.flange_b) annotation (
            points=[12,20; 20,20; 20,-20; 13.9,-20], style(color=58, rgbcolor={
                0,127,0}));
        connect(Contact, elevationGap.Contact) annotation (points=[-40,-60; -40,
              24; -22,24], style(color=83, rgbcolor={255,85,255}));
        connect(elevationGap.flange_b, forceSensor.flange_b) annotation (points=[19.8,40;
              32,40; 32,1.21236e-015; 66.1,1.21236e-015],          style(color=
                58, rgbcolor={0,127,0}));
        connect(position.flange_b, elevationGap.flange_a) annotation (points=[
              -50,40; -20,40], style(color=58, rgbcolor={0,127,0}));
        connect(position.s_ref, penetrationDepth) annotation (points=[-71,40;
              -80,40; -80,-60], style(color=74, rgbcolor={0,0,127}));
        connect(fN, contactPhysics.fN)          annotation (points=[60,-60; 60,
              -100],                 style(
            color=74,
            rgbcolor={0,0,127},
            fillColor=7,
            rgbfillColor={255,255,255},
            fillPattern=1));
        connect(penetrationDepth, tireBus.CP.penetrationDepth) annotation (
            points=[-80,-60; -80,-70; -60,-70; -60,-100], style(color=3,
              rgbcolor={0,0,255}));
        connect(Contact, tireBus.CP.Contact) annotation (points=[-40,-60; -40,
              -70; -60,-70; -60,-100], style(color=83, rgbcolor={255,85,255}));
        connect(CP, tireBus.CP) annotation (points=[-60,-80; -60,-100], style(color=
                78, rgbcolor={127,0,127}));
      end KelvinElevation;

      model GehmannElevation
        "enables the tire to lift from the ground with a Gehman model for rubber determining the penetration into the ground. Can 'stick' to the ground."
        extends WheelsAndTires.TireComponents.VerticalDynamics.ElevationBase;
        import WheelsAndTires;
        import SI = Modelica.SIunits;
        import MultiBondLib.Mechanics3D.World3D;

        parameter Real cR(
          final unit="N/m",
          final min=0) = 1e6 "Stiffness of the single spring";
        parameter Real cR1(
          final unit="N/m",
          final min=0) = 1e6 "Stiffness of the spring-damper serial connection";
        parameter Real dR1(
          final unit="N/ (m/s)",
          final min=0) = 1e4
          "Damping constant of the spring-damper serial connection";

      public
        SI.Distance penetration_depth = penetrationDepth
          "Position of the contact point relative to the surface";

      protected
        outer World3D world3D;
        outer WheelsAndTires.Environment.Surface Surface;

      protected
        WheelsAndTires.TireComponents.Utilities.AdditionalBG.SpringDamperSerial
          springDamperSerial(c=cR1, d=dR1)
          annotation (extent=[-6,-50; 14,-30]);
        WheelsAndTires.TireComponents.Utilities.AdditionalBG.ElevationGap
          elevationGap
          annotation (extent=[-20,20; 20,60]);
        BondLib.Mechanical.Translational.Passive.Spring spring(c=cR)
          annotation (extent=[-6,-30; 14,-10]);
        BondLib.Mechanical.Translational.Passive.Fixed fixed
          annotation (extent=[80,-10; 100,10], rotation=90);
        BondLib.Mechanical.Translational.Sensors.ForceSensor forceSensor
          annotation (extent=[66,-10; 86,10], rotation=180);
        WheelsAndTires.TireComponents.Utilities.AdditionalBG.PositionWithS
          position
          annotation (extent=[-70,30; -50,50]);

        annotation (Icon(
            Polygon(points=[-2,12; -2,-16; 2,-8; -6,-8; -2,-16; -2,12],
                                                                    style(
                color=0,
                rgbcolor={0,0,0},
                fillColor=0,
                rgbfillColor={0,0,0})),
            Text(
              extent=[0,-66; 100,-90],
              style(
                color=0,
                rgbcolor={0,0,0},
                fillColor=0,
                rgbfillColor={0,0,0},
                fillPattern=1),
              string="Gehmann"),
            Line(points=[-80,-38; -80,-46; -74,-48; -84,-50; -74,-52; -84,-54; -74,
                  -56; -84,-58; -74,-60; -84,-62; -74,-64; -84,-66; -78,-68; -78,-74],
                            style(
                color=0,
                rgbcolor={0,0,0},
                fillColor=58,
                rgbfillColor={0,127,0},
                fillPattern=1)),
            Line(points=[-58,-38; -58,-44; -62,-44; -62,-52; -62,-44; -54,-44; -54,
                  -52],     style(
                color=0,
                rgbcolor={0,0,0},
                fillColor=58,
                rgbfillColor={0,127,0},
                fillPattern=1)),
            Line(points=[-58,-80; -58,-84; -78,-84; -78,-78; -78,-74], style(
                color=0,
                rgbcolor={0,0,0},
                fillColor=58,
                rgbfillColor={0,127,0},
                fillPattern=1)),
            Ellipse(extent=[-48,70; 48,-30], style(
                color=10,
                rgbcolor={135,135,135},
                gradient=3,
                fillColor=7,
                rgbfillColor={255,255,255})),
            Polygon(points=[0,-62; 0,-38; -4,-46; 4,-46; 0,-38; 0,-62],
                style(
                color=0,
                rgbcolor={0,0,0},
                fillColor=0,
                rgbfillColor={0,0,0},
                fillPattern=1)),
            Ellipse(extent=[-34,56; 34,-16], style(
                color=7,
                rgbcolor={255,255,255},
                fillColor=7,
                rgbfillColor={255,255,255})),
            Polygon(points=[0,-2; 0,-30; 4,-22; -4,-22; 0,-30; 0,-2],
                                                                    style(
                color=0,
                rgbcolor={0,0,0},
                fillColor=0,
                rgbfillColor={0,0,0})),
            Line(points=[0,-30; 0,-38], style(
                color=9,
                rgbcolor={175,175,175},
                gradient=3,
                fillColor=7,
                rgbfillColor={255,255,255})),
            Line(points=[-58,-48; -58,-56; -54,-58; -64,-60; -54,-62; -64,-64; -54,
                  -66; -64,-68; -54,-70; -64,-72; -54,-74; -64,-76; -58,-78; -58,-84],
                            style(
                color=0,
                rgbcolor={0,0,0},
                fillColor=58,
                rgbfillColor={0,127,0},
                fillPattern=1))), Diagram,
          Documentation(info="<html>

The <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">gehmannElevation</span></span></span> model is the <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">elevationGap</span></span></span> model combined with a more complex
model for rubber modeling <span class=\"cite\">[<a href=\"Modelica://WheelsAndTires.UsersGuide.Literature\">MW03</a>]</span>. Here one can see the advantage of the <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">elastoElevation</span></span></span>

model that makes it very easy to use the components of the 1D mechanics bond graph
library to define vertical dynamics. The <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">Damper</span></span></span> in the <span class=\"cmti-10x-x-109\">Kelvin Elevation </span>was replaced by a
serial spring damper element.
<!--l. 47--></p><p class=\"noindent\">However, in this case there is one problem related to the bond graph library that can not
compute the behavior of a spring and a damper connected in series directly. The
simpler possibility to overcome this problem is to add a very light weight mass
between the two components. However, this introduces additional oscillations to the
system which is usually of very low damping. So to overcome this problem a bond
graphic model of the whole spring damper system connected in series has been
created that is now used to calculate the behavior of the Gehmann model for rubber.
It is based on the model of a
simple spring as it has been modeled in the 1D translational library of the <span class=\"cmti-10x-x-109\">Bond Lib</span>
<span class=\"cite\">[<a href=\"Modelica://WheelsAndTires.UsersGuide.Literature\">Cel07</a>]</span>.
<!--l. 58--></p>

</html>"));

      protected
        MultiBondLib.Interfaces.RealSignal fN
          annotation (extent=[52,-68; 68,-52],   rotation=0);
        MultiBondLib.Interfaces.RealSignal penetrationDepth
          annotation (extent=[-88,-68; -72,-52], rotation=0);
        WheelsAndTires.TireComponents.Communication.ContactPropertiesInput CP
          annotation (extent=[-66,-86; -54,-74], rotation=90);
        WheelsAndTires.TireComponents.Utilities.AddititionalMBG.BooleanSignal
          Contact
          annotation (extent=[-48,-68; -32,-52], rotation=0);
      initial equation
        //xN = -(mRim * g + fRim[2])/cR;
        //penetrationDepth = -mRim * 9.81/cR/2;
        //penetrationDepth = 0;

      equation

        connect(spring.flange_a,elevationGap. flange_a_extention) annotation (
            points=[-6,-20; -12,-20; -12,20; -4,20],              style(
            color=58,
            rgbcolor={0,127,0},
            fillColor=58,
            rgbfillColor={0,127,0},
            fillPattern=1));
        connect(forceSensor.flange_a, fixed.flange_b) annotation (points=[86,
              -1.22461e-015; 86,0; 90,0], style(color=58, rgbcolor={0,127,0}));
        connect(elevationGap.flange_b_extention, spring.flange_b) annotation (
            points=[12,20; 20,20; 20,-20; 13.9,-20], style(color=58, rgbcolor={
                0,127,0}));
        connect(elevationGap.flange_b, forceSensor.flange_b) annotation (points=[19.8,40;
              32,40; 32,1.21236e-015; 66.1,1.21236e-015],          style(color=
                58, rgbcolor={0,127,0}));
        connect(position.flange_b, elevationGap.flange_a) annotation (points=[-50,40;
              -20,40],         style(color=58, rgbcolor={0,127,0}));
        connect(elevationGap.flange_a_extention, springDamperSerial.flange_a)
          annotation (points=[-4,20; -12,20; -12,-40; -6,-40], style(color=58,
              rgbcolor={0,127,0}));
        connect(elevationGap.flange_b_extention, springDamperSerial.flange_b)
          annotation (points=[12,20; 20,20; 20,-40; 13.9,-40], style(color=58,
              rgbcolor={0,127,0}));
        connect(forceSensor.f,fN)  annotation (points=[76,10; 76,20; 60,20; 60,-60],
                    style(color=74, rgbcolor={0,0,127}));
        connect(Contact, elevationGap.Contact) annotation (points=[-40,-60; -40,
              24; -22,24], style(color=83, rgbcolor={255,85,255}));
        connect(position.s_ref,penetrationDepth)  annotation (points=[-71,40;
              -80,40; -80,-60], style(color=74, rgbcolor={0,0,127}));
        connect(fN, contactPhysics.fN)          annotation (points=[60,-60; 60,
              -100],                 style(
            color=74,
            rgbcolor={0,0,127},
            fillColor=7,
            rgbfillColor={255,255,255},
            fillPattern=1));
        connect(penetrationDepth, tireBus.CP.penetrationDepth) annotation (
            points=[-80,-60; -80,-70; -60,-70; -60,-100], style(color=3,
              rgbcolor={0,0,255}));
        connect(Contact, tireBus.CP.Contact) annotation (points=[-40,-60; -40,
              -70; -60,-70; -60,-100], style(color=83, rgbcolor={255,85,255}));
        connect(CP, tireBus.CP) annotation (points=[-60,-80; -60,-100], style(color=
                78, rgbcolor={127,0,127}));
      end GehmannElevation;

      model ElastoElevation
        "enables the tire to lift from the ground with a parallel spring damper system determining the penetration into the ground. Does not stick to the ground."

        extends WheelsAndTires.TireComponents.VerticalDynamics.ElevationBase;
        import SI = Modelica.SIunits;
        import MultiBondLib.Mechanics3D.World3D;

        parameter Real cR(
          final unit="N/m",
          final min=0) = 1e6
          "Stiffness of the tire in normal direction to the surface";
        parameter Real dR(
          final unit="N/ (m/s)",
          final min=0) = 1e4 "Damping constant of the tire for normal speed";

      public
        SI.Distance penetration_depth = penetrationDepth
          "Position of the contact point relative to the surface";
         SI.Force f_c;
        SI.Force f_d;
      protected
        outer World3D world3D;
        outer WheelsAndTires.Environment.Surface Surface;

        Modelica.Blocks.Continuous.Derivative derivative(T=1e-4)
          annotation (extent=[-72,-28; -52,-8], rotation=90);
        MultiBondLib.Interfaces.RealSignal penetrationSpeed
          annotation (extent=[-70,6; -54,22],    rotation=0);

      protected
        MultiBondLib.Interfaces.RealSignal fN
          annotation (extent=[52,-68; 68,-52],   rotation=0);
        MultiBondLib.Interfaces.RealSignal penetrationDepth
          annotation (extent=[-88,-68; -72,-52], rotation=0);
        Communication.ContactPropertiesInput CP
          annotation (extent=[-66,-86; -54,-74], rotation=90);
        Utilities.AddititionalMBG.BooleanSignal Contact
          annotation (extent=[-48,-68; -32,-52], rotation=0);
      initial equation
      //  xN = -(mRim * 9.81 + fRim[2])/cR;
      //  penetrationDepth = -(mRim * 9.81)/cR;

      equation

      if Contact then
         f_c = cR*penetrationDepth; // spring force
         f_d = dR*penetrationSpeed; // damper force
         fN  = smooth(0, noEvent(if (f_c + f_d) >= 0 then 0 else (-1)*(f_c + max(f_c, f_d))));
      else
         f_c = 0; // spring force
         f_d = 0; // damper force
         fN = 0;
      end if;

        annotation (Icon(
            Polygon(points=[-2,12; -2,-16; 2,-8; -6,-8; -2,-16; -2,12],
                                                                    style(
                color=0,
                rgbcolor={0,0,0},
                fillColor=0,
                rgbfillColor={0,0,0})),
            Text(
              extent=[0,-66; 100,-90],
              style(
                color=0,
                rgbcolor={0,0,0},
                fillColor=0,
                rgbfillColor={0,0,0},
                fillPattern=1),
              string="elasto"),
            Line(points=[-80,-38; -80,-46; -74,-48; -84,-50; -74,-52; -84,-54;
                  -74,-56; -84,-58; -74,-60; -84,-62; -74,-64; -84,-66; -78,-68;
                  -78,-74], style(
                color=0,
                rgbcolor={0,0,0},
                fillColor=58,
                rgbfillColor={0,127,0},
                fillPattern=1)),
            Ellipse(extent=[-48,70; 48,-30], style(
                color=10,
                rgbcolor={135,135,135},
                gradient=3,
                fillColor=7,
                rgbfillColor={255,255,255})),
            Polygon(points=[0,-62; 0,-38; -4,-46; 4,-46; 0,-38; 0,-62],
                style(
                color=0,
                rgbcolor={0,0,0},
                fillColor=0,
                rgbfillColor={0,0,0},
                fillPattern=1)),
            Ellipse(extent=[-34,56; 34,-16], style(
                color=7,
                rgbcolor={255,255,255},
                fillColor=7,
                rgbfillColor={255,255,255})),
            Polygon(points=[0,-2; 0,-30; 4,-22; -4,-22; 0,-30; 0,-2],
                                                                    style(
                color=0,
                rgbcolor={0,0,0},
                fillColor=0,
                rgbfillColor={0,0,0})),
            Line(points=[0,-30; 0,-38], style(
                color=9,
                rgbcolor={175,175,175},
                gradient=3,
                fillColor=7,
                rgbfillColor={255,255,255})),
            Line(points=[-62,-62; -62,-52; -58,-52; -58,-38],
                                                          style(
                color=0,
                rgbcolor={0,0,0},
                pattern=2,
                gradient=3,
                fillColor=7,
                rgbfillColor={255,255,255})),
            Line(points=[-54,-62; -54,-52; -58,-52],
                                                  style(
                color=0,
                rgbcolor={0,0,0},
                pattern=2,
                gradient=3,
                fillColor=7,
                rgbfillColor={255,255,255})),
            Line(points=[-58,-58; -58,-74],
                                          style(
                color=0,
                rgbcolor={0,0,0},
                pattern=2,
                gradient=3,
                fillColor=7,
                rgbfillColor={255,255,255})),
            Line(points=[-78,-74; -76,-74; -58,-74],
                                                  style(
                color=0,
                rgbcolor={0,0,0},
                gradient=3,
                fillColor=7,
                rgbfillColor={255,255,255}))),
                                  Diagram(
            Line(points=[-8,16; -8,10; -12,8; -4,6; -12,4; -4,2; -12,0; -4,-2;
                  -12,-4; -4,-6; -8,-8],                        style(
                color=10,
                rgbcolor={95,95,95},
                pattern=2)),
            Line(points=[8,16; 8,8; 4,8; 4,-2],               style(
                color=10,
                rgbcolor={95,95,95},
                pattern=2)),
            Line(points=[8,8; 12,8; 12,-2],          style(
                color=10,
                rgbcolor={95,95,95},
                pattern=2)),
            Line(points=[8,4; 8,-12; -8,-12],        style(
                color=10,
                rgbcolor={95,95,95},
                pattern=2)),
            Line(points=[-8,16; 8,16],      style(
                color=10,
                rgbcolor={95,95,95},
                pattern=2)),
            Line(points=[-8,-8; -8,-12],    style(
                color=10,
                rgbcolor={95,95,95},
                pattern=2)),
            Line(points=[0,-12; 0,-22; -4,-22; 4,-22],        style(color=10,
                  rgbcolor={95,95,95})),
            Line(points=[-4,-22; -6,-24],   style(color=10, rgbcolor={95,95,95})),
            Line(points=[-2,-22; -4,-24],   style(color=10, rgbcolor={95,95,95})),
            Line(points=[0,-22; -2,-24],    style(color=10, rgbcolor={95,95,95})),
            Line(points=[2,-22; 0,-24],     style(color=10, rgbcolor={95,95,95})),
            Line(points=[4,-22; 2,-24],     style(color=10, rgbcolor={95,95,95})),
            Line(points=[0,32; 0,16],       style(color=10, rgbcolor={95,95,95})),
            Line(points=[-40,-50; -40,2; -14,2],   style(color=10, rgbcolor={135,135,135})),
            Rectangle(extent=[-2,36; 2,32],   style(color=10, rgbcolor={135,135,
                    135})),
            Line(points=[0,38; 0,60; 60,60; 60,-46], style(
                color=10,
                rgbcolor={135,135,135},
                fillColor=10,
                rgbfillColor={135,135,135},
                fillPattern=1)),
            Polygon(points=[60,-52; 62,-46; 58,-46; 60,-52], style(
                color=10,
                rgbcolor={135,135,135},
                fillColor=10,
                rgbfillColor={135,135,135},
                fillPattern=1)),
            Line(points=[-80,-52; -80,36; -4,36],
                                               style(
                color=10,
                rgbcolor={135,135,135},
                fillColor=10,
                rgbfillColor={135,135,135},
                fillPattern=1)),
            Line(points=[-62,22; -62,32; -4,32],
                                               style(
                color=10,
                rgbcolor={135,135,135},
                fillColor=10,
                rgbfillColor={135,135,135},
                fillPattern=1))),
          Documentation(info="<html>

The <span class=\"cmti-10x-x-109\">Elasto Elevation is derived from the Standard Library of Modelica in Version 3.0 <span class=\"cite\">[<a href=\"Modelica://WheelsAndTires.UsersGuide.Literature\">Ass07</a>]</span>. The problem
concerning sticking was elegantly solved there. So this model features a parallel spring
damper system that acts without sticking. Another advantage of that model is that it does
not introduce a discontinuity. It usually arises from the dampers force which is proportional
to the speed of movement. If the tire moves to the road with a certain speed, the
damper force gets compensated until <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">Contact</span></span></span> gets true. From that point on the
spring, force rises continuously but the damping force already has a certain value
due to the speed of movement. So in general and if there is no more complex
behavior to be modeled, the <span class=\"cmti-10x-x-109\">Elasto Elevation </span>model is the best choice for the vertical
dynamics.


</html>"));
        connect(derivative.u, penetrationDepth) annotation (points=[-62,-30;
              -62,-60; -80,-60], style(color=74, rgbcolor={0,0,127}));
        connect(derivative.y, penetrationSpeed) annotation (points=[-62,-7; -62,14],
                   style(color=74, rgbcolor={0,0,127}));
        connect(fN, contactPhysics.fN)          annotation (points=[60,-60; 60,
              -100],                 style(
            color=74,
            rgbcolor={0,0,127},
            fillColor=7,
            rgbfillColor={255,255,255},
            fillPattern=1));
        connect(penetrationDepth, tireBus.CP.penetrationDepth) annotation (
            points=[-80,-60; -80,-70; -60,-70; -60,-100], style(color=3,
              rgbcolor={0,0,255}));
        connect(Contact, tireBus.CP.Contact) annotation (points=[-40,-60; -40,
              -70; -60,-70; -60,-100], style(color=83, rgbcolor={255,85,255}));
        connect(CP, tireBus.CP) annotation (points=[-60,-80; -60,-100], style(color=
                78, rgbcolor={127,0,127}));

      end ElastoElevation;

      annotation (Icon, Documentation(info="<html>


The models contained in this package determine if and how the tire is able to lift from the ground and how it responds to normal load on the base of the penetration depth.
<!--l. 5--></p><p class=\"noindent\">The <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">penetrationDepth</span></span></span> is calculated in the <span class=\"cmti-10x-x-109\">Geometry Class</span>. It can either be set to a certain
value as in the <span class=\"cmti-10x-x-109\">No Elevation </span>class or be the base for the calculation of the normal force <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">fN</span></span></span>. It
is important to notice that <span class=\"cmtt-10x-x-109\">penetrationDepth </span>as well as <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">fN</span></span></span> are directed as <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">eN</span></span></span>

is.
<!--l. 7--></p>

</html>"));
    end VerticalDynamics;

    package Friction
      "gathers the fricional effects in the sub-packages and contains different ready-made frictional classes."
      annotation(preferedView="info");

    extends WheelsAndTires.TireComponents.Utilities.Icons.TireComponentsPackage;

      partial model FrictionBase "partial base model of frictional classes"
        import MultiBondLib;
        import SI = Modelica.SIunits;
        import Modelica.Math.atan;
        import PI = Modelica.Constants.pi;

        extends WheelsAndTires.TireComponents.Utilities.Icons.TireComponents;

        parameter SI.Velocity vRotMin = 1e-6
          "Lower border used for the calculation of slip to not get infinite values. If vRot < vRotMin: vRot is set to vRotMin for calcualation of the slip";
        parameter SI.Velocity vLongMin = 1e-6
          "Lower border for the calculation of the slip angle. If vLong < vLongMin the angle is set to pi/2 or -pi/2";

      public
        Real mu_Tire_Road = mu "Fricitional coefficient between road and tire";
        SI.Velocity v_Long = vLong
          "Longitudinal translational velocity of the contact point";
        SI.Velocity v_Lat = vLat
          "Lateral translational velocity of the contact point";
        SI.Velocity v_Slip_Long = vSlipLong "Longitudinal slip velocity";
        SI.Velocity v_Slip_Lat = vSlipLat "Lateral slip velocity";
        SI.Velocity v_Rot_Long = vRotLong
          "Longitudinal velocity due to rotation of the rim";
        SI.Velocity v_Rot_Lat = vRotLat
          "Lateral velocity due to rotation of the rim";
        SI.Velocity v_Slip = vSlip "Total slip velocity";
        SI.Angle alpha_slip = alpha "Slip angle";
        SI.Angle phi_lean = phi "Lean angle of the tire";
        SI.Distance l_Trail = lTrail
          "Trailing distance that is responsible for the self aligning torque";
        Real s_Long = sLong "Longitudinal slip";
        Real s_Lat = sLat "Lateral slip";
        Real s_Total = s "Overall slip";
        Real s_Ad = sAd "Slip at which adhesion occurs";
        Real s_Sl = sSl "Slip at which full sliding occurs";
        Real v_Ad = vAd "Slip at which adhesion occurs";
        Real v_Sl = vSl "Slip at which full sliding occurs";
        Real load_Influcence = loadInfluence
          "Factor that makes the friction coefficient depending on the normal load";
        Boolean contact = Contact
          "= true if the tire has contact to the ground";
        SI.Force f_Long = fLong "Force in longitudinal direction";
        SI.Force f_Lat = fLat "Force in lateral direction";
        SI.Force f_N = fN "Normal force";
        SI.Torque t_Roll = tRoll "Rolling resistance torque";
        SI.Torque t_Bore = tBore "Bore torque";
        SI.Torque t_SelfAligning = tAlign "Self aligning torque";
        SI.Velocity v_Lat_Camber = vLatCamber
          "Lateral slip velocity due to camber angle";
        SI.Torque t_Overturn = tOverturn
          "Overturning torque due to camber angle";
        SI.AngularVelocity w_Plane = wPlane
          "angular velocity around the tire's vertical axis";

      protected
        inner SI.AngularVelocity wPlane
          "angular velocity around the tires vertical axis";
        inner SI.AngularVelocity wLat
          "angular velocity around the lateral tire axis";

        inner SI.Velocity vRot[3] "translational velocities due to rotation";
        inner SI.Velocity vRotLong
          "translational velocity due to roatation of contact point in longitudinal direction";
        inner SI.Velocity vRotLat
          "translational velocity due to roatation of contact point in lateral direction";
        inner SI.Velocity vRotPlane
          "translational velocity due to roatation of contact point in plane direction";

        inner SI.Force fLatSlip "lateral force due to lateral slip";
        inner SI.Force fLongSlip "longitudinal force due to longitudinal slip";

        inner SI.Angle alpha "slip angle";
        inner SI.Angle phi "Lean Angle of the Tire";
        inner Real mu "friction coefficient";

        inner Real sLong "longitudinal slip";
        inner Real sLat "lateral slip";
        inner Real s "overall slip";

        inner SI.Velocity vSlipLong
          "sliding velocity in longitudinal direction";
        inner SI.Velocity vSlipLat "sliding velocity in lateral direction";
        inner SI.Velocity vSlip "overall sliding velocity";

        inner SI.Velocity vLatCamber
          "additional lateral sliding velocity due to camber angle";

        inner SI.Velocity vAd
          "sliding velocity of the adhesive point that can change depending on slip and sliding velocity";
        inner SI.Velocity vSl
          "sliding velocity of the point of total slipping that can change depending on slip and sliding velocity";
        inner Real sAd
          "slip of the adhesive point that can change depending on slip and sliding velocity";
        inner Real sSl
          "slip of the point of total slipping that can change depending on slip and sliding velocity";

        /* These 4 are 'artificial' Variables that are necessary to combine the different
     SlipProperties for the calculation of Bore Torque and Self Aligning Torque.
     Two of these (one for Ad and one for Sl) have to be set in the SlipProperty,
     the other ones get calculated by the eqations below. */

        inner SI.Torque tBore "torque arising due to bore effects";
        inner SI.Torque tAlign "torque due to self aligning effects";
        inner SI.Torque tRoll "torque representing the roll resistance";
        inner SI.Torque tOverturn "torque due to overturning effects";

        inner Real loadInfluence
          "factor that influences the friction coefficient mu";
        inner SI.Distance lTrail
          "Trailing distance that is the reason for the self aligning torque";
        annotation (Icon(
            Ellipse(extent=[-62,-26; -36,-72],style(color=0, rgbcolor={0,0,0})),
            Polygon(points=[-38,-70; -52,-58; -48,-20; -22,-32; -38,-70],
                                                                        style(
                color=7,
                rgbcolor={255,255,255},
                fillColor=7,
                rgbfillColor={255,255,255},
                fillPattern=1)),
            Ellipse(extent=[-56,22; 0,0],  style(color=0, rgbcolor={0,0,0})),
            Rectangle(extent=[-62,8; 16,-4],  style(
                color=7,
                rgbcolor={255,255,255},
                fillColor=7,
                rgbfillColor={255,255,255},
                fillPattern=1)),
            Ellipse(extent=[-20,-10; 4,-54],style(color=0, rgbcolor={0,0,0})),
            Rectangle(extent=[-26,14; -12,-64], style(
                color=7,
                rgbcolor={255,255,255},
                fillColor=7,
                rgbfillColor={255,255,255},
                fillPattern=1)),
            Text(
              extent=[-100,68; 100,100],
              style(
                color=10,
                rgbcolor={135,135,135},
                fillPattern=1),
              string="%name"),
            Line(points=[-72,-66; -28,-28],
                                        style(
                color=10,
                rgbcolor={135,135,135},
                fillPattern=1)),
            Line(points=[-28,-28; 52,-28],
                                         style(
                color=10,
                rgbcolor={135,135,135},
                fillPattern=1)),
            Polygon(points=[48,-24; 48,-32; 62,-28; 48,-24],
                                                          style(
                color=9,
                rgbcolor={175,175,175},
                fillColor=9,
                rgbfillColor={175,175,175})),
            Polygon(points=[-76,-64; -68,-68; -82,-74; -76,-64], style(
                color=9,
                rgbcolor={175,175,175},
                fillColor=9,
                rgbfillColor={175,175,175})),
            Text(
              extent=[-18,72; -18,56],
              style(
                color=9,
                rgbcolor={175,175,175},
                fillColor=9,
                rgbfillColor={175,175,175},
                fillPattern=1),
              string="e"),
            Text(
              extent=[-11,64; -11,54],
              style(
                color=9,
                rgbcolor={175,175,175},
                fillColor=9,
                rgbfillColor={175,175,175},
                fillPattern=1),
              string="N"),
            Text(
              extent=[62,-10; 62,-26],
              style(
                color=9,
                rgbcolor={175,175,175},
                fillColor=9,
                rgbfillColor={175,175,175},
                fillPattern=1),
              string="e"),
            Text(
              extent=[77,-18; 77,-28],
              style(
                color=9,
                rgbcolor={175,175,175},
                fillColor=9,
                rgbfillColor={175,175,175},
                fillPattern=1),
              string="Long"),
            Text(
              extent=[-64,-68; -64,-84],
              style(
                color=9,
                rgbcolor={175,175,175},
                fillColor=9,
                rgbfillColor={175,175,175},
                fillPattern=1),
              string="e"),
            Text(
              extent=[-53,-76; -53,-86],
              style(
                color=9,
                rgbcolor={175,175,175},
                fillColor=9,
                rgbfillColor={175,175,175},
                fillPattern=1),
              string="Lat"),
            Polygon(points=[-14,-52; -8,-52; -10,-56; -14,-52], style(
                color=0,
                rgbcolor={0,0,0},
                fillColor=0,
                rgbfillColor={0,0,0},
                fillPattern=1)),
            Polygon(points=[2,8; -4,6; -2,10; 2,8],          style(
                color=0,
                rgbcolor={0,0,0},
                fillColor=0,
                rgbfillColor={0,0,0},
                fillPattern=1)),
            Line(points=[-28,-28; -28,60],
                                       style(
                color=10,
                rgbcolor={135,135,135},
                fillPattern=1)),
            Polygon(points=[-40,-66; -44,-68; -42,-70; -40,-66], style(
                color=0,
                rgbcolor={0,0,0},
                fillColor=0,
                rgbfillColor={0,0,0},
                fillPattern=1)),
            Polygon(points=[-28,-28; 24,-28; 18,-26; 18,-30; 24,-28; -28,-28],
                                                                         style(
                color=0,
                rgbcolor={0,0,0},
                fillColor=0,
                rgbfillColor={0,0,0},
                fillPattern=1)),
            Polygon(points=[-28,-28; -56,-52; -54,-48; -52,-50; -56,-52; -28,
                  -28],
                style(
                color=0,
                rgbcolor={0,0,0},
                fillColor=0,
                rgbfillColor={0,0,0},
                fillPattern=1)),
            Polygon(points=[-28,60; -32,44; -24,44; -28,60], style(
                color=9,
                rgbcolor={175,175,175},
                fillColor=9,
                rgbfillColor={175,175,175})),
            Text(
              extent=[-58,32; -58,16],
              style(
                color=0,
                rgbcolor={0,0,0},
                fillColor=9,
                rgbfillColor={175,175,175},
                fillPattern=1),
              string="tN"),
            Text(
              extent=[20,-44; 20,-60],
              style(
                color=0,
                rgbcolor={0,0,0},
                fillColor=9,
                rgbfillColor={175,175,175},
                fillPattern=1),
              string="tLong"),
            Text(
              extent=[-66,-14; -66,-30],
              style(
                color=0,
                rgbcolor={0,0,0},
                fillColor=9,
                rgbfillColor={175,175,175},
                fillPattern=1),
              string="tLat"),
            Text(
              extent=[26,-10; 26,-26],
              style(
                color=0,
                rgbcolor={0,0,0},
                fillColor=9,
                rgbfillColor={175,175,175},
                fillPattern=1),
              string="fLong"),
            Text(
              extent=[-36,-44; -36,-60],
              style(
                color=0,
                rgbcolor={0,0,0},
                fillColor=9,
                rgbfillColor={175,175,175},
                fillPattern=1),
              string="fLat")),  Diagram(Rectangle(extent=[-100,-100; 100,-60], style(
                color=51,
                rgbcolor={255,255,170},
                fillColor=51,
                rgbfillColor={255,255,170}))),
          Documentation(info="<html>

The friction base class computes many of the variables needed in the sub-classes that are added afterwards to determine the behavior of the tire. The rest of this section shows how these are calculated exactly and what type of limitations they imply.

</html>"));

      public
        WheelsAndTires.TireComponents.Communication.ContactPointConnector
          ContactPhysics "connect to the Contact Point Connector."
                                  annotation (extent=[-70,-110; -50,-90]);
        Communication.TireBus tireBus "connect to the Tire Bus."
          annotation (extent=[30,-110; 50,-90]);

      protected
        Communication.UnitVectorInput UV
          annotation (extent=[-18,-84; -6,-72],
                                              rotation=90);
        Communication.ContactPropertiesInput CP
          annotation (extent=[34,-84; 46,-72], rotation=90);
        Communication.SensorValuesInput SV
          annotation (extent=[74,-84; 86,-72], rotation=90);
        MultiBondLib.Interfaces.RealSignal RBelt[3,3]
          annotation (extent=[74,-66; 86,-54]);
        MultiBondLib.Interfaces.RealSignal wBelt[3]
          annotation (extent=[86,-66; 98,-54]);
        MultiBondLib.Interfaces.RealSignal rCP[3]
          annotation (extent=[46,-66; 58,-54]);
        inner MultiBondLib.Interfaces.RealSignal lCR
          annotation (extent=[34,-66; 46,-54]);
        inner MultiBondLib.Interfaces.RealSignal bCR
          annotation (extent=[22,-66; 34,-54]);
        MultiBondLib.Interfaces.RealSignal eLong[3]
          annotation (extent=[-54,-66; -42,-54]);
        inner
          WheelsAndTires.TireComponents.Utilities.AddititionalMBG.BooleanSignal
          Contact                       annotation (extent=[10,-66; 22,-54]);
        inner MultiBondLib.Interfaces.RealSignal eAxis[3]
          annotation (extent=[-6,-66; 6,-54]);
        MultiBondLib.Interfaces.RealSignal ePlane[3]
          annotation (extent=[-18,-66; -6,-54]);
        inner MultiBondLib.Interfaces.RealSignal eN[ 3]
          annotation (extent=[-30,-66; -18,-54]);
        MultiBondLib.Interfaces.RealSignal eLat[3]
          annotation (extent=[-42,-66; -30,-54]);
        inner MultiBondLib.Interfaces.RealSignal fLong
          annotation (extent=[-98,-66; -86,-54]);
        inner MultiBondLib.Interfaces.RealSignal fLat
          annotation (extent=[-86,-66; -74,-54]);
        inner MultiBondLib.Interfaces.RealSignal fN
          annotation (extent=[-74,-66; -62,-54]);
        inner MultiBondLib.Interfaces.RealSignal vLong
          annotation (extent=[-98,-98; -86,-86]);
        inner MultiBondLib.Interfaces.RealSignal vLat
          annotation (extent=[-86,-98; -74,-86]);
        inner MultiBondLib.Interfaces.RealSignal tLong
          annotation (extent=[-98,-82; -86,-70]);
        inner MultiBondLib.Interfaces.RealSignal tLat
          annotation (extent=[-86,-82; -74,-70]);
        inner MultiBondLib.Interfaces.RealSignal tN
          annotation (extent=[-74,-82; -62,-70]);
        inner MultiBondLib.Interfaces.RealSignal xCP[3]
          annotation (extent=[58,-66; 70,-54]);

      equation
        wPlane = wBelt * (-ePlane);
        wLat = wBelt * eLat;

        vRot = cross(wBelt,rCP);
        vRotLong = vRot*eLong;
        vRotLat = vRot*eLat;
        vRotPlane = vRot*ePlane;

        vSlipLong = vRotLong + vLong;
        vSlipLat = vLat + vLatCamber;
        vSlip = sqrt(vSlipLong^2 + vSlipLat^2);

        sLong = noEvent(if abs(vRotLong) > abs(vRotMin) then (-1)*vSlipLong/abs(vRotLong) else (-1)*vSlipLong/vRotMin);
        sLat = noEvent(if abs(vRotLong) > abs(vRotMin) then (-1)*vSlipLat/abs(vRotLong) else (-1)*vSlipLat/vRotMin);
        s = sqrt(sLat^2+sLong^2);

        // calculating vAd und sAd that are used in the other friction models
        sAd = noEvent(if abs(vRotLong) > abs(vRotMin) then vAd/abs(vRotLong) else vAd/vRotMin);
        sSl = noEvent(if abs(vRotLong) > abs(vRotMin) then vSl/abs(vRotLong) else vSl/vRotMin);

        phi = arcsin(-eN*eAxis);
        alpha = noEvent(if abs(vLong) > vLongMin then atan(sLat) else if (vLat) < 0 then PI/2 else if vLat > 0 then -PI/2 else 0);

        fLat = fLatSlip;
        fLong = fLongSlip;

        tLong = tOverturn;
        tN = tBore + tAlign;
        tLat = tRoll;

        connect(UV, tireBus.UV) annotation (points=[-12,-78; -12,-86; 38,-86;
              38,-94; 40,-94; 40,-100],
                                     style(
            color=58,
            rgbcolor={0,127,0},
            fillColor=51,
            rgbfillColor={255,255,170},
            fillPattern=1));
        connect(CP, tireBus.CP) annotation (points=[40,-78; 40,-100], style(
            color=78,
            rgbcolor={127,0,127},
            fillColor=51,
            rgbfillColor={255,255,170},
            fillPattern=1));
        connect(RBelt[:,:], SV.RBelt[:,:]) annotation (points=[80,-60; 80,-78],
            style(
            color=3,
            rgbcolor={0,0,255},
            fillColor=51,
            rgbfillColor={255,255,170},
            fillPattern=1));
        connect(wBelt[:], SV.wBelt[:]) annotation (points=[92,-60; 92,-68; 80,
              -68; 80,-78], style(
            color=3,
            rgbcolor={0,0,255},
            fillColor=51,
            rgbfillColor={255,255,170},
            fillPattern=1));
        connect(SV, tireBus.SV) annotation (points=[80,-78; 80,-86; 42,-86; 42,
              -94; 40,-94; 40,-100], style(
            color=45,
            rgbcolor={255,128,0},
            fillColor=51,
            rgbfillColor={255,255,170},
            fillPattern=1));
        connect(lCR, CP.lCR) annotation (points=[40,-60; 40,-78],
            style(
            color=3,
            rgbcolor={0,0,255},
            fillColor=51,
            rgbfillColor={255,255,170},
            fillPattern=1));
        connect(rCP[:], CP.rCP[:]) annotation (points=[52,-60; 52,-68; 40,-68;
              40,-78], style(
            color=3,
            rgbcolor={0,0,255},
            fillColor=51,
            rgbfillColor={255,255,170},
            fillPattern=1));
        connect(bCR, CP.bCR) annotation (points=[28,-60; 28,-68; 40,-68; 40,-78],
                                                                  style(
            color=3,
            rgbcolor={0,0,255},
            fillColor=51,
            rgbfillColor={255,255,170},
            fillPattern=1));
        connect(Contact, CP.Contact) annotation (points=[16,-60; 16,-68; 40,-68;
              40,-78], style(
            color=83,
            rgbcolor={255,85,255},
            fillColor=51,
            rgbfillColor={255,255,170},
            fillPattern=1));
        connect(eAxis[:], UV.eAxis[:]) annotation (points=[0,-60; 0,-68; -12,
              -68; -12,-78],
                           style(
            color=3,
            rgbcolor={0,0,255},
            fillColor=51,
            rgbfillColor={255,255,170},
            fillPattern=1));
        connect(ePlane[:], UV.ePlane[:]) annotation (points=[-12,-60; -12,-78],
            style(
            color=3,
            rgbcolor={0,0,255},
            fillColor=51,
            rgbfillColor={255,255,170},
            fillPattern=1));
        connect(eN[:], UV.eN[:]) annotation (points=[-24,-60; -24,-68; -12,-68;
              -12,-78],
                    style(
            color=3,
            rgbcolor={0,0,255},
            fillColor=51,
            rgbfillColor={255,255,170},
            fillPattern=1));
        connect(eLat[:], UV.eLat[:]) annotation (points=[-36,-60; -36,-68; -12,
              -68; -12,-78],
                           style(
            color=3,
            rgbcolor={0,0,255},
            fillColor=51,
            rgbfillColor={255,255,170},
            fillPattern=1));
        connect(eLong[:], UV.eLong[:]) annotation (points=[-48,-60; -48,-68;
              -12,-68; -12,-78],
                           style(
            color=3,
            rgbcolor={0,0,255},
            fillColor=51,
            rgbfillColor={255,255,170},
            fillPattern=1));
        connect(fN, ContactPhysics.fN) annotation (points=[-68,-60; -60,-60;
              -60,-100], style(
            color=3,
            rgbcolor={0,0,255},
            pattern=0,
            fillColor=51,
            rgbfillColor={255,255,170},
            fillPattern=1));
        connect(tN, ContactPhysics.tN) annotation (points=[-68,-76; -60,-76;
              -60,-100], style(
            color=3,
            rgbcolor={0,0,255},
            pattern=0,
            fillColor=51,
            rgbfillColor={255,255,170},
            fillPattern=1));
        connect(vLat, ContactPhysics.vLat) annotation (points=[-80,-92; -60,-92;
              -60,-100], style(
            color=3,
            rgbcolor={0,0,255},
            pattern=0,
            fillColor=51,
            rgbfillColor={255,255,170},
            fillPattern=1));
        connect(vLong, ContactPhysics.vLong) annotation (points=[-92,-92; -92,
              -98; -60,-98; -60,-100], style(
            color=3,
            rgbcolor={0,0,255},
            pattern=0,
            fillColor=51,
            rgbfillColor={255,255,170},
            fillPattern=1));
        connect(fLat, ContactPhysics.fLat) annotation (points=[-80,-60; -80,-66;
              -60,-66; -60,-100], style(
            color=3,
            rgbcolor={0,0,255},
            pattern=0,
            fillColor=51,
            rgbfillColor={255,255,170},
            fillPattern=1));
        connect(fLong, ContactPhysics.fLong) annotation (points=[-92,-60; -92,
              -68; -60,-68; -60,-100], style(
            color=3,
            rgbcolor={0,0,255},
            pattern=0,
            fillColor=51,
            rgbfillColor={255,255,170},
            fillPattern=1));
        connect(tLat, ContactPhysics.tLat) annotation (points=[-80,-76; -80,-82;
              -60,-82; -60,-100], style(
            color=3,
            rgbcolor={0,0,255},
            pattern=0,
            fillColor=51,
            rgbfillColor={255,255,170},
            fillPattern=1));
        connect(tLong, ContactPhysics.tLong) annotation (points=[-92,-76; -92,
              -84; -60,-84; -60,-100], style(
            color=3,
            rgbcolor={0,0,255},
            pattern=0,
            fillColor=51,
            rgbfillColor={255,255,170},
            fillPattern=1));
        connect(xCP[:], CP.xCP[:]) annotation (points=[64,-60; 64,-68; 40,-68;
              40,-78], style(
            color=3,
            rgbcolor={0,0,255},
            fillColor=30,
            rgbfillColor={215,215,215},
            fillPattern=1));
      end FrictionBase;

      package SlipProperties
        "different models to describe the slip behavior of the tire."
        annotation(preferedView="info");

      extends
          WheelsAndTires.TireComponents.Utilities.Icons.TireComponentsPackage;

        function GetMu_vSlip
          "interpolation of the frictional coefficient. Returns mu/vSlip or mu/s."
          import SI = Modelica.SIunits;

          input Real muMax "coefficient of friction at adhesion";
          input Real muMin "coefficient of friction at full sliding";
          input Real dmu_dvSlip
            "slope of the coefficient of friction at the zero crossing";

          input SI.Velocity vSlipIn "actual sliding velocity/slip";
          input SI.Velocity vAdhesionIn
            "sliding velocity/slip at which adhesion occurs";
          input SI.Velocity vSlideIn
            "sliding velocity/slip at which full sliding occurs";

          output Real mu_vSlip
            "coefficient of friction devided by the actual sliding velocity/slip (depending on the inputs)";

        protected
          SI.Velocity vSlip = abs(vSlipIn);
          SI.Velocity vAdhesion = abs(vAdhesionIn);
          SI.Velocity vSlide = abs(vSlideIn);

        algorithm
          if abs(vSlip) < abs(vAdhesion) then
            mu_vSlip := dmu_dvSlip/(1 + vSlip/vAdhesion*(vAdhesion/muMax*dmu_dvSlip-2+vSlip/vAdhesion));
          elseif abs(vSlip) < abs(vSlide) then
            mu_vSlip := (muMax - (muMax - muMin) * ((vSlip - vAdhesion)/(vSlide - vAdhesion))^2 * (3-2*(vSlip - vAdhesion)/(vSlide - vAdhesion)))/vSlip;
          else
            mu_vSlip := muMin/vSlip;
          end if;
          annotation (Documentation(info="<html>

The result of this function (interpolation) can be seen in Figure&nbsp;<a href=\"#x1-34005r1\">1(a)<!--tex4ht:ref: F_sDFL_mu_vLong --></a>, </p><hr class=\"figure\"><div class=\"figure\"><table class=\"figure\"><tbody><tr class=\"figure\"><td class=\"figure\">



<a id=\"x1-34007r12\"></a>


<div class=\"center\">
<!--l. 45--><p class=\"noindent\">
<a id=\"x1-34005r1\"></a>
</p><div class=\"subfigure\"><table><tbody><tr><td style=\"text-align: left;\"> <img src=\"../images/Master_Doku_MarkusAndres38x.png\" alt=\"PIC\" class=\"graphics\" width=\"177.82973pt\" height=\"133.88287pt\"><!--tex4ht:graphics
name=\"Master_Doku_MarkusAndres38x.png\" src=\"pics/mu_f_vSlipLong.eps\"
-->
<div class=\"subfigcaption\"><span class=\"cmr-9\">(a)  The  friction  coefficient  in  dependence  on  the</span>
<span class=\"cmr-9\">longitudinal slip velocity.</span></div>                     </td></tr></tbody></table></div> &nbsp;
<a id=\"x1-34006r2\"></a><div class=\"subfigure\"><table><tbody><tr><td style=\"text-align: left;\"> <img src=\"../images/Master_Doku_MarkusAndres39x.png\" alt=\"PIC\" class=\"graphics\" width=\"177.82973pt\" height=\"131.61563pt\"><!--tex4ht:graphics
name=\"Master_Doku_MarkusAndres39x.png\" src=\"pics/fLong_f_vSlipLong.eps\"
-->
<div class=\"subfigcaption\"><span class=\"cmr-9\">(b)  The  longitudinal  force  in  dependence  on  the</span>

<span class=\"cmr-9\">longitudinal slip velocity.</span></div>                     </td></tr></tbody></table></div> </div>
<br> <div class=\"caption\"><table class=\"caption\"><tbody><tr style=\"vertical-align: baseline;\" class=\"caption\"><td class=\"id\">Figure&nbsp;1: </td><td class=\"content\">The dependence of force generation in the longitudinal direction on the
sliding velocity.</td></tr></tbody></table></div><!--tex4ht:label?: x1-34007r12 -->


<!--l. 58--><p class=\"noindent\"></p></td></tr></tbody></table></div><hr class=\"endfigure\">
<!--l. 60--><p class=\"noindent\">where one can also clearly recognize the two characteristic points of the curve. These are the
parameters of the model which were set to
</p>

vAdhesion = 0.3m/s <br>
vSlide = 1m/s <br>
muMaxN = 1 <br>
muMinN = 0.6

</html>"));
        end GetMu_vSlip;

        function SoftMaxTol
          "function for the transition from slip to sliding velocity used by the Combined Friction model."
          import SI = Modelica.SIunits;
          import Modelica.Math.log;

          parameter SI.Velocity tol = 0.1
            "to determine the transition between the two models";

          input SI.Velocity vIn "translational speed";
          input SI.Velocity vRotIn "speed due to rotation";

          output SI.Velocity vComb "combined speed";

        protected
          SI.Velocity v = abs(vIn);
          SI.Velocity vRot = abs(vRotIn);

        algorithm
          vComb := log(exp(v/tol) + exp(vRot/tol))*tol;
          annotation (Documentation(info="<html>

The influence of the
parameter <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">tol</span></span></span> on the transition between the two models is depicted in Figure&nbsp;<a href=\"#x1-37010r15\">3.15<!--tex4ht:ref: F_softmax --></a>.

</p><hr class=\"figure\"><div class=\"figure\"><table class=\"figure\"><tbody><tr class=\"figure\"><td class=\"figure\">


<a id=\"x1-37010r15\"></a>


<div class=\"center\">
<!--l. 189--><p class=\"noindent\">
<a id=\"x1-37006r1\"></a>
</p><div class=\"subfigure\"><table><tbody><tr><td style=\"text-align: left;\"> <img src=\"../images/Master_Doku_MarkusAndres61x.png\" alt=\"PIC\" class=\"graphics\" width=\"177.82973pt\" height=\"196.04024pt\"><!--tex4ht:graphics
name=\"Master_Doku_MarkusAndres61x.png\" src=\"pics/softmax2.eps\"
-->
           <div class=\"subfigcaption\"><span class=\"cmr-9\">(a) Result using tol = 2.</span></div>           </td></tr></tbody></table></div> &nbsp;
<a id=\"x1-37007r2\"></a><div class=\"subfigure\"><table><tbody><tr><td style=\"text-align: left;\"> <img src=\"../images/Master_Doku_MarkusAndres62x.png\" alt=\"PIC\" class=\"graphics\" width=\"177.82973pt\" height=\"196.04024pt\"><!--tex4ht:graphics
name=\"Master_Doku_MarkusAndres62x.png\" src=\"pics/softmax1.eps\"
-->
           <div class=\"subfigcaption\"><span class=\"cmr-9\">(b) Result using tol = 1.</span></div>           </td></tr></tbody></table></div>



<a id=\"x1-37008r3\"></a><div class=\"subfigure\"><table><tbody><tr><td style=\"text-align: left;\"> <img src=\"../images/Master_Doku_MarkusAndres63x.png\" alt=\"PIC\" class=\"graphics\" width=\"177.82973pt\" height=\"196.04024pt\"><!--tex4ht:graphics
name=\"Master_Doku_MarkusAndres63x.png\" src=\"pics/softmax01.eps\"
-->
          <div class=\"subfigcaption\"><span class=\"cmr-9\">(c) Result using tol = 0.1.</span></div>          </td></tr></tbody></table></div> &nbsp;
<a id=\"x1-37009r4\"></a><div class=\"subfigure\"><table><tbody><tr><td style=\"text-align: left;\"> <img src=\"../images/Master_Doku_MarkusAndres64x.png\" alt=\"PIC\" class=\"graphics\" width=\"177.82973pt\" height=\"196.04024pt\"><!--tex4ht:graphics
name=\"Master_Doku_MarkusAndres64x.png\" src=\"pics/softmax001.eps\"
-->
         <div class=\"subfigcaption\"><span class=\"cmr-9\">(d) Result using tol = 0.01.</span></div>         </td></tr></tbody></table></div> </div>
<br> <div class=\"caption\"><table class=\"caption\"><tbody><tr style=\"vertical-align: baseline;\" class=\"caption\"><td class=\"id\">Figure&nbsp;3.15: </td><td class=\"content\">The influence of the parameter <span class=\"cmtt-10x-x-109\">tol </span>on the transition between the two
frictional models.</td></tr></tbody></table></div><!--tex4ht:label?: x1-37010r15 -->



<!--l. 207--><p class=\"noindent\"></p></td></tr></tbody></table></div><hr class=\"endfigure\">
<!--l. 209--><p class=\"noindent\">Values that are much bigger or smaller than the used ones do not provide useful results. The
<span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">softMaxTol</span></span></span> function is implemented in the following way
</p>

</html>"));
        end SoftMaxTol;

        partial model SlipBase "partial base model for slip classes."
          import SI = Modelica.SIunits;

          extends WheelsAndTires.TireComponents.Utilities.Icons.TireComponents;

          outer output Real mu;

          annotation (Icon(
              Text(
                extent=[-100,68; 100,100],
                style(
                  color=10,
                  rgbcolor={135,135,135},
                  fillPattern=1),
                string="%name"),
              Ellipse(extent=[-22,42; 10,-14], style(
                  color=9,
                  rgbcolor={175,175,175},
                  fillColor=9,
                  rgbfillColor={175,175,175},
                  fillPattern=1)),
              Line(points=[-44,-42; 48,22],style(
                  color=0,
                  rgbcolor={0,0,0},
                  fillColor=0,
                  rgbfillColor={0,0,0},
                  fillPattern=1)),
              Polygon(points=[0,-12; 30,-12; 26,-10; 26,-14; 30,-12; 0,-12],
                  style(
                  color=0,
                  rgbcolor={0,0,0},
                  fillColor=0,
                  rgbfillColor={0,0,0},
                  fillPattern=1)),
              Polygon(points=[-4,-14; 28,8; 24,8; 26,4; 28,8; -4,-14],
                  style(
                  color=0,
                  rgbcolor={0,0,0},
                  fillColor=0,
                  rgbfillColor={0,0,0},
                  fillPattern=1))), Documentation(info="<html>

Base class defining icon and output variables.

</html>"));
        equation

        end SlipBase;

        model NoSlip "models ideal friction without slip."
          extends
            WheelsAndTires.TireComponents.Friction.SlipProperties.SlipBase;
          import Modelica.Constants.inf;
          import SI = Modelica.SIunits;

          outer output Real vSlipLong;
          outer output Real vSlipLat;
          outer output SI.Velocity vAd;
          outer output SI.Velocity vSl;

        equation
          vSlipLong = 0;
          vSlipLat = 0;

          vAd = 0;
          vSl = inf;
          mu = inf;

          annotation (Icon(
              Text(
                extent=[100,-68; -100,-100],
                style(color=0, rgbcolor={0,0,0}),
                string="no")), Documentation(info="<html>

The simplest way to model a tire's slip behavior is to assume an ideal tire having no slip at
all. This is done in the <span class=\"cmti-10x-x-109\">No Slip </span>class by setting
</p><table class=\"align\">
                                 <tbody><tr><td class=\"align-odd\"><span class=\"cmmi-10x-x-109\">v</span><sub><span class=\"cmmi-8\">SlipLong</span></sub></td>                                 <td class=\"align-even\"> = 0</td>                                                                   <td class=\"align-label\"><a id=\"x1-33001r16\"></a>
                                 </td></tr><tr><td class=\"align-odd\"><span class=\"cmmi-10x-x-109\">v</span><sub><span class=\"cmmi-8\">SlipLat</span></sub></td>                                  <td class=\"align-even\"> = 0<span class=\"cmmi-10x-x-109\">.</span></td>                                                                  <td class=\"align-label\"><a id=\"x1-33002r17\"></a>                               </td></tr></tbody></table>

<!--l. 12--><p class=\"noindent\">This introduces two holonomic constraints that result in the two contact point forces <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">fLat</span></span></span>
and <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">fLong</span></span></span>.

One property of the model is that it does not take into account the variable <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">Contact</span></span></span>. So in
the event that a model, which allows the tire to lift from the ground, is chosen in the <span class=\"cmti-10x-x-109\">Vertical</span>
<span class=\"cmti-10x-x-109\">Dynamics </span>class and the tire really does lift from the ground, it can still transmit forces
although it has no contact to the ground. That property is not a big issue, because the
combination of a model with the ability to lift from the ground but without slip is one
that would usually not be simulated. Normally, the slip is one of the first things
that is modeled. Additionally every model that imposes slip and sliding velocity
depends on the normal force. If there is no contact, the normal force will be zero and
therefore no longitudinal or lateral force can be generated, independent of the contact


variable.

</html>"));
        end NoSlip;

        model SlidingDryFricitionLong
          "models dry friction in longitudinal direction and ideal friction in lateral direction."
          extends
            WheelsAndTires.TireComponents.Friction.SlipProperties.SlipBase;
          import SI = Modelica.SIunits;

          parameter SI.Velocity vAdhesion = 0.3 "Velocity of maximum friction";
          parameter SI.Velocity vSlide = 1
            "Velocity over which full sliding occurs";
          final parameter Real dmu_dvSlip(
            final unit="N/s^2",
            final min=0) = 2/vAdhesion "Curves Gradient at zero crossing";

          parameter Real muMaxN = 1
            "maximum friction coefficient at nominal Load (index N)";
          parameter Real muMinN(min = 0) = 0.6
            "minimum friction coefficient at nominal Load (index N)";

          //SI.Distance xN;
          Real mu_vSlip;  // = (mu/vSlip) -> for symbolic resolving

          outer output SI.Force fLongSlip;
          outer input SI.Force fN;
          outer output SI.Velocity vSlipLat;
          outer input SI.Velocity vSlipLong;
          outer input SI.Velocity vSlip;
          outer output SI.Velocity vAd;
          outer output SI.Velocity vSl;
          outer input Real loadInfluence;
          outer input Boolean Contact;
          outer input SI.Position xCP[3];

        protected
          outer WheelsAndTires.Environment.Surface Surface;

        equation
          mu_vSlip = Surface.get_mu(xCP[1],xCP[3]) * loadInfluence *
            WheelsAndTires.TireComponents.Friction.SlipProperties.GetMu_vSlip(muMaxN, muMinN, dmu_dvSlip, vSlip, vAdhesion, vSlide);

          mu = noEvent(abs(mu_vSlip * vSlip));

          fLongSlip = noEvent(if Contact then -fN * (mu_vSlip) * vSlipLong else 0);
          vSlipLat = 0;

          vAd = vAdhesion;
          vSl = vSlide;
          annotation (Icon(
              Text(
                extent=[100,-68; -100,-100],
                style(color=0, rgbcolor={0,0,0}),
                string="Dry Long")), Documentation(info="<html>

This model utilizes the properties of the <span class=\"cmti-10x-x-109\">No Slip </span>model for the lateral force generation
but allowing slip in the longitudinal direction. Therefore, the same that is valid
for the <span class=\"cmti-10x-x-109\">No Slip </span>class is true for the lateral direction of the <span class=\"cmti-10x-x-109\">Sliding Dry Friction</span>
<span class=\"cmti-10x-x-109\">Longitudinal </span>class. Lateral forces can be transmitted if there is no contact to the
ground.
<!--l. 20--></p><p class=\"noindent\">The generation of the longitudinal force is based on Coulomb's law of dry friction.

What makes that model meaningful for the modeling of tires is that the friction
coefficient <span class=\"cmmi-10x-x-109\"> &#956 </span> depends on the (overall) sliding velocity. Otherwise that model would
not represent a tire accurately. The function that is used to calculate the friction
coefficient depending on the sliding velocity is shown in <span class=\"cite\">[<a href=\"Modelica://WheelsAndTires.UsersGuide.Literature\">Ril07</a>]</span> and <span class=\"cite\">[<a href=\"Modelica://WheelsAndTires.UsersGuide.Literature\">ZO09</a>]</span>. It is
a curve determined by a continuous interpolation between characteristic points
<span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">vAdhesion/muMax</span></span></span> and <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">vSlide/muMin</span></span></span>. One more parameter is the slope of the curve in
the origin. The slope is a final parameter as
this one is usually not that important and difficult to determine for the average user.

The result of this interpolation can be seen in Figure&nbsp;<a href=\"#x1-34005r1\">1(a)<!--tex4ht:ref: F_sDFL_mu_vLong --></a>, </p><hr class=\"figure\"><div class=\"figure\"><table class=\"figure\"><tbody><tr class=\"figure\"><td class=\"figure\">



<a id=\"x1-34007r12\"></a>


<div class=\"center\">
<!--l. 45--><p class=\"noindent\">
<a id=\"x1-34005r1\"></a>
</p><div class=\"subfigure\"><table><tbody><tr><td style=\"text-align: left;\"> <img src=\"../images/Master_Doku_MarkusAndres38x.png\" alt=\"PIC\" class=\"graphics\" width=\"177.82973pt\" height=\"133.88287pt\"><!--tex4ht:graphics
name=\"Master_Doku_MarkusAndres38x.png\" src=\"pics/mu_f_vSlipLong.eps\"
-->
<div class=\"subfigcaption\"><span class=\"cmr-9\">(a)  The  friction  coefficient  in  dependence  on  the</span>
<span class=\"cmr-9\">longitudinal slip velocity.</span></div>                     </td></tr></tbody></table></div> &nbsp;
<a id=\"x1-34006r2\"></a><div class=\"subfigure\"><table><tbody><tr><td style=\"text-align: left;\"> <img src=\"../images/Master_Doku_MarkusAndres39x.png\" alt=\"PIC\" class=\"graphics\" width=\"177.82973pt\" height=\"131.61563pt\"><!--tex4ht:graphics
name=\"Master_Doku_MarkusAndres39x.png\" src=\"pics/fLong_f_vSlipLong.eps\"
-->
<div class=\"subfigcaption\"><span class=\"cmr-9\">(b)  The  longitudinal  force  in  dependence  on  the</span>

<span class=\"cmr-9\">longitudinal slip velocity.</span></div>                     </td></tr></tbody></table></div> </div>
<br> <div class=\"caption\"><table class=\"caption\"><tbody><tr style=\"vertical-align: baseline;\" class=\"caption\"><td class=\"id\">Figure&nbsp;1: </td><td class=\"content\">The dependence of force generation in the longitudinal direction on the
sliding velocity.</td></tr></tbody></table></div><!--tex4ht:label?: x1-34007r12 -->


<!--l. 58--><p class=\"noindent\"></p></td></tr></tbody></table></div><hr class=\"endfigure\">
<!--l. 60--><p class=\"noindent\">where one can also clearly recognize the two characteristic points of the curve.


Important to notice is, that the <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">if</span></span></span> statement accounts for the <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">Contact</span></span></span> variable which would
not be necessary in general, because the normal force <span class=\"cmmi-10x-x-109\">f</span><sub><span class=\"cmmi-8\">N</span></sub> is 0 when there is no contact
resulting in <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">fLong</span></span></span> and <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">fLat</span></span></span> to obtain 0. Still, it has been implemented this way to ensure
that the <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">Contact</span></span></span> variable can have influence on the simulation result not depending on the
normal force.


</html>"));
        end SlidingDryFricitionLong;

        model SlidingDryFricition
          "models dry firction in longitudinal and lateral direction"
          extends
            WheelsAndTires.TireComponents.Friction.SlipProperties.SlipBase;
          import SI = Modelica.SIunits;

          parameter SI.Velocity vAdhesion = 0.3 "Velocity of maximum friction";
          parameter SI.Velocity vSlide = 1
            "Velocity over which full sliding occurs";
          final parameter Real dmu_dvSlip(
            final unit="N/s^2",
            final min=0) = 2/vAdhesion "Curves gradient at zero crossing";

          parameter Real muMaxN = 1 "Maximum friction coefficient at adhesion";
          parameter Real muMinN(min = 0) = 0.6
            "Friciton coefficient at full sliding";

          //SI.Distance xN;
          Real mu_vSlip;  // = (mu/vSlip) -> for symbolic resolving

          outer output SI.Force fLongSlip;
          outer output SI.Force fLatSlip;
          outer input SI.Force fN;
          outer input SI.Velocity vSlipLat;
          outer input SI.Velocity vSlipLong;
          outer input SI.Velocity vSlip;
          outer output SI.Velocity vAd;
          outer output SI.Velocity vSl;
          outer input Real loadInfluence;
          outer input Boolean Contact;
          outer input SI.Position xCP[3];

        protected
          outer WheelsAndTires.Environment.Surface Surface;

        equation
          mu_vSlip = Surface.get_mu(xCP[1],xCP[3]) * loadInfluence *
            WheelsAndTires.TireComponents.Friction.SlipProperties.GetMu_vSlip(muMaxN, muMinN, dmu_dvSlip, vSlip, vAdhesion, vSlide);
          mu = noEvent(abs(mu_vSlip * vSlip));

          fLongSlip = noEvent(if Contact then -fN * (mu_vSlip) * vSlipLong else 0);
          fLatSlip = noEvent(if Contact then -fN * (mu_vSlip) * vSlipLat else 0);

          vAd = vAdhesion;
          vSl = vSlide;
          annotation (Icon(
              Text(
                extent=[100,-68; -100,-100],
                style(color=0, rgbcolor={0,0,0}),
                string="Dry")), Documentation(info="<html>

The main difference between the <span class=\"cmti-10x-x-109\">Sliding Dry Friction </span>and the foregoing <span class=\"cmti-10x-x-109\">Sliding Dry Friction</span>
<span class=\"cmti-10x-x-109\">Long </span>is that now, lateral sliding velocity is possible as well. The characteristics for the
friction are the same in principle

<a id=\"x1-35003r13\"></a>


<div class=\"center\">
<!--l. 93--><p class=\"noindent\">
<a id=\"x1-35001r1\"></a>
</p><div class=\"subfigure\"><table><tbody><tr><td style=\"text-align: left;\"> <img src=\"../images/Master_Doku_MarkusAndres44x.png\" alt=\"PIC\" class=\"graphics\" width=\"177.82973pt\" height=\"133.88287pt\"><!--tex4ht:graphics
name=\"Master_Doku_MarkusAndres44x.png\" src=\"pics/mu_f_vSlip.eps\"
-->

<div class=\"subfigcaption\"><span class=\"cmr-9\">(a)  The  friction  coefficient  in  dependence  of  the</span>
<span class=\"cmr-9\">overall sliding velocity, with and without lateral slip</span>
<span class=\"cmr-9\">of 0</span><span class=\"cmmi-9\">.</span><span class=\"cmr-9\">2</span><span class=\"cmmi-9\">ms</span><sup><span class=\"cmsy-6\">-</span><span class=\"cmr-6\">1</span></sup><span class=\"cmr-9\">.</span></div>                               </td></tr></tbody></table></div> &nbsp;
<a id=\"x1-35002r2\"></a><div class=\"subfigure\"><table><tbody><tr><td style=\"text-align: left;\"> <img src=\"../images/Master_Doku_MarkusAndres45x.png\" alt=\"PIC\" class=\"graphics\" width=\"177.82973pt\" height=\"131.61563pt\"><!--tex4ht:graphics
name=\"Master_Doku_MarkusAndres45x.png\" src=\"pics/fLong_f_vSlip.eps\"
-->
<div class=\"subfigcaption\"><span class=\"cmr-9\">(b)  The  longitudinal  force  in  dependence  of  the</span>

<span class=\"cmr-9\">overall sliding velocity, with and without lateral slip</span>
<span class=\"cmr-9\">of 0</span><span class=\"cmmi-9\">.</span><span class=\"cmr-9\">2</span><span class=\"cmmi-9\">ms</span><sup><span class=\"cmsy-6\">-</span><span class=\"cmr-6\">1</span></sup><span class=\"cmr-9\">.</span></div>                               </td></tr></tbody></table></div> </div>
<br> <div class=\"caption\"><table class=\"caption\"><tbody><tr style=\"vertical-align: baseline;\" class=\"caption\"><td class=\"id\">Figure&nbsp;1: </td><td class=\"content\">The dependence of force generation on the overall sliding velocity with
two different cases shown.</td></tr></tbody></table></div><!--tex4ht:label?: x1-35003r13 -->



<!--l. 106--><p class=\"noindent\"></p></td></tr></tbody></table></div><hr class=\"endfigure\">
<!--l. 108--><p class=\"noindent\">but one has to keep in mind that a lateral slip velocity adds up to the total sliding in a
quadratic sense. Therefore, a lateral slip has an effect
on the frictional properties in the longitudinal direction as well.
<!--l. 111--></p><p class=\"noindent\">This effect is shown in Figure&nbsp;<a href=\"#x1-35003r13\">1<!--tex4ht:ref: F_slidingDryFriction --></a>, where a simulation of two different cases was carried out.
The second one adds a lateral
sliding velocity of 0<span class=\"cmmi-10x-x-109\">.</span>2<span class=\"cmmi-10x-x-109\">ms</span><sup><span class=\"cmsy-8\">-</span><span class=\"cmr-8\">1</span></sup> which results in the corresponding curves. In <a href=\"#x1-35002r2\">1(b)<!--tex4ht:ref: F_sDFL_f_vSlip --></a>, one can see
that the force available for the longitudinal force is reduced by the lateral sliding velocity. In

<a href=\"#x1-35001r1\">1(a)<!--tex4ht:ref: F_sDFL_mu_f_vSlip --></a> the friction coefficient is shown. It does not reach 0 in the case of <span class=\"cmmi-10x-x-109\">v</span><sub><span class=\"cmmi-8\">Lat</span></sub> = 0<span class=\"cmmi-10x-x-109\">.</span>2<span class=\"cmmi-10x-x-109\">ms</span><sup><span class=\"cmsy-8\">-</span><span class=\"cmr-8\">1</span></sup> due
to the fact that the overall slip velocity can not get 0<span class=\"cmmi-10x-x-109\">ms</span><sup><span class=\"cmsy-8\">-</span><span class=\"cmr-8\">1</span></sup> with <span class=\"cmmi-10x-x-109\">v</span><sub><span class=\"cmmi-8\">Lat</span></sub><span class=\"cmmi-10x-x-109\">?</span>0 during the
simulation. The \"jump\" of the friction coefficient at <span class=\"cmmi-10x-x-109\">v</span><sub><span class=\"cmmi-8\">SlipLong</span></sub> = 0 has its reasons in the
simulation. The lateral sliding velocity is realized by a ramp function, hence the
friction coefficient raises with the lateral sliding velocity from 0 to a value above
0.9.

<!--l. 113--></p>

</html>"));
        end SlidingDryFricition;

        model RillFriction "friction as described by Rill's TMEasy"
          extends
            WheelsAndTires.TireComponents.Friction.SlipProperties.SlipBase;
          import SI = Modelica.SIunits;

          parameter Real sLongAdhesion = 0.15
            "Slip for full adhesion in longitudinal direction.";
          parameter Real sLongSlide = 0.4
            "Slip for full sliding in longitudinal direction.";
          final parameter Real dmu_dsLongN(
            final unit="N/s^2",
            final min=0)=5/(sLongAdhesion) "Curves Gradient at zero crossing";

          parameter Real muLongMaxN(min = 0) = 1
            "Maximum friction coefficient at adhesion in longitudinal direction";
          parameter Real muLongMinN(min = 0) = 0.9
            "Minimum friction coefficient at full sliding in longitudinal direction";

          parameter Real sLatAdhesion = 0.15
            "Slip for full adhesion in lateral direction.";
          parameter Real sLatSlide = 0.4
            "Slip for full sliding in lateral direction.";
          final parameter Real dmu_dsLatN(
            final unit="N/s^2",
            final min=0)=5/(sLatAdhesion) "Curves Gradient at zero crossing";

          parameter Real muLatMaxN(min = 0) = 1
            "Maximum friction coefficient at adhesion in lateral direction";
          parameter Real muLatMinN(min = 0) = 0.6
            "Minimum friction coefficient at full sliding in lateral direction";

          //SI.Distance xN;
          Real mu_s;  // = (mu/vSlip) -> for symbolic resolving
          Real sAdhesion;
          Real sSlide;
          Real muMaxN;
          Real muMinN;
          Real dmu_dsN(
            final unit="N/s^2",
            final min=0);

          outer output SI.Force fLongSlip;
          outer output SI.Force fLatSlip;
          outer input SI.Force fN;
          outer input Real sLat;
          outer input Real sLong;
          outer input Real s;
          outer output Real sAd;
          outer output Real sSl;
          outer input Real loadInfluence;
          outer input Boolean Contact;
          outer input SI.Angle alpha;
          outer input SI.Position xCP[3];

          Real cosAlpha = cos(alpha);
          Real sinAlpha = sin(alpha);

        protected
          outer WheelsAndTires.Environment.Surface Surface;

        equation
          sAdhesion = sqrt((cosAlpha*sLongAdhesion)^2 + (sinAlpha*sLatAdhesion)^2);
          sSlide = sqrt((cosAlpha*sLongSlide)^2 + (sinAlpha*sLatSlide)^2);
          muMaxN = sqrt((cosAlpha*muLongMaxN)^2 + (sinAlpha*muLatMaxN)^2);
          muMinN = sqrt((cosAlpha*muLongMinN)^2 + (sinAlpha*muLatMinN)^2);
          dmu_dsN = sqrt((cosAlpha*dmu_dsLongN)^2 + (sinAlpha*dmu_dsLatN)^2);

          mu_s = Surface.get_mu(xCP[1],xCP[3]) * loadInfluence *
            WheelsAndTires.TireComponents.Friction.SlipProperties.GetMu_vSlip(muMaxN, muMinN, dmu_dsN, s, sAd, sSl);
          mu = noEvent(abs(mu_s * s));

          fLongSlip = noEvent(if Contact then fN * (mu_s) * sLong else 0);
          fLatSlip = noEvent(if Contact then fN * (mu_s) * sLat else 0);

          sAd = sAdhesion;
          sSl = sSlide;
          annotation (Icon(
              Text(
                extent=[100,-68; -100,-100],
                style(color=0, rgbcolor={0,0,0}),
                string="Rill")), Documentation(info="<html>

The major difference of the <span class=\"cmti-10x-x-109\">Rill Fricition </span>to the foregoing classes is that it depends on the
slip rather then the sliding velocity. Another difference is that friction properties for longitudinal and lateral
friction can separately be set by parameters. These are used during simulation
to determine the frictional properties in every slipping situation.


The interpolation for the friction coefficient is the same one that was used in the foregoing classes. It does not matter whether it is used based on sliding velocities or the slip.
</html>"));
        end RillFriction;

        model CombinedFriction
          "combines frictional models based on slip and sliding veloctiy."
          extends
            WheelsAndTires.TireComponents.Friction.SlipProperties.SlipBase;
          import SI = Modelica.SIunits;
          import Modelica.Math.log;

          parameter SI.Velocity vLongAdhesion = 0.3
            "Longitudinal speed at which the maximum friction occurs";
          parameter SI.Velocity vLongSlide = 1
            "Longitudinal speed over which full sliding occurs";
          parameter Real sLongAdhesion = 0.15
            "Longitudinal slip at which the maximum fricion occurs";
          parameter Real sLongSlide = 0.4
            "Longitudinal slip over which full sliding occurs";
          final parameter Real dmu_dvSlip_LongN(
            final unit="N/s^2",
            final min=0) = 1/(10*sLongAdhesion)
            "Curves gradient at zero crossing";
          parameter Real muLongMaxN(min = 0) = 1
            "Maximum longitudinal friction coefficient at nominal load";
          parameter Real muLongMinN(min = 0) = 0.6
            "Longitudinal friction coefficient at nominal load and full sliding";
          parameter SI.Velocity vLatAdhesion = 0.4
            "Lateral speed at which the maximum friction occurs";
          parameter SI.Velocity vLatSlide = 1.2
            "Lateral speed over which full sliding occurs";
          parameter Real sLatAdhesion = 0.2
            "Lateral slip at which the maximum fricion occurs";
          parameter Real sLatSlide = 0.5
            "Lateral slip over which full sliding occurs";
          final parameter Real dmu_dvSlip_LatN(
            final unit="N/s^2",
            final min=0) = 1/(10*sLongAdhesion)
            "Curves Gradient at zero crossing";
          parameter Real muLatMaxN(min = 0) = 1
            "Maximum lateral friction coefficient at nominal load";
          parameter Real muLatMinN(min = 0) = 0.6
            "Lateral friction coefficient at nominal load and full sliding";

          Real mu_vSlip;  // = (mu/vSlip) -> for symbolic resolving
          SI.Velocity vAdhesion;
          SI.Velocity vSlide;
          Real sAdhesion;
          Real sSlide;
          Real muMaxN;
          Real muMinN;
          Real dmu_dvSlipN(
            final unit="N/s^2",
            final min=0);
          SI.Velocity vAR;
          SI.Velocity vSR;

          outer output SI.Force fLongSlip;
          outer output SI.Force fLatSlip;
          outer input SI.Force fN;
          outer input Real vSlipLong;
          outer input Real vSlipLat;
          outer input Real vSlip;
          outer output Real vAd;
          outer output Real vSl;
          outer input Real loadInfluence;
          outer input Boolean Contact;
          outer input SI.Velocity vRotLong;
          outer input SI.Angle alpha;
          outer input SI.Position xCP[3];

          Real cosAlpha = cos(alpha);
          Real sinAlpha = sin(alpha);

        protected
          outer WheelsAndTires.Environment.Surface Surface;

        equation
          vAdhesion = sqrt((cosAlpha*vLongAdhesion)^2 + (sinAlpha*vLatAdhesion)^2);
          vSlide = sqrt((cosAlpha*vLongSlide)^2 + (sinAlpha*vLatSlide)^2);
          sAdhesion = sqrt((cosAlpha*sLongAdhesion)^2 + (sinAlpha*sLatAdhesion)^2);
          sSlide = sqrt((cosAlpha*sLongSlide)^2 + (sinAlpha*sLatSlide)^2);
          muMaxN = sqrt((cosAlpha*muLongMaxN)^2 + (sinAlpha*muLatMaxN)^2);
          muMinN = sqrt((cosAlpha*muLongMinN)^2 + (sinAlpha*muLatMinN)^2);
          dmu_dvSlipN = sqrt((cosAlpha*dmu_dvSlip_LongN)^2 + (sinAlpha*dmu_dvSlip_LatN)^2);

          vAR = WheelsAndTires.TireComponents.Friction.SlipProperties.SoftMaxTol(vAdhesion, sAdhesion * vRotLong);
          vSR = WheelsAndTires.TireComponents.Friction.SlipProperties.SoftMaxTol(vSlide, sSlide * vRotLong);

          mu_vSlip = Surface.get_mu(xCP[1],xCP[3]) * loadInfluence *
            WheelsAndTires.TireComponents.Friction.SlipProperties.GetMu_vSlip(muMaxN, muMinN, dmu_dvSlipN, vSlip, vAR, vSR);
          mu = noEvent(abs(mu_vSlip * vSlip));

          fLongSlip = noEvent(if Contact then -fN * (mu_vSlip) * vSlipLong else 0);
          fLatSlip = noEvent(if Contact then -fN * (mu_vSlip) * vSlipLat else 0);

          vAd = vAR;
          vSl = vSR;
          annotation (Icon(
              Text(
                extent=[100,-68; -100,-100],
                style(color=0, rgbcolor={0,0,0}),
                string="Combined")), Documentation(info="<html>

The <span class=\"cmti-10x-x-109\">Combined Friction </span>class is named this way because it combines the advantages that arise
from the usage of the sliding velocity and the ones that arise from the slip as a base for the
frictional forces. The method was published in a paper by the DLR <span class=\"cite\">[<a href=\"Modelica://WheelsAndTires.UsersGuide.Literature\">ZO09</a>]</span>. As it can be seen
easily from Figure&nbsp;<a href=\"#x1-37004r14\">1<!--tex4ht:ref: F_mu_vSlip_vRoll --></a>

<img src=\"../images/Master_Doku_MarkusAndres57x.png\" alt=\"PIC\" class=\"graphics\" width=\"177.82973pt\" height=\"196.04024pt\"><!--tex4ht:graphics
name=\"Master_Doku_MarkusAndres57x.png\" src=\"pics/mu_vSlip_vRoll_dry.eps\"
-->
       <div class=\"subfigcaption\"><span class=\"cmr-9\">(a) Based on the sliding velocity.</span></div>       </td></tr></tbody></table></div> &nbsp;
<a id=\"x1-37002r2\"></a><div class=\"subfigure\"><table><tbody><tr><td style=\"text-align: left;\"> <img src=\"../images/Master_Doku_MarkusAndres58x.png\" alt=\"PIC\" class=\"graphics\" width=\"177.82973pt\" height=\"196.04024pt\"><!--tex4ht:graphics
name=\"Master_Doku_MarkusAndres58x.png\" src=\"pics/mu_vSlip_vRoll_Rill.eps\"
-->
            <div class=\"subfigcaption\"><span class=\"cmr-9\">(b) Based on the slip.</span></div>            </td></tr></tbody></table></div>



<a id=\"x1-37003r3\"></a><div class=\"subfigure\"><table><tbody><tr><td style=\"text-align: left;\"> <img src=\"../images/Master_Doku_MarkusAndres59x.png\" alt=\"PIC\" class=\"graphics\" width=\"177.82973pt\" height=\"196.04024pt\"><!--tex4ht:graphics
name=\"Master_Doku_MarkusAndres59x.png\" src=\"pics/mu_vSlip_vRoll_DLR.eps\"
-->
      <div class=\"subfigcaption\"><span class=\"cmr-9\">(c) Based on a combination of both.</span></div>      </td></tr></tbody></table></div> </div>
<br> <div class=\"caption\"><table class=\"caption\"><tbody><tr style=\"vertical-align: baseline;\" class=\"caption\"><td class=\"id\">Figure&nbsp;1: </td><td class=\"content\">The friction coefficient in dependence on the overall sliding velocity and
the pitch angle velocity, depending on different physical quantities.</td></tr></tbody></table></div><!--tex4ht:label?: x1-37004r14 -->


<!--l. 178--><p class=\"noindent\"></p></td></tr></tbody></table></div><hr class=\"endfigure\">
<!--l. 180--><p class=\"noindent\">there are essential differences between the models that base on the sliding velocity which
were named ?dry sliding? models and the one based on the slip. The former does not change
its behavior with the pitch angle velocity and is therefore very stable but valid only for a
small velocity range. The model used by Rill in <span class=\"cite\">[<a href=\"Modelica://WheelsAndTires.UsersGuide.Literature\">Ril07</a>]</span> is better suited for higher rolling
velocities but gets stiff at low pitch angle velocities.

</html>"));
        end CombinedFriction;

        annotation (Icon, Documentation(info="<html>

This section is intended to describe models relating slip or sliding velocity to the forces acting on the contact point. There are basically three different approaches to calculate contact forces. One is to set the sliding velocity to 0, the second to use slip as a base, the last is to use sliding velocities. All have advantages over the other which will be explained in the following sections. One approach is shown that combines the advantages of both.

</html>"));
      end SlipProperties;

      package RollResistance
        "covers different possibilities to describe rolling resistance."
        annotation(preferedView="info");

      extends
          WheelsAndTires.TireComponents.Utilities.Icons.TireComponentsPackage;

        partial model RollResistanceBase
          "partial base model for rolling resistance"
          import SI = Modelica.SIunits;

          extends WheelsAndTires.TireComponents.Utilities.Icons.TireComponents;

          outer SI.Torque tRoll;

          annotation (Icon(
              Ellipse(extent=[-20,-16; 20,-56], style(color=0, rgbcolor={0,0,
                      0})),
              Rectangle(extent=[-20,-26; -6,-52], style(
                  color=7,
                  rgbcolor={255,255,255},
                  fillColor=7,
                  rgbfillColor={255,255,255},
                  fillPattern=1)),
              Rectangle(extent=[-26,-26; -12,-52],style(
                  color=7,
                  rgbcolor={255,255,255},
                  fillColor=7,
                  rgbfillColor={255,255,255},
                  fillPattern=1)),
              Text(
                extent=[-100,68; 100,100],
                style(
                  color=10,
                  rgbcolor={135,135,135},
                  fillPattern=1),
                string="%name"),
              Line(points=[-90,-38; 90,-38], style(color=0, rgbcolor={0,0,0})),
              Ellipse(extent=[-52,58; 46,-38], style(color=9, rgbcolor={175,175,
                      175})),
              Polygon(points=[-20,-28; -14,-16; -8,-22; -20,-28],
                                                               style(
                  color=7,
                  rgbcolor={255,255,255},
                  fillColor=0,
                  rgbfillColor={0,0,0},
                  fillPattern=1))), Documentation(info="<html>

The partial base class ensures <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">tRoll</span></span></span> to be an output of every model with <span class=\"cmti-10x-x-109\">No Roll Resistance</span>
setting it to 0 in the event that the rolling resistance should not be part of the
simulation.


</html>"));
        equation

        end RollResistanceBase;

        model NoRollResistance "no rolling resistance is modeled"
          extends RollResistanceBase;
        equation
          tRoll = 0;
          annotation (Icon(
              Text(
                extent=[100,-68; -100,-100],
                style(color=0, rgbcolor={0,0,0}),
                string="no")), Documentation(info="<html>

sets tRoll to 0.

</html>"));

        end NoRollResistance;

        model ConstRollResistance "rolling resistance is independent of speed"
          extends RollResistanceBase;
          import SI = Modelica.SIunits;

          parameter Real fR0 = 10e-3
            "Rolling resistance coefficient: usually in the range from 0.01 to 0.025";
          parameter SI.Radius rWheel = 14/2*2.54e-2+2e-2
            "The tires total radius";

          outer input SI.Force fN;
          outer input SI.Velocity vAd;
          outer input SI.AngularVelocity vRotLong;
          outer input Boolean Contact;

        equation
          tRoll = if abs(vRotLong) > vAd and Contact then -fN * fR0 * rWheel * sign(vRotLong) else
                  if Contact then -fN * fR0 * rWheel * vRotLong/vAd else
                  0;
          annotation (Icon(
              Text(
                extent=[100,-68; -100,-100],
                style(color=0, rgbcolor={0,0,0}),
                string="constant")), Documentation(info="<html>

The constant rolling resistance is specified by one parameter <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">fR0</span></span></span> The index 0 indicates that it is not velocity dependent.
In Figure&nbsp;<a href=\"#x1-40001r16\">1<!--tex4ht:ref: F_tRoll_const --></a>, </p><hr class=\"figure\"><div class=\"figure\"><table class=\"figure\"><tbody><tr class=\"figure\"><td class=\"figure\">


<a id=\"x1-40001r16\"></a>


<div class=\"center\">
<!--l. 19--><p class=\"noindent\">
<!--l. 20--></p><p class=\"noindent\"><img src=\"../images/Master_Doku_MarkusAndres67x.png\" alt=\"PIC\" class=\"graphics\" width=\"241.84843pt\" height=\"175.27408pt\"><!--tex4ht:graphics
name=\"Master_Doku_MarkusAndres67x.png\" src=\"pics/tRoll_const.eps\"
--></p></div>
<br> <div class=\"caption\"><table class=\"caption\"><tbody><tr style=\"vertical-align: baseline;\" class=\"caption\"><td class=\"id\">Figure&nbsp;1: </td><td class=\"content\">Constant roll resistance torque depending on the pitch angle velocity.</td></tr></tbody></table></div><!--tex4ht:label?: x1-40001r16 -->



<!--l. 24--><p class=\"noindent\"></p></td></tr></tbody></table></div><hr class=\"endfigure\">
<!--l. 26--><p class=\"noindent\">the result of the model is shown. The torque does not rise with growing velocity, but a
limitation has been added if the velocity gets lower than the velocity of adhesion <span class=\"cmmi-10x-x-109\">v</span><sub><span class=\"cmmi-8\">Ad</span></sub> to avoid
step like change at the zero crossing.

</html>"));

        end ConstRollResistance;

        model SpeedDependingRollResistance
          "rolling resistance depends on speed."
          extends RollResistanceBase;
          import SI = Modelica.SIunits;

          parameter Real fR0 = 1e-2
            "Factor for the constant part of the rolling resistance";
          parameter Real fR1 = 0.2e-2
            "Factor for the linearily rising part of the rolling resistance (with speed)";
          parameter Real fR4 = 0.1e-2
            "Factor for the part that rises with the power of 4 with the speed";
          parameter SI.Radius rWheel = 14/2*2.54e-2+2e-2 "Wheels total radius";

          outer input SI.Force fN;
          outer input SI.Velocity vAd;
          outer input SI.AngularVelocity vRotLong;
          outer input Boolean Contact;

          Real fR;

        equation
          fR = fR0 + fR1 * abs(vRotLong)/(100/3.6) + fR4 * (abs(vRotLong)/(100/3.6))^4;

          tRoll = if abs(vRotLong) > vAd and Contact then -fN * fR * rWheel * sign(vRotLong) else
                  if Contact then -fN * fR * rWheel * vRotLong/vAd else
                  0;
          annotation (Icon(
              Text(
                extent=[100,-68; -100,-100],
                style(color=0, rgbcolor={0,0,0}),
                string="velocityDepending")), Documentation(info="<html>

This model improves the accuracy of <span class=\"cmti-10x-x-109\">Constant Rolling Resistance </span>by the two additional
parameters <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">fR1</span></span></span> and <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">fR4</span></span></span> whereas the number indicates the order of term it is used in.
The speed dependent factor <span class=\"cmmi-10x-x-109\">f</span><sub><span class=\"cmmi-8\">R</span></sub> is then used instead of <span class=\"cmmi-10x-x-109\">f</span><sub><span class=\"cmmi-8\">R</span><span class=\"cmr-8\">0</span></sub> in Equation&nbsp;(<a href=\"#x1-40002r40\">3.40<!--tex4ht:ref: E_tRoll --></a>). This type of
model for the rolling resistance as well as the default parameters are shown in <span class=\"cite\">[<a href=\"Modelica://WheelsAndTires.UsersGuide.Literature\">MW03</a>]</span>.
Figure&nbsp;<a href=\"#x1-41002r17\">1<!--tex4ht:ref: F_tRoll_speed --></a> <hr class=\"figure\"><div class=\"figure\"><table class=\"figure\"><tbody><tr class=\"figure\"><td class=\"figure\">



<a id=\"x1-41002r17\"></a>


<div class=\"center\">
<!--l. 47--><p class=\"noindent\">
<!--l. 48--></p><p class=\"noindent\"><img src=\"../images/Master_Doku_MarkusAndres71x.png\" alt=\"PIC\" class=\"graphics\" width=\"241.84843pt\" height=\"173.32597pt\"><!--tex4ht:graphics
name=\"Master_Doku_MarkusAndres71x.png\" src=\"pics/tRoll_speed.eps\"
--></p></div>
<br> <div class=\"caption\"><table class=\"caption\"><tbody><tr style=\"vertical-align: baseline;\" class=\"caption\"><td class=\"id\">Figure&nbsp;1: </td><td class=\"content\">Speed dependent roll resistance torque depending on the pitch angle
velocity.</td></tr></tbody></table></div><!--tex4ht:label?: x1-41002r17 -->


<!--l. 52--><p class=\"noindent\"></p></td></tr></tbody></table></div><hr class=\"endfigure\">
<!--l. 54--><p class=\"noindent\">shows the rising rolling resistance in dependence of the velocity. The area close to the zero
crossing applies the same linear dependences below the velocity of full adhesion.
<!--l. 57--></p><p class=\"noindent\">There is no quadratic term in the equation because the quadratic term of the frictional force
acting on a vehicle is usually dominated by the aerodynamic forces, not by the
tire.

</p>

</html>"));

        end SpeedDependingRollResistance;
        annotation (Documentation(info="<html>

The rolling resistance is an effect that arises because the pressure distribution in
the tread shuffle is asymmetric and a number of other effects that shall not be
mentioned here. For a more detailed description, the reader is referred to <span class=\"cite\">[<a href=\"#XMitschke\">MW03</a>]</span>.
The result of these effects is that the normal force <span class=\"cmmi-10x-x-109\">f</span><sub><span class=\"cmmi-8\">N</span></sub> does not act in the middle
of the contact area but a certain distance in front of it. This positional shift in
longitudinal direction and the normal force result in a torque that tries to slow
down the movement of the tire. For reasons of generality, the measured positional
shift <span class=\"cmmi-10x-x-109\">x</span><sub><span class=\"cmmi-8\">R</span></sub> is usually divided by the tires radius <span class=\"cmmi-10x-x-109\">r </span>resulting in a friction coefficient

fR = xR/r.

<!--l. 9--><p class=\"noindent\">It is important to notice that no force has to be transmitted via the contact point in order to
make the rolling resistance slow down the tire. Therefore, it is possible to have a decreasing
tire velocity for a freely rolling wheel on a surface with a friction coefficient of
<span class=\"cmmi-10x-x-109\">&#956 </span>= 0.

<!--l. 11--></p>

</html>"));
      end RollResistance;

      package BoreTorque "covers models that describe the bore torque"
        annotation(preferedView="info");

      extends
          WheelsAndTires.TireComponents.Utilities.Icons.TireComponentsPackage;

        partial model BoreTorqueBase "partial base model for bore torque"
          import SI = Modelica.SIunits;

          extends WheelsAndTires.TireComponents.Utilities.Icons.TireComponents;

          outer output SI.Torque tBore;

          annotation (Icon(
              Text(
                extent=[-100,68; 100,100],
                style(
                  color=10,
                  rgbcolor={135,135,135},
                  fillPattern=1),
                string="%name"),
              Rectangle(extent=[-14,44; 10,-28], style(
                  color=9,
                  rgbcolor={175,175,175},
                  fillColor=9,
                  rgbfillColor={175,175,175})),
              Line(points=[-22,-32; -30,-24; -36,-12; -40,2; -40,18; -38,30;
                    -32,42; -28,48], style(
                  color=0,
                  rgbcolor={0,0,0},
                  fillColor=0,
                  rgbfillColor={0,0,0},
                  fillPattern=1)),
              Ellipse(extent=[-14,56; 10,32], style(
                  color=9,
                  rgbcolor={175,175,175},
                  fillColor=9,
                  rgbfillColor={175,175,175})),
              Ellipse(extent=[-14,-16; 10,-40], style(
                  color=9,
                  rgbcolor={175,175,175},
                  fillColor=9,
                  rgbfillColor={175,175,175})),
              Polygon(points=[-28,48; -26,46; -20,54; -30,50; -28,48; -28,48],
                  style(
                  color=0,
                  rgbcolor={0,0,0},
                  fillColor=0,
                  rgbfillColor={0,0,0},
                  fillPattern=1))), Documentation(info="<html>

The <span class=\"cmti-10x-x-109\">Bore Torque Base </span>is a partial class ensuring, that every class extending it has <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">tBore</span></span></span>
(the bore torque) as an output variable.

</html>"));
        end BoreTorqueBase;

        model NoBoreTorque "modles no bore torque"
          extends BoreTorqueBase;
        equation
          tBore = 0;
          annotation (Icon(
              Text(
                extent=[100,-68; -100,-100],
                style(color=0, rgbcolor={0,0,0}),
                string="no")), Documentation(info="<html>

<span class=\"cmti-10x-x-109\">No Bore Torque </span>is a simple class defining the output
<span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">tBore</span></span></span> to be zero. So this class is to be used if there is no bore torque shall be
modeled.


</html>"));
        end NoBoreTorque;

        model LinBoreTorque
          "models bore torque based on the pitch angle velocitiy with a maximum value"
          extends BoreTorqueBase;
          import SI = Modelica.SIunits;

          parameter Real muTurn = 0.8
            "Friction coefficient for the bore torque";

          outer input SI.Force fN;
          outer input SI.Length lCR;
          outer input SI.Length bCR;
          outer input SI.AngularVelocity wPlane;
          outer input SI.Velocity vRotLong;
          outer input Real loadInfluence;
          outer input Boolean Contact;

        equation
          tBore = noEvent(if abs(wPlane)*1/4*sqrt(lCR^2+bCR^2) < abs(vRotLong) and Contact then
            -fN * loadInfluence * muTurn * 1/16 * (lCR^2 + bCR^2) * wPlane/vRotLong else if Contact then
            -fN * loadInfluence * muTurn * 1/4  * sqrt(lCR^2+bCR^2) * sign(wPlane) else
            0);

          annotation (Icon(
              Text(
                extent=[100,-68; -100,-100],
                style(color=0, rgbcolor={0,0,0}),
                string="linear")),   DymolaStoredErrors,
            Documentation(info="<html>

The linear bore torque model is a modified version of the one that is shown in <span class=\"cite\">[<a href=\"Modelica://WheelsAndTires.UsersGuide.Literature\">ZO09</a>]</span>. It has
been modified to better suit friction models that do not use <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">vAd</span></span></span> and <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">vSl</span></span></span> as a base.

The result of this model can be seen in Figure&nbsp;<a href=\"#x1-44002r18\">1<!--tex4ht:ref: F_BoreLin --></a>. </p><hr class=\"figure\"><div class=\"figure\"><table class=\"figure\"><tbody><tr class=\"figure\"><td class=\"figure\">



<a id=\"x1-44002r18\"></a>


<div class=\"center\">
<!--l. 27--><p class=\"noindent\">
<!--l. 28--></p><p class=\"noindent\"><img src=\"../images/Master_Doku_MarkusAndres73x.png\" alt=\"PIC\" class=\"graphics\" width=\"241.84843pt\" height=\"185.82448pt\"><!--tex4ht:graphics
name=\"Master_Doku_MarkusAndres73x.png\" src=\"pics/BoreLin.eps\"
--></p></div>
<br> <div class=\"caption\"><table class=\"caption\"><tbody><tr style=\"vertical-align: baseline;\" class=\"caption\"><td class=\"id\">Figure&nbsp;1: </td><td class=\"content\">The bore torque depending on the turning speed at different pitch angle
velocities in the linear model.</td></tr></tbody></table></div><!--tex4ht:label?: x1-44002r18 -->


<!--l. 32--><p class=\"noindent\"></p></td></tr></tbody></table></div><hr class=\"endfigure\">
<!--l. 34--><p class=\"noindent\">The bore torque strongly depends on the pitch rotation velocity of the tire which is true
according to experience. But for every driving situation the torque is limited to the
maximum value that depends on the size of the contact area, which in turn depends on the
normal load via the vertical dynamics determined in the elevation class. From Figure&nbsp;<a href=\"#x1-44002r18\">1<!--tex4ht:ref: F_BoreLin --></a>
one can see that the situation of the tread elements sticking to the ground is not modeled
assuming an immediate sliding of the tread elements.

<!--l. 36--></p>

</html>"));
        end LinBoreTorque;

        model CombinedBoreTorque
          "models bore torque based on the adhesive sliding velocity with a maximum value"
          extends BoreTorqueBase;
          import Modelica.Constants.inf;
          import Modelica.Constants.eps;
          import SI = Modelica.SIunits;

          parameter Real muTurn = 0.8
            "Friction coefficient for the bore torque";

          outer input SI.Force fN;
          outer input SI.Length lCR;
          outer input SI.Length bCR;
          outer input SI.Velocity vAd;
          outer input SI.Velocity vSl;
          outer input SI.AngularVelocity wPlane;
          outer input SI.Velocity vRotLong;
          outer input Real loadInfluence;
          outer input Boolean Contact;

        equation
          //assert(abs(vAd) >= eps and vSl <= inf, "The model in SlipProperties has to have a slip for the BoreTorque to be computed. Either use a different model for slip or use the noBoreTorque model");
          tBore = noEvent( if abs(wPlane)*1/4*sqrt(lCR^2+bCR^2) < abs(vAd) and Contact then
            -fN * loadInfluence * muTurn * 1/16 * (lCR^2 + bCR^2) * wPlane/vAd else if Contact then
            -fN * loadInfluence * muTurn * 1/4  * sqrt(lCR^2+bCR^2) * sign(wPlane) else
            0);

          annotation (Icon(
              Text(
                extent=[100,-68; -100,-100],
                style(color=0, rgbcolor={0,0,0}),
                string="Combined")), Documentation(info="<html>

<p>
The <span class=\"cmti-10x-x-109\">Combined Bore Torque </span>model is basically the same as the foregoing model. The main
difference is that for the <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">if</span></span></span> condition, not the pitch rotation speed is used, but
the velocity of adherence. This is a valid assumption if this velocity of adhering
changes with the pitch rotation velocity, what is true for the <span class=\"cmti-10x-x-109\">Combined Friction</span>.
Therefore, this model should just be used in combination with the combined model for
friction.</p>

The results of this model are shown in Figure&nbsp;<a href=\"#x1-45002r19\">1<!--tex4ht:ref: F_BoreDLR --></a>. </p><hr class=\"figure\"><div class=\"figure\"><table class=\"figure\"><tbody><tr class=\"figure\"><td class=\"figure\">


<a id=\"x1-45002r19\"></a>


<div class=\"center\">
<!--l. 60--><p class=\"noindent\">
<!--l. 61--></p><p class=\"noindent\"><img src=\"../images/Master_Doku_MarkusAndres75x.png\" alt=\"PIC\" class=\"graphics\" width=\"241.84843pt\" height=\"180.52357pt\"><!--tex4ht:graphics
name=\"Master_Doku_MarkusAndres75x.png\" src=\"pics/BoreDLR.eps\"
--></p></div>
<br> <div class=\"caption\"><table class=\"caption\"><tbody><tr style=\"vertical-align: baseline;\" class=\"caption\"><td class=\"id\">Figure&nbsp;1: </td><td class=\"content\">The bore torque depending on the turning speed at different rotational
velocities in the model from <span class=\"cite\">[<a href=\"Modelica://WheelsAndTires.UsersGuide.Literature\">ZO09</a>]</span>.</td></tr></tbody></table></div><!--tex4ht:label?: x1-45002r19 -->



<!--l. 65--><p class=\"noindent\"></p></td></tr></tbody></table></div><hr class=\"endfigure\">
<!--l. 67--><p class=\"noindent\">Although the value for <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">vAd</span></span></span> changes slightly during the simulation, the pitch rotation velocity
is too low to get big differences in <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">vAd</span></span></span> that would result in a curve with a lower slope. The
reason for that is the offset in <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">vAd</span></span></span> that comes from the <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">softMaxTol</span></span></span> function.

</html>"));
        end CombinedBoreTorque;
        annotation (Documentation(info="<html>

Bore torque appears when the tire is rotated around its vertical axis at a yaw rate not equal to 0. In the contact area, parts are sticking to the ground and therefore a kind of
spring has to be stretched to get the tire spinning until the parts of the tread shuffle start
sliding. The bore torque is the physical quantity that is used to describe that characteristic.
It always counteracts this rotating movement. For a more detailed description, the reader is
referred to <span class=\"cite\">[<a href=\"Modelica://WheelsAndTires.UsersGuide.Literature\">Ril07</a>]</span>

</html>"));
      end BoreTorque;

      package CamberForce "contains models to describe the camber force."
        annotation(preferedView="info");

      extends
          WheelsAndTires.TireComponents.Utilities.Icons.TireComponentsPackage;

        partial model CamberForceBase
          "partial base model for camber force classes.partial base model for the camber force"
          import SI = Modelica.SIunits;

          extends WheelsAndTires.TireComponents.Utilities.Icons.TireComponents;

          outer output SI.Velocity vLatCamber;

          annotation (Icon(
              Text(
                extent=[-100,68; 100,100],
                style(
                  color=10,
                  rgbcolor={135,135,135},
                  fillPattern=1),
                string="%name"),
              Line(points=[-40,-36; 48,-36],style(
                  color=0,
                  rgbcolor={0,0,0},
                  fillColor=0,
                  rgbfillColor={0,0,0},
                  fillPattern=1)),
              Polygon(points=[-14,-36; 6,28; 18,28; -2,-36; -14,-36], style(
                  color=9,
                  rgbcolor={175,175,175},
                  fillColor=9,
                  rgbfillColor={175,175,175})),
              Polygon(points=[-8,-36; 28,-38; 28,-42; 40,-36; 28,-30; 28,-34;
                    -8,-36],       style(
                  color=0,
                  rgbcolor={0,0,0},
                  fillColor=0,
                  rgbfillColor={0,0,0},
                  fillPattern=1)),
              Line(points=[-2,46; -2,-24; 16,46],   style(
                  color=0,
                  rgbcolor={0,0,0},
                  fillColor=0,
                  rgbfillColor={0,0,0},
                  fillPattern=1)),
              Polygon(points=[-2,42; 2,44; 2,40; -2,42],       style(
                  color=0,
                  rgbcolor={0,0,0},
                  fillColor=0,
                  rgbfillColor={0,0,0},
                  fillPattern=1)),
              Polygon(points=[12,44; 14,40; 10,40; 12,44],     style(
                  color=0,
                  rgbcolor={0,0,0},
                  fillColor=0,
                  rgbfillColor={0,0,0},
                  fillPattern=1)),
              Line(points=[2,42; 6,42; 8,42; 14,40],        style(
                  color=0,
                  rgbcolor={0,0,0},
                  fillColor=0,
                  rgbfillColor={0,0,0},
                  fillPattern=1)),
              Text(
                extent=[-36,54; -2,32],
                style(
                  color=0,
                  rgbcolor={0,0,0},
                  fillColor=0,
                  rgbfillColor={0,0,0},
                  fillPattern=1),
                string="phi"),
              Text(
                extent=[28,-8; 62,-30],
                style(
                  color=0,
                  rgbcolor={0,0,0},
                  fillColor=0,
                  rgbfillColor={0,0,0},
                  fillPattern=1),
                string="Flat")), Documentation(info="<html>

The model <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">CamberForceBase</span></span></span> ensures that variable <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">vLatCamber</span></span></span> is calculated somehow.

</html>"));
        end CamberForceBase;

        model NoCamberForce "does not model camber force"
          extends CamberForceBase;

        equation
          vLatCamber = 0;

          annotation (Icon(
              Text(
                extent=[100,-68; -100,-100],
                style(color=0, rgbcolor={0,0,0}),
                string="no")), Documentation(info="<html>

<span class=\"cmti-10x-x-109\">No Camber Force </span>just sets <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">vLatCamber</span></span></span> to 0.


</html>"));
        end NoCamberForce;

        model SimpleCamberSpeed
          "models camber forces linarly depending on the camber velocity."
          extends CamberForceBase;
          import SI = Modelica.SIunits;

          parameter Real camberGain = 1
            "Gain factor for the influence of the camber speed";
          parameter SI.Radius rWheel = 14/2*2.54e-2+2e-2 "Wheels total radius";

          //SI.Time tContact;
          SI.Distance camberDeflection;

          outer output SI.Velocity vLatCamber;
          outer input SI.Angle phi;
          outer input Boolean Contact;
          outer input SI.Length lCR;
          outer input Real eN[3];
          outer input Real eAxis[3];
          outer input SI.Velocity vRotLong;

        equation
          camberDeflection = (rWheel - rWheel * sqrt(1-(lCR/(2*rWheel))^2)) * sin(phi);

          vLatCamber = noEvent( if (Contact  and lCR > 0) then camberGain * camberDeflection * vRotLong /(2 * lCR) else 0);

          annotation (Icon(
              Text(
                extent=[100,-68; -100,-100],
                style(color=0, rgbcolor={0,0,0}),
                string="linear")), Documentation(info="<html>

The <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">linCamberSpeed</span></span></span> model is based on the assumption mentioned in the introduction. It
calculates the speed of the parts in the contact area and adds it to the lateral sliding velocity. The result is qualitatively the same as shown in the Information of the <i>Combined Camber Speed</i> model.

</html>"));
        end SimpleCamberSpeed;

        model CombinedCamberSpeed
          "models camber forces linarly depending on the camber pitch angle velocity."
          extends CamberForceBase;
          import SI = Modelica.SIunits;

          parameter Real camberGain = 20
            "Gain factor for the influence of the camber speed";
          parameter SI.Radius rWheel = 14/2*2.54e-2+2e-2 "Wheels total radius";

          SI.Distance camberDeflection;

          outer input SI.Angle phi;
          outer input Boolean Contact;
          outer input SI.Length lCR;
          outer input Real eN[3];
          outer input Real eAxis[3];
          outer input SI.Velocity vRotLong;

        equation
          camberDeflection = (rWheel - rWheel * sqrt(1-(lCR/(2*rWheel))^2)) * sin(phi);

          vLatCamber = noEvent( if (Contact  and lCR > 0) then camberGain * camberDeflection * vRotLong else 0);

          annotation (Icon(
              Text(
                extent=[100,-68; -100,-100],
                style(color=0, rgbcolor={0,0,0}),
                string="Combined")), Documentation(info="<html>

<p>
The foregoing model was based on assumptions that were taken from <span class=\"cite\">[<a href=\"Modelica://WheelsAndTires.UsersGuide.Literature\">ZO09</a>]</span> and
modified them partially. <span class=\"cmti-10x-x-109\">Combined Camber Speed </span>is taken directly from <span class=\"cite\">[<a href=\"Modelica://WheelsAndTires.UsersGuide.Literature\">ZO09</a>]</span>
and utilizes the same equations for the calculation of the camber deflections. The
following equations differ a little, with the argumentation for that to be looked up
in <span class=\"cite\">[<a href=\"Modelica://WheelsAndTires.UsersGuide.Literature\">ZO09</a>]</span>.
</p>

<p>
The result of this model is depicted in the figure below.
<div class=\"center\">
<!--l. 27--><p class=\"noindent\">
<!--l. 28--></p><p class=\"noindent\"><img src=\"../images/Master_Doku_MarkusAndres74x.png\" alt=\"PIC\" class=\"graphics\" width=\"241.84843pt\" height=\"185.82448pt\"><!--tex4ht:graphics
name=\"Master_Doku_MarkusAndres74x.png\" src=\"pics/BoreLin.eps\"
--></p></div>
<br> <div class=\"caption\"><table class=\"caption\"><tbody><tr style=\"vertical-align: baseline;\" class=\"caption\"><td class=\"id\">Figure&nbsp;1: </td><td class=\"content\">The camber speed depending on the lean angle.</td></tr></tbody></table></div><!--tex4ht:label?: x1-44002r18 -->
</html>"));
        end CombinedCamberSpeed;
        annotation (Documentation(info="<html>

The effect of camber force has its reason in the lean angle of a wheel. The elements in the
tread shuffle can not follow their natural path because they stick on the ground during the
contact phase. That effect produces a force that adds up to the lateral force and its origin is
shown in Figure&nbsp;<a href=\"#x1-46001r20\">1<!--tex4ht:ref: F_Camber_Force --></a>. </p><hr class=\"figure\"><div class=\"figure\"><table class=\"figure\"><tbody><tr class=\"figure\"><td class=\"figure\">


<a id=\"x1-46001r20\"></a>


<div class=\"center\">
<!--l. 7--><p class=\"noindent\">
<!--l. 8--></p><p class=\"noindent\"><img src=\"../images/Master_Doku_MarkusAndres76x.png\" alt=\"PIC\" class=\"graphics\" width=\"355.65945pt\" height=\"292.19058pt\"><!--tex4ht:graphics
name=\"Master_Doku_MarkusAndres76x.png\" src=\"pics/Camber_Force.eps\"
--></p></div>
<br> <div class=\"caption\"><table class=\"caption\"><tbody><tr style=\"vertical-align: baseline;\" class=\"caption\"><td class=\"id\">Figure&nbsp;1: </td><td class=\"content\">View of a wheel with lean angle and highlighted contact area including a
sketch of the maximal camber deflection.</td></tr></tbody></table></div><!--tex4ht:label?: x1-46001r20 -->



<!--l. 12--><p class=\"noindent\"></p></td></tr></tbody></table></div><hr class=\"endfigure\">
<!--l. 14--><p class=\"noindent\">As pointed out by <span class=\"cite\">[<a href=\"Modelica://WheelsAndTires.UsersGuide.Literature\">ZO09</a>]</span> and presented in <span class=\"cite\">[<a href=\"Modelica://WheelsAndTires.UsersGuide.Literature\">Ril07</a>]</span>, <span class=\"cite\">[<a href=\"Modelica://WheelsAndTires.UsersGuide.Literature\">Pac06</a>]</span> the force that results from a
camber angle can be modeled by an additional sliding velocity, which adds up to the lateral
sliding velocity. This is a convenient way because all the properties of the friction model stay
valid automatically.

<!--l. 16--></p>

</html>"));
      end CamberForce;

      package LoadInflunce
        "covers models to describe the influence of the normal load."
        annotation(preferedView="info");

      extends
          WheelsAndTires.TireComponents.Utilities.Icons.TireComponentsPackage;

        partial model FrictionLoadInfluenceBase
          "partial base model for the influence of normal load."
          outer output Real loadInfluence;

          extends WheelsAndTires.TireComponents.Utilities.Icons.TireComponents;

          annotation (Icon(
              Text(
                extent=[-100,68; 100,100],
                style(
                  color=10,
                  rgbcolor={135,135,135},
                  fillPattern=1),
                string="%name"),
              Line(points=[-56,34; -56,-58],   style(color=8)),
              Polygon(points=[-56,46; -60,30; -52,30; -56,46],     style(
                  color=8,
                  fillColor=8,
                  fillPattern=1)),
              Text(
                extent=[-82,64; -62,46],
                style(
                  color=9,
                  rgbcolor={175,175,175},
                  fillColor=85,
                  rgbfillColor={255,0,128},
                  fillPattern=1),
                string="mu"),
              Line(points=[-62,-52; 52,-52],   style(color=8)),
              Text(
                extent=[68,-56; 84,-74],
                style(
                  color=9,
                  rgbcolor={175,175,175},
                  fillColor=85,
                  rgbfillColor={255,0,128},
                  fillPattern=1),
                string="fN"),
              Polygon(points=[66,-52; 50,-48; 50,-56; 66,-52],     style(
                  color=8,
                  fillColor=8,
                  fillPattern=1))), Documentation(info="<html>

Besides the icon the <span class=\"cmti-10x-x-109\">Friction Load Influence Base </span>defines the factor <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">loadInfluence</span></span></span> to be
defined by the models that extend this base.


</html>"));
        end FrictionLoadInfluenceBase;

        model LinLoadInfluence
          "models a linear influence of the normal load on the fricition."
          extends FrictionLoadInfluenceBase;

        equation
          loadInfluence = 1;
          annotation (Icon(
              Line(points=[48,10; -56,10], style(
                  color=0,
                  rgbcolor={0,0,0},
                  fillColor=10,
                  rgbfillColor={135,135,135},
                  fillPattern=1)),
              Text(
                extent=[100,-68; -100,-100],
                style(color=0, rgbcolor={0,0,0}),
                string="linear")), Documentation(info="<html>

<span class=\"cmti-10x-x-109\">Linear Load Influence </span>is a quite simple model defining the factor <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">loadInfluence</span></span></span> to be 1.
This results in a tire capable of transmitting driving forces which rise linearly with the
normal load. Although this is not a very realistic model, it makes it possible to
understand complex driving situations more easily and is therefore very useful for the
modeler when trying to understand more complex simulations e.g.&nbsp;when searching for
errors.


</html>"));
        end LinLoadInfluence;

        model QuadraticLoadInfluence
          "models a nonlinear influence of the normal load on the friction coefficient."
          extends FrictionLoadInfluenceBase;
          import SI = Modelica.SIunits;

          parameter Real muN = 1 "Friction coeffient at nominal load";
          parameter Real mu2N = 0.75
            "Fricition coefficient at twice the nominal load";
          parameter SI.Force fNNominal = 3e3 "The nominal load of the tire";

          outer input SI.Force fN;

          SI.Force fNSat = fNNominal * (2*muN - mu2N)/(2*(muN-mu2N));

        equation
          loadInfluence = if fN <= fNSat then
                          (2*muN - mu2N) - (muN - mu2N)*fN/fNNominal else
                          (2*muN - mu2N)^2/(4*(muN - mu2N))*fNNominal/fN;

          annotation (Icon(
              Line(points=[48,-6; -56,22], style(
                  color=0,
                  rgbcolor={0,0,0},
                  fillColor=10,
                  rgbfillColor={135,135,135},
                  fillPattern=1)),
              Text(
                extent=[100,-68; -100,-100],
                style(color=0, rgbcolor={0,0,0}),
                string="quadratic")), Documentation(info="<html>

The <span class=\"cmti-10x-x-109\">Quadratic Load Influence </span>model from <span class=\"cite\">[<a href=\"Modelica://WheelsAndTires.UsersGuide.Literature\">ZO09</a>]</span> makes the coefficient of friction µ
dependent on the normal load. This combined with the fact that <span class=\"cmmi-10x-x-109\">&#956 </span>gets multiplied
with the normal load in the reasonable models for slip properties is the reason
for the quadratic behavior of the overall model with a maximum of the contact
forces at <span class=\"cmmi-10x-x-109\">f</span><sub><span class=\"cmmi-8\">NSat</span></sub>. If the normal force rises further, the contact forces stay constant
due to a decreasing friction coefficient.


Figure&nbsp;<a href=\"#x1-53007r21\">1<!--tex4ht:ref: F_loadInfluence_fN --></a> </p><hr class=\"figure\"><div class=\"figure\"><table class=\"figure\"><tbody><tr class=\"figure\"><td class=\"figure\">


<a id=\"x1-53007r21\"></a>


<div class=\"center\">
<!--l. 31--><p class=\"noindent\">
<a id=\"x1-53003r1\"></a>
</p><div class=\"subfigure\"><table><tbody><tr><td style=\"text-align: left;\"> <img src=\"../images/Master_Doku_MarkusAndres84x.png\" alt=\"PIC\" class=\"graphics\" width=\"177.82973pt\" height=\"132.2182pt\"><!--tex4ht:graphics
name=\"Master_Doku_MarkusAndres84x.png\" src=\"pics/loadInfluence_fN.eps\"
-->
<div class=\"subfigcaption\"><span class=\"cmr-9\">(a) </span><span class=\"cmtt-9\">loadInfluence </span><span class=\"cmr-9\">= </span><span class=\"cmmi-9\">f</span><span class=\"cmr-9\">(</span><span class=\"cmmi-9\">f</span><sub><span class=\"cmmi-6\">N</span></sub><span class=\"cmr-9\">) for usual values of </span><span class=\"cmmi-9\">f</span><sub><span class=\"cmmi-6\">N</span></sub><span class=\"cmr-9\">.</span></div></td></tr></tbody></table></div> &nbsp;

<a id=\"x1-53004r2\"></a><div class=\"subfigure\"><table><tbody><tr><td style=\"text-align: left;\"> <img src=\"../images/Master_Doku_MarkusAndres85x.png\" alt=\"PIC\" class=\"graphics\" width=\"177.82973pt\" height=\"130.14696pt\"><!--tex4ht:graphics
name=\"Master_Doku_MarkusAndres85x.png\" src=\"pics/loadInfluence_fN_big.eps\"
-->
<div class=\"subfigcaption\"><span class=\"cmr-9\">(b) </span><span class=\"cmtt-9\">loadInfluence </span><span class=\"cmr-9\">= </span><span class=\"cmmi-9\">f</span><span class=\"cmr-9\">(</span><span class=\"cmmi-9\">f</span><sub><span class=\"cmmi-6\">N</span></sub><span class=\"cmr-9\">) for very big values of</span>
<span class=\"cmmi-9\">f</span><sub><span class=\"cmmi-6\">N</span></sub><span class=\"cmr-9\">.</span></div>                                     </td></tr></tbody></table></div>
<a id=\"x1-53005r3\"></a><div class=\"subfigure\"><table><tbody><tr><td style=\"text-align: left;\"> <img src=\"../images/Master_Doku_MarkusAndres86x.png\" alt=\"PIC\" class=\"graphics\" width=\"177.82973pt\" height=\"127.30188pt\"><!--tex4ht:graphics
name=\"Master_Doku_MarkusAndres86x.png\" src=\"pics/loadInfluence_fLong_usual.eps\"
-->

<div class=\"subfigcaption\"><span class=\"cmr-9\">(c) </span><span class=\"cmmi-9\">f</span><sub><span class=\"cmmi-6\">Long</span></sub>  <span class=\"cmr-9\">=  </span><span class=\"cmmi-9\">f</span><span class=\"cmr-9\">(</span><span class=\"cmmi-9\">f</span><sub><span class=\"cmmi-6\">N</span></sub><span class=\"cmr-9\">)  for  usual  values  of  </span><span class=\"cmmi-9\">f</span><sub><span class=\"cmmi-6\">N</span></sub>  <span class=\"cmr-9\">at  full</span>
<span class=\"cmr-9\">sliding.</span></div>                                   </td></tr></tbody></table></div> &nbsp;



<a id=\"x1-53006r4\"></a><div class=\"subfigure\"><table><tbody><tr><td style=\"text-align: left;\"> <img src=\"../images/Master_Doku_MarkusAndres87x.png\" alt=\"PIC\" class=\"graphics\" width=\"177.82973pt\" height=\"125.5804pt\"><!--tex4ht:graphics
name=\"Master_Doku_MarkusAndres87x.png\" src=\"pics/loadInfluence_fLong_big.eps\"
-->
<div class=\"subfigcaption\"><span class=\"cmr-9\">(d) </span><span class=\"cmmi-9\">f</span><sub><span class=\"cmmi-6\">Long</span></sub> <span class=\"cmr-9\">= </span><span class=\"cmmi-9\">f</span><span class=\"cmr-9\">(</span><span class=\"cmmi-9\">f</span><sub><span class=\"cmmi-6\">N</span></sub><span class=\"cmr-9\">) for very big values of </span><span class=\"cmmi-9\">f</span><sub><span class=\"cmmi-6\">N</span></sub> <span class=\"cmr-9\">at full</span>

<span class=\"cmr-9\">sliding.</span></div>                                   </td></tr></tbody></table></div> </div>
<br> <div class=\"caption\"><table class=\"caption\"><tbody><tr style=\"vertical-align: baseline;\" class=\"caption\"><td class=\"id\">Figure&nbsp;1: </td><td class=\"content\">The load influence factor and longitudinal friction force in dependence of
the normal load <span class=\"cmmi-10x-x-109\">f</span><sub><span class=\"cmmi-8\">N</span></sub>.</td></tr></tbody></table></div><!--tex4ht:label?: x1-53007r21 -->


<!--l. 51--><p class=\"noindent\"></p></td></tr></tbody></table></div><hr class=\"endfigure\">
<!--l. 53--><p class=\"noindent\">shows the values of the <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">loadInfluence</span></span></span> factor as well as the corresponding longitudinal force
at full sliding. The used values are the defaults of the model which are <span class=\"cmmi-10x-x-109\">f</span><sub><span class=\"cmmi-8\">N</span></sub> = 3<span class=\"cmmi-10x-x-109\">kN</span>, <span class=\"cmmi-10x-x-109\">µ</span><sub><span class=\"cmmi-8\">N</span></sub> = 1
and <span class=\"cmmi-10x-x-109\">µ</span><sub><span class=\"cmr-8\">2</span><span class=\"cmmi-8\">N</span></sub> = 0<span class=\"cmmi-10x-x-109\">.</span>75. Full sliding has been chosen because then the friction coefficient does not
change during the simulation due to varying slip. Figure&nbsp;<a href=\"#x1-53003r1\">1(a)<!--tex4ht:ref: F_loadInfluence_fN_usual --></a> shows the factor in a usual
range of <span class=\"cmmi-10x-x-109\">f</span><sub><span class=\"cmmi-8\">N</span></sub>, whereas Figure&nbsp;<a href=\"#x1-53004r2\">1(b)<!--tex4ht:ref: F_loadInfluence_fN_big --></a> shows the behavior of the model when very big normal
loads are acting. These are not representative for usual simulation cases, but for
quick transient events it is important that the friction coefficient still has positive
values.

</p>
</html>"));
        end QuadraticLoadInfluence;
        annotation (Documentation(info="<html>

As shown in <span class=\"cite\">[<a href=\"Modelica://WheelsAndTires.UsersGuide.Literature\">Ril07</a>]</span> the normal load of the tire has a nonlinear influence on the friction
properties. Usually a doubled normal load does not enable the tire to transmit the double
forces in longitudinal and lateral direction. This fact shall be accounted for in the more
complex of the following models.




</html>"));
      end LoadInflunce;

      package OverturningTorque
        "covers models to describe the overturning torque."
        annotation(preferedView="info");

      extends
          WheelsAndTires.TireComponents.Utilities.Icons.TireComponentsPackage;

        partial model OverturningTorqueBase
          "partial base class for overturning torque models."
          import SI = Modelica.SIunits;

          extends WheelsAndTires.TireComponents.Utilities.Icons.TireComponents;

          outer output SI.Torque tOverturn;

          annotation (Icon(
              Polygon(points=[-14,-36; 6,28; 18,28; -2,-36; -14,-36], style(
                  color=9,
                  rgbcolor={175,175,175},
                  fillColor=9,
                  rgbfillColor={175,175,175},
                  fillPattern=1)),
              Text(
                extent=[-100,68; 100,100],
                style(
                  color=10,
                  rgbcolor={135,135,135},
                  fillPattern=1),
                string="%name"),
              Ellipse(extent=[-24,-24; 0,-46], style(color=0, rgbcolor={0,0,0})),
              Rectangle(extent=[-30,-22; -14,-48], style(
                  color=7,
                  rgbcolor={255,255,255},
                  fillColor=7,
                  rgbfillColor={255,255,255},
                  fillPattern=1)),
              Polygon(points=[-18,-26; -14,-22; -12,-26; -18,-26], style(
                  color=0,
                  rgbcolor={0,0,0},
                  fillColor=0,
                  rgbfillColor={0,0,0})),
              Text(
                extent=[-2,-36; 28,-50],
                string="tOver",
                style(
                  color=0,
                  rgbcolor={0,0,0},
                  fillColor=10,
                  rgbfillColor={135,135,135})),
              Line(points=[-40,-36; 48,-36],style(
                  color=0,
                  rgbcolor={0,0,0},
                  fillColor=0,
                  rgbfillColor={0,0,0},
                  fillPattern=1)),
              Line(points=[-2,46; -2,-24; 16,46],   style(
                  color=0,
                  rgbcolor={0,0,0},
                  fillColor=0,
                  rgbfillColor={0,0,0},
                  fillPattern=1)),
              Polygon(points=[-2,42; 2,44; 2,40; -2,42],       style(
                  color=0,
                  rgbcolor={0,0,0},
                  fillColor=0,
                  rgbfillColor={0,0,0},
                  fillPattern=1)),
              Polygon(points=[12,44; 14,40; 10,40; 12,44],     style(
                  color=0,
                  rgbcolor={0,0,0},
                  fillColor=0,
                  rgbfillColor={0,0,0},
                  fillPattern=1)),
              Line(points=[2,42; 6,42; 8,42; 14,40],        style(
                  color=0,
                  rgbcolor={0,0,0},
                  fillColor=0,
                  rgbfillColor={0,0,0},
                  fillPattern=1)),
              Text(
                extent=[-36,54; -2,32],
                style(
                  color=0,
                  rgbcolor={0,0,0},
                  fillColor=0,
                  rgbfillColor={0,0,0},
                  fillPattern=1),
                string="phi")), Documentation(info="<html>

The <span class=\"cmti-10x-x-109\">Overturing Torque Base </span>model ensures <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">tOverturn</span></span></span> to be calculated.


</html>"));
        equation

        end OverturningTorqueBase;

        model NoOverturningTorque "models no overturning torque."
          extends OverturningTorqueBase;

        equation
          tOverturn = 0;

          annotation (Icon(
              Text(
                extent=[100,-68; -100,-100],
                style(color=0, rgbcolor={0,0,0}),
                string="no")), Documentation(info="<html>

<span class=\"cmti-10x-x-109\">No Overturning</span>
<span class=\"cmti-10x-x-109\">Torque </span>can be used to set it to 0 if this effect is not accounted for in the overall
model.

</html>"));
        end NoOverturningTorque;

        model LinOverturningTorque
          "models overturning toruq linearly depending on the lean anlge."
          extends OverturningTorqueBase;
          import SI = Modelica.SIunits;

          parameter Real cR(
            final unit="N/m",
            final min=0) = 1e5 "Radial stiffness of the tire";

          outer input Real eN[3];
          outer input Real eAxis[3];
          outer input SI.Length bCR;

        protected
          Real cOverturn(
            final unit="N/m",
            final min=0) "spring constant";
          SI.Angle phi;

        equation
          phi = arcsin(-eN*eAxis);
          cOverturn = 1/12 * bCR^2 * cR;
          tOverturn = - cOverturn * phi;
          annotation (Icon(
              Text(
                extent=[100,-68; -100,-100],
                style(color=0, rgbcolor={0,0,0}),
                string="linear")), Documentation(info="<html>

This effect arises due to the varying deflection of the contact area. This effect can be modeled
as shown in <span class=\"cite\">[<a href=\"Modelica://WheelsAndTires.UsersGuide.Literature\">Ril07</a>]</span>. The model developed there is linearly dependent on the lean angle <font face=\"Symbol\">&#966;</font>
(<span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">phi</span></span></span>).

<!--l. 12--></p><p class=\"noindent\">As mentioned before the relationship between the lean angle <font face=\"Symbol\">&#966;</font> and the overturning torque
can be modeled linearly, which can be seen in Figure&nbsp;<a href=\"#x1-56001r22\">1<!--tex4ht:ref: F_tOverturn_phi --></a>. </p><hr class=\"figure\"><div class=\"figure\"><table class=\"figure\"><tbody><tr class=\"figure\"><td class=\"figure\">


<a id=\"x1-56001r22\"></a>


<div class=\"center\">
<!--l. 15--><p class=\"noindent\">
<!--l. 16--></p><p class=\"noindent\"><img src=\"../images/Master_Doku_MarkusAndres88x.png\" alt=\"PIC\" class=\"graphics\" width=\"241.84843pt\" height=\"181.5629pt\"><!--tex4ht:graphics
name=\"Master_Doku_MarkusAndres88x.png\" src=\"pics/tOverturn_phi.eps\"
--></p></div>
<br> <div class=\"caption\"><table class=\"caption\"><tbody><tr style=\"vertical-align: baseline;\" class=\"caption\"><td class=\"id\">Figure&nbsp;1: </td><td class=\"content\">The overturning torque in dependence of the lean angle <font face=\"Symbol\">&#966;</font>.</td></tr></tbody></table></div><!--tex4ht:label?: x1-56001r22 -->



<!--l. 20--><p class=\"noindent\"></p></td></tr></tbody></table></div><hr class=\"endfigure\">
<!--l. 22--><p class=\"noindent\">Other factors that influence the value of the torque are radial stiffness and the width of the
contact area.

</html>"));
        end LinOverturningTorque;
        annotation (Documentation(info="<html>
The overturning torque tries to reduce the lean angle of the tire by a counteracting torque.

</html>"));
      end OverturningTorque;

      package SelfAligningTorque
        "contains models describing the self-aligning effect."
        annotation(preferedView="info");

      extends
          WheelsAndTires.TireComponents.Utilities.Icons.TireComponentsPackage;

        partial model SelfAligningTorqueBase
          "partial base model for self-aligning torque."
          import SI = Modelica.SIunits;

          extends WheelsAndTires.TireComponents.Utilities.Icons.TireComponents;

          outer SI.Torque tAlign;
          outer SI.Distance lTrail;

          annotation (Icon(
              Text(
                extent=[-100,68; 100,100],
                style(
                  color=10,
                  rgbcolor={135,135,135},
                  fillPattern=1),
                string="%name"),
              Rectangle(extent=[-14,48; 10,-18], style(
                  color=9,
                  rgbcolor={175,175,175},
                  fillColor=9,
                  rgbfillColor={175,175,175})),
              Ellipse(extent=[-14,60; 10,36], style(
                  color=9,
                  rgbcolor={175,175,175},
                  fillColor=9,
                  rgbfillColor={175,175,175})),
              Ellipse(extent=[-14,-6; 10,-30], style(
                  color=9,
                  rgbcolor={175,175,175},
                  fillColor=9,
                  rgbfillColor={175,175,175})),
              Line(points=[-4,14; -24,14],  style(
                  color=0,
                  rgbcolor={0,0,0},
                  fillColor=0,
                  rgbfillColor={0,0,0},
                  fillPattern=1)),
              Line(points=[-4,-6; -24,-6],style(
                  color=0,
                  rgbcolor={0,0,0},
                  fillColor=0,
                  rgbfillColor={0,0,0},
                  fillPattern=1)),
              Line(points=[-20,14; -20,-6],style(
                  color=0,
                  rgbcolor={0,0,0},
                  fillColor=0,
                  rgbfillColor={0,0,0},
                  fillPattern=1)),
              Polygon(points=[-20,14; -22,8; -18,8; -20,14],   style(
                  color=0,
                  rgbcolor={0,0,0},
                  fillColor=0,
                  rgbfillColor={0,0,0},
                  fillPattern=1)),
              Polygon(points=[-20,-6; -18,0; -22,0; -20,-6],
                                                           style(
                  color=0,
                  rgbcolor={0,0,0},
                  fillColor=0,
                  rgbfillColor={0,0,0},
                  fillPattern=1)),
              Text(
                extent=[-56,-8; -20,-26],
                style(
                  color=0,
                  rgbcolor={0,0,0},
                  fillColor=0,
                  rgbfillColor={0,0,0},
                  fillPattern=1),
                string="lTrail")), Documentation(info="<html>

<span class=\"cmti-10x-x-109\">No Self Aligning </span>sets <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">tAlign</span></span></span> to 0.


</html>"));
        equation

        end SelfAligningTorqueBase;

        model NoSelfAligningTorque "models no self-aligning effect."
          extends SelfAligningTorqueBase;
        equation
          tAlign = 0;
          lTrail = 0;
          annotation (Icon(
              Text(
                extent=[100,-68; -100,-100],
                style(color=0, rgbcolor={0,0,0}),
                string="no")), Documentation(info="<html>

<span class=\"cmti-10x-x-109\">No Self Aligning </span>sets <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">tAlign</span></span></span> to 0.


</html>"));
        end NoSelfAligningTorque;

        model SelfAligningTorqueRill
          "models a self-aligning by a methode presented by G. Rill"
          extends SelfAligningTorqueBase;
          import SI = Modelica.SIunits;

          outer input SI.Length lCR;
          outer input SI.Velocity sLat;
          outer input SI.Velocity sAd;
          outer input SI.Velocity sSl;
          outer input SI.Force fLat;
          outer input Boolean Contact;

        equation
          lTrail = noEvent(if abs(sLat) < sAd and Contact then 1/6 * lCR * (1 - abs(sLat)/sAd) else
                           if abs(sLat) > sAd and abs(sLat) < sSl and Contact then -1/6 * lCR * (abs(sLat) - sAd)/sAd * ((sSl - abs(sLat))/(sSl - sAd))^2 else
                           0);

          tAlign = - lTrail * fLat;
          annotation (Icon(
              Text(
                extent=[100,-68; -100,-100],
                style(color=0, rgbcolor={0,0,0}),
                string="Rill")), Documentation(info="<html>

Figure&nbsp;<a href=\"#x1-59003r2\">1(b)<!--tex4ht:ref: F_lTrail_vLat_Rill --></a> </p><hr class=\"figure\"><div class=\"figure\"><table class=\"figure\"><tbody><tr class=\"figure\"><td class=\"figure\">



<a id=\"x1-59004r23\"></a>


<div class=\"center\">
<!--l. 33--><p class=\"noindent\">
<a id=\"x1-59002r1\"></a>
</p><div class=\"subfigure\"><table><tbody><tr><td style=\"text-align: left;\"> <img src=\"../images/Master_Doku_MarkusAndres91x.png\" alt=\"PIC\" class=\"graphics\" width=\"177.82973pt\" height=\"124.78404pt\"><!--tex4ht:graphics
name=\"Master_Doku_MarkusAndres91x.png\" src=\"pics/lTrail_sLat_Rill.eps\"
-->
<div class=\"subfigcaption\"><span class=\"cmr-9\">(a) The dynamic trail by </span><span class=\"cite\"><span class=\"cmr-9\">[</span><a href=\"Modelica://WheelsAndTires.UsersGuide.Literature\"><span class=\"cmr-9\">Ril07</span></a><span class=\"cmr-9\">]</span></span> <span class=\"cmr-9\">depending on the</span>
<span class=\"cmr-9\">lateral slip.</span></div>                                </td></tr></tbody></table></div> &nbsp;

<a id=\"x1-59003r2\"></a><div class=\"subfigure\"><table><tbody><tr><td style=\"text-align: left;\"> <img src=\"../images/Master_Doku_MarkusAndres92x.png\" alt=\"PIC\" class=\"graphics\" width=\"177.82973pt\" height=\"123.72858pt\"><!--tex4ht:graphics
name=\"Master_Doku_MarkusAndres92x.png\" src=\"pics/lTrail_vLat_Rill.eps\"
-->
<div class=\"subfigcaption\"><span class=\"cmr-9\">(b) The dynamic trail by </span><span class=\"cite\"><span class=\"cmr-9\">[</span><a href=\"Modelica://WheelsAndTires.UsersGuide.Literature\"><span class=\"cmr-9\">Ril07</span></a><span class=\"cmr-9\">]</span></span> <span class=\"cmr-9\">depending on the</span>
<span class=\"cmr-9\">lateral sliding velocity.</span></div>                       </td></tr></tbody></table></div> </div>
<br> <div class=\"caption\"><table class=\"caption\"><tbody><tr style=\"vertical-align: baseline;\" class=\"caption\"><td class=\"id\">Figure&nbsp;1: </td><td class=\"content\">The dynamic trail depending on different physical quantities.</td></tr></tbody></table></div><!--tex4ht:label?: x1-59004r23 -->



<!--l. 46--><p class=\"noindent\"></p></td></tr></tbody></table></div><hr class=\"endfigure\">
<!--l. 48--><p class=\"noindent\">shows the pneumatic trail in dependence on the lateral sliding velocity. The differing curves
arise from the fact that in the equation of the slip the pitch angle velocity is accounted
for inversely. As this velocity changes during the simulation that was carried out
resulting in Figure&nbsp;<a href=\"#x1-59004r23\">1<!--tex4ht:ref: F_lTrail_Rill --></a>, the dynamic trail does not directly depend on lateral sliding
velocity.
<!--l. 50--></p>

</html>"));
        end SelfAligningTorqueRill;

        annotation (Documentation(info="<html>

The self aligning torque is the result of the lateral force <span class=\"cmmi-10x-x-109\">f</span><sub><span class=\"cmmi-8\">Lat</span></sub> which does not act on the center
of the contact area in longitudinal direction. This distance is called the pneumatic trail
due to the reasons of this trail. The force and the mentioned positional shift <span class=\"cmmi-10x-x-109\">l</span><sub><span class=\"cmmi-8\">Tail</span></sub>
produce a torque that tries to reduce the slip angle. How this can be modeled
is shown in <span class=\"cite\">[<a href=\"Modelica://WheelsAndTires.UsersGuide.Literature\">MW03</a>]</span> very well. They find that <span class=\"cmmi-10x-x-109\">l</span><sub><span class=\"cmmi-8\">Trail</span></sub> mainly depends on the slip
angle.

<!--l. 5--></p><p class=\"noindent\">The following two models build on the lateral slip <span class=\"cmmi-10x-x-109\">s</span><sub><span class=\"cmmi-8\">Lat</span></sub>, the slip of adhesion <span class=\"cmmi-10x-x-109\">s</span><sub><span class=\"cmmi-8\">Ad</span></sub> and full
sliding <span class=\"cmmi-10x-x-109\">s</span><sub><span class=\"cmmi-8\">Sl</span></sub> as a base for the calculation of <span class=\"cmmi-10x-x-109\">l</span><sub><span class=\"cmmi-8\">Trail</span></sub> rather than the slip angle.

</html>"));
      end SelfAligningTorque;

      model IdealFricition
        "describes an ideal friction. See the description of the contained models for further information."
        import MultiBondLib;
        import WheelsAndTires;
        extends FrictionBase;
        WheelsAndTires.TireComponents.Friction.SlipProperties.NoSlip
          SlipProperties
                   annotation (extent=[-80,34; -40,74]);
        WheelsAndTires.TireComponents.Friction.BoreTorque.NoBoreTorque
          BoreTorque annotation (extent=[-20,8; 20,48]);
        WheelsAndTires.TireComponents.Friction.CamberForce.NoCamberForce
          CamberForce annotation (extent=[40,34; 80,74]);
        WheelsAndTires.TireComponents.Friction.SelfAligningTorque.NoSelfAligningTorque
          SelfAligningTorque annotation (extent=[-20,-40; 20,0]);
        WheelsAndTires.TireComponents.Friction.RollResistance.NoRollResistance
          RollResistance annotation (extent=[-20,56; 20,96]);
        WheelsAndTires.TireComponents.Friction.LoadInflunce.LinLoadInfluence
          LoadInfluence annotation (extent=[-80,-16; -40,24]);
        WheelsAndTires.TireComponents.Friction.OverturningTorque.NoOverturningTorque
          OverturningTorque annotation (extent=[40,-16; 80,24]);
      equation

        annotation (Diagram, Icon(
            Text(
              extent=[0,-66; 100,-90],
              style(
                color=0,
                rgbcolor={0,0,0},
                fillColor=0,
                rgbfillColor={0,0,0},
                fillPattern=1),
              string="ideal")),
          Documentation(info="<html>

<span class=\"cmti-10x-x-109\">Ideal Friction </span>- <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">IdealFriction</span></span></span>, modeling ideal frictional behavior. The reader is refered to the documentation of the subclasses for further information.

</html>"));
      end IdealFricition;

      annotation (Icon, Documentation(info="<html>

The following chapter is intended to explain the function of the friction class and its subcomponents. For the sake of object oriented modeling, the different modeled effects are put into subclasses that are of different complexity. All of the featured classes that model a
certain type of effect are extended from the corresponding base class, which ensures
that the necessary output is calculated somehow. This as well ensures that all
models stay exchangeable not depending on the implementation of the modeled
effect.
<!--l. 18--></p><p class=\"noindent\">

The simplest model always is a class that just sets the corresponding output to a constant
value<span class=\"footnote-mark\">.
These are useful if the overall model should not consider this effect. For instance if a tire shall
not have a bore torque because it is unnecessary in that application. Additionally, there are
one or more models that apply versions of the different effects in various levels of detail. The
modeled effects are
     </p><ul class=\"itemize1\">

     <li class=\"itemize\"><span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">Slip</span><span class=\"cmtt-10x-x-109\">&nbsp;Properties</span></span></span>
     </li>
     <li class=\"itemize\"><span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">Roll</span><span class=\"cmtt-10x-x-109\">&nbsp;Resistance</span></span></span>
     </li>
     <li class=\"itemize\"><span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">Bore</span><span class=\"cmtt-10x-x-109\">&nbsp;Torque</span></span></span>
     </li>

     <li class=\"itemize\"><span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">Load</span><span class=\"cmtt-10x-x-109\">&nbsp;Influence</span></span></span>
     </li>
     <li class=\"itemize\"><span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">Camber</span><span class=\"cmtt-10x-x-109\">&nbsp;Force</span></span></span>
     </li>
     <li class=\"itemize\"><span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">Overturning</span><span class=\"cmtt-10x-x-109\">&nbsp;Torque</span></span></span> and
     </li>

     <li class=\"itemize\"><span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">Self</span><span class=\"cmtt-10x-x-109\">&nbsp;Aligning</span><span class=\"cmtt-10x-x-109\">&nbsp;Torque</span></span></span>.</li></ul>
<!--l. 29--><p class=\"noindent\">All of these models are combined in a base model that is called <span class=\"cmti-10x-x-109\">FrictionBase</span>. Here the
common variables are computed and it provides the <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">inner/outer</span></span></span> framework for the
communication among the sub-models. The following sections will describe the different
classes in more detail.


</p>


</p>
</html>"));

      model DryFricitionRollRes
        "describes a model for dry friction with constant rolling resistance. See the description of the contained models for further information."
        extends FrictionBase;
        import MultiBondLib;
        import WheelsAndTires;
        import SI = Modelica.SIunits;

        parameter SI.Velocity vAdhesion = 0.3 "Velocity of maximum friction";
        parameter SI.Velocity vSlide = 1
          "Velocity over which full sliding occurs";
        final parameter Real dmu_dvSlip(
          final unit="N/s^2",
          final min=0) = 2/vAdhesion "Curves gradient at zero crossing";
        parameter Real muMaxN = 1 "Maximum friction coefficient (at vAdhesion)";
        parameter Real muMinN(min = 0) = 0.6
          "Friciton coefficient at full sliding";

        parameter Real fR0 = 10e-3
          "Rolling resistance coefficient: usually in the range from 0.01 to 0.025";
        parameter SI.Radius rWheel = 14/2*2.54e-2+2e-2 "The wheels radius";

      protected
        WheelsAndTires.TireComponents.Friction.SlipProperties.SlidingDryFricition
          SlipProperties(
          vAdhesion=vAdhesion,
          vSlide=vSlide,
          muMaxN=muMaxN,
          muMinN=muMinN)
                   annotation (extent=[-80,34; -40,74]);
        WheelsAndTires.TireComponents.Friction.BoreTorque.NoBoreTorque
          BoreTorque annotation (extent=[-20,8; 20,48]);
        WheelsAndTires.TireComponents.Friction.CamberForce.NoCamberForce
          CamberForce annotation (extent=[40,34; 80,74]);
        WheelsAndTires.TireComponents.Friction.SelfAligningTorque.NoSelfAligningTorque
          SelfAligningTorque annotation (extent=[-20,-40; 20,0]);
        WheelsAndTires.TireComponents.Friction.RollResistance.ConstRollResistance
          RollResistance(fR0=fR0, rWheel=rWheel)
                         annotation (extent=[-20,56; 20,96]);
        WheelsAndTires.TireComponents.Friction.LoadInflunce.LinLoadInfluence
          LoadInfluence annotation (extent=[-80,-16; -40,24]);
        WheelsAndTires.TireComponents.Friction.OverturningTorque.NoOverturningTorque
          OverturningTorque annotation (extent=[40,-16; 80,24]);
      equation

        annotation (Diagram, Icon(
            Text(
              extent=[0,-66; 100,-90],
              style(
                color=0,
                rgbcolor={0,0,0},
                fillColor=0,
                rgbfillColor={0,0,0},
                fillPattern=1),
              string="DryRollRes")),
          Documentation(info="<html>

<span class=\"cmti-10x-x-109\">Dry Friction with Roll Resistance </span>- <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">DryFrictionRollRes</span></span></span>, adding slip based on
     the sliding dry friction model and constant rolling resistance.


The reader is refered to the documentation of the subclasses for further information.

</html>"));
      end DryFricitionRollRes;

      model AdvancedFriction
        "describes a model for advanced friction covering all modelable effects. See the description of the contained models for further information."
        import MultiBondLib;
        import WheelsAndTires;
        extends FrictionBase;
        import SI = Modelica.SIunits;

      // slip
        parameter SI.Velocity vLongAdhesion = 0.3
          "Longitudinal speed at which the maximum friction occurs";
        parameter SI.Velocity vLongSlide = 1
          "Longitudinal speed over which full sliding occurs";
        parameter Real sLongAdhesion = 0.15
          "Longitudinal slip at which the maximum fricion occurs";
        parameter Real sLongSlide = 0.4
          "Longitudinal slip over which full sliding occurs";
        final parameter Real dmu_dvSlip_LongN(
          final unit="N/s^2",
          final min=0) = 1/(10*sLongAdhesion)
          "Curves gradient at zero crossing";
        parameter Real muLongMaxN(min = 0) = 1
          "Maximum longitudinal friction coefficient at nominal load";
        parameter Real muLongMinN(min = 0) = 0.6
          "Longitudinal friction coefficient at nominal load and full sliding";
        parameter SI.Velocity vLatAdhesion = 0.4
          "Lateral speed at which the maximum friction occurs";
        parameter SI.Velocity vLatSlide = 1.2
          "Lateral speed over which full sliding occurs";
        parameter Real sLatAdhesion = 0.2
          "Lateral slip at which the maximum fricion occurs";
        parameter Real sLatSlide = 0.5
          "Lateral slip over which full sliding occurs";
        final parameter Real dmu_dvSlip_LatN(
          final unit="N/s^2",
          final min=0) = 1/(10*sLongAdhesion)
          "Curves Gradient at zero crossing";
        parameter Real muLatMaxN(min = 0) = 1
          "Maximum lateral friction coefficient at nominal load";
        parameter Real muLatMinN(min = 0) = 0.6
          "Lateral friction coefficient at nominal load and full sliding";

      // load influence
        parameter Real muN = 1 "Friction coeffient at nominal load";
        parameter Real mu2N = 0.75
          "Fricition coefficient at twice the nominal load";
        parameter SI.Force fNNominal = 3e3 "The nominal load of the tire";

      // roll resistance
        parameter Real fR0 = 1e-2
          "Factor for the constant part of the rolling resistance";
        parameter Real fR1 = 0.2e-2
          "Factor for the linearily rising part of the rolling resistance (with speed)";
        parameter Real fR4 = 0.1e-2
          "Factor for the part that rises with the power of 4 with the speed";
        parameter SI.Radius rWheel = 14/2*2.54e-2+2e-2 "Wheels total radius";

      // bore torque
        parameter Real muTurn = 0.8 "Friction coefficient for the bore torque";

      // self alginging

      // camber force
        parameter Real camberGain = 1
          "Gain factor for the influence of the camber speed";

      // overturning torque
        parameter Real cR(
          final unit="N/m",
          final min=0) = 1e5 "Radial stiffness of the tire";

        WheelsAndTires.TireComponents.Friction.SlipProperties.CombinedFriction
          SlipProperties(
          vLongAdhesion=vLongAdhesion,
          vLongSlide=vLongSlide,
          sLongAdhesion=sLongAdhesion,
          sLongSlide=sLongSlide,
          muLongMaxN=muLongMaxN,
          muLongMinN=muLongMinN,
          vLatAdhesion=vLatAdhesion,
          vLatSlide=vLatSlide,
          sLatAdhesion=sLatAdhesion,
          sLatSlide=sLatSlide,
          muLatMaxN=muLatMaxN,
          muLatMinN=muLatMinN)
                   annotation (extent=[-80,34; -40,74]);
        WheelsAndTires.TireComponents.Friction.BoreTorque.CombinedBoreTorque
          BoreTorque(
            muTurn=muTurn)
                     annotation (extent=[-20,8; 20,48]);
        WheelsAndTires.TireComponents.Friction.CamberForce.CombinedCamberSpeed
          CamberForce(
            camberGain=camberGain, rWheel=rWheel)
                      annotation (extent=[40,34; 80,74]);
        WheelsAndTires.TireComponents.Friction.SelfAligningTorque.SelfAligningTorqueRill
          SelfAligningTorque annotation (extent=[-20,-40; 20,0]);
        WheelsAndTires.TireComponents.Friction.RollResistance.SpeedDependingRollResistance
          RollResistance(
          fR0=fR0,
          fR1=fR1,
          fR4=fR4,
          rWheel=rWheel) annotation (extent=[-20,56; 20,96]);
        WheelsAndTires.TireComponents.Friction.LoadInflunce.QuadraticLoadInfluence
          LoadInfluence(
          muN=muN,
          mu2N=mu2N,
          fNNominal=fNNominal)
                        annotation (extent=[-80,-16; -40,24]);
        WheelsAndTires.TireComponents.Friction.OverturningTorque.LinOverturningTorque
          OverturningTorque(cR=cR)
                            annotation (extent=[40,-16; 80,24]);
      equation

        annotation (Diagram, Icon(
            Text(
              extent=[0,-66; 100,-90],
              string="advanced",
              style(
                color=0,
                rgbcolor={0,0,0},
                fillColor=30,
                rgbfillColor={215,215,215},
                fillPattern=1))),
          Documentation(info="<html>

<span class=\"cmti-10x-x-109\">Advanced Friction </span>- <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">AdvancedFriction</span></span></span>, the most advanced version of friction
     possible with the current version of the library including all covered frictional
     effects. The reader is refered to the documentation of the subclasses for further information.

</html>"));
      end AdvancedFriction;
    end Friction;

    package Geometry
      "package that covers different geometries and the finding of contact patch properties."
      annotation(preferedView="info");

    extends WheelsAndTires.TireComponents.Utilities.Icons.TireComponentsPackage;

      partial model GeometryBase "partial base model for geometry classes"
        import MultiBondLib;
        import SI = Modelica.SIunits;
        import MB = Modelica.Mechanics.MultiBody;

        extends WheelsAndTires.TireComponents.Utilities.Icons.TireComponents;

        parameter SI.Distance rRim= 14/2*2.54e-2 "radius of the rim";
        parameter Boolean visBeltEnabled = true
          "true: belt will be animated, false: tire will not be animated"
          annotation(Dialog(tab="Visualization"));
        parameter MB.Types.Color beltColor= {26,26,26} "Belt Color"         annotation(Dialog(tab="Visualization"));
        parameter MB.Types.SpecularCoefficient beltSpecularCoefficient = 0.1
          "Specular Coefficient: 0 total absorbtion, 1 reflecting"    annotation(Dialog(tab="Visualization"));

        parameter Boolean visContactPointEnabled = false
          "true if the contact point shall be animated as a cone"
          annotation(Dialog(tab="Visualization", group="Contact Point Properties"));
        parameter MB.Types.Color contactColor= {128,128,128}
          "Color of the contactpoint cone"
          annotation(Dialog(tab="Visualization", group="Contact Point Properties"));
        parameter SI.Length contactPointSize = 0.05
          "Dimensions of the cone for the contact point"
          annotation(Dialog(tab="Visualization", group="Contact Point Properties"));

        annotation (Icon(                   Text(
              extent=[-100,68; 100,100],
              style(
                color=10,
                rgbcolor={135,135,135},
                fillPattern=1),
              string="%name")), Diagram(Rectangle(extent=[-100,-100; 100,-60],
                style(
                color=51,
                rgbcolor={255,255,170},
                fillColor=51,
                rgbfillColor={255,255,170},
                fillPattern=1))),
          DymolaStoredErrors,
          Documentation(info="<html>

The Geometry Base computes unit vectors, based on <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">eAxis</span></span></span> as this is an input to
the model from a measurement in the <span class=\"cmti-10x-x-109\">Rim </span>Class. Furthermore, <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">eN</span></span></span> is determined utilizing the
<span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">get_eN</span></span></span> function.

</html>"));
        annotation (Diagram);
      public
        Communication.TireBus tireBus "connect to the Tire Bus."
          annotation (extent=[-10,-110; 10,-90]);
        Real e_Long[3] = eLong;
        Real e_N[3] = eN;
        Real e_Lat[3] = eLat;
        Real e_Plane[3] = ePlane;
        Real e_Axis[3] = eAxis;
        Real r_CP[3] = rCP;
        SI.Distance x_CP[3] = xCP;
        SI.Distance penetration_Depth = penetrationDepth;
        SI.Length l_CR = lCR;
        SI.Length b_CR = bCR;

      protected
        outer MultiBondLib.Mechanics3D.World3D world3D;

        Real dLong[3];
        Real dLat[3];
        Real dPlane[3];

      protected
        Communication.ContactPropertiesOutput CP
          annotation (extent=[-86,-86; -74,-74], rotation=270);
        Communication.SensorValuesInput SV
          annotation (extent=[-6,-86; 6,-74], rotation=90);
        Communication.UnitVectorsOutput UV
          annotation (extent=[74,-86; 86,-74], rotation=270);
        MultiBondLib.Interfaces.RealSignal RBelt[3,3]
          annotation (extent=[0,-66; 12,-54]);
        MultiBondLib.Interfaces.RealSignal eLong[3]
          annotation (extent=[38,-66; 50,-54]);
        MultiBondLib.Interfaces.RealSignal eAxis[3]
          annotation (extent=[86,-66; 98,-54]);
        MultiBondLib.Interfaces.RealSignal ePlane[3]
          annotation (extent=[74,-66; 86,-54]);
        MultiBondLib.Interfaces.RealSignal eN[3]
          annotation (extent=[62,-66; 74,-54]);
        MultiBondLib.Interfaces.RealSignal eAxisSens[3]
          annotation (extent=[24,-66; 36,-54]);
        WheelsAndTires.TireComponents.Utilities.AddititionalMBG.BooleanSignal
          Contact                       annotation (extent=[-98,-66; -86,-54]);
        MultiBondLib.Interfaces.RealSignal penetrationDepth
          annotation (extent=[-86,-66; -74,-54]);
        MultiBondLib.Interfaces.RealSignal xBelt[3]
          annotation (extent=[12,-66; 24,-54]);
        MultiBondLib.Interfaces.RealSignal lCR
          annotation (extent=[-74,-66; -62,-54]);
        MultiBondLib.Interfaces.RealSignal bCR
          annotation (extent=[-62,-66; -50,-54]);
        MultiBondLib.Interfaces.RealSignal rCP[3]
          annotation (extent=[-50,-66; -38,-54]);
        MultiBondLib.Interfaces.RealSignal eLat[3]
          annotation (extent=[50,-66; 62,-54]);
        MultiBondLib.Interfaces.RealSignal xCP[3]
          annotation (extent=[-38,-66; -26,-54]);

      MB.Visualizers.Advanced.Shape contactPoint(
          each shapeType="cone",
          each color=contactColor,
          each length= contactPointSize,
          each width=contactPointSize,
          each height=contactPointSize,
          each lengthDirection=eN,
          each widthDirection=eLat,
          each r=xCP-contactPointSize*eN,
          each r_shape={0,0,0},
          each specularCoefficient = 0.2,
          each extra = 0) if visContactPointEnabled and world3D.enableAnimation;

      equation
        dLong = cross(eN,eAxis);
        eLong = dLong/sqrt(dLong*dLong);
        dLat = cross(eLong,eN);
        eLat = dLat/sqrt(dLat*dLat);
        dPlane = cross(eLong, eAxis);
        ePlane = dPlane/sqrt(dPlane*dPlane);

        connect(SV, tireBus.SV) annotation (points=[0,-80; 0,-100], style(
            color=45,
            rgbcolor={255,128,0},
            fillColor=51,
            rgbfillColor={255,255,170},
            fillPattern=1));
        connect(UV, tireBus.UV) annotation (points=[80,-80; 80,-88; 2,-88; 2,
              -96; 0,-96; 0,-100], style(
            color=58,
            rgbcolor={0,127,0},
            fillColor=51,
            rgbfillColor={255,255,170},
            fillPattern=1));
        connect(eAxisSens, eAxis) annotation (points=[30,-60; 30,-52; 92,-52;
              92,-60], style(
            color=3,
            rgbcolor={0,0,255},
            pattern=0,
            fillColor=51,
            rgbfillColor={255,255,170},
            fillPattern=1));
        connect(Contact, CP.Contact) annotation (points=[-92,-60; -92,-70; -80,
              -70; -80,-80], style(
            color=83,
            rgbcolor={255,85,255},
            pattern=0,
            fillColor=51,
            rgbfillColor={255,255,170},
            fillPattern=1));
        connect(penetrationDepth, CP.penetrationDepth) annotation (points=[-80,-60;
              -80,-80],      style(
            color=3,
            rgbcolor={0,0,255},
            pattern=0,
            fillColor=51,
            rgbfillColor={255,255,170},
            fillPattern=1));
        connect(lCR, CP.lCR) annotation (points=[-68,-60; -68,-70; -80,-70; -80,
              -80], style(
            color=3,
            rgbcolor={0,0,255},
            pattern=0,
            fillColor=51,
            rgbfillColor={255,255,170},
            fillPattern=1));
        connect(bCR, CP.bCR) annotation (points=[-56,-60; -56,-70; -80,-70; -80,
              -80], style(
            color=3,
            rgbcolor={0,0,255},
            pattern=0,
            fillColor=51,
            rgbfillColor={255,255,170},
            fillPattern=1));
        connect(RBelt[:, :], SV.RBelt[:,:]) annotation (points=[6,-60; 6,-70; 0,
              -70; 0,-80],
            style(
            color=3,
            rgbcolor={0,0,255},
            pattern=0,
            fillColor=51,
            rgbfillColor={255,255,170},
            fillPattern=1));
        connect(rCP[:], CP.rCP[:]) annotation (points=[-44,-64; -44,-70; -80,
              -70; -80,-80], style(
            color=3,
            rgbcolor={0,0,255},
            pattern=0,
            fillColor=51,
            rgbfillColor={255,255,170},
            fillPattern=1));
        connect(xBelt[:], SV.xBelt[:]) annotation (points=[18,-60; 18,-70; 0,
              -70; 0,-80], style(
            color=3,
            rgbcolor={0,0,255},
            pattern=0,
            fillColor=51,
            rgbfillColor={255,255,170},
            fillPattern=1));
        connect(eAxisSens[:], SV.eAxis[:]) annotation (points=[30,-60; 30,-70;
              0,-70; 0,-80], style(
            color=3,
            rgbcolor={0,0,255},
            pattern=0,
            fillColor=51,
            rgbfillColor={255,255,170},
            fillPattern=1));
        connect(eLong[:], UV.eLong[:]) annotation (points=[44,-64; 44,-70; 80,
              -70; 80,-80], style(
            color=3,
            rgbcolor={0,0,255},
            pattern=0,
            fillColor=51,
            rgbfillColor={255,255,170},
            fillPattern=1));
        connect(eN[:], UV.eN[:]) annotation (points=[68,-64; 68,-70; 80,-70; 80,
              -80], style(
            color=3,
            rgbcolor={0,0,255},
            pattern=0,
            fillColor=51,
            rgbfillColor={255,255,170},
            fillPattern=1));
        connect(ePlane[:], UV.ePlane[:]) annotation (points=[80,-64; 80,-80],
            style(
            color=3,
            rgbcolor={0,0,255},
            pattern=0,
            fillColor=51,
            rgbfillColor={255,255,170},
            fillPattern=1));
        connect(eAxis[:], UV.eAxis[:]) annotation (points=[92,-64; 92,-70; 80,
              -70; 80,-80], style(
            color=3,
            rgbcolor={0,0,255},
            pattern=0,
            fillColor=51,
            rgbfillColor={255,255,170},
            fillPattern=1));
        connect(eLat[:], UV.eLat[:]) annotation (points=[56,-64; 56,-70; 80,-70;
              80,-80], style(
            color=3,
            rgbcolor={0,0,255},
            pattern=0,
            fillColor=51,
            rgbfillColor={255,255,170},
            fillPattern=1));
        connect(xCP[:], tireBus.CP.xCP[:]) annotation (points=[-32,-64; -32,-70;
              -80,-70; -80,-88; -2,-88; -2,-94; 0,-94; 0,-100], style(
            color=3,
            rgbcolor={0,0,255},
            fillColor=30,
            rgbfillColor={215,215,215},
            fillPattern=1));
        connect(CP, tireBus.CP) annotation (points=[-80,-80; -80,-88; -2,-88;
              -2,-96], style(
            color=78,
            rgbcolor={127,0,127},
            fillColor=30,
            rgbfillColor={215,215,215},
            fillPattern=1));
      end GeometryBase;

      model FlatDisc "models an ideally slim disc."
        extends WheelsAndTires.TireComponents.Geometry.GeometryBase;
        import SI = Modelica.SIunits;
        import MB = Modelica.Mechanics.MultiBody;

        final parameter SI.Radius rWheel = rRim + height
          "The total radius of the tire";
        parameter SI.Distance height = 20e-3 "height of the belt";
        parameter SI.Distance width = 20e-3
          "width of the belt. (Just for visualisation, the tire has 0 width when it comes to the contact point localization.)";

      protected
        outer WheelsAndTires.Environment.Surface Surface;

        MB.Visualizers.Advanced.Shape beltPipe(
          each shapeType="pipe",
          each color=beltColor,
          each length=width,
          each width=2*(height+rRim),
          each height=2*(height+rRim),
          each lengthDirection={0,0,1},
          each widthDirection={0,1,0},
          each extra=rRim/(height+rRim),
          each r_shape={0,0,-width/2},
          each r=xBelt,
          each specularCoefficient=beltSpecularCoefficient,
          each R=MB.Frames.Orientation(T=RBelt,w=zeros(3))) if visBeltEnabled and world3D.enableAnimation;

      equation
        if Surface.FlatSurface then
          xCP  = {xBelt[1]+rCP[1], 0, xBelt[3]+rCP[3]};
          eN = {0,1,0};
        else
          xCP[1] = xBelt[1] + rCP[1];
          xCP[3] = xBelt[3] + rCP[3];
          xCP[2] = Surface.get_elevation(xCP[1], xCP[3]);
          eN = Surface.get_eN(xCP[1], xCP[3]);
        end if;

        rCP = if Contact then rWheel * ePlane - penetrationDepth * eN else rWheel * ePlane;

        penetrationDepth = (xBelt - xCP + rCP) *eN;
        Contact = penetrationDepth <= 0;

        lCR = if Contact then sqrt(8*rWheel*penetrationDepth) else 0;
        bCR = 0;

        annotation (Diagram, Icon(
            Ellipse(extent=[8,62; -10,-36], style(
                pattern=0,
                fillColor=7,
                rgbfillColor={255,255,255})), Bitmap(extent=[-82,64; 82,-86],
                name="images/slimTire.png"),
            Text(
              extent=[0,-66; 100,-90],
              style(
                color=0,
                rgbcolor={0,0,0},
                fillColor=30,
                rgbfillColor={215,215,215},
                fillPattern=1),
              string="Ideal slim")),
          Documentation(info="<html>

The first and simplest model hast the geometry of a flat disc. It is shown in Figure&nbsp;<a href=\"#x1-62001r26\">1<!--tex4ht:ref: F_Geometrie_Disc --></a>.
</p><hr class=\"figure\"><div class=\"figure\"><table class=\"figure\"><tbody><tr class=\"figure\"><td class=\"figure\">


<a id=\"x1-62001r26\"></a>


<div class=\"center\">

<!--l. 41--><p class=\"noindent\">
<!--l. 42--></p><p class=\"noindent\"><img src=\"../images/Master_Doku_MarkusAndres99x.png\" alt=\"PIC\" class=\"graphics\" width=\"177.82973pt\" height=\"212.12523pt\"><!--tex4ht:graphics
name=\"Master_Doku_MarkusAndres99x.png\" src=\"pics/Geometrie_Disc.eps\"
--></p></div>
<br> <div class=\"caption\"><table class=\"caption\"><tbody><tr style=\"vertical-align: baseline;\" class=\"caption\"><td class=\"id\">Figure&nbsp;1: </td><td class=\"content\">Geometric properties of the ideal tire.</td></tr></tbody></table></div><!--tex4ht:label?: x1-62001r26 -->


<!--l. 46--><p class=\"noindent\"></p></td></tr></tbody></table></div><hr class=\"endfigure\">
<!--l. 48--><p class=\"noindent\">The width of the model is just used for the visualization and is not accounted for in the
geometrical calculations.
<!--l. 50--></p>

</html>"));
      end FlatDisc;

      model CircularTire "describes a tire with a semi-circle cross-section."
        extends WheelsAndTires.TireComponents.Geometry.GeometryBase;
        import SI = Modelica.SIunits;
        import MB = Modelica.Mechanics.MultiBody;

        parameter SI.Distance height = 50e-3 "height of the belt = radius";

      protected
        outer WheelsAndTires.Environment.Surface Surface;

        Real Rrel[3,3];

        WheelsAndTires.Visualization.Torus beltTorus(
          each nu=17,
          each nv=17,
          each Material=vector([beltColor/255;beltSpecularCoefficient]),
          each ri=rRim,
          each ro=height,
          each opening=Modelica.Constants.pi/2,
          each r_0=xBelt,
          each R=MB.Frames.Orientation(T=RBelt*Rrel, w=zeros(3))) if visBeltEnabled and world3D.enableAnimation;

      equation
        if Surface.FlatSurface then
          xCP  = {xBelt[1]+rCP[1], 0, xBelt[3]+rCP[3]};
          eN = {0,1,0};
        else
          xCP[1] = xBelt[1] + rCP[1];
          xCP[3] = xBelt[3] + rCP[3];
          xCP[2] = Surface.get_elevation(xCP[1], xCP[3]);
          eN = Surface.get_eN(xCP[1], xCP[3]);
        end if;

        rCP = if Contact then rRim * ePlane - height * eN - penetrationDepth * eN else rRim * ePlane - height * eN;

        Rrel = [RBelt[1,:]]*transpose([RBelt[1,:]]) - skew(RBelt[1,:]);
        // simlified version of eqn (7.5) in Dirk's Master's Thesis

        penetrationDepth = (xBelt - xCP + rCP) *eN;
        Contact = penetrationDepth < 0;

        lCR = if Contact then sqrt(8*(rRim+height)*(-penetrationDepth)) else 0;
        bCR = if Contact and (-penetrationDepth) < height then sqrt(8*(height)*(-penetrationDepth)) else
              if Contact and (-penetrationDepth) > height then 2*height else 0;

        annotation (Diagram, Icon(
            Rectangle(extent=[-46,36; 46,-2], style(
                pattern=0,
                fillColor=7,
                rgbfillColor={255,255,255},
                fillPattern=1)), Bitmap(extent=[-82,64; 82,-86], name=
                  "images/circTire.png"),
            Text(
              extent=[0,-66; 100,-90],
              style(
                color=0,
                rgbcolor={0,0,0},
                fillColor=30,
                rgbfillColor={215,215,215},
                fillPattern=1),
              string="Circular")),
          Documentation(info="<html>

The geometry of the circular tire is depicted in Figure&nbsp;<a href=\"#x1-63001r27\">1<!--tex4ht:ref: F_Geometrie_Circular --></a>. </p><hr class=\"figure\"><div class=\"figure\"><table class=\"figure\"><tbody><tr class=\"figure\"><td class=\"figure\">


<a id=\"x1-63001r27\"></a>



<div class=\"center\">
<!--l. 79--><p class=\"noindent\">
<!--l. 80--></p><p class=\"noindent\"><img src=\"../images/Master_Doku_MarkusAndres102x.png\" alt=\"PIC\" class=\"graphics\" width=\"177.82973pt\" height=\"199.93442pt\"><!--tex4ht:graphics
name=\"Master_Doku_MarkusAndres102x.png\" src=\"pics/Geometrie_Circular.eps\"
--></p></div>
<br> <div class=\"caption\"><table class=\"caption\"><tbody><tr style=\"vertical-align: baseline;\" class=\"caption\"><td class=\"id\">Figure&nbsp;1: </td><td class=\"content\">Geometric properties of the circular tire.</td></tr></tbody></table></div><!--tex4ht:label?: x1-63001r27 -->


<!--l. 84--><p class=\"noindent\"></p></td></tr></tbody></table></div><hr class=\"endfigure\">
<!--l. 86--><p class=\"noindent\">From the figure one can directly recognize that the <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">rCP</span></span></span> depends on the lean angle <font face=\"Symbol\">&#966;</font> of
the tire. This has to be accounted for in the computation. Also one can see that
the radius of the circular element of the tire is called <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">height</span></span></span> in that figure. This
is done to enable a simple class change from the ideally slim belt to the circular
belt.

<!--l. 88--></p>

</html>"));
      end CircularTire;

      model BeltTire
        "describes a tire with a side walls an a section of a circle for the belt as cross-section."
        extends WheelsAndTires.TireComponents.Geometry.GeometryBase;
        import SI = Modelica.SIunits;
        import MB = Modelica.Mechanics.MultiBody;
        import PI = Modelica.Constants.pi;

        parameter SI.Distance width = 100e-3 "Width of the tire";
        parameter SI.Distance height = 50e-3 "Height of the belt of the tire";
        parameter SI.Radius r = 75e-3 "Radius of the tread area";
        final parameter SI.Distance x = width/2
          "x coordinate of the outmost possible contact point of the tire";
        final parameter SI.Distance y = rRim + height
          "y coordinate of the outmost possible contact point of the tire";
        final parameter SI.Distance d =  y - sqrt(r^2 - x^2)
          "distance from the rims center to the midpoint of the radius describing the belt's curvature";
        final parameter SI.Angle phiMax = PI/2  - arctan(sqrt(r^2-x^2)/x)
          "lean angle a which the belts contact point is at the outmost possible point";
        final parameter SI.Angle phiBelt = arctan(x/(y-d))
          "half opening angle of the torus used for the visualization";

      protected
        outer WheelsAndTires.Environment.Surface Surface;

        SI.Angle phiAct;
        Real Rrel[3,3];

        MB.Visualizers.Advanced.Shape beltPipe(
          each shapeType="pipe",
          each color=beltColor,
          each length= width,
          each width=2*(height+rRim),
          each height=2*(height+rRim),
          each lengthDirection={0,0,1},
          each widthDirection={0,1,0},
          each extra=rRim/(height+rRim),
          each r_shape={0,0,-width/2},
          each r=xBelt,
          each specularCoefficient=beltSpecularCoefficient,
          each R=MB.Frames.Orientation(T=RBelt,w=zeros(3))) if visBeltEnabled and world3D.enableAnimation;

        WheelsAndTires.Visualization.Torus beltTorus(
          each nu=17,
          each nv=17,
          each Material=vector([beltColor/255;beltSpecularCoefficient]),
          each ri=d,
          each ro=r,
          each opening=Modelica.Constants.pi - phiBelt,
          each r_0=xBelt,
          each R=MB.Frames.Orientation(T=RBelt*Rrel, w=zeros(3))) if visBeltEnabled and world3D.enableAnimation;

      equation
        if Surface.FlatSurface then
          xCP  = {xBelt[1]+rCP[1], 0, xBelt[3]+rCP[3]};
          eN = {0,1,0};
        else
          xCP[1] = xBelt[1] + rCP[1];
          xCP[3] = xBelt[3] + rCP[3];
          xCP[2] = Surface.get_elevation(xCP[1], xCP[3]);
          eN = Surface.get_eN(xCP[1], xCP[3]);
        end if;

        if Contact then
          rCP = if (abs(phiAct) < phiMax) then
                  d * ePlane - r * eN - penetrationDepth * eN else
                if (phiAct > phiMax) then
                  (rRim + height) * ePlane + x * eAxis - penetrationDepth * eN else
                  (rRim + height) * ePlane - x * eAxis - penetrationDepth * eN;
        else
          rCP = if (abs(phiAct) < phiMax) then
                  d * ePlane - r * eN else
                if (phiAct > phiMax) then
                  (rRim + height) * ePlane + x * eAxis else
                  (rRim + height) * ePlane - x * eAxis;
        end if;

        phiAct = PI/2 - arccos(eAxis * (-eN));

        Rrel = [RBelt[1,:]]*transpose([RBelt[1,:]]) - skew(RBelt[1,:]);
        // simlified version of eqn (7.5) in Dirk Zimmer's Master's Thesis for visualization

        penetrationDepth = (xBelt - xCP + rCP) *eN;
        Contact = penetrationDepth < 0;

        lCR = if Contact then sqrt(8*(rRim+r)*(-penetrationDepth)) else 0;
        bCR = if Contact and (-penetrationDepth) < r-height then sqrt(8*(r)*(-penetrationDepth)) else
              if Contact and (-penetrationDepth) > r-height then 2*r else 0;

        annotation (Diagram, Icon(
            Rectangle(extent=[46,-52; 88,14], style(
                pattern=0,
                fillColor=7,
                rgbfillColor={255,255,255},
                fillPattern=1)),
            Rectangle(extent=[-86,-56; -44,12], style(
                pattern=0,
                fillColor=7,
                rgbfillColor={255,255,255},
                fillPattern=1)),
            Bitmap(extent=[-82,64; 82,-86], name="images/beltTire.png"),
            Text(
              extent=[0,-66; 100,-90],
              style(
                color=0,
                rgbcolor={0,0,0},
                fillColor=30,
                rgbfillColor={215,215,215},
                fillPattern=1),
              string="Belt")),
          Documentation(info="<html>

The most complex geometry that is possible with the library is the belted tire shown in
Figure&nbsp;<a href=\"#x1-64001r28\">1<!--tex4ht:ref: F_Geometrie_Belt --></a>. </p><hr class=\"figure\"><div class=\"figure\"><table class=\"figure\"><tbody><tr class=\"figure\"><td class=\"figure\">


<a id=\"x1-64001r28\"></a>


<div class=\"center\">
<!--l. 126--><p class=\"noindent\">
<!--l. 127--></p><p class=\"noindent\"><img src=\"../images/Master_Doku_MarkusAndres106x.png\" alt=\"PIC\" class=\"graphics\" width=\"177.82973pt\" height=\"219.35818pt\"><!--tex4ht:graphics
name=\"Master_Doku_MarkusAndres106x.png\" src=\"pics/Geometrie_Belt.eps\"
--></p></div>
<br> <div class=\"caption\"><table class=\"caption\"><tbody><tr style=\"vertical-align: baseline;\" class=\"caption\"><td class=\"id\">Figure&nbsp;1: </td><td class=\"content\">Geometric properties of a belted tire with side walls.</td></tr></tbody></table></div><!--tex4ht:label?: x1-64001r28 -->



<!--l. 131--><p class=\"noindent\"></p></td></tr></tbody></table></div><hr class=\"endfigure\">
<!--l. 133--><p class=\"noindent\">It features a tire that has a radius as well as side walls both configurable easily by the
parameters <span class=\"cmti-10x-x-109\">width</span>, <span class=\"cmti-10x-x-109\">height </span>and <span class=\"cmti-10x-x-109\">r </span>(radius). Out of these three parameters, adding the
information of the rim?s radius, the other geometrical aspects are computed. As well a
detection whether the tire rolls on the corner between the side wall and radius is
implemented.
<!--l. 135--></p>

</html>"));
      end BeltTire;
      annotation (Documentation(info="<html>

All geometric classes have two main tasks to fulfill. The first is to determine the contact point
properties<span class=\"footnote-mark\"><a href=\"Master_Doku_MarkusAndres10.html#fn9x3\"></a></span><a id=\"x1-60001f9\"></a>
including the vector <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">rCP</span></span></span> that points from the center of the
rim<span class=\"footnote-mark\"><a href=\"Master_Doku_MarkusAndres11.html#fn10x3\"></a></span><a id=\"x1-60002f10\"></a>

to the contact point. Secondly, all have to compute the unit vectors that are important in
many other objects. As the unit vectors are calculated similarly independent of the actual
geometric properties, these equations are implemented in the base model.
<!--l. 6--></p><p class=\"noindent\">The first task - the determination of <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">rCP</span></span></span> is depending on the normal vector of the surface at
the contact point and the lean angle of the tire described by <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">ePlane</span></span></span>. Therefore the contact
point has to be found, which can be a non-trivial task in case of an uneven surface. In case of
the <span class=\"cmti-10x-x-109\">Wheels and Tires </span>library a quite simple approach was developed. Although the same code for the finding of
the contact point is used in all the models, it was copied to the three different
geometric classes. This is reasonable due to the fact that the base class can be
extended by classes using other techniques for finding the contact point totally
different.


<!--l. 8--></p><p class=\"noindent\">Figure&nbsp;<a href=\"#x1-60003r25\">1<!--tex4ht:ref: F_PenetrationDepth --></a> </p><hr class=\"figure\"><div class=\"figure\"><table class=\"figure\"><tbody><tr class=\"figure\"><td class=\"figure\">



<a id=\"x1-60003r25\"></a>


<div class=\"center\">
<!--l. 11--><p class=\"noindent\">
<!--l. 12--></p><p class=\"noindent\"><img src=\"../images/Master_Doku_MarkusAndres95x.png\" alt=\"PIC\" class=\"graphics\" width=\"177.82973pt\" height=\"146.19264pt\"><!--tex4ht:graphics
name=\"Master_Doku_MarkusAndres95x.png\" src=\"pics/PenetrationDepth.eps\"
--></p></div>
<br> <div class=\"caption\"><table class=\"caption\"><tbody><tr style=\"vertical-align: baseline;\" class=\"caption\"><td class=\"id\">Figure&nbsp;1: </td><td class=\"content\">A tire with an ideal stiff belt penetrating the surface.</td></tr></tbody></table></div><!--tex4ht:label?: x1-60003r25 -->


<!--l. 16--><p class=\"noindent\"></p></td></tr></tbody></table></div><hr class=\"endfigure\">
<!--l. 18--><p class=\"noindent\">depicts the <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">penetration</span></span></span><span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">Depth</span></span></span>, which is calculated in all geometric classes in a similar
manner. It is used in the <span class=\"cmti-10x-x-109\">Vertical Dynamics </span>classes to calculate the normal force acting on
the contact point. The <span class=\"cmti-10x-x-109\">No Elevation </span>class is a special case here. Positive values of the
<span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">penetration</span></span></span><span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">Depth</span></span></span> indicate a tire lifted from the ground, whereas negative values denote a
real penetration in the surface.
</p>

</html>"));
    end Geometry;

    package Rim "covers rim classes"
      annotation(preferedView="info");

    extends WheelsAndTires.TireComponents.Utilities.Icons.TireComponentsPackage;

      partial model RimBase "partial base model for rim classes"

        import MultiBondLib;
        import SI = Modelica.SIunits;
        import MB = Modelica.Mechanics.MultiBody;
        import PI = Modelica.Constants.pi;

        extends WheelsAndTires.TireComponents.Utilities.Icons.TireComponents;

        parameter SI.Radius rRim = 14/2*2.54e-2 "Radius of the Rim";
        parameter SI.Length bRim = 100e-3 "Width of the Rim";

        parameter Boolean visRimEnabled = true
          "true: rim will be animated, false: rim will not be animated" annotation(Dialog(tab="Visualization"));
        parameter MB.Types.Color rimRodColor= {164,164,164} "Color of the rods"
                              annotation(Dialog(tab="Visualization"));
        parameter MB.Types.SpecularCoefficient rimSpecularCoefficient = 0.75
          "Specular Coefficient: 0 total absorbtion, 1 reflecting" annotation(Dialog(tab="Visualization"));

      public
        SI.Position x_Rim[3] = frame_a.P.x;

        MultiBondLib.Mechanics3D.Interfaces.Frame_a frame_a
          "connect to the Belt Dynamics model"
          annotation (extent=[-120,-10; -100,10]);
        MultiBondLib.Mechanics3D.Interfaces.Frame_b frame_b
          "connect to the Tire Hub."
          annotation (extent=[100,-10; 120,10]);
        Communication.TireBus tireBus "connect to the tire hub."
          annotation (extent=[-10,90; 10,110]);

      protected
        WheelsAndTires.TireComponents.Utilities.AddititionalMBG.AbsoluteSensor
          eAxisSensor(                       get_r_abs=false, get_R=true)
          annotation (extent=[-86,20; -74,32], rotation=90);
      protected
        outer MultiBondLib.Mechanics3D.World3D world3D;
        Communication.SensorValuesOutput SV
          annotation (extent=[-66,72; -54,84], rotation=90);
        Communication.UnitVectorInput UV
          annotation (extent=[54,72; 66,84], rotation=270);
        MultiBondLib.Interfaces.RealSignal eN[3]
          annotation (extent=[68,54; 80,66]);
        MultiBondLib.Interfaces.RealSignal eLat[3]
          annotation (extent=[54,54; 66,66]);
        MultiBondLib.Interfaces.RealSignal eLong[3]
          annotation (extent=[40,54; 52,66]);
        Real RRim[3,3] = frame_a.P.R
          "Rotation Matrix of the Rim related to the interial system";
        annotation (Icon(                   Text(
              extent=[-100,-100; 100,-68],
              style(
                color=10,
                rgbcolor={135,135,135},
                fillPattern=1),
              string="%name")), Diagram(Rectangle(extent=[-100,60; 100,100], style(
                color=51,
                rgbcolor={255,255,170},
                fillColor=51,
                rgbfillColor={255,255,170}))),
          Documentation(info="<html>

Defines inputs and outputs for rim models.

</html>"));
      equation
        connect(eAxisSensor.frame_a, frame_a) annotation (points=[-80,19.4; -80,0;
              -110,0],    style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(eAxisSensor.out[7:9], SV.eAxis[:]) annotation (points=[-80,32.6;
              -80,50; -60,50; -60,78], style(
            color=74,
            rgbcolor={0,0,127},
            fillColor=51,
            rgbfillColor={255,255,170},
            fillPattern=1));
        connect(SV, tireBus.SV) annotation (points=[-60,78; -60,88; -2,88; -2,
              98; 0,98; 0,100], style(
            color=45,
            rgbcolor={255,128,0},
            fillColor=51,
            rgbfillColor={255,255,170},
            fillPattern=1));
        connect(UV, tireBus.UV) annotation (points=[60,78; 60,88; 2,88; 2,98; 0,
              98; 0,100], style(
            color=58,
            rgbcolor={0,127,0},
            fillColor=51,
            rgbfillColor={255,255,170},
            fillPattern=1));
        connect(eLong[:], UV.eLong[:]) annotation (points=[46,60; 46,68; 60,68;
              60,78], style(
            color=3,
            rgbcolor={0,0,255},
            fillColor=51,
            rgbfillColor={255,255,170},
            fillPattern=1));
        connect(eLat[:], UV.eLat[:]) annotation (points=[60,60; 60,78], style(
            color=3,
            rgbcolor={0,0,255},
            fillColor=51,
            rgbfillColor={255,255,170},
            fillPattern=1));
        connect(eN[:], UV.eN[:]) annotation (points=[74,60; 74,68; 60,68; 60,78],
            style(
            color=3,
            rgbcolor={0,0,255},
            fillColor=51,
            rgbfillColor={255,255,170},
            fillPattern=1));
      end RimBase;

      model SpokedRim "models a spoked rim"
        extends WheelsAndTires.TireComponents.Rim.RimBase;

        import MultiBondLib;
        import SI = Modelica.SIunits;
        import MB = Modelica.Mechanics.MultiBody;
        import PI = Modelica.Constants.pi;

        parameter SI.Mass mRim = 6 "Mass of the Rim";
        parameter SI.Length height = 0.02 "height of the belt";
        parameter SI.Inertia I_11 = 0.05 "[1,1] element of the inertia tensor" annotation(Dialog(group="Mass Properties"));
        parameter SI.Inertia I_22 = 0.05 "[2,2] element of the inertia tensor" annotation(Dialog(group="Mass Properties"));
        parameter SI.Inertia I_33 = 0.25 "[3,3] element of the inertia tensor" annotation(Dialog(group="Mass Properties"));
        parameter SI.Inertia I_21 = 0 "[2,1] element of the inertia tensor" annotation(Dialog(group="Mass Properties"));
        parameter SI.Inertia I_31 = 0 "[3,1] element of the inertia tensor" annotation(Dialog(group="Mass Properties"));
        parameter SI.Inertia I_32 = 0 "[3,2] element of the inertia tensor" annotation(Dialog(group="Mass Properties"));

      public
        SI.Position x[3] "Position of the frame";

        MultiBondLib.Mechanics3D.Parts.Body rimMass(
          animation=false,
          m=mRim,
          I_11=I_11,
          I_22=I_22,
          I_33=I_33,
          I_21=I_21,
          I_31=I_31,
          I_32=I_32,
          useQuaternions=false)
                         annotation (extent=[-10,20; 10,40], rotation=90);

      protected
        MB.Visualizers.Advanced.Shape tirePipe(
          each shapeType="pipe",
          each color=rimRodColor,
          each length= bRim,
          each width=2*rRim,
          each height=2*rRim,
          each lengthDirection={0,0,1},
          each widthDirection={0,1,0},
          each extra=(rRim-height)/rRim,
          each r_shape={0,0,-bRim/2},
          each r=x,
          each specularCoefficient=rimSpecularCoefficient,
          each R=MB.Frames.Orientation(T=RRim,w=zeros(3))) if visRimEnabled and world3D.enableAnimation;

      MB.Visualizers.Advanced.Shape cylinderX(
          each shapeType="cylinder",
          each color=rimRodColor,
          each length= 2*rRim,
          each width=bRim/8,
          each height=bRim/8,
          each lengthDirection={1,0,0},
          each widthDirection={0,0,1},
          each r_shape={-1,0,0}*rRim,
          each r=x,
          each specularCoefficient=rimSpecularCoefficient,
          each R=MB.Frames.Orientation(T=RRim,w=zeros(3))) if visRimEnabled and world3D.enableAnimation;

      MB.Visualizers.Advanced.Shape cylinderY(
          each shapeType="cylinder",
          each color=rimRodColor,
          each length= 2*rRim,
          each width=bRim/8,
          each height=bRim/8,
          each lengthDirection={0,1,0},
          each widthDirection={0,0,1},
          each r_shape={0,-1,0}*rRim,
          each r=x,
          each specularCoefficient=rimSpecularCoefficient,
          each R=MB.Frames.Orientation(T=RRim,w=zeros(3))) if visRimEnabled and world3D.enableAnimation;

      MB.Visualizers.Advanced.Shape cylinder45(
          each shapeType="cylinder",
          each color=rimRodColor,
          each length= 2*rRim,
          each width=bRim/8,
          each height=bRim/8,
          each lengthDirection={1,1,0},
          each widthDirection={0,0,1},
          each r_shape={-cos(PI/4),-sin(PI/4),0}*rRim,
          each r=x,
          each specularCoefficient=rimSpecularCoefficient,
          each R=MB.Frames.Orientation(T=RRim,w=zeros(3))) if visRimEnabled and world3D.enableAnimation;

      MB.Visualizers.Advanced.Shape cylinder45n(
          each shapeType="cylinder",
          each color=rimRodColor,
          each length= 2*rRim,
          each width=bRim/8,
          each height=bRim/8,
          each lengthDirection={1,-1,0},
          each widthDirection={0,0,1},
          each r_shape={-cos(PI/4),sin(PI/4),0}*rRim,
          each r=x,
          each specularCoefficient=rimSpecularCoefficient,
          each R=MB.Frames.Orientation(T=RRim,w=zeros(3))) if visRimEnabled and world3D.enableAnimation;

      MB.Visualizers.Advanced.Shape cylinder225(
          each shapeType="cylinder",
          each color=rimRodColor,
          each length= 2*rRim,
          each width=bRim/8,
          each height=bRim/8,
          each lengthDirection={cos(PI/8),sin(PI/8),0},
          each widthDirection={0,0,1},
          each r_shape={-cos(PI/8),-sin(PI/8),0}*rRim,
          each r=x,
          each specularCoefficient=rimSpecularCoefficient,
          each R=MB.Frames.Orientation(T=RRim,w=zeros(3))) if visRimEnabled and world3D.enableAnimation;

      MB.Visualizers.Advanced.Shape cylinder225n(
          each shapeType="cylinder",
          each color=rimRodColor,
          each length= 2*rRim,
          each width=bRim/8,
          each height=bRim/8,
          each lengthDirection={cos(PI/8),-sin(PI/8),0},
          each widthDirection={0,0,1},
          each r_shape={-cos(PI/8),+sin(PI/8),0}*rRim,
          each r=x,
          each specularCoefficient=rimSpecularCoefficient,
          each R=MB.Frames.Orientation(T=RRim,w=zeros(3))) if visRimEnabled and world3D.enableAnimation;

      MB.Visualizers.Advanced.Shape cylinder675(
          each shapeType="cylinder",
          each color=rimRodColor,
          each length= 2*rRim,
          each width=bRim/8,
          each height=bRim/8,
          each lengthDirection={cos(3*PI/8),sin(3*PI/8),0},
          each widthDirection={0,0,1},
          each r_shape={-cos(3*PI/8),-sin(3*PI/8),0}*rRim,
          each r=x,
          each specularCoefficient=rimSpecularCoefficient,
          each R=MB.Frames.Orientation(T=RRim,w=zeros(3))) if visRimEnabled and world3D.enableAnimation;

      MB.Visualizers.Advanced.Shape cylinder675n(
          each shapeType="cylinder",
          each color=rimRodColor,
          each length= 2*rRim,
          each width=bRim/8,
          each height=bRim/8,
          each lengthDirection={cos(3*PI/8),-sin(3*PI/8),0},
          each widthDirection={0,0,1},
          each r_shape={-cos(3*PI/8),sin(3*PI/8),0}*rRim,
          each r=x,
          each specularCoefficient=rimSpecularCoefficient,
          each R=MB.Frames.Orientation(T=RRim,w=zeros(3))) if visRimEnabled and world3D.enableAnimation;

      equation
        x = rimMass.PotentialFBM1.x;
        connect(rimMass.frame_a, frame_a) annotation (points=[-6.73533e-016,19;
              -6.73533e-016,0; -110,0],     style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2,
            fillPattern=1));
        connect(rimMass.frame_a, frame_b) annotation (points=[-6.73533e-016,19;
              -6.73533e-016,0; 110,0],     style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2,
            fillPattern=1));
        annotation (Icon(Bitmap(extent=[-92,82; 84,-68], name=
                  "images/roddedRim.png")), Diagram,
          Documentation(info="<html>

The Rim Class is a rather simple model, as the rim can be modeled ideally just consisting of a body that has a mass and an inertia tensor. It as well measures the unit vector eAxis on which the calculation of the other unit vectors is based. This is done in the Geometry class.

</html>"));
      end SpokedRim;

      annotation (Documentation(info="<html>

Models the Rim between its two frames.
</html>"));
    end Rim;

    annotation (Icon, preferedView="info", Documentation(info="<html>

For information on how to use the contained models see section [<a href=\"Modelica://WheelsAndTires.UsersGuide.StructureTL.Tire\">Tire Model Structure</a>] of the [<a href=\"Modelica://WheelsAndTires.UsersGuide\">User's Guide</a>]

</html>"));

    package Utilities
      "contains models needed to build the contained tire models."
      annotation(preferedView="info");

      package AdditionalBG
        "contains models that are additions to the Bond Graph Library BondLib"
        annotation(preferedView="info");

        model Angle
          "Forced movement of a rotational flange according to a non ideally derivated reference Real signal"
          import SI = Modelica.SIunits;

          parameter SI.Time T = 1e-5
            "time constant for the non ideal derivative Block";

          Modelica.Blocks.Interfaces.RealInput phi_ref(redeclare type
              SignalType =
                Modelica.SIunits.Angle) "External angle"
            annotation (extent=[-120,-10; -100,10]);
        protected
          BondLib.Sources.mSf W1  annotation (extent=[-2,-10; -22,10]);
          BondLib.Bonds.eBond B1
                         annotation (extent=[-2,-10; 18,10],   rotation=0);
        protected
          BondLib.Mechanical.Rotational.Interfaces.BG2Rot BG2Rot
                                   annotation (extent=[18,-10; 38,10]);
        public
          BondLib.Mechanical.Rotational.Interfaces.Flange_b flange_b
            "1D mechanical rotational output."
            annotation (extent=[90,-10; 110,10]);
          Modelica.Blocks.Continuous.Derivative derivative(T=T)
            annotation (extent=[-82,-10; -62,10]);
        equation
          connect(W1.BondCon1, B1.fBondCon1)
                                            annotation (points=[-2,0; -2,6.10623e-016;
                -2,6.10623e-016; -2,1.22125e-015; -2,0; -2,0],
              style(color=8, rgbcolor={192,192,192}));
          connect(B1.eBondCon1,BG2Rot. BondCon1) annotation (points=[18,0; 18,0],
              style(color=8, rgbcolor={192,192,192}));
          annotation (Diagram, Icon(
              Rectangle(extent=[-100,20; 0,-20], style(
                  color=9,
                  rgbcolor={175,175,175},
                  fillColor=8,
                  rgbfillColor={192,192,192})),
              Rectangle(extent=[0,20; 100,-20],     style(
                  gradient=2,
                  fillColor=8,
                  fillPattern=1)),
              Text(extent=[0,120; 0,60],   string="%name"),
              Text(
                extent=[-80,-40; 80,-100],
                string="phi",
                style(color=3, rgbcolor={0,0,255})),
              Line(points=[-80,20; -80,-26], style(color=3, rgbcolor={0,0,255})),
              Polygon(points=[-80,40; -76,20; -84,20; -80,40], style(
                  color=3,
                  rgbcolor={0,0,255},
                  fillColor=3,
                  rgbfillColor={0,0,255})),
              Line(points=[-26,-20; -86,-20], style(color=3, rgbcolor={0,0,255})),
              Polygon(points=[-26,-16; -6,-20; -26,-24; -26,-16], style(
                  color=3,
                  rgbcolor={0,0,255},
                  fillColor=3,
                  rgbfillColor={0,0,255})),
              Line(points=[-80,20; -78,6; -74,-4; -68,-12; -62,-16; -54,-18;
                    -40,-20; -28,-20; -20,-20],
                                         style(
                  color=3,
                  rgbcolor={0,0,255},
                  fillColor=3,
                  rgbfillColor={0,0,255},
                  fillPattern=1))),
            Documentation(info="<html>

There are two reasons for this model to exist. The first is a design issue that restricts the use
of the original <span class=\"cmti-10x-x-109\">Angle </span>element of the <span class=\"cmti-10x-x-109\">Bond Lib</span>. This issue can lead to a problem
with one equation to many in the system of equations due to the connection from
<span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">phi_ref</span></span></span> to <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">BG2Rot.phi</span></span></span> (the real port of the BG to Rot element).

Therefore this connection was canceled in this element. The second reason is that an
<span class=\"cmti-10x-x-109\">approximated derivative block </span>was used instead of an analytically calculating one. The main
reason for that is consistency with the element <span class=\"cmti-10x-x-109\">Position where an analytical derivative block leads to problems in certain models.

</html>"));
          connect(BG2Rot.Rot, flange_b)
            annotation (points=[38,0; 53.5,0; 53.5,1.16573e-015; 69,1.16573e-015; 69,
                0; 100,0],                    style(color=0, rgbcolor={0,0,0}));
          connect(phi_ref, derivative.u) annotation (points=[-110,0; -103.5,0; -103.5,
                1.22125e-015; -97,1.22125e-015; -97,0; -84,0],               style(
                color=74, rgbcolor={0,0,127}));
          connect(derivative.y, W1.s) annotation (points=[-61,0; -51,0; -51,
                1.22125e-015; -41,1.22125e-015; -41,0; -21,0],           style(
                color=74, rgbcolor={0,0,127}));

        end Angle;

        model AngularVelocity
          "Forced movement of a rotational flange according to a non ideally derivated reference Real signal"

          Modelica.Blocks.Interfaces.RealInput w_ref(redeclare type SignalType
              = Modelica.SIunits.AngularVelocity) "External anglular velocity"
            annotation (extent=[-120,-10; -100,10]);
          annotation (Diagram, Icon(
              Rectangle(extent=[0,20; 100,-20],     style(
                  gradient=2,
                  fillColor=8,
                  fillPattern=1)),
              Text(extent=[0,120; 0,60],   string="%name"),
              Text(
                extent=[-80,-40; 80,-100],
                style(color=3, rgbcolor={0,0,255}),
                string="w"),
              Rectangle(extent=[-100,20; 0,-20], style(
                  color=9,
                  rgbcolor={175,175,175},
                  fillColor=8,
                  rgbfillColor={192,192,192})),
              Line(points=[-80,20; -80,-26], style(color=3, rgbcolor={0,0,255})),
              Polygon(points=[-80,40; -76,20; -84,20; -80,40], style(
                  color=3,
                  rgbcolor={0,0,255},
                  fillColor=3,
                  rgbfillColor={0,0,255})),
              Line(points=[-26,-20; -86,-20], style(color=3, rgbcolor={0,0,255})),
              Polygon(points=[-26,-16; -6,-20; -26,-24; -26,-16], style(
                  color=3,
                  rgbcolor={0,0,255},
                  fillColor=3,
                  rgbfillColor={0,0,255})),
              Line(points=[-80,20; -78,6; -74,-4; -68,-12; -62,-16; -54,-18;
                    -40,-20; -28,-20; -20,-20],
                                         style(
                  color=3,
                  rgbcolor={0,0,255},
                  fillColor=3,
                  rgbfillColor={0,0,255},
                  fillPattern=1))),
            Documentation(info="<html>

The <span class=\"cmti-10x-x-109\">Angular Velocity </span>block is added to the library for the same reasons as the <span class=\"cmti-10x-x-109\">Angle</span>
block. It is the one equation too many when connected e.g.&nbsp;to an actuated revolute
joint.
<!--l. 29--></p><p class=\"noindent\">The model is the same as for the <span class=\"cmti-10x-x-109\">Angle </span>block without the <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">derivative</span></span></span> block.

</html>"));

        protected
          BondLib.Sources.mSf W1  annotation (extent=[-2,-10; -22,10]);
          BondLib.Bonds.eBond B1
                         annotation (extent=[-2,-10; 18,10],   rotation=0);
        protected
          BondLib.Mechanical.Rotational.Interfaces.BG2Rot BG2Rot
                                   annotation (extent=[18,-10; 38,10]);
        public
          BondLib.Mechanical.Rotational.Interfaces.Flange_b flange_b
            "1D mechanical rotational output."
            annotation (extent=[90,-10; 110,10]);
        equation
          connect(W1.BondCon1, B1.fBondCon1)
                                            annotation (points=[-2,0; -2,6.10623e-016;
                -2,6.10623e-016; -2,1.22125e-015; -2,0; -2,0],
              style(color=8, rgbcolor={192,192,192}));
          connect(B1.eBondCon1,BG2Rot. BondCon1) annotation (points=[18,0; 18,0],
              style(color=8, rgbcolor={192,192,192}));
          connect(BG2Rot.Rot, flange_b)
            annotation (points=[38,0; 53.5,0; 53.5,1.16573e-015; 69,1.16573e-015; 69,
                0; 100,0],                    style(color=0, rgbcolor={0,0,0}));
          connect(w_ref, W1.s) annotation (points=[-110,0; -87.75,0; -87.75,
                1.16573e-015; -65.5,1.16573e-015; -65.5,0; -21,0], style(color=74,
                rgbcolor={0,0,127}));
        end AngularVelocity;

        model Position
          "Forced movement of a tranlational flange according to a non ideally derivated reference Real signal"
          import SI = Modelica.SIunits;

          parameter SI.Time T = 1e-5
            "time constant for the non ideal derivative Block";

          Modelica.Blocks.Interfaces.RealInput s_ref(redeclare type SignalType
              = Modelica.SIunits.Position) "External position"
            annotation (extent=[-120,-10; -100,10]);
        protected
          BondLib.Sources.mSf W1  annotation (extent=[-2,-10; -22,10]);
          BondLib.Bonds.eBond B1
                         annotation (extent=[-2,-10; 18,10],   rotation=0);
        protected
          BondLib.Mechanical.Translational.Interfaces.BG2Tr BG2Rot
                                   annotation (extent=[18,-10; 38,10]);
        public
          BondLib.Mechanical.Translational.Interfaces.Flange_b flange_b
            "1D mechanical translational output."
            annotation (extent=[90,-10; 110,10]);
          Modelica.Blocks.Continuous.Derivative derivative(T=T)
            annotation (extent=[-60,-10; -40,10]);
        equation
          connect(W1.BondCon1, B1.fBondCon1)
                                            annotation (points=[-2,0; -2,6.10623e-016;
                -2,6.10623e-016; -2,1.22125e-015; -2,0; -2,0],
              style(color=8, rgbcolor={192,192,192}));
          connect(B1.eBondCon1,BG2Rot. BondCon1) annotation (points=[18,0; 18,0],
              style(color=8, rgbcolor={192,192,192}));
          annotation (Diagram, Icon(
              Text(extent=[0,120; 0,60],   string="%name"),
              Text(
                extent=[-80,-40; 80,-100],
                style(color=3, rgbcolor={0,0,255}),
                string="s"),
              Line(points=[-100,0; 90,0],  style(color=58, rgbcolor={0,127,0})),
              Line(points=[-80,20; -80,-26], style(color=3, rgbcolor={0,0,255})),
              Polygon(points=[-80,40; -76,20; -84,20; -80,40], style(
                  color=3,
                  rgbcolor={0,0,255},
                  fillColor=3,
                  rgbfillColor={0,0,255})),
              Line(points=[-26,-20; -86,-20], style(color=3, rgbcolor={0,0,255})),
              Polygon(points=[-26,-16; -6,-20; -26,-24; -26,-16], style(
                  color=3,
                  rgbcolor={0,0,255},
                  fillColor=3,
                  rgbfillColor={0,0,255})),
              Line(points=[-80,20; -78,6; -74,-4; -68,-12; -62,-16; -54,-18;
                    -40,-20; -28,-20; -20,-20],
                                         style(
                  color=3,
                  rgbcolor={0,0,255},
                  fillColor=3,
                  rgbfillColor={0,0,255},
                  fillPattern=1))),
            Documentation(info="<html>

The <span class=\"cmti-10x-x-109\">Position </span>model has the same background as the <span class=\"cmti-10x-x-109\">Angle</span>. The main difference is that here
translational elements are used instead of rotational ones.


</html>"));
          connect(s_ref, derivative.u)   annotation (points=[-110,0; -98,0; -98,
                1.22125e-015; -86,1.22125e-015; -86,0; -62,0],               style(
                color=74, rgbcolor={0,0,127}));
          connect(derivative.y, W1.s) annotation (points=[-39,0; -34.5,0; -34.5,
                1.22125e-015; -30,1.22125e-015; -30,0; -21,0],           style(
                color=74, rgbcolor={0,0,127}));
          connect(BG2Rot.Tr, flange_b) annotation (points=[37.9,-0.1; 67.95,-0.1;
                67.95,0; 100,0], style(color=58, rgbcolor={0,127,0}));
        end Position;

        model PositionWithS
          "Forced movement of a tranlational flange according to a non ideally derivated reference Real signal, with the equation for the position contained."
          import SI = Modelica.SIunits;

          parameter SI.Time T = 1e-5
            "time constant for the non ideal derivative Block";

          Modelica.Blocks.Interfaces.RealInput s_ref(redeclare type SignalType
              = Modelica.SIunits.Position) "External position"
            annotation (extent=[-120,-10; -100,10]);
        protected
          BondLib.Sources.mSf W1  annotation (extent=[-2,-10; -22,10]);
          BondLib.Bonds.eBond B1
                         annotation (extent=[-2,-10; 18,10],   rotation=0);
        protected
          BondLib.Mechanical.Translational.Interfaces.BG2Tr BG2Rot
                                   annotation (extent=[18,-10; 38,10]);
        public
          BondLib.Mechanical.Translational.Interfaces.Flange_b flange_b
            "1D mechanical translational output."
            annotation (extent=[90,-10; 110,10]);
          Modelica.Blocks.Continuous.Derivative derivative(T=T)
            annotation (extent=[-60,-10; -40,10]);
        equation
          connect(W1.BondCon1, B1.fBondCon1)
                                            annotation (points=[-2,0; -2,6.10623e-016;
                -2,6.10623e-016; -2,1.22125e-015; -2,0; -2,0],
              style(color=8, rgbcolor={192,192,192}));
          connect(B1.eBondCon1,BG2Rot. BondCon1) annotation (points=[18,0; 18,0],
              style(color=8, rgbcolor={192,192,192}));
          annotation (Diagram, Icon(
              Text(extent=[0,120; 0,60],   string="%name"),
              Text(
                extent=[-80,-40; 80,-100],
                style(color=3, rgbcolor={0,0,255}),
                string="s"),
              Line(points=[-100,0; 90,0],  style(color=58, rgbcolor={0,127,0})),
              Line(points=[-80,20; -80,-26], style(color=3, rgbcolor={0,0,255})),
              Polygon(points=[-80,40; -76,20; -84,20; -80,40], style(
                  color=3,
                  rgbcolor={0,0,255},
                  fillColor=3,
                  rgbfillColor={0,0,255})),
              Line(points=[-26,-20; -86,-20], style(color=3, rgbcolor={0,0,255})),
              Polygon(points=[-26,-16; -6,-20; -26,-24; -26,-16], style(
                  color=3,
                  rgbcolor={0,0,255},
                  fillColor=3,
                  rgbfillColor={0,0,255})),
              Line(points=[20,0; 20,-40],  style(color=58, rgbcolor={0,127,0})),
              Line(points=[80,-40; 20,-40],style(color=58, rgbcolor={0,127,0})),
              Line(points=[80,0; 80,-40],  style(color=58, rgbcolor={0,127,0})),
              Polygon(points=[80,0; 78,-8; 82,-8; 80,0], style(
                  color=58,
                  rgbcolor={0,127,0},
                  fillColor=58,
                  rgbfillColor={0,127,0},
                  fillPattern=1)),
              Line(points=[-80,20; -78,6; -74,-4; -68,-12; -62,-16; -54,-18;
                    -40,-20; -28,-20; -20,-20],
                                         style(
                  color=3,
                  rgbcolor={0,0,255},
                  fillColor=3,
                  rgbfillColor={0,0,255},
                  fillPattern=1))),
            Documentation(info="<html>

The <span class=\"cmti-10x-x-109\">Position With S </span>element is basically the <span class=\"cmti-10x-x-109\">Position </span>element with the
additional equation for the position added from the input to the \"BG to Tr\" element. So the only difference between the <span class=\"cmti-10x-x-109\">Position With S </span>element and the original
<span class=\"cmti-10x-x-109\">Position </span>from the <span class=\"cmti-10x-x-109\">Bond Lib </span>element is the non ideal derivative block used instead of the ideal
one. This is done because the element is used in the <span class=\"cmti-10x-x-109\">Vertical Dynamics </span>classes. The functions
that are used to determine elevation and normal vector of the surface are not derivable with
the ideal block. Therefore, the non ideal block has been used introducing just little difference
to the ideal solution. The time constant which is the reason for the non ideal behavior, is a


parameter that can be set to very small values. For the default value, a time constant
was used that enables good accurateness with very little influence on simulation
time.


</html>"));
          connect(s_ref, derivative.u)   annotation (points=[-110,0; -98,0; -98,
                1.22125e-015; -86,1.22125e-015; -86,0; -62,0],               style(
                color=74, rgbcolor={0,0,127}));
          connect(derivative.y, W1.s) annotation (points=[-39,0; -34.5,0; -34.5,
                1.22125e-015; -30,1.22125e-015; -30,0; -21,0],           style(
                color=74, rgbcolor={0,0,127}));
          connect(BG2Rot.Tr, flange_b) annotation (points=[37.9,-0.1; 67.95,-0.1;
                67.95,0; 100,0], style(color=58, rgbcolor={0,127,0}));
          connect(s_ref, BG2Rot.s) annotation (points=[-110,0; -80,0; -80,-20; 28,-20;
                28,-10], style(color=74, rgbcolor={0,0,127}));
        end PositionWithS;

        model Velocity
          "Forced movement of a translational flange according to a non reference Real signal"

          Modelica.Blocks.Interfaces.RealInput v_ref(redeclare type SignalType
              = Modelica.SIunits.Velocity) "External angle"
            annotation (extent=[-120,-10; -100,10]);
          annotation (Diagram, Icon(
              Text(extent=[0,120; 0,60],   string="%name"),
              Text(
                extent=[-80,-40; 80,-100],
                style(color=3, rgbcolor={0,0,255}),
                string="v"),
              Line(points=[-100,0; 90,0],  style(color=58, rgbcolor={0,127,0})),
              Line(points=[-80,20; -80,-26], style(color=3, rgbcolor={0,0,255})),
              Polygon(points=[-80,40; -76,20; -84,20; -80,40], style(
                  color=3,
                  rgbcolor={0,0,255},
                  fillColor=3,
                  rgbfillColor={0,0,255})),
              Line(points=[-26,-20; -86,-20], style(color=3, rgbcolor={0,0,255})),
              Polygon(points=[-26,-16; -6,-20; -26,-24; -26,-16], style(
                  color=3,
                  rgbcolor={0,0,255},
                  fillColor=3,
                  rgbfillColor={0,0,255})),
              Line(points=[-80,20; -78,6; -74,-4; -68,-12; -62,-16; -54,-18;
                    -40,-20; -28,-20; -20,-20],
                                         style(
                  color=3,
                  rgbcolor={0,0,255},
                  fillColor=3,
                  rgbfillColor={0,0,255},
                  fillPattern=1))),
            Documentation(info="<html>

The velocity block leaves out the superfluous equation contained in the original <span class=\"cmti-10x-x-109\">Speed </span>block
of the <span class=\"cmti-10x-x-109\">Bond Lib </span>for the position to allow simulation.

</html>"));
        protected
          BondLib.Sources.mSf W1  annotation (extent=[-2,-10; -22,10]);
          BondLib.Bonds.eBond B1
                         annotation (extent=[-2,-10; 18,10],   rotation=0);
        protected
          BondLib.Mechanical.Translational.Interfaces.BG2Tr BG2Rot
                                   annotation (extent=[18,-10; 38,10]);
        public
          BondLib.Mechanical.Translational.Interfaces.Flange_b flange_b
            "1D mechanical translational output."
            annotation (extent=[90,-10; 110,10]);
        equation
          connect(W1.BondCon1, B1.fBondCon1)
                                            annotation (points=[-2,0; -2,6.10623e-016;
                -2,6.10623e-016; -2,1.22125e-015; -2,0; -2,0],
              style(color=8, rgbcolor={192,192,192}));
          connect(B1.eBondCon1,BG2Rot. BondCon1) annotation (points=[18,0; 18,0],
              style(color=8, rgbcolor={192,192,192}));
          connect(v_ref, W1.s) annotation (points=[-110,0; -87.75,0; -87.75,
                1.16573e-015; -65.5,1.16573e-015; -65.5,0; -21,0], style(color=74,
                rgbcolor={0,0,127}));
          connect(BG2Rot.Tr, flange_b) annotation (points=[37.9,-0.1; 68.95,-0.1;
                68.95,0; 100,0], style(color=58, rgbcolor={0,127,0}));
        end Velocity;

        model SpringDamperSerial "Linear 1D translational spring damper system"
          extends BondLib.Mechanical.Translational.Interfaces.OnePort;

          import SI = Modelica.SIunits;

          parameter SI.Distance s_rel0=0 "Unstretched spring length";
          parameter Real c(
            final unit="N/m",
            final min=0) = 1 "Spring constant ";
          parameter Real d(
            final unit="N/ (m/s)",
            final min=0) = 1 "damping constant";
          parameter SI.Distance sD0 = 0 "Initial length of the damper element";

          SI.Distance s_rel;

        protected
          Modelica.SIunits.Velocity v_rel "Relative velocity of spring";
          Modelica.SIunits.Force f "Spring force";
          BondLib.Mechanical.Translational.Interfaces.Tr2BG Tr2BG
            annotation (extent=[-82,-10; -62,10]);
          BondLib.Bonds.eBond B1
                          annotation (extent=[-30,0; -10,20]);
          BondLib.Bonds.fBond B2
                          annotation (extent=[10,0; 30,20]);
          BondLib.Junctions.J0p4 j0p3_1
                                 annotation (extent=[-10,0; 10,20]);
          BondLib.Sources.mSe Fx
            annotation (extent=[-10,-40; 10,-20],rotation=-90);
          BondLib.Bonds.fBond B3
                          annotation (extent=[-10,-20; 10,0], rotation=
                90);
          Modelica.Blocks.Math.Gain G1(k=c)
            annotation (extent=[-10,-64; 10,-44], rotation=90);
          Modelica.Blocks.Math.Add3 A1(k3=-1)
            annotation (extent=[-50,-82; -30,-62]);
          Modelica.Blocks.Sources.Constant C1(k=s_rel0)
            annotation (extent=[-100,-82; -80,-62]);
          BondLib.Mechanical.Translational.Interfaces.BG2Tr BG2Tr
            annotation (extent=[64,-10; 84,10]);
          BondLib.Bonds.fBond B4
                          annotation (extent=[-10,60; 10,80], rotation=90);
          BondLib.Bonds.fBond B6
                          annotation (extent=[-10,20; 10,40], rotation=90);
          BondLib.Passive.R R(R=d)
                                 annotation (extent=[-10,80; 10,100], rotation=90);
          BondLib.Sensors.Dq dq(q0=sD0)
                                annotation (extent=[30,40; 50,60], rotation=0);
          Modelica.Blocks.Math.Add A2
            annotation (extent=[-10,-96; 10,-76], rotation=180);
          BondLib.Junctions.J1p3 j0p3_2
                                 annotation (extent=[-10,40; 10,60], rotation=90);
          BondLib.Bonds.eBond B5
                          annotation (extent=[10,40; 30,60]);
        equation
          connect(j0p3_1.BondCon1,B1. eBondCon1) annotation (points=[-10,10; -10,10],
                    style(color=8, rgbcolor={192,192,192}));
          connect(j0p3_1.BondCon2,B2. eBondCon1) annotation (points=[10,10; 10,10],
              style(color=8, rgbcolor={192,192,192}));
          connect(Tr2BG.BondCon1,B1. fBondCon1) annotation (points=[-62,0; -56,0; -56,
                10; -30,10],        style(color=8, rgbcolor={192,192,192}));
          connect(Fx.BondCon1,B3. eBondCon1) annotation (points=[-6.12303e-016,
                -20; -6.12303e-016,-20],
                                       style(color=8, rgbcolor={192,192,192}));
          connect(B3.fBondCon1,j0p3_1. BondCon3) annotation (points=[
                6.12303e-016,0; 1.13924e-015,0; 1.13924e-015,4.87687e-022;
                1.16657e-015,4.87687e-022; 1.16657e-015,0; 0,0],
                                        style(color=8, rgbcolor={192,192,192}));
          connect(A1.y,G1. u) annotation (points=[-29,-72; -7.34764e-016,-72;
                -7.34764e-016,-66], style(color=74, rgbcolor={0,0,127}));
          connect(Tr2BG.s,A1. u1) annotation (points=[-72,-10; -72,-64; -52,-64],
                                   style(color=3, rgbcolor={0,0,255}));
          connect(C1.y,A1. u2) annotation (points=[-79,-72; -52,-72], style(
                color=74, rgbcolor={0,0,127}));
          annotation (
            Diagram,
            Icon(
              Line(points=[-60,-90; 20,-90],   style(color=0, fillColor=10)),
              Polygon(points=[50,-90; 20,-80; 20,-100; 50,-90],     style(color=10,
                    fillColor=10)),
              Text(extent=[0,110; 0,50],   string="%name"),
              Line(points=[-90,0; -80,0; -70,-30; -50,32; -30,-30; -10,32; 0,0; 40,
                    0], style(color=0, rgbcolor={0,0,0})),
              Line(points=[20,20; 60,20; 60,-20; 20,-20; 60,-20; 60,0; 92,0], style(
                    color=0, rgbcolor={0,0,0})),
              Rectangle(extent=[34,20; 60,-20],    style(color=0, fillColor=8))),
            Documentation(info="<html>

In contrast to the <span class=\"cmti-10x-x-109\">Modelica Standard Library</span>, the <span class=\"cmti-10x-x-109\">Bond Lib </span>does not allow a serial connection
of a spring and a damper element without a mass in between the two elements. Therefore, an
element was developed that is used in the <span class=\"cmti-10x-x-109\">Gehmann Elevation </span>model. It is derived
from the original model of a spring in the <span class=\"cmti-10x-x-109\">Bond Lib.

</html>"));
          s_rel = BG2Tr.s - Tr2BG.s;
          v_rel = Fx.f;
          f = -G1.y;
          connect(Tr2BG.Tr, flange_a) annotation (points=[-82.1,-0.1; -85.05,-0.1;
                -85.05,0; -100,0],       style(color=58, rgbcolor={0,127,0}));
          connect(G1.y, Fx.s) annotation (points=[6.73533e-016,-43;
                6.73533e-016,-38; 5.51073e-016,-38; 5.51073e-016,-39],    style(
                color=74, rgbcolor={0,0,127}));
          connect(BG2Tr.Tr, flange_b) annotation (points=[83.9,-0.1; 92.95,-0.1;
                92.95,0; 99,0], style(color=58, rgbcolor={0,127,0}));
          connect(A2.u1, BG2Tr.s) annotation (points=[12,-92; 74,-92; 74,-10],
              style(color=74, rgbcolor={0,0,127}));
          connect(A2.y, A1.u3) annotation (points=[-11,-86; -72,-86; -72,-80; -52,
                -80], style(color=74, rgbcolor={0,0,127}));
          connect(B4.fBondCon1, R.BondCon1) annotation (points=[6.12303e-016,80;
                -6.12303e-016,80], style(color=8, rgbcolor={192,192,192}));
          connect(j0p3_1.BondCon4, B6.eBondCon1) annotation (points=[0,20;
                -6.12303e-016,20], style(color=8, rgbcolor={192,192,192}));
          connect(B4.eBondCon1, j0p3_2.BondCon2) annotation (points=[
                -6.12303e-016,60; 6.12303e-016,60],
                                      style(color=8, rgbcolor={192,192,192}));
          connect(j0p3_2.BondCon1, B6.fBondCon1) annotation (points=[
                -6.12303e-016,40; 6.12303e-016,40],
                                      style(color=8, rgbcolor={192,192,192}));
          connect(j0p3_2.BondCon3, B5.fBondCon1) annotation (points=[10,50; 10,50],
              style(color=8, rgbcolor={192,192,192}));
          connect(dq.BondCon1, B5.eBondCon1) annotation (points=[30,50; 30,50],
              style(color=8, rgbcolor={192,192,192}));
          connect(B2.fBondCon1, BG2Tr.BondCon1) annotation (points=[30,10; 60,10; 60,
                0; 64,0],    style(color=8, rgbcolor={192,192,192}));
          connect(dq.OutPort1, A2.u2) annotation (points=[51,50; 54,50; 54,-80; 12,
                -80], style(color=74, rgbcolor={0,0,127}));
        end SpringDamperSerial;

        model ElevationGap "enables force free lift of the ground"
          import SI = Modelica.SIunits;
          extends BondLib.Mechanical.Translational.Interfaces.OnePort;

          annotation (Diagram, Icon(
              Text(
                extent=[-100,100; 100,60],
                style(
                  color=58,
                  rgbcolor={0,127,0},
                  fillColor=58,
                  rgbfillColor={0,127,0},
                  fillPattern=1),
                string="%name"),
              Line(points=[-40,-20; 60,-20],
                                         style(color=58, rgbcolor={0,127,0})),
              Polygon(points=[18,6; 18,40; 14,40; 20,54; 26,40; 22,40; 22,6; 18,6],
                            style(
                  color=58,
                  rgbcolor={0,127,0},
                  fillColor=58,
                  rgbfillColor={0,127,0})),
              Text(
                extent=[40,20; 100,60],
                style(
                  color=58,
                  rgbcolor={0,127,0},
                  fillColor=58,
                  rgbfillColor={0,127,0},
                  fillPattern=1),
                string="f = 0"),
              Polygon(points=[18,-2; 18,-38; 14,-38; 20,-52; 26,-38; 22,-38; 22,
                    -2; 18,-2],      style(
                  color=58,
                  rgbcolor={0,127,0},
                  fillColor=58,
                  rgbfillColor={0,127,0})),
              Line(points=[-20,-20; -20,-90],
                                            style(color=58, rgbcolor={0,127,0})),
              Ellipse(extent=[0,20; 40,-20], style(
                  color=58,
                  rgbcolor={0,127,0},
                  gradient=3,
                  fillColor=58,
                  rgbfillColor={0,127,0})),
              Line(points=[60,-20; 60,-90], style(color=58, rgbcolor={0,127,0})),
              Ellipse(extent=[6,14; 34,-14], style(
                  color=58,
                  rgbcolor={0,127,0},
                  fillColor=7,
                  rgbfillColor={255,255,255})),
              Line(points=[-100,-80; -40,-80; -40,-40; 20,-20], style(color=5,
                    rgbcolor={255,0,255}))),
            Documentation(info="<html>

It is realized by a force sensor that measures the force generated by the externally connected
elements in order to supply an inversely connected source of force if there is no contact to the
ground. This makes it possible to have external 1D translational elements determining the
vertical dynamics of the tire in the case of contact which is very convenient. As realized
in the <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">kelvinElevation</span></span></span> there is a simple spring damper system for the vertical
dynamics.
<!--l. 69--></p><p class=\"noindent\">There is one disadvantage of this model. This is that in the case of decreasing
<span class=\"cmtt-10x-x-109\">penetrationDepth</span>, the damper introduces a force that \"pulls\" the tire back onto the street.
This happens because of the damper's characteristic. If this force gets bigger than the force
of the spring that \"presses\" the tire away from the street, the tire \"sticks\" on the street, and
this is not the real physical behavior. This is a serious issue if the damping coefficient is big
compared to the spring constant. As tires usually have very low damping coefficients and are
relatively stiff, that fact is neglected in favor of the comfortable way to specify
more complex vertical dynamics.

</html>"));
          Modelica.Blocks.Sources.Constant no_Force(k=0)
            annotation (extent=[0,40; 20,60], rotation=0);
          Modelica.Blocks.Logical.Switch switch  annotation (extent=[32,-10; 52,
                10]);
          BondLib.Mechanical.Translational.Sensors.ForceSensor forceSensor
            annotation (extent=[-60,-52; -40,-32],
                                                 rotation=180);
          BondLib.Mechanical.Translational.Sources.Force force
            annotation (extent=[60,-10; 80,10], rotation=0);
          BondLib.Mechanical.Translational.Interfaces.Flange_b
            flange_b_extention "Right translational connector"
            annotation (extent=[50,-110; 70,-90]);
          BondLib.Mechanical.Translational.Interfaces.Flange_a
            flange_a_extention "Left translational connector"
            annotation (extent=[-30,-110; -10,-90]);
          Modelica.Blocks.Interfaces.BooleanInput Contact
            "set to true if there is contact and to false if not."
            annotation (extent=[-120,-90; -100,-70]);
        equation
          connect(force.f, switch.y)  annotation (points=[61,0; 59,0; 59,1.22125e-015;
                57,1.22125e-015; 57,0; 53,0],                          style(
              color=74,
              rgbcolor={0,0,127},
              fillColor=58,
              rgbfillColor={0,127,0},
              fillPattern=1));
          connect(force.flange_b, flange_b) annotation (points=[80,0; 84.75,0; 84.75,
                1.16573e-015; 89.5,1.16573e-015; 89.5,0; 99,0],              style(
              color=58,
              rgbcolor={0,127,0},
              fillColor=58,
              rgbfillColor={0,127,0},
              fillPattern=1));
          connect(forceSensor.flange_b, flange_a) annotation (points=[-59.9,-42; -90,
                -42; -90,0; -100,0],style(
              color=58,
              rgbcolor={0,127,0},
              fillColor=58,
              rgbfillColor={0,127,0},
              fillPattern=1));
          connect(flange_a_extention, flange_a_extention) annotation (points=[-20,-100;
                -20,-100],       style(color=58, rgbcolor={0,127,0}));
          connect(forceSensor.flange_a, flange_a_extention) annotation (points=[-40,-42;
                -20,-42; -20,-100],      style(color=58, rgbcolor={0,127,0}));
          connect(flange_b_extention, force.flange_b) annotation (points=[60,-100; 60,
                -40; 80,-40; 80,0],
                        style(color=58, rgbcolor={0,127,0}));
          connect(forceSensor.f, switch.u3) annotation (points=[-50,-32; -50,-8;
                30,-8],            style(color=74, rgbcolor={0,0,127}));
          connect(no_Force.y, switch.u1) annotation (points=[21,50; 26,50; 26,8; 30,8],
                    style(color=74, rgbcolor={0,0,127}));
          connect(Contact, switch.u2) annotation (points=[-110,-80; -72,-80; -72,0;
                30,0],    style(color=5, rgbcolor={255,0,255}));
        end ElevationGap;
      end AdditionalBG;

      package AddititionalMBG
        "contains models that are additions to the Mulit Bond Graph Library MultiBondLib"
        annotation(preferedView="info");

        connector BooleanSignal "acausal boolean signal"

        annotation(Documentation(info="<html>
The <span class=\"cmti-10x-x-109\">Boolean Signal is created to handle the <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">Contact</span></span></span> signal in an acausal way in the communication structure. It is simply the Boolean version of the <span class=\"cmti-10x-x-109\">Real Signal </span>in
the <span class=\"cmti-10x-x-109\">Multi Bond Lib</span>.

</html>
"));
           extends Modelica.Blocks.Interfaces.BooleanSignal;

          annotation (Icon(Polygon(points=[0,80; -80,0; 0,-80; 80,0; 0,80], style(
                  color=83,
                  rgbcolor={255,85,255},
                  fillColor=7,
                  rgbfillColor={255,255,255},
                  fillPattern=1)), Text(
                extent=[-80,28; 80,-26],
                string="%name",
                style(
                  color=83,
                  rgbcolor={255,85,255},
                  fillColor=7,
                  rgbfillColor={255,255,255},
                  fillPattern=1))));
        end BooleanSignal;

        model mTF2_effort
          "modulated projective multibondgraphic effort transformator"
          import MultiBondLib;
        annotation(Documentation(info="<html>
This is the model of the projective multibondgraphic effort transformator. This is a two-port element, where
both connectors are of different cardinality. The bond on side A must be of cardinality nA
and the bond on side B of cardinality nB.
<p>
<b>The bondgraphic effort is projected by the matrix M in direction of the arrow</b><br>
or: <br>
<b>eA</b> = <b>M</b> * der(<b>eB</b>) and<br>
<b>fB</b> = transpose(<b>M</b>) * der(<b>fA</b>);<br>
where <b>M</b> is a  nB x nA matrix.
<p>
The cardinality of the two ports can be set by the parameters nA and nB. <br>
The transformation can be specified by the matrix M of size nB x nA.
</html>
"),     Diagram);
          extends MultiBondLib.Interfaces.TwoDiffPort;
          MultiBondLib.Interfaces.RealSignal M[nB,nA] "modulation matrix"
                                                  annotation (extent=[-10,-118;
                10,-98]);
        equation
          eB = M*eA;
          fA = transpose(M)*fB;
          annotation (Icon(
              Text(extent=[-100,110; 100,60],string="%name"),
              Text(extent=[-68,-50; 72,-90], string="effort"),
              Text(
                extent=[-100,70; 100,-68],
                style(color=0, fillColor=0),
                string="TF")));
        end mTF2_effort;

        model mTranslationalTF_r "modulated translational transformer"
          import MultiBondLib;
          extends MultiBondLib.Interfaces.TwoPort(final n=3);

          annotation (
            extent=[-10,-114; 10,-94],
            rotation=90,
            Diagram,
            Icon(
              Text(extent=[-100,90; 100,50],
                                           string="%name"),
              Text(
                extent=[-90,77; 90,-77],
                style(color=0, fillColor=0),
                string="mTF"),
              Text(extent=[-100,-48; 100,-86],
                                             string="translational")),
            Documentation(info="<html>
This is the translational transformer. It couples the rotational domain at the arrow tail
with the translational domain at the arrow head. It is of fixed cardinality 3.
<p>
The angular velocity is transformed along a vector <b>r</b>.
This leads to the equation:<br>
<b>v</b> = <b>w</b> cross <b>r</b><br>
and in consequence:<br>
<b>t</b> = <b>r</b> cross <b>f</b><br>
<p>
<b>r</b> can be set by an parameter.
</html>"));
          MultiBondLib.Interfaces.RealSignal r[3] "modulation radius"
                                                 annotation (extent=[-10,90; 10,
                110]);
        equation

            f2 = cross(f1,r);
            e1 = cross(r,e2);

          annotation (Icon(
              Text(extent=[-74,92; 66,52], string="%name"),
              Text(extent=[-70,-50; 70,-90], string="translational"),
              Text(
                extent=[-86,78; 92,-76],
                style(color=0, fillColor=0),
                string="mTF")));
        end mTranslationalTF_r;

        model mTranslationalTF_ampl
          "modulated translational transformer by amplification"
          import MultiBondLib;
          extends MultiBondLib.Interfaces.TwoPort(final n=3);
          annotation (
            extent=[-10,-114; 10,-94],
            rotation=90,
            Diagram,
            Icon(
              Text(extent=[-100,90; 100,50],
                                           string="%name"),
              Text(
                extent=[-90,90; 90,-90],
                style(color=0, fillColor=0),
                string="mTF"),
              Text(extent=[-100,-48; 100,-86],
                                             string="translational")),
            Documentation(info="<html>
This is a modulated translational transformer. It couples the rotational domain at the arrow tail
with the translational domain at the arrow head.<br> It is of fixed cardinality 3.
<p>
Different from the unmodulated translational transformer, the vector <b>r</b> can be amplified
by a real signal \"ampl\".
<p>
The angular velocity is then transformed along a vector <b>r</b>*ampl.
This leads to the equation:<br>
<b>v</b> = <b>w</b> cross (<b>r</b>*ampl)<br>
and in consequence:<br>
<b>t</b> = (<b>r</b>*ampl) cross <b>f</b><br>
<p>
<b>r</b> can be set by an parameter. This element is used to model a prismatic joint.
</html>"));
          MultiBondLib.Interfaces.RealSignal ampl "amplification signal"
                                                  annotation (extent=[-10,90; 10,110]);
          MultiBondLib.Interfaces.RealSignal r[3] "modulation radius"
                                                  annotation (extent=[-8,-110; 12,
                -90]);
        equation

            f2 = cross(f1,ampl*r);
            e1 = cross(ampl*r,e2);

          annotation (Icon(
              Text(extent=[-74,92; 66,52], string="%name"),
              Text(extent=[-70,-50; 70,-90], string="translational"),
              Text(
                extent=[-86,78; 92,-76],
                style(color=0, fillColor=0),
                string="mTF")));
        end mTranslationalTF_ampl;

        model mTranslation_r "modulated translation of position"

          annotation (Icon(
              Rectangle(extent=[-80,80; 80,-80], style(
                  color=3,
                  rgbcolor={0,0,255},
                  fillColor=7,
                  rgbfillColor={255,255,255},
                  fillPattern=1)),
                           Text(
                extent=[-80,-80; 80,80],
                style(color=3, rgbcolor={0,0,255}),
                string="Translation"),
              Line(points=[-92,0; -80,0], style(
                  color=3,
                  rgbcolor={0,0,255},
                  fillColor=7,
                  rgbfillColor={255,255,255},
                  fillPattern=1)),
              Line(points=[92,0; 80,0], style(
                  color=3,
                  rgbcolor={0,0,255},
                  fillColor=7,
                  rgbfillColor={255,255,255},
                  fillPattern=1)),
              Line(points=[-72,-40; 68,-40; 50,-28], style(color=3, rgbcolor={0,0,255})),
              Line(points=[68,-40; 50,-52], style(color=3, rgbcolor={0,0,255})),
              Line(points=[0,92; 0,80],     style(
                  color=3,
                  rgbcolor={0,0,255},
                  fillColor=7,
                  rgbfillColor={255,255,255},
                  fillPattern=1))),     Diagram,
            Documentation(info="<html>
This model implements a translation between the two positional signals x1 and x2.
<p>
The translation is specified by the parameter r, which is resolved in the body system specified by the signal
R.
<p>
The translation can optionally be amplified by the signal ampl.
</html>"));

          MultiBondLib.Interfaces.RealSignal x1[3] "position of frame 1."
            annotation (extent=[-110,-10; -90,10]);
          MultiBondLib.Interfaces.RealSignal x2[3] "position of frame 2."
            annotation (extent=[90,-10; 110,10]);
          MultiBondLib.Interfaces.RealSignal r[3]
            "distance between the frames."       annotation (extent=[-10,90; 10,110]);

        equation
          x2 = x1 + r;

        end mTranslation_r;

        model mTranslation_ampl
          "modulated translation of position by an amplification"

          annotation (Icon(
              Rectangle(extent=[-80,80; 80,-80], style(
                  color=3,
                  rgbcolor={0,0,255},
                  fillColor=7,
                  rgbfillColor={255,255,255},
                  fillPattern=1)),
                           Text(
                extent=[-80,-80; 80,80],
                style(color=3, rgbcolor={0,0,255}),
                string="Translation"),
              Line(points=[0,-80; 0,-92],   style(
                  color=3,
                  rgbcolor={0,0,255},
                  fillColor=7,
                  rgbfillColor={255,255,255},
                  fillPattern=1)),
              Line(points=[-92,0; -80,0], style(
                  color=3,
                  rgbcolor={0,0,255},
                  fillColor=7,
                  rgbfillColor={255,255,255},
                  fillPattern=1)),
              Line(points=[92,0; 80,0], style(
                  color=3,
                  rgbcolor={0,0,255},
                  fillColor=7,
                  rgbfillColor={255,255,255},
                  fillPattern=1)),
              Line(points=[-72,-40; 68,-40; 50,-28], style(color=3, rgbcolor={0,0,255})),
              Line(points=[68,-40; 50,-52], style(color=3, rgbcolor={0,0,255})),
              Line(points=[0,92; 0,80],     style(
                  color=3,
                  rgbcolor={0,0,255},
                  fillColor=7,
                  rgbfillColor={255,255,255},
                  fillPattern=1))),     Diagram,
            Documentation(info="<html>
This model implements a translation between the two positional signals x1 and x2.
<p>
The translation is specified by the parameter r, which is resolved in the body system specified by the signal
R.
<p>
The translation can optionally be amplified by the signal ampl.
</html>"));

          MultiBondLib.Interfaces.RealSignal x1[3] "position of frame 1."
            annotation (extent=[-110,-10; -90,10]);
          MultiBondLib.Interfaces.RealSignal x2[3] "position of frame 2."
            annotation (extent=[90,-10; 110,10]);

          MultiBondLib.Interfaces.RealSignal ampl "amplification signal"
                                                 annotation (extent=[-10,90; 10,110]);
          MultiBondLib.Interfaces.RealSignal r[3] "direction of modulation"
                                                 annotation (extent=[-10,-110; 10,
                -90]);

          Real eR[3] = r/sqrt(r*r);

        equation
          if cardinality(ampl) == 0 then
            ampl = 1;
          end if;

          if cardinality(r) == 0 then
            r = {1,0,0};
          end if;

          x2 = x1 + (eR*ampl);
        end mTranslation_ampl;

        model modulatedActuatedPrismatic
          "prismatic joint with 1 degree of freedom, with the axis of action as an imput"

          annotation (Icon(      Text(extent=[-135,-87; 142,-34],    string="%name"),
              Rectangle(extent=[-100,-40; -30,51], style(
                  pattern=0,
                  fillColor=83,
                  rgbfillColor={255,170,255})),
              Rectangle(extent=[-30,-20; 100,30], style(
                  pattern=0,
                  fillColor=83,
                  rgbfillColor={255,170,255})),
              Text(
                extent=[60,22; 96,-3],
                string="b",
                style(color=10)),
              Rectangle(extent=[-30,30; 100,40],   style(
                  pattern=0,
                  fillColor=0,
                  fillPattern=1)),
              Rectangle(extent=[-100,50; -30,60],   style(
                  pattern=0,
                  fillColor=0,
                  fillPattern=1)),
              Text(
                extent=[-95,23; -60,1],
                string="a",
                style(color=10)),
              Rectangle(extent=[80,40; 100,80], style(
                  pattern=0,
                  fillColor=83,
                  rgbfillColor={255,170,255}))),
                                   Diagram,
            Documentation(info="<html>
The model is derived from the <span class=\"cmti-10x-x-109\">Actuated Prismatic </span>element in the <span class=\"cmti-10x-x-109\">Multi Bond Lib </span><span class=\"cite\">[<a href=\"Modelica://WheelsAndTires.UsersGuide.Literature\">Zim06</a>]</span>. The difference
is that for the original prismatic element the direction of action can be set via parameter
values and the environment determines how the model behaves during simulation. E.g.&nbsp;if the
model is attached to a revolute joint the direction of action changes with the angle of the
revolute joint, which makes total sense from the physical or mechanical point of
view.
<!--l. 140--></p><p class=\"noindent\">For some models of tires though these elements have to act in given directions independently
of what happens at the frames they are connected to. That is exactly what the <span class=\"cmti-10x-x-109\">Modulated</span>
<span class=\"cmti-10x-x-109\">Actuated Prismatic </span>does. The input <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">r</span></span></span> sets the direction of action independent of the
connected frames. This may not be a reasonable model in terms of mechanics,
but it is very useful in tire modeling e.g.&nbsp;due to the fact that no initialization
is needed and it is guaranteed to act e.g.&nbsp;in the longitudinal direction in every
case.

</p>
</html>"));
          import SI = Modelica.SIunits;
          import MB = Modelica.Mechanics.MultiBody;

          parameter Boolean animation = true "animate prismatic joint as box";

          parameter SI.Position s_offset=0
            "Relative distance offset (distance between frame_a and frame_b = s_offset + s)"
            annotation (Evaluate=false);
          parameter Integer column(final min = 1, max = 3) = 1
            "which row of the rotation matrix is chosen for the vector";

          parameter MB.Types.Init.Temp initType=MB.Types.Init.Free
            "|Initialization| Type of initialization (defines usage of start values below)";
          parameter SI.Distance s_start = 0 "|Initialization|initial length";
          parameter SI.Velocity v_start = 0 "|Initialization|initial velocity";
          parameter SI.Acceleration a_start = 0
            "|Initialization|initial acceleration";

          parameter SI.Distance boxWidth=world3D.defaultJointWidth
            "|Animation|if animation = true| Width of prismatic joint box";
          parameter SI.Distance boxHeight=boxWidth
            "|Animation|if animation = true| Height of prismatic joint box";
          parameter Modelica.Mechanics.MultiBody.Types.Color boxColor=world3D.defaultJointColor
            "|Animation|if animation = true| Color of prismatic joint box";

          parameter Boolean enforceStates =  false
            "|Advanced||enforce s and v as states";

          SI.Position s(stateSelect=if enforceStates then StateSelect.always else StateSelect.prefer)
            "length of prismatic joint";
          SI.Velocity v(stateSelect=if enforceStates then StateSelect.always else StateSelect.prefer)
            "velocity of prismatic joint";
          SI.Acceleration a "acceleration of prismatic joint";

          replaceable MultiBondLib.Mechanics3D.Interfaces.Frame_a frame_a
            "|Advanced||replaceable Interface for further extensions"
                                     annotation (extent=[-120,-20; -100,20]);
          replaceable MultiBondLib.Mechanics3D.Interfaces.Frame_b frame_b
            "|Advanced||replaceable Interface for further extensions"
                                     annotation (extent=[100,-20; 120,20]);

        protected
          outer MultiBondLib.Mechanics3D.World3D world3D;
        protected
          inner MultiBondLib.Defaults MBG_defaults(n=3)
                                           annotation (extent=[-100,80; -80,100]);
          replaceable MultiBondLib.Mechanics3D.Interfaces.Mech2MBG Mech2MBG1
                                        annotation (extent=[-100,-100; -80,-20]);
          replaceable MultiBondLib.Mechanics3D.Interfaces.MBG2Mech MBG2Mech1
                                        annotation (extent=[80,-100; 100,-20]);
          MultiBondLib.Junctions.J1 J1_1(n=1)
                            annotation (extent=[-20,20; 0,40]);
          MultiBondLib.Sensors.Dq Dq1(
            stateInitialCondition=false,
            q(stateSelect=StateSelect.never),
            n=1)                                                                                      annotation (extent=[-40,20;
                -60,40]);
          MultiBondLib.Passive.mTF_effort mTF_effort1
                                         annotation (extent=[30,-70; 10,-50],
              rotation=0);
          MultiBondLib.Bonds.Utilities.MultiBondTail MultiBondTail2
                                             annotation (extent=[48,-70; 30,-50],
              rotation=180);
          MultiBondLib.Junctions.J0 J0_1
                            annotation (extent=[40,-40; 60,-20]);
          MultiBondLib.Junctions.J1 J1_2
                            annotation (extent=[-60,-100; -40,-80]);
          WheelsAndTires.TireComponents.Utilities.AddititionalMBG.mTranslationalTF_ampl
            translational_mTF1
            annotation (extent=[-30,-70; -10,-50]);
          MultiBondLib.Bonds.MultiBond MultiBond2
                                          annotation (extent=[-80,-100; -60,-80]);
          MultiBondLib.Bonds.MultiBond MultiBond11
                                          annotation (extent=[60,-100; 80,-80]);
          MultiBondLib.Bonds.MultiBond MultiBond8
                                          annotation (extent=[-50,-70; -30,-50],
              rotation=0);
          MultiBondLib.Bonds.MultiBond MultiBond1
                                          annotation (extent=[60,-40; 80,-20]);
          MultiBondLib.Bonds.MultiBond MultiBond3
                                          annotation (extent=[20,-40; 40,-20]);
          MultiBondLib.Bonds.MultiBond MultiBond5(n=1)
                                     annotation (extent=[0,20; 20,40],  rotation=0);
          MultiBondLib.Bonds.MultiBond MultiBond7(n=1)
                                     annotation (extent=[-20,20; -40,40]);
          MultiBondLib.Bonds.MultiBond MultiBond9
                                          annotation (extent=[-10,-70; 10,-50],
              rotation=0);
          MultiBondLib.Bonds.MultiBond MultiBond10
                                          annotation (extent=[40,-60; 60,-40], rotation=
               90);
          MultiBondLib.Bonds.MultiBond MultiBond12
            annotation (extent=[40,-20; 60,0],rotation=270);
          MultiBondLib.Bonds.Utilities.MultiBondTail MultiBondTail1
                                             annotation (extent=[-80,-40; 22,-20]);
          MultiBondLib.Bonds.Utilities.MultiBondTail MultiBondTail3
                                             annotation (extent=[-40,-80; -60,-62],
              rotation=90);
          MultiBondLib.Bonds.Utilities.MultiBondTail MultiBondTail4
                                             annotation (extent=[-40,-100; 62,-80]);
          MultiBondLib.Bonds.Utilities.MultiBondTail MultiBondTail5
                                             annotation (extent=[40,20; 48,40],
              rotation=180);
          WheelsAndTires.TireComponents.Utilities.AddititionalMBG.mTranslation_ampl
            Translation1
            annotation (extent=[-74,-60; -54,-40]);

          parameter Integer ndim=if world3D.enableAnimation and animation then 1 else 0;
          MB.Visualizers.Advanced.Shape box[ndim](
            each shapeType="box",
            each color=boxColor,
            each length=Dq1.q[1],
            each width=boxWidth,
            each height=boxHeight,
            each lengthDirection=r,
            each widthDirection={0,0,1},
            each r_shape={0,0,0},
            each r=Mech2MBG1.x,
            each R=MB.Frames.Orientation(T=identity(3),w=zeros(3)));

        public
          WheelsAndTires.TireComponents.Utilities.AddititionalMBG.mTF2_effort
            projectiveTF(nA=3, nB=1)
                    annotation (extent=[40,20; 20,40], rotation=0);
          BondLib.Mechanical.Translational.Interfaces.Flange_a axis
            annotation (extent=[60,60; 80,80]);
          BondLib.Mechanical.Translational.Interfaces.Flange_b bearing
            annotation (extent=[-70,60; -50,80]);
          BondLib.Mechanical.Translational.Interfaces.Tr2BG tr2BG
            annotation (extent=[-50,80; -30,100]);
          BondLib.Mechanical.Translational.Interfaces.BG2Tr bG2Tr
            annotation (extent=[40,60; 60,80]);
          BondLib.Bonds.Bond bond
            annotation (extent=[-30,100; -10,80], rotation=180);
          Modelica.Blocks.Sources.Constant Constant(k=0)
            annotation (extent=[-52,60; -42,70]);
        protected
          MultiBondLib.Bonds.Utilities.MultiBondTail MultiBondTail6
                                             annotation (extent=[40,-2; 60,28],
              rotation=270);
          MultiBondLib.Bonds.Utilities.MultiBondTail MultiBondTail7
                                             annotation (extent=[-20,40; 0,68],
              rotation=270);
        public
          MultiBondLib.Compositions.FromMultiBond fromMultiBond
            annotation (extent=[22,60; 40,80]);
          BondLib.Sources.Sf sf(f0=0)
            annotation (extent=[-10,80; 10,100], rotation=0);
        protected
          MultiBondLib.Bonds.Utilities.MultiBondTail MultiBondTail8
                                             annotation (extent=[-10,60; 24,80],
              rotation=0);
        public
          MultiBondLib.Interfaces.RealSignal r[3]
            annotation (extent=[-10,-110; 10,-90]);
          WheelsAndTires.TireComponents.Utilities.AddititionalMBG.normalize
            normalize1         annotation (extent=[-4,-86; 4,-78], rotation=90);
        initial equation
          if initType == MB.Types.Init.Position or initType == MB.Types.Init.
              PositionVelocity or initType == MB.Types.Init.PositionVelocityAcceleration then
            // Initialize positional variables
            s = s_start;
          end if;

          if initType == MB.Types.Init.PositionVelocity or initType == MB.Types.Init.
              PositionVelocityAcceleration or initType == MB.Types.Init.Velocity or
              initType == MB.Types.Init.VelocityAcceleration then
            // Initialize velocity variables
            v = v_start;
          end if;

          if initType == MB.Types.Init.VelocityAcceleration or initType == MB.Types.Init.
              PositionVelocityAcceleration then
            // Initialize acceleration variables
            a = a_start;
          end if;

          if initType == MB.Types.Init.SteadyState then
            v = 0;
            a = 0;
          end if;

        equation
          defineBranch(frame_a.P,frame_b.P);

          s = Dq1.q[1]-s_offset;
          v = J1_1.MultiBondCon1.f[1];
          a = der(v);
          connect(Mech2MBG1.frame_a, frame_a) annotation (points=[-99,-60; -100,-60;
                -100,-2; -106,-2; -106,0; -110,0],
                            style(
              color=0,
              rgbcolor={0,0,0},
              thickness=2,
              fillColor=83,
              rgbfillColor={255,170,255},
              fillPattern=1));
          connect(MBG2Mech1.frame_b, frame_b) annotation (points=[99,-60; 100,-60;
                100,0; 110,0],
                        style(
              color=0,
              rgbcolor={0,0,0},
              thickness=2,
              fillColor=83,
              rgbfillColor={255,170,255},
              fillPattern=1));
          connect(MultiBond7.MultiBondCon1, J1_1.MultiBondCon1)
            annotation (points=[-20,30; -20,30],
                                               style(color=71, rgbcolor={85,170,255}));
          connect(MultiBond7.MultiBondCon2, Dq1.MultiBondCon1)
            annotation (points=[-40,30; -40,30],
                                             style(color=71, rgbcolor={85,170,255}));
          connect(Mech2MBG1.x, Translation1.x1) annotation (points=[-80,-50; -74,
                -50],              style(color=3, rgbcolor={0,0,255}));
          connect(MultiBond1.MultiBondCon2, MBG2Mech1.MultiBondConTrans) annotation (
              points=[80,-30; 80,-30], style(color=71, rgbcolor={85,170,255}));
          connect(MultiBond1.MultiBondCon1, J0_1.MultiBondCon2) annotation (points=[60,-30;
                60,-30],      style(color=71, rgbcolor={85,170,255}));
          connect(MultiBond3.MultiBondCon2, J0_1.MultiBondCon1) annotation (points=[40,-30;
                40,-30],      style(color=71, rgbcolor={85,170,255}));
          connect(MultiBond3.MultiBondCon1, Mech2MBG1.MultiBondConTrans) annotation (
              points=[20,-30; -80,-30], style(color=71, rgbcolor={85,170,255}));
          connect(MultiBond2.MultiBondCon2, J1_2.MultiBondCon1) annotation (points=[-60,-90;
                -60,-90],      style(color=71, rgbcolor={85,170,255}));
          connect(MultiBond2.MultiBondCon1, Mech2MBG1.MultiBondConRot) annotation (
              points=[-80,-90; -79.8,-90], style(color=71, rgbcolor={85,170,255}));
          connect(MultiBond11.MultiBondCon2, MBG2Mech1.MultiBondConRot) annotation (
              points=[80,-90; 80,-90], style(color=71, rgbcolor={85,170,255}));
          connect(Translation1.x2, MBG2Mech1.x) annotation (points=[-54,-50; -48,
                -50; -48,-44; 74,-44; 74,-50; 80,-50],
                                                  style(color=3, rgbcolor={0,0,255}));
          connect(Mech2MBG1.R, MBG2Mech1.R) annotation (points=[-80,-70; -78,-70;
                -78,-74; 74,-74; 74,-70; 80,-70],
                                              style(color=3, rgbcolor={0,0,255}));
          connect(MultiBond8.MultiBondCon1, J1_2.MultiBondCon4) annotation (points=[-50,-60;
                -50,-80],      style(color=71, rgbcolor={85,170,255}));
          connect(J1_2.MultiBondCon2, MultiBond11.MultiBondCon1) annotation (points=[-40,-90;
                60,-90],          style(color=71, rgbcolor={85,170,255}));
          connect(J0_1.MultiBondCon3, MultiBond10.MultiBondCon2) annotation (points=[50,-40;
                50,-40],      style(color=71, rgbcolor={85,170,255}));
          connect(MultiBond5.MultiBondCon1, J1_1.MultiBondCon2)
            annotation (points=[0,30; 0,30], style(color=71, rgbcolor={85,170,255}));
          connect(Translation1.ampl, Dq1.q[1]) annotation (points=[-64,-40; -64,
                30; -60,30],
                     style(color=3, rgbcolor={0,0,255}));
          connect(translational_mTF1.MultiBondCon1, MultiBond8.MultiBondCon2)
            annotation (points=[-30,-60; -30,-60], style(color=71, rgbcolor={85,170,255}));
          connect(translational_mTF1.MultiBondCon2, MultiBond9.MultiBondCon1)
            annotation (points=[-10,-60; -10,-60], style(color=71, rgbcolor={85,170,255}));
          connect(translational_mTF1.ampl, Dq1.q[1]) annotation (points=[-20,-50;
                -20,-14; -64,-14; -64,30; -60,30],
                                        style(color=3, rgbcolor={0,0,255}));
          connect(projectiveTF.MultiBondConB, MultiBond5.MultiBondCon2) annotation (
             points=[20,30; 20,30], style(color=71, rgbcolor={85,170,255}));
          connect(tr2BG.Tr, bearing) annotation (points=[-50.1,89.9; -55.05,89.9;
                -55.05,70; -60,70], style(color=58, rgbcolor={0,127,0}));
          connect(bG2Tr.Tr, axis) annotation (points=[59.9,69.9; 45.95,69.9;
                45.95,70; 70,70], style(color=58, rgbcolor={0,127,0}));
          connect(Constant.y, tr2BG.s) annotation (points=[-41.5,65; -40,65; -40,
                80], style(color=74, rgbcolor={0,0,127}));
          connect(Dq1.q[1], bG2Tr.s) annotation (points=[-60,30; -64,30; -64,52;
                50,52; 50,60], style(color=3, rgbcolor={0,0,255}));
          connect(MultiBond12.MultiBondCon1, projectiveTF.MultiBondConA)
            annotation (points=[50,0; 50,30; 40,30],  style(color=71, rgbcolor={
                  85,170,255}));
          connect(fromMultiBond.MultiBondCon1, J1_1.MultiBondCon4) annotation (
              points=[22,70; -10,70; -10,40], style(color=71, rgbcolor={85,170,
                  255}));
          connect(bond.BondCon2, tr2BG.BondCon1) annotation (points=[-30,90; -30,
                90], style(color=8, rgbcolor={192,192,192}));
          connect(bond.BondCon1, sf.BondCon1) annotation (points=[-10.2,90; -10,
                90], style(
              color=8,
              rgbcolor={192,192,192},
              pattern=0));
          connect(fromMultiBond.BondCon1, bG2Tr.BondCon1) annotation (points=[40,
                70; 40,70], style(
              color=8,
              rgbcolor={192,192,192},
              pattern=0));
          connect(MultiBond12.MultiBondCon2, J0_1.MultiBondCon4) annotation (points=
               [50,-20; 50,-20], style(
              color=71,
              rgbcolor={85,170,255},
              fillColor=7,
              rgbfillColor={255,255,255},
              fillPattern=1));
          connect(r, normalize1.u) annotation (points=[0,-100; 0,-86.8; -0.08,
                -86.8],
              style(
              color=3,
              rgbcolor={0,0,255},
              fillColor=7,
              rgbfillColor={255,255,255},
              fillPattern=1));
          connect(translational_mTF1.r, normalize1.y) annotation (points=[-19.8,
                -70; -20,-70; -20,-76; 2.69413e-016,-76; 2.69413e-016,-77.6],
                                                           style(
              color=3,
              rgbcolor={0,0,255},
              fillColor=7,
              rgbfillColor={255,255,255},
              fillPattern=1));
          connect(projectiveTF.M[1, :], normalize1.y) annotation (points=[30,19.2;
                30,6; 34,6; 34,-76; 2.69413e-016,-76; 2.69413e-016,-77.6],
                                                             style(
              color=3,
              rgbcolor={0,0,255},
              fillColor=7,
              rgbfillColor={255,255,255},
              fillPattern=1));
          connect(Translation1.r, normalize1.y) annotation (points=[-64,-60;
                -64,-76; 2.69413e-016,-76; 2.69413e-016,-77.6],
                                              style(
              color=3,
              rgbcolor={0,0,255},
              fillColor=7,
              rgbfillColor={255,255,255},
              fillPattern=1));
          connect(mTF_effort1.MultiBondCon1, MultiBond10.MultiBondCon1) annotation (
             points=[30,-60; 50,-60], style(
              color=71,
              rgbcolor={85,170,255},
              fillColor=7,
              rgbfillColor={255,255,255},
              fillPattern=1));
          connect(mTF_effort1.MultiBondCon2, MultiBond9.MultiBondCon2) annotation (
              points=[10,-60; 10,-60], style(
              color=71,
              rgbcolor={85,170,255},
              fillColor=7,
              rgbfillColor={255,255,255},
              fillPattern=1));
          connect(mTF_effort1.M, MBG2Mech1.R) annotation (points=[20,-70; 20,-74;
                74,-74; 74,-70; 80,-70], style(
              color=3,
              rgbcolor={0,0,255},
              fillColor=7,
              rgbfillColor={255,255,255},
              fillPattern=1));
        end modulatedActuatedPrismatic;

        model AbsoluteSensor "Measures the absolute position and motion"

          import SI = Modelica.SIunits;

          parameter Boolean get_r_abs=true
            "= true, to measure the position vector from the origin of the world frame to the origin of frame_a in [m]";
          parameter Boolean get_v_abs=false
            "= true, to measure the absolute velocity of the origin of frame_a in [m/s]";
          parameter Boolean get_a_abs=false
            "= true, to measure the absolute acceleration of the origin of frame_a in [m/s^2]";
          parameter Boolean get_R=false
            "= true, to measure the 3 rotation angles to rotate the world frame into frame_a along the axes defined in 'sequence' below in [rad]";
          parameter Boolean get_w_abs=false
            "= true, to measure the absolute angular velocity of frame_a in [rad/s]";
          parameter Boolean get_z_abs=false
            "= true, to measure the absolute angular acceleration to frame_a in [rad/s^2]";

          final parameter Integer n_out = ((if get_r_abs then 3 else
                        0) + (if get_v_abs then 3 else 0) + (if get_a_abs then 3 else
                        0) + (if get_R then 9 else 0) + (if get_w_abs then 3 else
                        0) + (if get_z_abs then 3 else 0));

          MultiBondLib.Mechanics3D.Interfaces.Frame_a frame_a
                                     annotation (extent=[-120,-20; -100,20]);
          Modelica.Blocks.Interfaces.RealOutput out[n_out]
               annotation (extent=[100,10; 120,-10],      rotation=0);
          annotation (Icon(
              Ellipse(extent=[-70,70; 70,-70],   style(color=0, fillColor=7)),
              Line(points=[0,70; 0,46], style(color=10, rgbcolor={95,95,95})),
              Line(points=[26,38; 40.2,57.3], style(color=10, rgbcolor={95,95,95})),
              Line(points=[-26,38; -40.2,57.3], style(color=10, rgbcolor={95,95,
                      95})),
              Line(points=[44,16; 65.8,23.9], style(color=10, rgbcolor={95,95,95})),
              Line(points=[-46,16; -65.8,23.9], style(color=10, rgbcolor={95,95,
                      95})),
              Line(points=[0,0; 9.02,28.6],   style(color=0)),
              Polygon(points=[2,32; 16,26; 20,58; 2,32], style(
                  color=0,
                  rgbcolor={0,0,0},
                  fillColor=10,
                  rgbfillColor={95,95,95},
                  fillPattern=1)),
              Ellipse(extent=[-5,5; 5,-5],   style(
                  color=0,
                  gradient=0,
                  fillColor=0,
                  fillPattern=1)),
              Line(points=[-70,0; -101,0],   style(color=0)),
              Line(points=[70,0; 100,0],   style(color=0)),
              Text(extent=[-128,78; 133,126],   string="%name")),
                                                        Diagram(
              Line(points=[-60,10; 20,10; 20,2; 100,2], style(
                  color=3,
                  rgbcolor={0,0,255},
                  pattern=4)),
              Line(points=[-20,30; 40,30; 40,4; 100,4], style(
                  color=3,
                  rgbcolor={0,0,255},
                  pattern=4)),
              Line(points=[22,50; 42,50; 60,50; 60,6; 100,6], style(
                  color=3,
                  rgbcolor={0,0,255},
                  pattern=4)),
              Line(points=[-60,-10; 20,-10; 20,-2; 100,-2; 96,-2], style(
                  color=3,
                  rgbcolor={0,0,255},
                  pattern=4)),
              Line(points=[20,-30; 40,-30; 40,-4; 102,-4], style(
                  color=3,
                  rgbcolor={0,0,255},
                  pattern=4)),
              Line(points=[60,-50; 70,-50; 70,-6; 100,-6], style(
                  color=3,
                  rgbcolor={0,0,255},
                  pattern=4))),
            Documentation(info="<html>
The <span class=\"cmti-10x-x-109\">Absolute Sensor </span>is just a very slight modification of the original element in the
<span class=\"cmti-10x-x-109\">Multi Bond Lib</span>. The difference is that the original element sets the unit of the
output to Newton, which does not suit the application in the <span class=\"cmti-10x-x-109\">Wheels And Tires</span>
Library. So this section has been deleted from the original model and this is the only
difference.

</html>"));
        protected
          parameter Integer i1=1;
          parameter Integer i2=if get_r_abs then i1 + 3 else i1;
          parameter Integer i3=if get_v_abs then i2 + 3 else i2;
          parameter Integer i4=if get_a_abs then i3 + 3 else i3;
          parameter Integer i5=if get_R then i4 + 9 else i4;
          parameter Integer i6=if get_w_abs then i5 + 3 else i5;

          MultiBondLib.Bonds.MultiBond multiBond
                                    annotation (extent=[-60,20; -40,40]);
          MultiBondLib.Mechanics3D.Interfaces.Mech2MBG mech2MBG
                                       annotation (extent=[-80,-40; -60,40]);
          inner MultiBondLib.Defaults MBG_defaults(n=3)
                                           annotation (extent=[-80,60; -60,80]);
          Modelica.Blocks.Continuous.Der der_v[3]
            annotation (extent=[0,40; 20,60]);
          MultiBondLib.Bonds.MultiBond multiBond1
                                    annotation (extent=[-60,-40; -40,-20]);
          Modelica.Blocks.Continuous.Der der_w[3]
            annotation (extent=[40,-60; 60,-40]);
          MultiBondLib.Bonds.MultiBond multiBond2
                                    annotation (extent=[-20,-40; 0,-20]);
          MultiBondLib.Sensors.Df Df_v
                          annotation (extent=[-40,20; -20,40]);
          MultiBondLib.Sensors.Df Df_w
                          annotation (extent=[0,-40; 20,-20]);
          MultiBondLib.Passive.mTF_effort mTF_effort
            annotation (extent=[-40,-40; -20,-20], rotation=180);
        equation

          if get_r_abs then
            out[i1:i1 + 2] = mech2MBG.x;
          end if;

          if get_v_abs then
            out[i2:i2 + 2] = Df_v.f_out;
          end if;

          if get_a_abs then
            out[i3:i3 + 2] = der_v.y;
          end if;

          if get_R then
            out[i4:i4 + 2] = mech2MBG.R[1,1:3];
            out[i4+3:i4+5] = mech2MBG.R[2,1:3];
            out[i4+6:i4+8] = mech2MBG.R[3,1:3];
          end if;

          if get_w_abs then
            out[i5:i5 + 2] = Df_w.f_out;
          end if;

          if get_z_abs then
            out[i6:i6 + 2] = der_w.y;
          end if;

          connect(mech2MBG.frame_a, frame_a) annotation (points=[-79,0; -86.75,0;
                -86.75,4.10782e-015; -94.5,4.10782e-015; -94.5,0; -110,0],
              style(
              color=0,
              rgbcolor={0,0,0},
              thickness=2,
              fillColor=10,
              rgbfillColor={95,95,95},
              fillPattern=1));
          connect(multiBond.MultiBondCon1, mech2MBG.MultiBondConTrans)
            annotation (points=[-60,30; -60,30], style(
              color=71,
              rgbcolor={85,170,255},
              fillColor=10,
              rgbfillColor={95,95,95},
              fillPattern=1));
          connect(multiBond1.MultiBondCon1, mech2MBG.MultiBondConRot) annotation (
             points=[-60,-30; -59.8,-30], style(color=71, rgbcolor={85,170,255}));
          connect(Df_v.f_out, der_v.u) annotation (points=[-20,30; -12,30; -12,50; -2,
                50],    style(
              color=3,
              rgbcolor={0,0,255},
              pattern=0));
          connect(Df_w.MultiBondCon1, multiBond2.MultiBondCon2) annotation (
              points=[0,-30; 0,-30], style(
              color=71,
              rgbcolor={85,170,255},
              pattern=0));
          connect(Df_w.f_out, der_w.u) annotation (points=[20,-30; 28,-30; 28,-50;
                38,-50], style(
              color=3,
              rgbcolor={0,0,255},
              pattern=0));
          connect(mTF_effort.MultiBondCon2, multiBond1.MultiBondCon2) annotation (
             points=[-40,-30; -40,-30], style(
              color=71,
              rgbcolor={85,170,255},
              pattern=0));
          connect(mTF_effort.MultiBondCon1, multiBond2.MultiBondCon1) annotation (
             points=[-20,-30; -20,-30], style(
              color=71,
              rgbcolor={85,170,255},
              pattern=0));
          connect(mech2MBG.R, mTF_effort.M) annotation (points=[-60,-10; -30,-10; -30,
                -20],     style(
              color=3,
              rgbcolor={0,0,255},
              pattern=0));
          connect(Df_v.MultiBondCon1, multiBond.MultiBondCon2) annotation (points=
               [-40,30; -40,30], style(
              color=71,
              rgbcolor={85,170,255},
              pattern=0));
        end AbsoluteSensor;

        model normalize "normalized the input to the output"

          annotation (Icon(Rectangle(extent=[-100,100; 100,-100], style(
                  color=3,
                  rgbcolor={0,0,255},
                  fillColor=7,
                  rgbfillColor={255,255,255})), Text(
                extent=[-84,84; 86,-84],
                style(
                  color=3,
                  rgbcolor={0,0,255},
                  fillColor=7,
                  rgbfillColor={255,255,255},
                  fillPattern=1),
                string="normalize")), Diagram);
          Modelica.Blocks.Interfaces.RealInput u[3] "input vector"
            annotation (extent=[-140,-18; -100,22]);
          Modelica.Blocks.Interfaces.RealOutput y[3] "normalized input"
            annotation (extent=[100,-10; 120,10]);

        equation
          y = Modelica.Mechanics.MultiBody.Frames.normalize(u);
        end normalize;
      end AddititionalMBG;

      package Icons "contains icons used troughout the library."
        annotation(preferedView="info");

        model TireComponentsPackage "Icon of the Tire Components Package"

          annotation (Icon(
              Rectangle(extent=[-100,-100; 80,50], style(
                  color=58,
                  rgbcolor={0,127,0},
                  fillColor=30,
                  rgbfillColor={235,235,235},
                  fillPattern=1)),
              Polygon(points=[-100,50; -80,70; 100,70; 80,50; -100,50], style(
                  color=58,
                  rgbcolor={0,127,0},
                  fillColor=30,
                  rgbfillColor={235,235,235},
                  fillPattern=1)),
              Polygon(points=[100,70; 100,-80; 80,-100; 80,50; 100,70], style(
                  color=58,
                  rgbcolor={0,127,0},
                  fillColor=30,
                  rgbfillColor={235,235,235},
                  fillPattern=1)),
              Ellipse(extent=[-64,32; -14,-16], style(color=58, rgbcolor={0,127,0})),
              Rectangle(extent=[4,6; 56,-50], style(color=58, rgbcolor={0,127,0})),
              Polygon(points=[-72,-84; -50,-34; -24,-84; -72,-84], style(color=58,
                    rgbcolor={0,127,0}))));
        equation

        end TireComponentsPackage;

        model CommunicationPackage "Icon of the Communication Package"

          annotation (Icon(
              Rectangle(extent=[-100,-100; 80,50], style(
                  color=58,
                  rgbcolor={0,127,0},
                  fillColor=30,
                  rgbfillColor={235,235,235},
                  fillPattern=1)),
              Polygon(points=[-100,50; -80,70; 100,70; 80,50; -100,50], style(
                  color=58,
                  rgbcolor={0,127,0},
                  fillColor=30,
                  rgbfillColor={235,235,235},
                  fillPattern=1)),
              Polygon(points=[100,70; 100,-80; 80,-100; 80,50; 100,70], style(
                  color=58,
                  rgbcolor={0,127,0},
                  fillColor=30,
                  rgbfillColor={235,235,235},
                  fillPattern=1)),
              Rectangle(extent=[-16,-28; 24,-32],
                                               style(rgbcolor={255,204,51}, thickness=2)),
              Polygon(points=[-70,20; 52,20; 72,0; 56,-70; 34,-80; -48,-80; -70,
                    -70; -88,-2; -70,20],    style(
                  color=0,
                  rgbcolor={0,0,0},
                  fillColor=6,
                  rgbfillColor={255,204,51})),
              Ellipse(extent=[-57,-5; -47,-15],  style(
                  color=0,
                  rgbcolor={0,0,0},
                  fillColor=0,
                  rgbfillColor={0,0,0})),
              Ellipse(extent=[-15,-5; -5,-15],style(
                  color=0,
                  rgbcolor={0,0,0},
                  fillColor=0,
                  rgbfillColor={0,0,0})),
              Ellipse(extent=[31,-5; 41,-15], style(
                  color=0,
                  rgbcolor={0,0,0},
                  fillColor=0,
                  rgbfillColor={0,0,0})),
              Ellipse(extent=[-37,-45; -27,-55],   style(
                  color=0,
                  rgbcolor={0,0,0},
                  fillColor=0,
                  rgbfillColor={0,0,0})),
              Ellipse(extent=[11,-45; 21,-55],   style(
                  color=0,
                  rgbcolor={0,0,0},
                  fillColor=0,
                  rgbfillColor={0,0,0}))));
        equation

        end CommunicationPackage;

        model TirePackage "Icon of the Tire Package"

          annotation (Icon(
              Polygon(points=[100,70; 100,-80; 80,-100; 80,50; 100,70], style(
                  color=58,
                  rgbcolor={0,127,0},
                  fillColor=30,
                  rgbfillColor={235,235,235},
                  fillPattern=1)),
              Polygon(points=[-100,50; -80,70; 100,70; 80,50; -100,50], style(
                  color=58,
                  rgbcolor={0,127,0},
                  fillColor=30,
                  rgbfillColor={235,235,235},
                  fillPattern=1)),
              Rectangle(extent=[-100,-100; 80,50], style(
                  color=58,
                  rgbcolor={0,127,0},
                  fillColor=30,
                  rgbfillColor={235,235,235},
                  fillPattern=1)),
              Ellipse(extent=[-88,48; 64,-98], style(
                  color=0,
                  rgbcolor={0,0,0},
                  gradient=3,
                  fillColor=10,
                  rgbfillColor={135,135,135})),
              Line(points=[-12,-24; 50,-24],
                                       style(
                  color=10,
                  rgbcolor={135,135,135},
                  fillColor=7,
                  rgbfillColor={255,255,255},
                  fillPattern=1)),
              Ellipse(extent=[-80,40; 56,-90], style(
                  color=30,
                  rgbcolor={215,215,215},
                  fillColor=30,
                  rgbfillColor={215,215,215})),
              Ellipse(extent=[-74,34; 50,-84], style(
                  color=7,
                  rgbcolor={255,255,255},
                  fillColor=7,
                  rgbfillColor={255,255,255})),
              Line(points=[-12,34; -12,-84],
                                         style(color=30, rgbcolor={215,215,215})),
              Line(points=[-74,-24; 50,-24],
                                         style(color=30, rgbcolor={215,215,215})),
              Line(points=[34,-68; -56,18], style(color=30, rgbcolor={215,215,215})),
              Line(points=[-58,-66; 34,18], style(color=30, rgbcolor={215,215,215})),
              Line(points=[-68,-2; 48,-48], style(color=30, rgbcolor={215,215,215})),
              Line(points=[-34,30; 12,-82], style(color=30, rgbcolor={215,215,215})),
              Line(points=[-40,-82; 14,30], style(color=30, rgbcolor={215,215,215})),
              Line(points=[-70,-46; 46,-2], style(color=30, rgbcolor={215,215,215}))));
        equation

        end TirePackage;

        model EnvironmentPackage "Icon of the Environment Package"

          annotation (Icon(
              Polygon(points=[100,70; 100,-80; 80,-100; 80,50; 100,70], style(
                  color=74,
                  rgbcolor={0,0,127},
                  fillColor=30,
                  rgbfillColor={235,235,235},
                  fillPattern=1)),
              Polygon(points=[-100,50; -80,70; 100,70; 80,50; -100,50], style(
                  color=74,
                  rgbcolor={0,0,127},
                  fillColor=30,
                  rgbfillColor={235,235,235},
                  fillPattern=1)),
              Rectangle(extent=[-100,-100; 80,50], style(
                  color=74,
                  rgbcolor={0,0,127},
                  fillColor=30,
                  rgbfillColor={235,235,235},
                  fillPattern=1)),
              Text(
                extent=[-100,50; 80,-100],
                string="Environment",
                style(color=74, rgbcolor={0,0,127}))));
        equation

        end EnvironmentPackage;

        model TestBenchPackage "Icon of the Test Bench Package"

          annotation (Icon(
              Polygon(points=[100,70; 100,-80; 80,-100; 80,50; 100,70], style(
                  color=45,
                  rgbcolor={255,128,0},
                  fillColor=30,
                  rgbfillColor={235,235,235},
                  fillPattern=1)),
              Polygon(points=[-100,50; -80,70; 100,70; 80,50; -100,50], style(
                  color=45,
                  rgbcolor={255,128,0},
                  fillColor=30,
                  rgbfillColor={235,235,235},
                  fillPattern=1)),
              Rectangle(extent=[-100,-100; 80,50], style(
                  color=45,
                  rgbcolor={255,128,0},
                  fillColor=30,
                  rgbfillColor={235,235,235},
                  fillPattern=1)),
              Text(
                extent=[-100,-100; 80,50],
                string="Test Bench",
                style(color=45, rgbcolor={255,128,0}))));
        equation

        end TestBenchPackage;

        model ExamplesPackage "Icon of the Examples Package"

          annotation (Icon(
              Polygon(points=[100,70; 100,-80; 80,-100; 80,50; 100,70], style(
                  color=78,
                  rgbcolor={127,0,127},
                  fillColor=30,
                  rgbfillColor={235,235,235},
                  fillPattern=1)),
              Polygon(points=[-100,50; -80,70; 100,70; 80,50; -100,50], style(
                  color=78,
                  rgbcolor={127,0,127},
                  fillColor=30,
                  rgbfillColor={235,235,235},
                  fillPattern=1)),
              Rectangle(extent=[-100,-100; 80,50], style(
                  color=78,
                  rgbcolor={127,0,127},
                  fillColor=30,
                  rgbfillColor={235,235,235},
                  fillPattern=1)),
              Text(
                extent=[-100,50; 80,-100],
                style(color=78, rgbcolor={127,0,127}),
                string="Ex")));
        equation

        end ExamplesPackage;

        model TireComponents "Icon of the Tire Components"

          annotation (Icon(
                 Rectangle(extent=[-100,-100; 100,100],   style(
                color=74,
                rgbcolor={0,0,127},
                fillColor=7,
                rgbfillColor={255,255,255}))));
        equation

        end TireComponents;

        partial model TireModel "Icon of the Tire Models"

          annotation (Icon(
              Ellipse(extent=[-76,72; 76,-74], style(
                  color=0,
                  rgbcolor={0,0,0},
                  gradient=3,
                  fillColor=10,
                  rgbfillColor={135,135,135})),
              Text(
                extent=[0,100; 0,80],
                string="%name",
                style(
                  color=10,
                  rgbcolor={95,95,95},
                  gradient=3,
                  fillColor=10,
                  rgbfillColor={135,135,135})),
              Line(points=[0,0; 62,0], style(
                  color=10,
                  rgbcolor={135,135,135},
                  fillColor=7,
                  rgbfillColor={255,255,255},
                  fillPattern=1)),
              Line(points=[64,0; 88,0],  style(
                  color=10,
                  rgbcolor={135,135,135},
                  fillColor=7,
                  rgbfillColor={255,255,255},
                  fillPattern=1)),
              Ellipse(extent=[-68,64; 68,-66], style(
                  color=30,
                  rgbcolor={215,215,215},
                  fillColor=30,
                  rgbfillColor={215,215,215})),
              Ellipse(extent=[-62,58; 62,-60], style(
                  color=7,
                  rgbcolor={255,255,255},
                  fillColor=7,
                  rgbfillColor={255,255,255})),
              Line(points=[0,58; 0,-60], style(color=30, rgbcolor={215,215,215})),
              Line(points=[-62,0; 62,0], style(color=30, rgbcolor={215,215,215})),
              Line(points=[46,-44; -44,42], style(color=30, rgbcolor={215,215,215})),
              Line(points=[-46,-42; 46,42], style(color=30, rgbcolor={215,215,215})),
              Line(points=[-56,22; 60,-24], style(color=30, rgbcolor={215,215,215})),
              Line(points=[-22,54; 24,-58], style(color=30, rgbcolor={215,215,215})),
              Line(points=[-28,-58; 26,54], style(color=30, rgbcolor={215,215,215})),
              Line(points=[-58,-22; 58,22], style(color=30, rgbcolor={215,215,215})),
              Line(points=[0,0; 100,0], style(
                  color=10,
                  rgbcolor={135,135,135},
                  fillColor=7,
                  rgbfillColor={255,255,255},
                  fillPattern=1))));

        end TireModel;

        partial model TestBenchModel "Icon of the Test Bench Models"

          annotation (Icon(
              Ellipse(extent=[-100,100; 100,-100], style(
                  color=45,
                  rgbcolor={255,128,0},
                  fillColor=7,
                  rgbfillColor={255,255,255})),
              Text(
                extent=[-100,100; 100,-80],
                style(color=45, rgbcolor={255,128,0}),
                string="tb")));
        equation

        end TestBenchModel;

        partial model ExampleModel "Icon of the Example models"

          annotation (Icon(
              Ellipse(extent=[-100,100; 100,-100], style(
                  color=78,
                  rgbcolor={127,0,127},
                  fillColor=7,
                  rgbfillColor={255,255,255})),
              Text(
                extent=[-100,100; 100,-80],
                string="ex",
                style(color=78, rgbcolor={127,0,127}))));
        equation

        end ExampleModel;
      end Icons;
    end Utilities;
  end TireComponents;

  annotation (
    version="1.0",
    versionDate="2009-08-23",
    preferedView="info",
    uses(
      BondLib(version="2.3"),
      MultiBondLib(version="1.3"),
      Modelica(version="2.2.1")), Icon,
    Documentation(info="<html>
<p>
The <i>Wheels and Tires</i> library is a free Modelica package providing the easily modifiable tire models.
</p>
<dl>
  <dt><b>Author</b></dt>
  <dd>Markus Andres, <br>
      Vorarlberg University of Applied Sciences,<br>
      Dornbirn,<br>
      Austria<br>
      E-mail: <A HREF='mailto:Markus.Andres@students.fhv.at'>Markus.Andres@students.fhv.at</A><br>&nbsp;</dd>
      This package was developed and implemented from March 2009 to August 2009 at the
      Vorarlberg University of Applied Sciences,
      Dornbirn, Austria.<br>
      This package has originaly been developed as part of the master's thesis \"Object-Oriented Modeling of Wheels
      and Tires in Dymola/Modelica\".
  </dd>
  <dt><b>Contact</b></dt>
  <dd><a href='http://www.inf.ethz.ch/personal/fcellier/'>Prof. Francois E. Cellier</a><br>
      Institute of Computational Science, <br>
      Dept. Computer Science, <br>
      ETH Z&uuml;rich, <br>
      Suisse<br>
      E-mail: <A HREF='mailto:fcellier@inf.ethz.ch'>fcellier@inf.ethz.ch</A><br>&nbsp;</dd>
      </dd>

<h4>Acknowledgement</h4>
<p>
Thanks to Prof. F. E. Cellier, Dirk Zimmer and Dr. Reinhard Schneider for the great support during the master's thesis. It was a pleasure to work with you.<br>
Thanks Thomas Schmitt for being such a good colleague.
</p>

</dl>
<b>Copyright (C) 2009, Markus Andres</b> <p>
<i>The Wheels and Tires package is <b>free</b> software;
it can be redistributed and/or modified
under the terms of the <b>Modelica License 2</b>, see the license conditions
and the accompanying <b>disclaimer</b> in the documentation of package
Modelica in file \"Modelica/package.mo\".</i>
</html>"));
  package Tires "contains ready-made tire models."
    annotation(preferedView="info");

  extends WheelsAndTires.TireComponents.Utilities.Icons.TirePackage;

    annotation (Icon, Documentation(info="<html>

For further information see the documentation of the used models and section <a href=\"Modelica://WheelsAndTires.UsersGuide.Tires\">Provided Tire Models</a> of the <a href=\"Modelica://WheelsAndTires.UsersGuide\">User's Guide</a>.

</html>"));
    package Commons "aggregates parameters of tire models"
      annotation(preferedView="info");

    extends WheelsAndTires.TireComponents.Utilities.Icons.TirePackage;

      partial model ParametersCommon
        "parameters necessary for every tire model"

        import SI = Modelica.SIunits;
        import MB = Modelica.Mechanics.MultiBody;

      // rim
        parameter SI.Mass mRim = 6 "Mass of the Rim";
        parameter SI.Inertia I_11 = 0.2 "[1,1] element of the inertia tensor"  annotation(Dialog(group="Rim Mass Properties"));
        parameter SI.Inertia I_22 = 0.2 "[2,2] element of the inertia tensor"  annotation(Dialog(group="Rim Mass Properties"));
        parameter SI.Inertia I_33 = 1 "[3,3] element of the inertia tensor"    annotation(Dialog(group="Rim Mass Properties"));
        parameter SI.Inertia I_21 = 0 "[2,1] element of the inertia tensor" annotation(Dialog(group="Rim Mass Properties"));
        parameter SI.Inertia I_31 = 0 "[3,1] element of the inertia tensor" annotation(Dialog(group="Rim Mass Properties"));
        parameter SI.Inertia I_32 = 0 "[3,2] element of the inertia tensor" annotation(Dialog(group="Rim Mass Properties"));
        parameter Boolean visRimEnabled = true "= true: Rim will be animated" annotation(Dialog(tab="Visualization", group="Rim"));
        parameter MB.Types.Color rimRodColor= {164,164,164} "Color of the rods"
                                                                                 annotation(Dialog(tab="Visualization", group="Rim"));
        parameter MB.Types.SpecularCoefficient rimSpecularCoefficient = 0.75
          "Specular Coefficient: 0 total absorbtion, 1 reflecting" annotation(Dialog(tab="Visualization", group="Rim"));

      // contact point
        parameter Boolean visContactPointEnabled = false
          "= true if the contact point shall be animated (will be shown as a cone)"
          annotation(Dialog(tab="Visualization", group="Contact Point"));
        parameter MB.Types.Color contactColor= {128,128,128}
          "Color of the contactpoint cone"
          annotation(Dialog(tab="Visualization", group="Contact Point"));
        parameter SI.Length contactPointSize = 0.05
          "Dimensions of the cone for the contact point"
          annotation(Dialog(tab="Visualization", group="Contact Point"));
        parameter Boolean visForcesEnabled = true
          "= true: contact forces are shown as arrows"
          annotation(Dialog(tab="Visualization", group="Contact Force"));
        parameter Real forceScaling = 1000
          "Factor to determine the length of the visualization window. length[m] = Force[N]/forceScaling"
          annotation(Dialog(tab="Visualization", group="Contact Force"));
        parameter MB.Types.Color arrowColor= {255,0,0}
          "Color of the arrows visualizing the forces"
          annotation(Dialog(tab="Visualization", group="Contact Force"));
        parameter SI.Length arrowDiameter = 0.01
          "Diameter of the arrow visualizing the forces"
          annotation(Dialog(tab="Visualization", group="Contact Force"));

      // center to CP
        parameter Boolean visCenter2CPEnabled = false
          "= true: animation of the center2CP 'rod' shall be enabled"
          annotation(Dialog(tab="Visualization",group="Center2CP"));
        parameter MB.Types.Color center2CPColor= {128,128,128}
          "Color of the rod"
          annotation(Dialog(tab="Visualization",group="Center2CP"));

      // belt
        parameter Boolean visBeltEnabled = true
          "= true: tire's belt will be animated"
          annotation(Dialog(tab="Visualization", group="Belt"));
        parameter MB.Types.Color beltColor= {26,26,26} "Belt Color"     annotation(Dialog(tab="Visualization", group="Belt"));
        parameter MB.Types.SpecularCoefficient beltSpecularCoefficient = 0.1
          "Specular Coefficient: 0 total absorbtion, 1 reflecting"    annotation(Dialog(tab="Visualization", group="Belt"));

      end ParametersCommon;

      partial model ParametersDryRollRes
        "covers parameter for models with dry friction with rolling resistance"

        import SI = Modelica.SIunits;
        import MB = Modelica.Mechanics.MultiBody;

      // friction
        parameter SI.Velocity vRotMin = 1e-6
          "Lower border used for the calculation of slip to not get infinite values. If vRot < vRotMin: vRot is set to vRotMin for calcualation of the slip"
          annotation(Dialog(tab="Friction", group="Slip Properties"));
        parameter SI.Velocity vLongMin = 1e-6
          "Lower border for the calculation of the slip angle. If vLong < vLongMin the angle is set to pi/2 or -pi/2"
          annotation(Dialog(tab="Friction", group="Slip Properties"));
        parameter SI.Velocity vAdhesion = 0.3 "Velocity of maximum friction"
          annotation(Dialog(tab="Friction", group="Slip Properties"));
        parameter SI.Velocity vSlide = 1
          "Velocity over which full sliding occurs"
          annotation(Dialog(tab="Friction", group="Slip Properties"));
        final parameter Real dmu_dvSlip(
          final unit="N/s^2",
          final min=0) = 2/vAdhesion "Curves gradient at zero crossing";
        parameter Real muMaxN = 1 "Maximum friction coefficient (at vAdhesion)"
          annotation(Dialog(tab="Friction", group="Slip Properties"));
        parameter Real muMinN(min = 0) = 0.6
          "Friciton coefficient at full sliding"
            annotation(Dialog(tab="Friction", group="Slip Properties"));
        parameter Real fR0 = 10e-3
          "Rolling resistance coefficient: usually in the range from 0.01 to 0.025"
            annotation(Dialog(tab="Friction", group="Rolling Resistance"));

      end ParametersDryRollRes;

      partial model ParametersAdvancedFriction
        "covers parameters for the advanced friction model"

        import SI = Modelica.SIunits;
        import MB = Modelica.Mechanics.MultiBody;

      // friction base
        parameter SI.Velocity vRotMin = 1e-6
          "Lower border used for the calculation of slip to not get infinite values. If vRot < vRotMin: vRot is set to vRotMin for calcualation of the slip"
          annotation(Dialog(tab="Friction", group="Slip Properties"));
        parameter SI.Velocity vLongMin = 1e-6
          "Lower border for the calculation of the slip angle. If vLong < vLongMin the angle is set to pi/2 or -pi/2"
          annotation(Dialog(tab="Friction", group="Slip Properties"));

      // slip
        parameter SI.Velocity vLongAdhesion = 0.3
          "Longitudinal speed at which the maximum friction occurs" annotation(Dialog(tab="Friction", group="Slip Properties"));
        parameter SI.Velocity vLongSlide = 1
          "Longitudinal speed over which full sliding occurs" annotation(Dialog(tab="Friction", group="Slip Properties"));
        parameter Real sLongAdhesion = 0.15
          "Longitudinal slip at which the maximum fricion occurs" annotation(Dialog(tab="Friction", group="Slip Properties"));
        parameter Real sLongSlide = 0.4
          "Longitudinal slip over which full sliding occurs" annotation(Dialog(tab="Friction", group="Slip Properties"));
        final parameter Real dmu_dvSlip_LongN(
          final unit="N/s^2",
          final min=0) = 1/(10*sLongAdhesion)
          "Curves gradient at zero crossing"                                     annotation(Dialog(tab="Friction", group="Slip Properties"));
        parameter Real muLongMaxN(min = 0) = 1
          "Maximum longitudinal friction coefficient at nominal load" annotation(Dialog(tab="Friction", group="Slip Properties"));
        parameter Real muLongMinN(min = 0) = 0.6
          "Longitudinal friction coefficient at nominal load and full sliding" annotation(Dialog(tab="Friction", group="Slip Properties"));
        parameter SI.Velocity vLatAdhesion = 0.4
          "Lateral speed at which the maximum friction occurs" annotation(Dialog(tab="Friction", group="Slip Properties"));
        parameter SI.Velocity vLatSlide = 1.2
          "Lateral speed over which full sliding occurs" annotation(Dialog(tab="Friction", group="Slip Properties"));
        parameter Real sLatAdhesion = 0.2
          "Lateral slip at which the maximum fricion occurs" annotation(Dialog(tab="Friction", group="Slip Properties"));
        parameter Real sLatSlide = 0.5
          "Lateral slip over which full sliding occurs"                              annotation(Dialog(tab="Friction", group="Slip Properties"));
        final parameter Real dmu_dvSlip_LatN(
          final unit="N/s^2",
          final min=0) = 1/(10*sLongAdhesion)
          "Curves Gradient at zero crossing";
        parameter Real muLatMaxN(min = 0) = 1
          "Maximum lateral friction coefficient at nominal load" annotation(Dialog(tab="Friction", group="Slip Properties"));
        parameter Real muLatMinN(min = 0) = 0.6
          "Lateral friction coefficient at nominal load and full sliding" annotation(Dialog(tab="Friction", group="Slip Properties"));

      // load influence
        parameter Real muN = 1 "Friction coeffient at nominal load" annotation(Dialog(tab="Friction", group="Load Influence"));
        parameter Real mu2N = 0.75
          "Fricition coefficient at twice the nominal load"                          annotation(Dialog(tab="Friction", group="Load Influence"));
        parameter SI.Force fNNominal = 3e3 "The nominal load of the tire" annotation(Dialog(tab="Friction", group="Load Influence"));

      // roll resistance
        parameter Real fR0 = 1e-2
          "Factor for the constant part of the rolling resistance" annotation(Dialog(tab="Friction", group="Roll Resistance"));
        parameter Real fR1 = 0.2e-2
          "Factor for the linearily rising part of the rolling resistance (with speed)"
                                                                                        annotation(Dialog(tab="Friction", group="Roll Resistance"));
        parameter Real fR4 = 0.1e-2
          "Factor for the part that rises with the power of 4 with the speed" annotation(Dialog(tab="Friction", group="Roll Resistance"));

      // bore torque
        parameter Real muTurn = 0.8 "Friction coefficient for the bore torque" annotation(Dialog(tab="Friction", group="Bore Torque"));

      // self alginging

      // camber force
        parameter Real camberGain = 1
          "Gain factor for the influence of the camber speed" annotation(Dialog(tab="Friction", group="Camber Force"));

      // overturning torque

      end ParametersAdvancedFriction;

      annotation (Icon, Documentation(info="<html>

This package contains partial models that aggregate different parameters in order to be used in the tire models defined in the package. This way the parameters can be modiefied at a central place with the tire models extending the correspoding common parameters model.

</html>"));
      package Types "intialization types of tires"
        annotation(preferedView="info");

      extends
          WheelsAndTires.TireComponents.Utilities.Icons.TireComponentsPackage;

        package InitSlip
          "Type, constants and menu choices to define initialization of slip, as temporary solution until enumerations are available"

          annotation (Documentation(info="<html> </html>"));

          extends Modelica.Icons.Enumeration;

          constant Integer TransRot=1
            "Initialize the translational and rotational speed, calculate the slip";
          constant Integer TransSlip=2
            "Initialize the translational speed and slip, calculate the rotational speed";
          constant Integer RotSlip=3
            "Initialize the rotational speed and slip, calculate the translational speed";

          type Temp
            "Temporary type of Init with choices for menus (until enumerations are available)"

            extends Modelica.Icons.TypeInteger;
            annotation (choices(
                choice=WheelsAndTires.Tires.Commons.Types.InitSlip.TransRot
                  "TransRot: Set transl. and rot. velocities, get slip",
                choice=WheelsAndTires.Tires.Commons.Types.InitSlip.TransSlip
                  "TransSlip: Set slip and transl. speed, get rot. speed",
                choice=WheelsAndTires.Tires.Commons.Types.InitSlip.RotSlip
                  "RotSlip: Set rot. speed and slip, get transl. speed"),
                Documentation(info="<html>

<table border=1 cellspacing=0 cellpadding=2>
<tr><th><b>Types.Init.</b></th><th><b>Meaning</b></th></tr>
<tr><td>Free</td>

<tr><td>TransRot</td>
    <td>Initialize the translational and rotational speed, calculate the slip</td></tr>

<tr><td>TransSlip</td>
    <td>Initialize the translational speed and slip, calculate the rotational speed</td></tr>

<tr><td>RotSlip</td>
    <td>Initialize the rotational speed and slip, calculate the translational speed</td></tr>

</table>

</html>"));

          end Temp;
        end InitSlip;
        annotation (Icon);
      end Types;
    end Commons;

    package Slim "contains ideally slim tires"
      annotation(preferedView="info");

    extends WheelsAndTires.TireComponents.Utilities.Icons.TirePackage;

      model IdealTire
        "ideally rigid tire without slip or penetration into the ground. Just use with the FlatSurface option of the Surface enabled."
        import MultiBondLib;
        import WheelsAndTires;
        import SI = Modelica.SIunits;
        import MB = Modelica.Mechanics.MultiBody;

        extends WheelsAndTires.Tires.Commons.ParametersCommon;
        extends WheelsAndTires.TireComponents.Utilities.Icons.TireModel;

      // geometry
        parameter SI.Radius rWheel = 14*2.54e-2 "Radius of the wheel";
        parameter SI.Radius rRim = rWheel - height "The radius of the rim";
        parameter SI.Distance height = 4e-3
          "Height of the belt (just for visualization)";

      // initialization
        parameter MB.Types.Init.Temp initType=MB.Types.Init.Free
          "Type of initialization (defines usage of start values below)" annotation(Dialog(tab="Initialization"));
        parameter Boolean useTransVelocities = false
          "Use the translational velocities (defines usage of start values below), does not work with every starting angle"
           annotation(Dialog(tab="Initialization"));
        parameter SI.Position x_start[3] = {0,0,0}
          "Initial position of the contact point in the global coordinate system ([2] is used if possible)"
           annotation(Dialog(tab="Initialization"));
        parameter SI.Velocity v_start[3] = {0,0,0}
          "Initial velocity in the global coordinate system (2nd is optional for models with non flat surfaces)"
           annotation(Dialog(tab="Initialization",enable=useTransVelocities));
        parameter SI.Acceleration a_start[3] = {0,0,0}
          "deactivated due to not possible initialization"
           annotation(Dialog(tab="Initialization",enable=false));
        parameter SI.Angle phi_start[3] = {0,0,0}
          "Initial angles in the world coordinate system"
           annotation(Dialog(tab="Initialization"));
        parameter SI.AngularVelocity w_start[3] = {0,0,0}
          "Initial angular velocity in the rim body coordinate system"
           annotation(Dialog(tab="Initialization",enable=not useTransVelocities));
        parameter SI.AngularAcceleration z_start[3] = {0,0,0}
          "deactivated due to not possible initialization"
           annotation(Dialog(tab="Initialization",enable=false));
        final parameter MultiBondLib.Mechanics3D.Types.Quaternion Q_start=
            MultiBondLib.Mechanics3D.Utilities.AxesRotQ(phi_start,
            sequence_angles) "Initial quaternion";
        final parameter MultiBondLib.Mechanics3D.Types.RotationSequence
          sequence_angles={2,1,3} "Sequence of the cardan angles" annotation(Dialog(tab="Advanced"));
        parameter Boolean enforceStates = false
          "Enforce cardan angles and w as states" annotation(Dialog(tab="Advanced"));
        parameter Boolean useQuaternions =  false
          "Use Quaternions instead of cardan angles" annotation(Dialog(tab="Advanced"));

      // variables used for initialization
        SI.Position xCP[3] "Position of the contact point frame";
        SI.Position xRim[3] "Position of the rim frame";
        SI.Velocity vRim[3] "Velocity of the rim frame";
        SI.Acceleration aRim[3] "Acceleration of the rim frame";
        SI.Angle phiRim[3](stateSelect=if not useQuaternions then (if enforceStates then
                        StateSelect.always else StateSelect.prefer) else  StateSelect.never)
          "cardan angles of the rim Frame";
        SI.Angle phi_dRim[3](stateSelect=if not useQuaternions then (if enforceStates then
                        StateSelect.always else StateSelect.prefer) else  StateSelect.never)
          "cardan angles derivatives of the Rim Frame";
        SI.AngularVelocity wRim[3](stateSelect=if useQuaternions then (if enforceStates then
                        StateSelect.always else StateSelect.prefer) else  StateSelect.default)
          "angular velocity of the Rim Frame";
        SI.AngularAcceleration zRim[3] "angular acceleration of the Rim";
        MultiBondLib.Mechanics3D.Types.Quaternion QRim(
          stateSelect=if useQuaternions then StateSelect.prefer else StateSelect.never,
          start=Q_start,
          fixed=false) "quaternions";

        WheelsAndTires.TireComponents.ContactPhysics.ContactBondNoDynamics
          ContactPhysics(
          visForcesEnabled=visForcesEnabled,
          forceScaling=forceScaling,
          arrowColor=arrowColor,
          arrowDiameter=arrowDiameter)
          annotation (extent=[-90,-60; -50,-20]);
        WheelsAndTires.TireComponents.Friction.IdealFricition Friction
          annotation (extent=[-40,20; 0,60]);
        WheelsAndTires.TireComponents.Rim.SpokedRim Rim(
          rRim=rRim,
          bRim=5*height,
          mRim=mRim,
          height=height/2,
          I_11=I_11,
          I_22=I_22,
          I_33=I_33,
          I_21=I_21,
          I_31=I_31,
          I_32=I_32,
          visRimEnabled=visRimEnabled,
          rimRodColor=rimRodColor,
          rimSpecularCoefficient=rimSpecularCoefficient)
          annotation (extent=[40,-60; 80,-20]);
        MultiBondLib.Mechanics3D.Interfaces.Frame_a TireHub
          "connection to the superordinate vehicle model"
          annotation (extent=[90,-10; 110,10]);
        WheelsAndTires.TireComponents.BeltDynamics.RigidBelt BeltDynamics
          annotation (extent=[-10,-60; 30,-20]);

        WheelsAndTires.TireComponents.Geometry.FlatDisc Geometry(
          rRim=rRim,
          width=5*height,
          visBeltEnabled=visBeltEnabled,
          beltColor=beltColor,
          beltSpecularCoefficient=beltSpecularCoefficient,
          visContactPointEnabled=visContactPointEnabled,
          contactColor=contactColor,
          contactPointSize=contactPointSize,
          height=height)
          annotation (extent=[40,20; 80,60]);
        WheelsAndTires.TireComponents.Center2ContactPoint.Center2CPBond
          center2CP(
          visCenter2CPEnabled=visCenter2CPEnabled,
          center2CPColor=center2CPColor)
          annotation (extent=[-22,-48; -38,-32],
          rotation=0);
        WheelsAndTires.TireComponents.VerticalDynamics.NoElevation
          VerticalDynamics
                      annotation (extent=[-90,20; -50,60]);

      protected
        outer WheelsAndTires.Environment.Surface Surface;
        Real eLong[3];
        Real eLat[3];
        Real eN[3];
        Real ePlane[3];
        annotation (Diagram,
          experiment(
            StopTime=10,
            NumberOfIntervals=1000,
            Tolerance=1e-006),
          experimentSetupOutput,
          Icon(
            Text(
              extent=[0,-100; 0,-80],
              style(color=10, rgbcolor={135,135,135}),
              string="Slim Ideal")),
          Coordsys(extent=[-100,-100; 100,100], scale=0.2),
          Documentation(info="<html>

For further information see the documentation of the used models and section <a href=\"Modelica://WheelsAndTires.UsersGuide.Tires\">Provided Tire Models</a> of the <a href=\"Modelica://WheelsAndTires.UsersGuide\">User's Guide</a>.

</html>"));

      initial equation

        if initType == MB.Types.Init.Position or initType == MB.Types.Init.
          PositionVelocity or initType == MB.Types.Init.PositionVelocityAcceleration then
            xCP[1] = x_start[1];
            xCP[3] = x_start[3];
          if useQuaternions then
            QRim[1:3] = Q_start[1:3];
          else
            phiRim = phi_start;
          end if;
        end if;

        if initType == MB.Types.Init.PositionVelocity or initType == MB.Types.Init.
            PositionVelocityAcceleration or initType == MB.Types.Init.Velocity or
            initType == MB.Types.Init.VelocityAcceleration then
          if useTransVelocities then
            vRim[1] = v_start[1];
            vRim[3] = v_start[3];
            wRim*eN = 0;
            if not Surface.FlatSurface then
              vRim[2] = v_start[2];
            end if;
          else
            wRim = w_start;
          end if;
        end if;

        if initType == MB.Types.Init.VelocityAcceleration or initType == MB.Types.Init.
            PositionVelocityAcceleration then
          if useTransVelocities then
            aRim[1] = a_start[1];
            aRim[3] = a_start[3];
          else
            zRim = z_start;
          end if;
        end if;

        if initType == MB.Types.Init.SteadyState then
          wRim = zeros(3);
          zRim = zeros(3);
        end if;

      equation
        xCP = ContactPhysics.MBG2Mech1.x;
        xRim = Rim.rimMass.PotentialFBM1.x;
        vRim = Rim.rimMass.PotentialFBM1.v;
        aRim = Rim.rimMass.PotentialFBM1.a;
        phiRim = Rim.rimMass.PotentialFBM1.phi;
        phi_dRim = Rim.rimMass.PotentialFBM1.phi_d;
        wRim = Rim.rimMass.PotentialFBM1.w;
        zRim = Rim.rimMass.PotentialFBM1.z;
        QRim = Rim.rimMass.PotentialFBM1.Q;

        eLong = Geometry.tireBus.UV.eLong;
        eLat = Geometry.tireBus.UV.eLat;
        eN = Geometry.tireBus.UV.eN;
        ePlane = Geometry.tireBus.UV.ePlane;

        connect(Rim.frame_b,TireHub)               annotation (points=[82,-40; 90,-40;
              90,0; 100,0],        style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(BeltDynamics.frame_b, Rim.frame_a)
                                               annotation (points=[32,-40; 38,-40],
            style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(Geometry.tireBus,ContactPhysics. tireBus)
                                                       annotation (points=[60,20;
              60,0; -82,0; -82,-20], style(
            color=42,
            rgbcolor={127,0,0},
            fillColor=7,
            rgbfillColor={255,255,255},
            fillPattern=1));
        connect(Geometry.tireBus, BeltDynamics.tireBus)
                                                    annotation (points=[60,20; 60,0;
              10,0; 10,-20],     style(
            color=42,
            rgbcolor={127,0,0},
            fillColor=7,
            rgbfillColor={255,255,255},
            fillPattern=1));
        connect(Geometry.tireBus, Rim.tireBus) annotation (points=[60,20; 60,-20],
                          style(
            color=42,
            rgbcolor={127,0,0},
            fillColor=7,
            rgbfillColor={255,255,255},
            fillPattern=1));
        connect(ContactPhysics.frame_b, center2CP.frame_b)
                                                        annotation (points=[-48,-40;
              -38.8,-40],                                        style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(center2CP.frame_a, BeltDynamics.frame_a)
                                                     annotation (points=[-21.2,
              -40; -12,-40],                                  style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(center2CP.tireBus, Geometry.tireBus) annotation (points=[-30,-32;
              -30,0; 60,0; 60,20],                                         style(
              color=42, rgbcolor={127,0,0}));
        connect(Friction.tireBus, BeltDynamics.tireBus)
                                                    annotation (points=[-12,20; -12,0;
              10,0; 10,-20],        style(
            color=42,
            rgbcolor={127,0,0},
            fillColor=10,
            rgbfillColor={135,135,135},
            fillPattern=1));
        connect(VerticalDynamics.tireBus, ContactPhysics.tireBus)
                                                        annotation (points=[-82,20;
              -82,-20],     style(
            color=42,
            rgbcolor={127,0,0},
            fillColor=10,
            rgbfillColor={135,135,135},
            fillPattern=1));
        connect(VerticalDynamics.contactPhysics, ContactPhysics.Friction)
                                                                   annotation (
            points=[-58,20; -58,-20], style(
            color=58,
            rgbcolor={0,127,0},
            fillColor=9,
            rgbfillColor={175,175,175},
            fillPattern=1));
        connect(ContactPhysics.Friction, Friction.ContactPhysics) annotation (
            points=[-58,-20; -58,12; -32,12; -32,20], style(
            color=58,
            rgbcolor={0,127,0},
            fillColor=9,
            rgbfillColor={175,175,175},
            fillPattern=1));
      end IdealTire;

      model Slipping "slim tire with dry friction."
        import MultiBondLib;
        import WheelsAndTires;
        import SI = Modelica.SIunits;
        import MB = Modelica.Mechanics.MultiBody;
        import WheelsAndTires.Tires.Commons.Types.InitSlip;

        extends WheelsAndTires.Tires.Commons.ParametersCommon;
        extends WheelsAndTires.Tires.Commons.ParametersDryRollRes;
        extends WheelsAndTires.TireComponents.Utilities.Icons.TireModel;

      // geometry
        parameter SI.Radius rWheel= 14*2.54e-2 "Radius of the wheel";
        parameter SI.Radius rRim = rWheel - height "The radius of the rim";
        parameter SI.Distance height = 4e-3
          "Height of the belt (just for visualization)";

      // elevation
        parameter Real cR(
          final unit="N/m",
          final min=0) = 1e6 "Stiffness of the single spring" annotation(Dialog(tab="Elevation"));
        parameter Real cR1(
          final unit="N/m",
          final min=0) = 1e6 "Stiffness of the spring-damper serial connection"
                                                                                annotation(Dialog(tab="Elevation"));
        parameter Real dR1(
          final unit="N/ (m/s)",
          final min=0) = 1e4
          "Damping constant of the spring-damper serial connection" annotation(Dialog(tab="Elevation"));

      // initialization
        parameter MB.Types.Init.Temp initType=MB.Types.Init.Free
          "Type of initialization (defines usage of start values below)" annotation(Dialog(tab="Initialization"));
        parameter Boolean onSurface = true
          "true: the tire will be initialized to start on the surface"
           annotation(Dialog(tab="Initialization", enable=
            not (initType == MB.Types.Init.Position or
            initType == MB.Types.Init.PositionVelocity or
            initType == MB.Types.Init.PositionVelocityAcceleration)));
        parameter Boolean useTransVelocities = false
          "Use the translational velocities (defines usage of start values below), does not work with every starting angle"
           annotation(Dialog(tab="Initialization"));
        parameter SI.Position x_start[3] = {0,0,0}
          "Initial position of the contact point in the global coordinate system ([2] is used if possible)"
           annotation(Dialog(tab="Initialization"), enable = not onSurface);
        parameter SI.Velocity v_start[3] = {0,0,0}
          "Initial velocity in the global coordinate system (2nd is optional for models with non flat surfaces)"
           annotation(Dialog(tab="Initialization",enable=useTransVelocities));
        parameter SI.Acceleration a_start[3] = {0,0,0}
          "deactivated due to not possible initialization"
           annotation(Dialog(tab="Initialization",enable=false));
        parameter SI.Angle phi_start[3] = {0,0,0}
          "Initial angles in the world coordinate system"
           annotation(Dialog(tab="Initialization"));
        parameter SI.AngularVelocity w_start[3] = {0,0,0}
          "Initial angular velocity in the rim body coordinate system"
           annotation(Dialog(tab="Initialization",enable=not useTransVelocities));
        parameter SI.AngularAcceleration z_start[3] = {0,0,0}
          "deactivated due to not possible initialization"
           annotation(Dialog(tab="Initialization",enable=false));
        final parameter MultiBondLib.Mechanics3D.Types.Quaternion Q_start=
            MultiBondLib.Mechanics3D.Utilities.AxesRotQ(phi_start,
            sequence_angles) "Initial quaternion";
        final parameter MultiBondLib.Mechanics3D.Types.RotationSequence
          sequence_angles={2,1,3} "Sequence of the cardan angles" annotation(Dialog(tab="Advanced"));
        parameter Boolean enforceStates = false
          "Enforce cardan angles and w as states" annotation(Dialog(tab="Advanced"));
        parameter Boolean useQuaternions =  false
          "Use Quaternions instead of cardan angles" annotation(Dialog(tab="Advanced"));

        parameter Boolean useAdvancedInitialization = false
          "Enables setting manual setting of slip" annotation(Dialog(tab="Initialization", group="Advanced"));
        parameter WheelsAndTires.Tires.Commons.Types.InitSlip.Temp initSlip=
            WheelsAndTires.Tires.Commons.Types.InitSlip.RotSlip
          "The type of initialization for velocities and slip"
          annotation(Dialog(tab="Initialization", group="Advanced", enable = useAdvancedInitialization));
        parameter SI.Velocity v_start_advanced[3] = {0,0,0}
          "Initial velocity in the global coordinate system (2nd is optional for models with non flat surfaces)"
           annotation(Dialog(tab="Initialization", group="Advanced", enable = (initSlip <> InitSlip.RotSlip) and useAdvancedInitialization));
        parameter SI.AngularVelocity w_start_advanced[3] = {0,0,0}
          "Initial angular velocity in the rim body coordinate system"
           annotation(Dialog(tab="Initialization", group="Advanced", enable = (initSlip <> InitSlip.TransSlip) and useAdvancedInitialization));
        parameter SI.Velocity v_slip_start_advanced[3] = {0,0,0}
          "Initial velocity in the global coordinate system (2nd value is ignored)"
           annotation(Dialog(tab="Initialization", group="Advanced", enable = (initSlip <> InitSlip.TransRot) and useAdvancedInitialization));

      // variables used for initialization
        SI.Position xCP[3] "Position of the contact point frame";
        SI.Position xRim[3]( stateSelect=if not useQuaternions then (if enforceStates then
                        StateSelect.always else StateSelect.prefer) else  StateSelect.never)
          "Position of the rim frame";
        SI.Velocity vRim[3](  stateSelect=if not useQuaternions then (if enforceStates then
                        StateSelect.always else StateSelect.prefer) else  StateSelect.never)
          "Velocity of the rim frame";
        SI.Acceleration aRim[3] "Acceleration of the rim frame";
        SI.Angle phiRim[3](stateSelect=if not useQuaternions then (if enforceStates then
                        StateSelect.always else StateSelect.prefer) else  StateSelect.never)
          "cardan angles of the rim Frame";
        SI.Angle phi_dRim[3](stateSelect=if not useQuaternions then (if enforceStates then
                        StateSelect.always else StateSelect.prefer) else  StateSelect.never)
          "cardan angles derivatives of the Rim Frame";
        SI.AngularVelocity wRim[3](stateSelect=if useQuaternions then (if enforceStates then
                        StateSelect.always else StateSelect.prefer) else  StateSelect.default)
          "angular velocity of the Rim Frame";
        SI.AngularAcceleration zRim[3] "angular acceleration of the Rim";
        MultiBondLib.Mechanics3D.Types.Quaternion QRim(
          stateSelect=if useQuaternions then StateSelect.prefer else StateSelect.never,
          start=Q_start,
          fixed=false) "quaternions";

        SI.Velocity vSlipLong "Longitudinal slip velocity";
        SI.Velocity vSlipLat "Lateral slip velocity";

        WheelsAndTires.TireComponents.ContactPhysics.ContactBondNoDynamics
          ContactPhysics(
          visForcesEnabled=visForcesEnabled,
          forceScaling=forceScaling,
          arrowColor=arrowColor,
          arrowDiameter=arrowDiameter)
          annotation (extent=[-90,-60; -50,-20]);

        WheelsAndTires.TireComponents.Friction.DryFricitionRollRes Friction(
          vRotMin=vRotMin,
          vLongMin=vLongMin,
          vAdhesion=vAdhesion,
          vSlide=vSlide,
          muMaxN=muMaxN,
          muMinN=muMinN,
          fR0=fR0,
          rWheel=rWheel)
          annotation (extent=[-40,20; 0,60]);

        WheelsAndTires.TireComponents.Rim.SpokedRim Rim(
          rRim=rRim,
          bRim=5*height,
          mRim=mRim,
          height=height/2,
          I_11=I_11,
          I_22=I_22,
          I_33=I_33,
          I_21=I_21,
          I_31=I_31,
          I_32=I_32,
          visRimEnabled=visRimEnabled,
          rimRodColor=rimRodColor,
          rimSpecularCoefficient=rimSpecularCoefficient)
          annotation (extent=[40,-60; 80,-20]);

        MultiBondLib.Mechanics3D.Interfaces.Frame_a TireHub
          "connection to the superordinate vehicle model"
          annotation (extent=[90,-10; 110,10]);

        WheelsAndTires.TireComponents.BeltDynamics.RigidBelt BeltDynamics
          annotation (extent=[-10,-60; 30,-20]);

        WheelsAndTires.TireComponents.Geometry.FlatDisc Geometry(
          rRim=rRim,
          width=5*height,
          height=height,
          visBeltEnabled=visBeltEnabled,
          beltColor=beltColor,
          beltSpecularCoefficient=beltSpecularCoefficient,
          visContactPointEnabled=visContactPointEnabled,
          contactColor=contactColor,
          contactPointSize=contactPointSize)
          annotation (extent=[40,20; 80,60]);
        WheelsAndTires.TireComponents.Center2ContactPoint.Center2CPBond
          center2CP(
          visCenter2CPEnabled=visCenter2CPEnabled,
          center2CPColor=center2CPColor)
          annotation (extent=[-22,-48; -38,-32],
                                             rotation=0);
        WheelsAndTires.TireComponents.VerticalDynamics.GehmannElevation
          VerticalDynamics(
          cR=cR,
          cR1=cR1,
          dR1=dR1)
          annotation (extent=[-90,20; -50,60]);

      protected
        outer WheelsAndTires.Environment.Surface Surface;
        Real eLong[3];
        Real eLat[3];
        Real eN[3];
        Real ePlane[3];
        annotation (Diagram,
          experiment(
            StopTime=10,
            NumberOfIntervals=1000,
            Tolerance=1e-006),
          experimentSetupOutput,
          Icon(
            Text(
              extent=[0,-100; 0,-80],
              style(color=10, rgbcolor={135,135,135}),
              string="Slim Slipping")),
          Coordsys(extent=[-100,-100; 100,100], scale=0.2),
          Documentation(info="<html>

For further information see the documentation of the used models and section <a href=\"Modelica://WheelsAndTires.UsersGuide.Tires\">Provided Tire Models</a> of the <a href=\"Modelica://WheelsAndTires.UsersGuide\">User's Guide</a>.

</html>"));

      initial equation

        if onSurface and not (initType == MB.Types.Init.Position or
            initType == MB.Types.Init.PositionVelocity or
            initType == MB.Types.Init.PositionVelocityAcceleration) then
          xCP[2] = Surface.get_elevation((xRim[1] - Geometry.r_CP*ePlane), (xRim[3] - Geometry.r_CP*ePlane));
        end if; // to initialize the tire on the surface not with xRim[2] = 0;

        if initType == MB.Types.Init.Position or initType == MB.Types.Init.
            PositionVelocity or initType == MB.Types.Init.PositionVelocityAcceleration then
            xCP[1] = x_start[1];
            xCP[3] = x_start[3];
            if not Surface.FlatSurface then
              xRim[2] = x_start[2] - Geometry.r_CP * eN;
            else
              xCP[2] = 0;
            end if;
          if useQuaternions then
            QRim[1:3] = Q_start[1:3];
          else
            phiRim = phi_start;
          end if;
        end if;

        if initType == MB.Types.Init.PositionVelocity or initType == MB.Types.Init.
          PositionVelocityAcceleration or initType == MB.Types.Init.Velocity or
          initType == MB.Types.Init.VelocityAcceleration then

          if not useAdvancedInitialization then
            if useTransVelocities then
              vRim = v_start;
            else
              wRim = w_start;
              vRim[2] = 0;
            end if;

          else
            if initSlip <> InitSlip.RotSlip then
              vRim = v_start_advanced;
            end if;

            if initSlip <> InitSlip.TransRot then
              vSlipLong = v_slip_start_advanced[1];
              vSlipLat = v_slip_start_advanced[3];
            end if;

            if initSlip <> InitSlip.TransSlip then
              wRim = w_start_advanced;
            end if;

            if initSlip == InitSlip.RotSlip then
              vRim[2] = 0;
            end if;
          end if;
        end if;

        if initType == MB.Types.Init.VelocityAcceleration or initType == MB.Types.Init.
            PositionVelocityAcceleration then
          if useTransVelocities then
            aRim[1] = a_start[1];
            aRim[3] = a_start[3];
          else
            zRim = z_start;
          end if;
        end if;

        if initType == MB.Types.Init.SteadyState then
          wRim = zeros(3);
          zRim = zeros(3);
        end if;

      equation

        xCP = ContactPhysics.MBG2Mech1.x;
        xRim = Rim.rimMass.PotentialFBM1.x;
        vRim = Rim.rimMass.PotentialFBM1.v;
        aRim = Rim.rimMass.PotentialFBM1.a;
        phiRim = Rim.rimMass.PotentialFBM1.phi;
        phi_dRim = Rim.rimMass.PotentialFBM1.phi_d;
        wRim = Rim.rimMass.PotentialFBM1.w;
        zRim = Rim.rimMass.PotentialFBM1.z;
        QRim = Rim.rimMass.PotentialFBM1.Q;

        vSlipLong = Friction.v_Slip_Long;
        vSlipLat = Friction.v_Slip_Lat;

        eLong = Geometry.tireBus.UV.eLong;
        eLat = Geometry.tireBus.UV.eLat;
        eN = Geometry.tireBus.UV.eN;
        ePlane = Geometry.tireBus.UV.ePlane;

        connect(Rim.frame_b,TireHub)               annotation (points=[82,-40; 90,-40;
              90,0; 100,0],        style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(BeltDynamics.frame_b, Rim.frame_a)
                                               annotation (points=[32,-40; 38,-40],
            style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(Geometry.tireBus,ContactPhysics. tireBus)
                                                       annotation (points=[60,20;
              60,0; -82,0; -82,-20], style(
            color=42,
            rgbcolor={127,0,0},
            fillColor=7,
            rgbfillColor={255,255,255},
            fillPattern=1));
        connect(Geometry.tireBus, BeltDynamics.tireBus)
                                                    annotation (points=[60,20;
              60,0; 10,0; 10,-20],
                                 style(
            color=42,
            rgbcolor={127,0,0},
            fillColor=7,
            rgbfillColor={255,255,255},
            fillPattern=1));
        connect(Geometry.tireBus, Rim.tireBus) annotation (points=[60,20; 60,-20],
                          style(
            color=42,
            rgbcolor={127,0,0},
            fillColor=7,
            rgbfillColor={255,255,255},
            fillPattern=1));
        connect(ContactPhysics.frame_b, center2CP.frame_b)
                                                        annotation (points=[-48,-40;
              -38.8,-40],                                        style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(center2CP.frame_a, BeltDynamics.frame_a)
                                                     annotation (points=[-21.2,
              -40; -12,-40],                                  style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(center2CP.tireBus, Geometry.tireBus) annotation (points=[-30,-32;
              -30,0; 60,0; 60,20],                                         style(
              color=42, rgbcolor={127,0,0}));
        connect(Friction.tireBus, BeltDynamics.tireBus)
                                                    annotation (points=[-12,20;
              -12,0; 10,0; 10,-20], style(
            color=42,
            rgbcolor={127,0,0},
            fillColor=10,
            rgbfillColor={135,135,135},
            fillPattern=1));
        connect(VerticalDynamics.tireBus, ContactPhysics.tireBus)
                                                        annotation (points=[-82,20;
              -82,-20],     style(
            color=42,
            rgbcolor={127,0,0},
            fillColor=10,
            rgbfillColor={135,135,135},
            fillPattern=1));
        connect(VerticalDynamics.contactPhysics, ContactPhysics.Friction)
                                                                   annotation (
            points=[-58,20; -58,-20], style(
            color=58,
            rgbcolor={0,127,0},
            fillColor=9,
            rgbfillColor={175,175,175},
            fillPattern=1));
        connect(ContactPhysics.Friction, Friction.ContactPhysics) annotation (
            points=[-58,-20; -58,12; -32,12; -32,20], style(
            color=58,
            rgbcolor={0,127,0},
            fillColor=9,
            rgbfillColor={175,175,175},
            fillPattern=1));
      end Slipping;

      model Advanced "slim tire with advanced friction"
        import MultiBondLib;
        import WheelsAndTires;
        import SI = Modelica.SIunits;
        import MB = Modelica.Mechanics.MultiBody;
        import WheelsAndTires.Tires.Commons.Types.InitSlip;

        extends WheelsAndTires.Tires.Commons.ParametersCommon;
        extends WheelsAndTires.Tires.Commons.ParametersAdvancedFriction;
        extends WheelsAndTires.TireComponents.Utilities.Icons.TireModel;

      // geometry
        parameter SI.Radius rWheel= 14*2.54e-2 "Radius of the wheel";
        parameter SI.Radius rRim = rWheel - height "The radius of the rim";
        parameter SI.Distance height = 4e-3
          "Height of the belt (just for visualization)";

      // elevation
        parameter Real cR(
          final unit="N/m",
          final min=0) = 1e6
          "Stiffness of the tire in normal direction to the surface" annotation(Dialog(tab="Elevation"));
        parameter Real dR(
          final unit="N/ (m/s)",
          final min=0) = 1e3 "Damping constant of the tire for normal speed" annotation(Dialog(tab="Elevation"));

      // initialization
        parameter MB.Types.Init.Temp initType=MB.Types.Init.Free
          "Type of initialization (defines usage of start values below)" annotation(Dialog(tab="Initialization"));
        parameter Boolean onSurface = true
          "true: the tire will be initialized to start on the surface"
           annotation(Dialog(tab="Initialization", enable=
            not (initType == MB.Types.Init.Position or
            initType == MB.Types.Init.PositionVelocity or
            initType == MB.Types.Init.PositionVelocityAcceleration)));
        parameter Boolean useTransVelocities = false
          "Use the translational velocities (defines usage of start values below), does not work with every starting angle"
           annotation(Dialog(tab="Initialization"));
        parameter SI.Position x_start[3] = {0,0,0}
          "Initial position of the contact point in the global coordinate system ([2] is used if possible)"
           annotation(Dialog(tab="Initialization"), enable = not onSurface);
        parameter SI.Velocity v_start[3] = {0,0,0}
          "Initial velocity in the global coordinate system (2nd is optional for models with non flat surfaces)"
           annotation(Dialog(tab="Initialization",enable=useTransVelocities));
        parameter SI.Acceleration a_start[3] = {0,0,0}
          "deactivated due to not possible initialization"
           annotation(Dialog(tab="Initialization",enable=false));
        parameter SI.Angle phi_start[3] = {0,0,0}
          "Initial angles in the world coordinate system"
           annotation(Dialog(tab="Initialization"));
        parameter SI.AngularVelocity w_start[3] = {0,0,0}
          "Initial angular velocity in the rim body coordinate system"
           annotation(Dialog(tab="Initialization",enable=not useTransVelocities));
        parameter SI.AngularAcceleration z_start[3] = {0,0,0}
          "deactivated due to not possible initialization"
           annotation(Dialog(tab="Initialization",enable=false));
        final parameter MultiBondLib.Mechanics3D.Types.Quaternion Q_start=
            MultiBondLib.Mechanics3D.Utilities.AxesRotQ(phi_start,
            sequence_angles) "Initial quaternion";
        final parameter MultiBondLib.Mechanics3D.Types.RotationSequence
          sequence_angles={2,1,3} "Sequence of the cardan angles" annotation(Dialog(tab="Advanced"));
        parameter Boolean enforceStates = false
          "Enforce cardan angles and w as states" annotation(Dialog(tab="Advanced"));
        parameter Boolean useQuaternions =  false
          "Use Quaternions instead of cardan angles" annotation(Dialog(tab="Advanced"));

        parameter Boolean useAdvancedInitialization = false
          "Enables setting manual setting of slip" annotation(Dialog(tab="Initialization", group="Advanced"));
        parameter WheelsAndTires.Tires.Commons.Types.InitSlip.Temp initSlip=
            WheelsAndTires.Tires.Commons.Types.InitSlip.RotSlip
          "The type of initialization for velocities and slip"
          annotation(Dialog(tab="Initialization", group="Advanced", enable = useAdvancedInitialization));
        parameter SI.Velocity v_start_advanced[3] = {0,0,0}
          "Initial velocity in the global coordinate system (2nd is optional for models with non flat surfaces)"
           annotation(Dialog(tab="Initialization", group="Advanced", enable = (initSlip <> InitSlip.RotSlip) and useAdvancedInitialization));
        parameter SI.AngularVelocity w_start_advanced[3] = {0,0,0}
          "Initial angular velocity in the rim body coordinate system"
           annotation(Dialog(tab="Initialization", group="Advanced", enable = (initSlip <> InitSlip.TransSlip) and useAdvancedInitialization));
        parameter SI.Velocity v_slip_start_advanced[3] = {0,0,0}
          "Initial velocity in the global coordinate system (2nd value is ignored)"
           annotation(Dialog(tab="Initialization", group="Advanced", enable = (initSlip <> InitSlip.TransRot) and useAdvancedInitialization));

      // variables used for initialization
        SI.Position xCP[3] "Position of the contact point frame";
        SI.Position xRim[3] "Position of the rim frame";
        SI.Velocity vRim[3] "Velocity of the rim frame";
        SI.Acceleration aRim[3] "Acceleration of the rim frame";
        SI.Angle phiRim[3](stateSelect=if not useQuaternions then (if enforceStates then
                        StateSelect.always else StateSelect.prefer) else  StateSelect.never)
          "cardan angles of the rim Frame";
        SI.Angle phi_dRim[3](stateSelect=if not useQuaternions then (if enforceStates then
                        StateSelect.always else StateSelect.prefer) else  StateSelect.never)
          "cardan angles derivatives of the Rim Frame";
        SI.AngularVelocity wRim[3](stateSelect=if useQuaternions then (if enforceStates then
                        StateSelect.always else StateSelect.prefer) else  StateSelect.default)
          "angular velocity of the Rim Frame";
        SI.AngularAcceleration zRim[3] "angular acceleration of the Rim";
        MultiBondLib.Mechanics3D.Types.Quaternion QRim(
          stateSelect=if useQuaternions then StateSelect.prefer else StateSelect.never,
          start=Q_start,
          fixed=false) "quaternions";

        SI.Velocity vSlipLong "Longitudinal slip velocity";
        SI.Velocity vSlipLat "Lateral slip velocity";

        WheelsAndTires.TireComponents.ContactPhysics.ContactBondNoDynamics
          ContactPhysics(
          visForcesEnabled=visForcesEnabled,
          forceScaling=forceScaling,
          arrowColor=arrowColor,
          arrowDiameter=arrowDiameter)
          annotation (extent=[-90,-60; -50,-20]);

        WheelsAndTires.TireComponents.Friction.AdvancedFriction Friction(
          vRotMin=vRotMin,
          vLongMin=vLongMin,
          fR0=fR0,
          rWheel=rWheel,
          vLongAdhesion=vLongAdhesion,
          vLongSlide=vLongSlide,
          sLongAdhesion=sLongAdhesion,
          sLongSlide=sLongSlide,
          muLongMaxN=muLongMaxN,
          muLongMinN=muLongMinN,
          vLatAdhesion=vLatAdhesion,
          vLatSlide=vLatSlide,
          sLatAdhesion=sLatAdhesion,
          sLatSlide=sLatSlide,
          muLatMaxN=muLatMaxN,
          muLatMinN=muLatMinN,
          muN=muN,
          mu2N=mu2N,
          fNNominal=fNNominal,
          fR1=fR1,
          fR4=fR4,
          muTurn=muTurn,
          camberGain=camberGain,
          cR=cR)
          annotation (extent=[-40,20; 0,60]);

        WheelsAndTires.TireComponents.Rim.SpokedRim Rim(
          rRim=rRim,
          bRim=5*height,
          mRim=mRim,
          height=height/2,
          I_11=I_11,
          I_22=I_22,
          I_33=I_33,
          I_21=I_21,
          I_31=I_31,
          I_32=I_32,
          visRimEnabled=visRimEnabled,
          rimRodColor=rimRodColor,
          rimSpecularCoefficient=rimSpecularCoefficient)
          annotation (extent=[40,-60; 80,-20]);

        MultiBondLib.Mechanics3D.Interfaces.Frame_a TireHub
          "connection to the superordinate vehicle model"
          annotation (extent=[90,-10; 110,10]);

        WheelsAndTires.TireComponents.BeltDynamics.RigidBelt BeltDynamics
          annotation (extent=[-10,-60; 30,-20]);

        WheelsAndTires.TireComponents.Geometry.FlatDisc Geometry(
          rRim=rRim,
          width=5*height,
          height=height,
          visBeltEnabled=visBeltEnabled,
          beltColor=beltColor,
          beltSpecularCoefficient=beltSpecularCoefficient,
          visContactPointEnabled=visContactPointEnabled,
          contactColor=contactColor,
          contactPointSize=contactPointSize)
          annotation (extent=[40,20; 80,60]);
        WheelsAndTires.TireComponents.Center2ContactPoint.Center2CPBond
          center2CP(
          visCenter2CPEnabled=visCenter2CPEnabled,
          center2CPColor=center2CPColor)
          annotation (extent=[-22,-48; -38,-32],
                                             rotation=0);
        WheelsAndTires.TireComponents.VerticalDynamics.ElastoElevation
          VerticalDynamics(cR=cR, dR=dR)
          annotation (extent=[-90,20; -50,60]);

      protected
        outer WheelsAndTires.Environment.Surface Surface;
        Real eLong[3];
        Real eLat[3];
        Real eN[3];
        Real ePlane[3];
        annotation (Diagram,
          experiment(
            StopTime=10,
            NumberOfIntervals=1000,
            Tolerance=1e-006),
          experimentSetupOutput,
          Icon(
            Text(
              extent=[0,-100; 0,-80],
              style(color=10, rgbcolor={135,135,135}),
              string="Slim Advanced")),
          Coordsys(extent=[-100,-100; 100,100], scale=0.2),
          Documentation(info="<html>
For further information see the documentation of the used models and section <a href=\"Modelica://WheelsAndTires.UsersGuide.Tires\">Provided Tire Models</a> of the <a href=\"Modelica://WheelsAndTires.UsersGuide\">User's Guide</a>.

</html>"));

      initial equation

        if onSurface and not (initType == MB.Types.Init.Position or
            initType == MB.Types.Init.PositionVelocity or
            initType == MB.Types.Init.PositionVelocityAcceleration) then
          xCP[2] = Surface.get_elevation((xRim[1] - Geometry.r_CP*ePlane), (xRim[3] - Geometry.r_CP*ePlane));
        end if; // to initialize the tire on the surface not with xRim[2] = 0;

        if initType == MB.Types.Init.Position or initType == MB.Types.Init.
            PositionVelocity or initType == MB.Types.Init.PositionVelocityAcceleration then
            xCP[1] = x_start[1];
            xCP[3] = x_start[3];
            if not Surface.FlatSurface then
              xRim[2] = x_start[2] - Geometry.r_CP * eN;
            else
              xCP[2] = 0;
            end if;
          if useQuaternions then
            QRim[1:3] = Q_start[1:3];
          else
            phiRim = phi_start;
          end if;
        end if;

        if initType == MB.Types.Init.PositionVelocity or initType == MB.Types.Init.
          PositionVelocityAcceleration or initType == MB.Types.Init.Velocity or
          initType == MB.Types.Init.VelocityAcceleration then

          if not useAdvancedInitialization then
            if useTransVelocities then
              vRim = v_start;
            else
              wRim = w_start;
              vRim[2] = 0;
            end if;

          else
            if initSlip <> InitSlip.RotSlip then
              vRim = v_start_advanced;
            end if;

            if initSlip <> InitSlip.TransRot then
              vSlipLong = v_slip_start_advanced[1];
              vSlipLat = v_slip_start_advanced[3];
            end if;

            if initSlip <> InitSlip.TransSlip then
              wRim = w_start_advanced;
            end if;

            if initSlip == InitSlip.RotSlip then
              vRim[2] = 0;
            end if;
          end if;
        end if;

        if initType == MB.Types.Init.VelocityAcceleration or initType == MB.Types.Init.
            PositionVelocityAcceleration then
          if useTransVelocities then
            aRim[1] = a_start[1];
            aRim[3] = a_start[3];
          else
            zRim = z_start;
          end if;
        end if;

        if initType == MB.Types.Init.SteadyState then
          wRim = zeros(3);
          zRim = zeros(3);
        end if;

      equation

        xCP = ContactPhysics.MBG2Mech1.x;
        xRim = Rim.rimMass.PotentialFBM1.x;
        vRim = Rim.rimMass.PotentialFBM1.v;
        aRim = Rim.rimMass.PotentialFBM1.a;
        phiRim = Rim.rimMass.PotentialFBM1.phi;
        phi_dRim = Rim.rimMass.PotentialFBM1.phi_d;
        wRim = Rim.rimMass.PotentialFBM1.w;
        zRim = Rim.rimMass.PotentialFBM1.z;
        QRim = Rim.rimMass.PotentialFBM1.Q;

        vSlipLong = Friction.v_Slip_Long;
        vSlipLat = Friction.v_Slip_Lat;

        eLong = Geometry.tireBus.UV.eLong;
        eLat = Geometry.tireBus.UV.eLat;
        eN = Geometry.tireBus.UV.eN;
        ePlane = Geometry.tireBus.UV.ePlane;

        connect(Rim.frame_b,TireHub)               annotation (points=[82,-40; 90,-40;
              90,0; 100,0],        style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(BeltDynamics.frame_b, Rim.frame_a)
                                               annotation (points=[32,-40; 38,-40],
            style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(Geometry.tireBus,ContactPhysics. tireBus)
                                                       annotation (points=[60,20;
              60,0; -82,0; -82,-20], style(
            color=42,
            rgbcolor={127,0,0},
            fillColor=7,
            rgbfillColor={255,255,255},
            fillPattern=1));
        connect(Geometry.tireBus, BeltDynamics.tireBus)
                                                    annotation (points=[60,20;
              60,0; 10,0; 10,-20],
                                 style(
            color=42,
            rgbcolor={127,0,0},
            fillColor=7,
            rgbfillColor={255,255,255},
            fillPattern=1));
        connect(Geometry.tireBus, Rim.tireBus) annotation (points=[60,20; 60,-20],
                          style(
            color=42,
            rgbcolor={127,0,0},
            fillColor=7,
            rgbfillColor={255,255,255},
            fillPattern=1));
        connect(ContactPhysics.frame_b, center2CP.frame_b)
                                                        annotation (points=[-48,-40;
              -38.8,-40],                                        style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(center2CP.frame_a, BeltDynamics.frame_a)
                                                     annotation (points=[-21.2,
              -40; -12,-40],                                  style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(center2CP.tireBus, Geometry.tireBus) annotation (points=[-30,-32;
              -30,0; 60,0; 60,20],                                         style(
              color=42, rgbcolor={127,0,0}));
        connect(Friction.tireBus, BeltDynamics.tireBus)
                                                    annotation (points=[-12,20;
              -12,0; 10,0; 10,-20], style(
            color=42,
            rgbcolor={127,0,0},
            fillColor=10,
            rgbfillColor={135,135,135},
            fillPattern=1));
        connect(VerticalDynamics.tireBus, ContactPhysics.tireBus)
                                                        annotation (points=[-82,20;
              -82,-20],     style(
            color=42,
            rgbcolor={127,0,0},
            fillColor=10,
            rgbfillColor={135,135,135},
            fillPattern=1));
        connect(VerticalDynamics.contactPhysics, ContactPhysics.Friction)
                                                                   annotation (
            points=[-58,20; -58,-20], style(
            color=58,
            rgbcolor={0,127,0},
            fillColor=9,
            rgbfillColor={175,175,175},
            fillPattern=1));
        connect(ContactPhysics.Friction, Friction.ContactPhysics) annotation (
            points=[-58,-20; -58,12; -32,12; -32,20], style(
            color=58,
            rgbcolor={0,127,0},
            fillColor=9,
            rgbfillColor={175,175,175},
            fillPattern=1));
      end Advanced;

      model Dynamic "slim tire with dynamic contact point"
        import MultiBondLib;
        import WheelsAndTires;
        import SI = Modelica.SIunits;
        import MB = Modelica.Mechanics.MultiBody;
        import WheelsAndTires.Tires.Commons.Types.InitSlip;

        extends WheelsAndTires.Tires.Commons.ParametersCommon;
        extends WheelsAndTires.Tires.Commons.ParametersAdvancedFriction;
        extends WheelsAndTires.TireComponents.Utilities.Icons.TireModel;

      // geometry
        parameter SI.Radius rWheel= 14*2.54e-2 "Radius of the wheel";
        parameter SI.Radius rRim = rWheel - height "The radius of the rim";
        parameter SI.Distance height = 4e-3
          "Height of the belt (just for visualization)";
        parameter Real cR(
          final unit="N/m",
          final min=0) = 1e6
          "Stiffness of the tire in normal direction to the surface"
           annotation(Dialog(tab="Elevation"));
        parameter Real dR(
          final unit="N/ (m/s)",
          final min=0) = 1e3 "Damping constant of the tire for normal speed"
           annotation(Dialog(tab="Elevation"));

      // contact point dynamics
        parameter Real cLong(
          final unit="N/m",
          final min=0) = 1e5
          "Longitudinal stiffness of the contact point dynamics"
           annotation(Dialog(tab="Dynamics"));
        parameter Real dLong(
          final unit="N/ (m/s)",
          final min=0) = 1e4
          "Longitudinal damping constant of the contact point dynamics"
           annotation(Dialog(tab="Dynamics"));
        parameter Real cLat(
          final unit="N/m",
          final min=0) = 1e5 "Lateral stiffness of the contact point dynamics"
           annotation(Dialog(tab="Dynamics"));
        parameter Real dLat(
          final unit="N/ (m/s)",
          final min=0) = 1e4
          "Lateral damping constant of the contact point dynamics"
            annotation(Dialog(tab="Dynamics"));
        parameter SI.Mass BeltMass = 1 "Mass of the contact point"
          annotation(Dialog(tab="Dynamics"));
        parameter Boolean visCPDynamics = false
          "Show the prismatic elements that realize the dynamic behaviour"
          annotation(Dialog(tab="Visualization", group="CPDynamics"));

      // initialization
        parameter MB.Types.Init.Temp initType=MB.Types.Init.Free
          "Type of initialization (defines usage of start values below)"
           annotation(Dialog(tab="Initialization"));
        parameter Boolean onSurface = true
          "true: the tire will be initialized to start on the surface"
           annotation(Dialog(tab="Initialization", enable=
            not (initType == MB.Types.Init.Position or
            initType == MB.Types.Init.PositionVelocity or
            initType == MB.Types.Init.PositionVelocityAcceleration)));
        parameter Boolean useTransVelocities = false
          "Use the translational velocities (defines usage of start values below), does not work with every starting angle"
           annotation(Dialog(tab="Initialization"));
        parameter SI.Position x_start[3] = {0,0,0}
          "Initial position of the contact point in the global coordinate system ([2] is used if possible)"
           annotation(Dialog(tab="Initialization"), enable = not onSurface);
        parameter SI.Velocity v_start[3] = {0,0,0}
          "Initial velocity in the global coordinate system (2nd is optional for models with non flat surfaces)"
           annotation(Dialog(tab="Initialization",enable=useTransVelocities));
        parameter SI.Acceleration a_start[3] = {0,0,0}
          "deactivated due to not possible initialization"
           annotation(Dialog(tab="Initialization",enable=false));
        parameter SI.Angle phi_start[3] = {0,0,0}
          "Initial angles in the world coordinate system"
           annotation(Dialog(tab="Initialization"));
        parameter SI.AngularVelocity w_start[3] = {0,0,0}
          "Initial angular velocity in the rim body coordinate system"
           annotation(Dialog(tab="Initialization",enable=not useTransVelocities));
        parameter SI.AngularAcceleration z_start[3] = {0,0,0}
          "deactivated due to not possible initialization"
           annotation(Dialog(tab="Initialization",enable=false));
        final parameter MultiBondLib.Mechanics3D.Types.Quaternion Q_start=
            MultiBondLib.Mechanics3D.Utilities.AxesRotQ(phi_start,
            sequence_angles) "Initial quaternion";
        final parameter MultiBondLib.Mechanics3D.Types.RotationSequence
          sequence_angles={2,1,3} "Sequence of the cardan angles" annotation(Dialog(tab="Advanced"));
        parameter Boolean enforceStates = false
          "Enforce cardan angles and w as states" annotation(Dialog(tab="Advanced"));
        parameter Boolean useQuaternions =  false
          "Use Quaternions instead of cardan angles" annotation(Dialog(tab="Advanced"));

        parameter Boolean useAdvancedInitialization = false
          "Enables setting manual setting of slip" annotation(Dialog(tab="Initialization", group="Advanced"));
        parameter WheelsAndTires.Tires.Commons.Types.InitSlip.Temp initSlip=
            WheelsAndTires.Tires.Commons.Types.InitSlip.RotSlip
          "The type of initialization for velocities and slip"
          annotation(Dialog(tab="Initialization", group="Advanced", enable = useAdvancedInitialization));
        parameter SI.Velocity v_start_advanced[3] = {0,0,0}
          "Initial velocity in the global coordinate system (2nd is optional for models with non flat surfaces)"
           annotation(Dialog(tab="Initialization", group="Advanced", enable = (initSlip <> InitSlip.RotSlip) and useAdvancedInitialization));
        parameter SI.AngularVelocity w_start_advanced[3] = {0,0,0}
          "Initial angular velocity in the rim body coordinate system"
           annotation(Dialog(tab="Initialization", group="Advanced", enable = (initSlip <> InitSlip.TransSlip) and useAdvancedInitialization));
        parameter SI.Velocity v_slip_start_advanced[3] = {0,0,0}
          "Initial velocity in the global coordinate system (2nd value is ignored)"
           annotation(Dialog(tab="Initialization", group="Advanced", enable = (initSlip <> InitSlip.TransRot) and useAdvancedInitialization));

      // variables used for initialization
        SI.Position xCP[3] "Position of the contact point frame";
        SI.Position xRim[3] "Position of the rim frame";
        SI.Velocity vRim[3] "Velocity of the rim frame";
        SI.Acceleration aRim[3] "Acceleration of the rim frame";
        SI.Angle phiRim[3](stateSelect=if not useQuaternions then (if enforceStates then
                        StateSelect.always else StateSelect.prefer) else  StateSelect.never)
          "cardan angles of the rim Frame";
        SI.Angle phi_dRim[3](stateSelect=if not useQuaternions then (if enforceStates then
                        StateSelect.always else StateSelect.prefer) else  StateSelect.never)
          "cardan angles derivatives of the Rim Frame";
        SI.AngularVelocity wRim[3](stateSelect=if useQuaternions then (if enforceStates then
                        StateSelect.always else StateSelect.prefer) else  StateSelect.default)
          "angular velocity of the Rim Frame";
        SI.AngularAcceleration zRim[3] "angular acceleration of the Rim";
        MultiBondLib.Mechanics3D.Types.Quaternion QRim(
          stateSelect=if useQuaternions then StateSelect.prefer else StateSelect.never,
          start=Q_start,
          fixed=false) "quaternions";

        SI.Velocity vSlipLong "Longitudinal slip velocity";
        SI.Velocity vSlipLat "Lateral slip velocity";

        WheelsAndTires.TireComponents.ContactPhysics.ContactBondWithDynamics
          ContactPhysics(
          visForcesEnabled=visForcesEnabled,
          forceScaling=forceScaling,
          arrowColor=arrowColor,
          arrowDiameter=arrowDiameter,
          cLong=cLong,
          dLong=dLong,
          cLat=cLat,
          dLat=dLat)
          annotation (extent=[-90,-60; -50,-20]);

        WheelsAndTires.TireComponents.Friction.AdvancedFriction Friction(
          vRotMin=vRotMin,
          vLongMin=vLongMin,
          fR0=fR0,
          rWheel=rWheel,
          vLongAdhesion=vLongAdhesion,
          vLongSlide=vLongSlide,
          sLongAdhesion=sLongAdhesion,
          sLongSlide=sLongSlide,
          muLongMaxN=muLongMaxN,
          muLongMinN=muLongMinN,
          vLatAdhesion=vLatAdhesion,
          vLatSlide=vLatSlide,
          sLatAdhesion=sLatAdhesion,
          sLatSlide=sLatSlide,
          muLatMaxN=muLatMaxN,
          muLatMinN=muLatMinN,
          muN=muN,
          mu2N=mu2N,
          fNNominal=fNNominal,
          fR1=fR1,
          fR4=fR4,
          muTurn=muTurn,
          camberGain=camberGain,
          cR=cR)
          annotation (extent=[-40,20; 0,60]);

        WheelsAndTires.TireComponents.Rim.SpokedRim Rim(
          rRim=rRim,
          bRim=5*height,
          mRim=mRim,
          height=height/2,
          I_11=I_11,
          I_22=I_22,
          I_33=I_33,
          I_21=I_21,
          I_31=I_31,
          I_32=I_32,
          visRimEnabled=visRimEnabled,
          rimRodColor=rimRodColor,
          rimSpecularCoefficient=rimSpecularCoefficient)
          annotation (extent=[40,-60; 80,-20]);

        MultiBondLib.Mechanics3D.Interfaces.Frame_a TireHub
          "connection to the superordinate vehicle model"
          annotation (extent=[90,-10; 110,10]);

        WheelsAndTires.TireComponents.BeltDynamics.RigidBelt BeltDynamics
          annotation (extent=[-10,-60; 30,-20]);

        WheelsAndTires.TireComponents.Geometry.FlatDisc Geometry(
          rRim=rRim,
          width=5*height,
          height=height,
          visBeltEnabled=visBeltEnabled,
          beltColor=beltColor,
          beltSpecularCoefficient=beltSpecularCoefficient,
          visContactPointEnabled=visContactPointEnabled,
          contactColor=contactColor,
          contactPointSize=contactPointSize)
          annotation (extent=[40,20; 80,60]);
        WheelsAndTires.TireComponents.Center2ContactPoint.Center2CPBond
          center2CP(
          visCenter2CPEnabled=visCenter2CPEnabled,
          center2CPColor=center2CPColor)
          annotation (extent=[-22,-48; -38,-32],
                                             rotation=0);
        WheelsAndTires.TireComponents.VerticalDynamics.ElastoElevation
          VerticalDynamics(cR=cR, dR=dR)
          annotation (extent=[-90,20; -50,60]);

      protected
        outer WheelsAndTires.Environment.Surface Surface;
        Real eLong[3];
        Real eLat[3];
        Real eN[3];
        Real ePlane[3];
        annotation (Diagram,
          experiment(
            StopTime=10,
            NumberOfIntervals=1000,
            Tolerance=1e-006),
          experimentSetupOutput,
          Icon(
            Text(
              extent=[0,-100; 0,-80],
              style(color=10, rgbcolor={135,135,135}),
              string="Slim Dynamic")),
          Coordsys(extent=[-100,-100; 100,100], scale=0.2),
          Documentation(info="<html>

For further information see the documentation of the used models and section <a href=\"Modelica://WheelsAndTires.UsersGuide.Tires\">Provided Tire Models</a> of the <a href=\"Modelica://WheelsAndTires.UsersGuide\">User's Guide</a>.

</html>"));

      initial equation

        if onSurface and not (initType == MB.Types.Init.Position or
            initType == MB.Types.Init.PositionVelocity or
            initType == MB.Types.Init.PositionVelocityAcceleration) then
          xCP[2] = Surface.get_elevation((xRim[1] - Geometry.r_CP*ePlane), (xRim[3] - Geometry.r_CP*ePlane));
        end if; // to initialize the tire on the surface not with xRim[2] = 0;

        if initType == MB.Types.Init.Position or initType == MB.Types.Init.
            PositionVelocity or initType == MB.Types.Init.PositionVelocityAcceleration then
            xCP[1] = x_start[1];
            xCP[3] = x_start[3];
            if not Surface.FlatSurface then
              xRim[2] = x_start[2] - Geometry.r_CP * eN;
            else
              xCP[2] = 0;
            end if;
          if useQuaternions then
            QRim[1:3] = Q_start[1:3];
          else
            phiRim = phi_start;
          end if;
        end if;

        if initType == MB.Types.Init.PositionVelocity or initType == MB.Types.Init.
          PositionVelocityAcceleration or initType == MB.Types.Init.Velocity or
          initType == MB.Types.Init.VelocityAcceleration then

          if not useAdvancedInitialization then
            if useTransVelocities then
              vRim = v_start;
            else
              wRim = w_start;
              vRim[2] = 0;
            end if;

          else
            if initSlip <> InitSlip.RotSlip then
              vRim = v_start_advanced;
            end if;

            if initSlip <> InitSlip.TransRot then
              vSlipLong = v_slip_start_advanced[1];
              vSlipLat = v_slip_start_advanced[3];
            end if;

            if initSlip <> InitSlip.TransSlip then
              wRim = w_start_advanced;
            end if;

            if initSlip == InitSlip.RotSlip then
              vRim[2] = 0;
            end if;
          end if;
        end if;

        if initType == MB.Types.Init.VelocityAcceleration or initType == MB.Types.Init.
            PositionVelocityAcceleration then
          if useTransVelocities then
            aRim[1] = a_start[1];
            aRim[3] = a_start[3];
          else
            zRim = z_start;
          end if;
        end if;

        if initType == MB.Types.Init.SteadyState then
          wRim = zeros(3);
          zRim = zeros(3);
        end if;

      equation

        xCP = ContactPhysics.MBG2Mech1.x;
        xRim = Rim.rimMass.PotentialFBM1.x;
        vRim = Rim.rimMass.PotentialFBM1.v;
        aRim = Rim.rimMass.PotentialFBM1.a;
        phiRim = Rim.rimMass.PotentialFBM1.phi;
        phi_dRim = Rim.rimMass.PotentialFBM1.phi_d;
        wRim = Rim.rimMass.PotentialFBM1.w;
        zRim = Rim.rimMass.PotentialFBM1.z;
        QRim = Rim.rimMass.PotentialFBM1.Q;

        vSlipLong = Friction.v_Slip_Long;
        vSlipLat = Friction.v_Slip_Lat;

        eLong = Geometry.tireBus.UV.eLong;
        eLat = Geometry.tireBus.UV.eLat;
        eN = Geometry.tireBus.UV.eN;
        ePlane = Geometry.tireBus.UV.ePlane;

        connect(Rim.frame_b,TireHub)               annotation (points=[82,-40; 90,-40;
              90,0; 100,0],        style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(BeltDynamics.frame_b, Rim.frame_a)
                                               annotation (points=[32,-40; 38,-40],
            style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(Geometry.tireBus,ContactPhysics. tireBus)
                                                       annotation (points=[60,20;
              60,0; -82,0; -82,-20], style(
            color=42,
            rgbcolor={127,0,0},
            fillColor=7,
            rgbfillColor={255,255,255},
            fillPattern=1));
        connect(Geometry.tireBus, BeltDynamics.tireBus)
                                                    annotation (points=[60,20;
              60,0; 10,0; 10,-20],
                                 style(
            color=42,
            rgbcolor={127,0,0},
            fillColor=7,
            rgbfillColor={255,255,255},
            fillPattern=1));
        connect(Geometry.tireBus, Rim.tireBus) annotation (points=[60,20; 60,-20],
                          style(
            color=42,
            rgbcolor={127,0,0},
            fillColor=7,
            rgbfillColor={255,255,255},
            fillPattern=1));
        connect(ContactPhysics.frame_b, center2CP.frame_b)
                                                        annotation (points=[-48,-40;
              -38.8,-40],                                        style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(center2CP.frame_a, BeltDynamics.frame_a)
                                                     annotation (points=[-21.2,
              -40; -12,-40],                                  style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(center2CP.tireBus, Geometry.tireBus) annotation (points=[-30,-32;
              -30,0; 60,0; 60,20],                                         style(
              color=42, rgbcolor={127,0,0}));
        connect(Friction.tireBus, BeltDynamics.tireBus)
                                                    annotation (points=[-12,20;
              -12,0; 10,0; 10,-20], style(
            color=42,
            rgbcolor={127,0,0},
            fillColor=10,
            rgbfillColor={135,135,135},
            fillPattern=1));
        connect(VerticalDynamics.tireBus, ContactPhysics.tireBus)
                                                        annotation (points=[-82,20;
              -82,-20],     style(
            color=42,
            rgbcolor={127,0,0},
            fillColor=10,
            rgbfillColor={135,135,135},
            fillPattern=1));
        connect(VerticalDynamics.contactPhysics, ContactPhysics.Friction)
                                                                   annotation (
            points=[-58,20; -58,-20], style(
            color=58,
            rgbcolor={0,127,0},
            fillColor=9,
            rgbfillColor={175,175,175},
            fillPattern=1));
        connect(ContactPhysics.Friction, Friction.ContactPhysics) annotation (
            points=[-58,-20; -58,12; -32,12; -32,20], style(
            color=58,
            rgbcolor={0,127,0},
            fillColor=9,
            rgbfillColor={175,175,175},
            fillPattern=1));
      end Dynamic;
      annotation (Icon, Documentation(info="<html>

This package contains ideally slim tires. For further information see the documentation of the used models and section [<a href=\"Modelica://WheelsAndTires.UsersGuide.Tires\">Provided Tire Models</a>] of the [<a href=\"Modelica://WheelsAndTires.UsersGuide\">User's Guide</a>]

</html>"));
    end Slim;

    package Circular "contains tires with semi-circular cross-section"
      annotation(preferedView="info");

    extends WheelsAndTires.TireComponents.Utilities.Icons.TirePackage;

      model Advanced "rigid circular tire with the advance friction model"

        import MultiBondLib;
        import WheelsAndTires;
        import SI = Modelica.SIunits;
        import MB = Modelica.Mechanics.MultiBody;
        import WheelsAndTires.Tires.Commons.Types.InitSlip;

        extends WheelsAndTires.Tires.Commons.ParametersCommon;
        extends WheelsAndTires.Tires.Commons.ParametersAdvancedFriction;
        extends WheelsAndTires.TireComponents.Utilities.Icons.TireModel;

      // geometry
        parameter SI.Radius rWheel= 14*2.54e-2 "Radius of the wheel";
        final parameter SI.Radius rRim =       rWheel - height
          "The radius of the rim";
        parameter SI.Distance height = 50e-3 "Height of the belt";

      // elevation
        parameter Real cR(
          final unit="N/m",
          final min=0) = 1e6
          "Stiffness of the tire in normal direction to the surface" annotation(Dialog(tab="Elevation"));
        parameter Real dR(
          final unit="N/ (m/s)",
          final min=0) = 1e4 "Damping constant of the tire for normal speed" annotation(Dialog(tab="Elevation"));

      // initialization
        parameter MB.Types.Init.Temp initType=MB.Types.Init.Free
          "Type of initialization (defines usage of start values below)" annotation(Dialog(tab="Initialization"));
        parameter Boolean onSurface = true
          "true: the tire will be initialized to start on the surface"
           annotation(Dialog(tab="Initialization", enable=
            not (initType == MB.Types.Init.Position or
            initType == MB.Types.Init.PositionVelocity or
            initType == MB.Types.Init.PositionVelocityAcceleration)));
        parameter Boolean useTransVelocities = false
          "Use the translational velocities (defines usage of start values below), does not work with every starting angle"
           annotation(Dialog(tab="Initialization"));
        parameter SI.Position x_start[3] = {0,0,0}
          "Initial position of the contact point in the global coordinate system ([2] is used if possible)"
           annotation(Dialog(tab="Initialization"), enable = not onSurface);
        parameter SI.Velocity v_start[3] = {0,0,0}
          "Initial velocity in the global coordinate system (2nd is optional for models with non flat surfaces)"
           annotation(Dialog(tab="Initialization",enable=useTransVelocities));
        parameter SI.Acceleration a_start[3] = {0,0,0}
          "deactivated due to not possible initialization"
           annotation(Dialog(tab="Initialization",enable=false));
        parameter SI.Angle phi_start[3] = {0,0,0}
          "Initial angles in the world coordinate system"
           annotation(Dialog(tab="Initialization"));
        parameter SI.AngularVelocity w_start[3] = {0,0,0}
          "Initial angular velocity in the rim body coordinate system"
           annotation(Dialog(tab="Initialization",enable=not useTransVelocities));
        parameter SI.AngularAcceleration z_start[3] = {0,0,0}
          "deactivated due to not possible initialization"
           annotation(Dialog(tab="Initialization",enable=false));
        final parameter MultiBondLib.Mechanics3D.Types.Quaternion Q_start=
            MultiBondLib.Mechanics3D.Utilities.AxesRotQ(phi_start,
            sequence_angles) "Initial quaternion";
        final parameter MultiBondLib.Mechanics3D.Types.RotationSequence
          sequence_angles={2,1,3} "Sequence of the cardan angles" annotation(Dialog(tab="Advanced"));
        parameter Boolean enforceStates = false
          "Enforce cardan angles and w as states" annotation(Dialog(tab="Advanced"));
        parameter Boolean useQuaternions =  false
          "Use Quaternions instead of cardan angles" annotation(Dialog(tab="Advanced"));

        parameter Boolean useAdvancedInitialization = false
          "Enables setting manual setting of slip" annotation(Dialog(tab="Initialization", group="Advanced"));
        parameter WheelsAndTires.Tires.Commons.Types.InitSlip.Temp initSlip=
            WheelsAndTires.Tires.Commons.Types.InitSlip.RotSlip
          "The type of initialization for velocities and slip"
          annotation(Dialog(tab="Initialization", group="Advanced", enable = useAdvancedInitialization));
        parameter SI.Velocity v_start_advanced[3] = {0,0,0}
          "Initial velocity in the global coordinate system (2nd is optional for models with non flat surfaces)"
           annotation(Dialog(tab="Initialization", group="Advanced", enable = (initSlip <> InitSlip.RotSlip) and useAdvancedInitialization));
        parameter SI.AngularVelocity w_start_advanced[3] = {0,0,0}
          "Initial angular velocity in the rim body coordinate system"
           annotation(Dialog(tab="Initialization", group="Advanced", enable = (initSlip <> InitSlip.TransSlip) and useAdvancedInitialization));
        parameter SI.Velocity v_slip_start_advanced[3] = {0,0,0}
          "Initial velocity in the global coordinate system (2nd value is ignored)"
           annotation(Dialog(tab="Initialization", group="Advanced", enable = (initSlip <> InitSlip.TransRot) and useAdvancedInitialization));

      // variables used for initialization
        SI.Position xCP[3] "Position of the contact point frame";
        SI.Position xRim[3] "Position of the rim frame";
        SI.Velocity vRim[3] "Velocity of the rim frame";
        SI.Acceleration aRim[3] "Acceleration of the rim frame";
        SI.Angle phiRim[3](stateSelect=if not useQuaternions then (if enforceStates then
                        StateSelect.always else StateSelect.prefer) else  StateSelect.never)
          "cardan angles of the rim Frame";
        SI.Angle phi_dRim[3](stateSelect=if not useQuaternions then (if enforceStates then
                        StateSelect.always else StateSelect.prefer) else  StateSelect.never)
          "cardan angles derivatives of the Rim Frame";
        SI.AngularVelocity wRim[3](stateSelect=if useQuaternions then (if enforceStates then
                        StateSelect.always else StateSelect.prefer) else  StateSelect.default)
          "angular velocity of the Rim Frame";
        SI.AngularAcceleration zRim[3] "angular acceleration of the Rim";
        MultiBondLib.Mechanics3D.Types.Quaternion QRim(
          stateSelect=if useQuaternions then StateSelect.prefer else StateSelect.never,
          start=Q_start,
          fixed=false) "quaternions";

        SI.Velocity vSlipLong "Longitudinal slip velocity";
        SI.Velocity vSlipLat "Lateral slip velocity";

        WheelsAndTires.TireComponents.ContactPhysics.ContactBondNoDynamics
          ContactPhysics(
          visForcesEnabled=visForcesEnabled,
          forceScaling=forceScaling,
          arrowColor=arrowColor,
          arrowDiameter=arrowDiameter)
          annotation (extent=[-90,-60; -50,-20]);

        WheelsAndTires.TireComponents.Friction.AdvancedFriction Friction(
          vRotMin=vRotMin,
          vLongMin=vLongMin,
          fR0=fR0,
          rWheel=rWheel,
          vLongAdhesion=vLongAdhesion,
          vLongSlide=vLongSlide,
          sLongAdhesion=sLongAdhesion,
          sLongSlide=sLongSlide,
          muLongMaxN=muLongMaxN,
          muLongMinN=muLongMinN,
          vLatAdhesion=vLatAdhesion,
          vLatSlide=vLatSlide,
          sLatAdhesion=sLatAdhesion,
          sLatSlide=sLatSlide,
          muLatMaxN=muLatMaxN,
          muLatMinN=muLatMinN,
          muN=muN,
          mu2N=mu2N,
          fNNominal=fNNominal,
          fR1=fR1,
          fR4=fR4,
          muTurn=muTurn,
          camberGain=camberGain,
          cR=cR)
          annotation (extent=[-40,20; 0,60]);

        WheelsAndTires.TireComponents.Rim.SpokedRim Rim(
          rRim=rRim,
          bRim=2*height,
          mRim=mRim,
          height=height/2,
          I_11=I_11,
          I_22=I_22,
          I_33=I_33,
          I_21=I_21,
          I_31=I_31,
          I_32=I_32,
          visRimEnabled=visRimEnabled,
          rimRodColor=rimRodColor,
          rimSpecularCoefficient=rimSpecularCoefficient)
          annotation (extent=[40,-60; 80,-20]);

        MultiBondLib.Mechanics3D.Interfaces.Frame_a TireHub
          "connection to the superordinate vehicle model"
          annotation (extent=[90,-10; 110,10]);

        WheelsAndTires.TireComponents.BeltDynamics.RigidBelt BeltDynamics
          annotation (extent=[-10,-60; 30,-20]);

        WheelsAndTires.TireComponents.Geometry.CircularTire Geometry(
          rRim=rRim,
          height=height,
          visBeltEnabled=visBeltEnabled,
          beltColor=beltColor,
          beltSpecularCoefficient=beltSpecularCoefficient,
          visContactPointEnabled=visContactPointEnabled,
          contactColor=contactColor,
          contactPointSize=contactPointSize)
          annotation (extent=[40,20; 80,60]);
        WheelsAndTires.TireComponents.Center2ContactPoint.Center2CPBond
          center2CP(
          visCenter2CPEnabled=visCenter2CPEnabled,
          center2CPColor=center2CPColor)
          annotation (extent=[-22,-48; -38,-32],
                                             rotation=0);
        WheelsAndTires.TireComponents.VerticalDynamics.ElastoElevation
          VerticalDynamics(cR=cR, dR=dR)
          annotation (extent=[-90,20; -50,60]);

      protected
        outer WheelsAndTires.Environment.Surface Surface;
        Real eLong[3];
        Real eLat[3];
        Real eN[3];
        Real ePlane[3];
        annotation (Diagram,
          experiment(
            StopTime=10,
            NumberOfIntervals=1000,
            Tolerance=1e-006),
          experimentSetupOutput,
          Icon(
            Text(
              extent=[0,-100; 0,-80],
              style(color=10, rgbcolor={135,135,135}),
              string="Circular Advanced")),
          Coordsys(extent=[-100,-100; 100,100], scale=0.2),
          Documentation(info="<html>

For further information see the documentation of the used models and section <a href=\"Modelica://WheelsAndTires.UsersGuide.Tires\">Provided Tire Models</a> of the <a href=\"Modelica://WheelsAndTires.UsersGuide\">User's Guide</a>.

</html>"));

      initial equation

        if onSurface and not (initType == MB.Types.Init.Position or
            initType == MB.Types.Init.PositionVelocity or
            initType == MB.Types.Init.PositionVelocityAcceleration) then
          xCP[2] = Surface.get_elevation((xRim[1] - Geometry.r_CP*ePlane), (xRim[3] - Geometry.r_CP*ePlane));
        end if; // to initialize the tire on the surface not with xRim[2] = 0;

        if initType == MB.Types.Init.Position or initType == MB.Types.Init.
            PositionVelocity or initType == MB.Types.Init.PositionVelocityAcceleration then
            xCP[1] = x_start[1];
            xCP[3] = x_start[3];
            if not Surface.FlatSurface then
              xRim[2] = x_start[2] - Geometry.r_CP * eN;
            else
              xCP[2] = 0;
            end if;
          if useQuaternions then
            QRim[1:3] = Q_start[1:3];
          else
            phiRim = phi_start;
          end if;
        end if;

        if initType == MB.Types.Init.PositionVelocity or initType == MB.Types.Init.
          PositionVelocityAcceleration or initType == MB.Types.Init.Velocity or
          initType == MB.Types.Init.VelocityAcceleration then

          if not useAdvancedInitialization then
            if useTransVelocities then
              vRim = v_start;
            else
              wRim = w_start;
              vRim[2] = 0;
            end if;

          else
            if initSlip <> InitSlip.RotSlip then
              vRim = v_start_advanced;
            end if;

            if initSlip <> InitSlip.TransRot then
              vSlipLong = v_slip_start_advanced[1];
              vSlipLat = v_slip_start_advanced[3];
            end if;

            if initSlip <> InitSlip.TransSlip then
              wRim = w_start_advanced;
            end if;

            if initSlip == InitSlip.RotSlip then
              vRim[2] = 0;
            end if;
          end if;
        end if;

        if initType == MB.Types.Init.VelocityAcceleration or initType == MB.Types.Init.
            PositionVelocityAcceleration then
          if useTransVelocities then
            aRim[1] = a_start[1];
            aRim[3] = a_start[3];
          else
            zRim = z_start;
          end if;
        end if;

        if initType == MB.Types.Init.SteadyState then
          wRim = zeros(3);
          zRim = zeros(3);
        end if;

      equation

        xCP = ContactPhysics.MBG2Mech1.x;
        xRim = Rim.rimMass.PotentialFBM1.x;
        vRim = Rim.rimMass.PotentialFBM1.v;
        aRim = Rim.rimMass.PotentialFBM1.a;
        phiRim = Rim.rimMass.PotentialFBM1.phi;
        phi_dRim = Rim.rimMass.PotentialFBM1.phi_d;
        wRim = Rim.rimMass.PotentialFBM1.w;
        zRim = Rim.rimMass.PotentialFBM1.z;
        QRim = Rim.rimMass.PotentialFBM1.Q;

        vSlipLong = Friction.v_Slip_Long;
        vSlipLat = Friction.v_Slip_Lat;

        eLong = Geometry.tireBus.UV.eLong;
        eLat = Geometry.tireBus.UV.eLat;
        eN = Geometry.tireBus.UV.eN;
        ePlane = Geometry.tireBus.UV.ePlane;

        connect(Rim.frame_b,TireHub)               annotation (points=[82,-40; 90,-40;
              90,0; 100,0],        style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(BeltDynamics.frame_b, Rim.frame_a)
                                               annotation (points=[32,-40; 38,-40],
            style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(Geometry.tireBus,ContactPhysics. tireBus)
                                                       annotation (points=[60,20;
              60,0; -82,0; -82,-20], style(
            color=42,
            rgbcolor={127,0,0},
            fillColor=7,
            rgbfillColor={255,255,255},
            fillPattern=1));
        connect(Geometry.tireBus, BeltDynamics.tireBus)
                                                    annotation (points=[60,20; 60,0;
              10,0; 10,-20],     style(
            color=42,
            rgbcolor={127,0,0},
            fillColor=7,
            rgbfillColor={255,255,255},
            fillPattern=1));
        connect(Geometry.tireBus, Rim.tireBus) annotation (points=[60,20; 60,-20],
                          style(
            color=42,
            rgbcolor={127,0,0},
            fillColor=7,
            rgbfillColor={255,255,255},
            fillPattern=1));
        connect(ContactPhysics.frame_b, center2CP.frame_b)
                                                        annotation (points=[-48,-40;
              -38.8,-40],                                        style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(center2CP.frame_a, BeltDynamics.frame_a)
                                                     annotation (points=[-21.2,
              -40; -12,-40],                                  style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(center2CP.tireBus, Geometry.tireBus) annotation (points=[-30,-32;
              -30,0; 60,0; 60,20],                                         style(
              color=42, rgbcolor={127,0,0}));
        connect(Friction.tireBus, BeltDynamics.tireBus)
                                                    annotation (points=[-12,20; -12,0;
              10,0; 10,-20],        style(
            color=42,
            rgbcolor={127,0,0},
            fillColor=10,
            rgbfillColor={135,135,135},
            fillPattern=1));
        connect(VerticalDynamics.tireBus, ContactPhysics.tireBus)
                                                        annotation (points=[-82,20;
              -82,-20],     style(
            color=42,
            rgbcolor={127,0,0},
            fillColor=10,
            rgbfillColor={135,135,135},
            fillPattern=1));
        connect(VerticalDynamics.contactPhysics, ContactPhysics.Friction)
                                                                   annotation (
            points=[-58,20; -58,-20], style(
            color=58,
            rgbcolor={0,127,0},
            fillColor=9,
            rgbfillColor={175,175,175},
            fillPattern=1));
        connect(ContactPhysics.Friction, Friction.ContactPhysics) annotation (
            points=[-58,-20; -58,12; -32,12; -32,20], style(
            color=58,
            rgbcolor={0,127,0},
            fillColor=9,
            rgbfillColor={175,175,175},
            fillPattern=1));
      end Advanced;

      model Dynamic
        "dynamic model with a rotational degree of freedom around the tire axis and the advanced friction"
        import MultiBondLib;
        import WheelsAndTires;
        import SI = Modelica.SIunits;
        import MB = Modelica.Mechanics.MultiBody;
        import WheelsAndTires.Tires.Commons.Types.InitSlip;

        extends WheelsAndTires.Tires.Commons.ParametersCommon;
        extends WheelsAndTires.Tires.Commons.ParametersAdvancedFriction;
        extends WheelsAndTires.TireComponents.Utilities.Icons.TireModel;

      // geometry
        parameter SI.Radius rWheel= 14*2.54e-2 "Radius of the wheel";
        final parameter SI.Radius rRim = rWheel - height
          "The radius of the rim";
        parameter SI.Distance height = 50e-3 "Height of the belt";

      // elevation
        parameter Real cR(
          final unit="N/m",
          final min=0) = 1e6
          "Stiffness of the tire in normal direction to the surface" annotation(Dialog(tab="Elevation"));
        parameter Real dR(
          final unit="N/ (m/s)",
          final min=0) = 1e3 "Damping constant of the tire for normal speed" annotation(Dialog(tab="Elevation"));

      // dynamics
        parameter Real cBelt(final unit="N.m/rad", final min=0) = 2e5
          "Spring constant of the torsion belt"
         annotation(Dialog(tab="Dynamics"));
        parameter Real dBelt(final unit="N.m.s/rad", final min=0) = 1e3
          "Damping constant of the torsion belt"
         annotation(Dialog(tab="Dynamics"));
        parameter SI.Inertia IBelt = 1 "Belt inertia around it's spinning axis";

      // initialization
        parameter MB.Types.Init.Temp initType=MB.Types.Init.Free
          "Type of initialization (defines usage of start values below)" annotation(Dialog(tab="Initialization"));
        parameter Boolean onSurface = true
          "true: the tire will be initialized to start on the surface"
           annotation(Dialog(tab="Initialization", enable=
            not (initType == MB.Types.Init.Position or
            initType == MB.Types.Init.PositionVelocity or
            initType == MB.Types.Init.PositionVelocityAcceleration)));
        parameter Boolean useTransVelocities = false
          "Use the translational velocities (defines usage of start values below), does not work with every starting angle"
           annotation(Dialog(tab="Initialization"));
        parameter SI.Position x_start[3] = {0,0,0}
          "Initial position of the contact point in the global coordinate system ([2] is used if possible)"
           annotation(Dialog(tab="Initialization"), enable = not onSurface);
        parameter SI.Velocity v_start[3] = {0,0,0}
          "Initial velocity in the global coordinate system (2nd is optional for models with non flat surfaces)"
           annotation(Dialog(tab="Initialization",enable=useTransVelocities));
        parameter SI.Acceleration a_start[3] = {0,0,0}
          "deactivated due to not possible initialization"
           annotation(Dialog(tab="Initialization",enable=false));
        parameter SI.Angle phi_start[3] = {0,0,0}
          "Initial angles in the world coordinate system"
           annotation(Dialog(tab="Initialization"));
        parameter SI.AngularVelocity w_start[3] = {0,0,0}
          "Initial angular velocity in the rim body coordinate system"
           annotation(Dialog(tab="Initialization",enable=not useTransVelocities));
        parameter SI.AngularAcceleration z_start[3] = {0,0,0}
          "deactivated due to not possible initialization"
           annotation(Dialog(tab="Initialization",enable=false));
        final parameter MultiBondLib.Mechanics3D.Types.Quaternion Q_start=
            MultiBondLib.Mechanics3D.Utilities.AxesRotQ(phi_start,
            sequence_angles) "Initial quaternion";
        final parameter MultiBondLib.Mechanics3D.Types.RotationSequence
          sequence_angles={2,1,3} "Sequence of the cardan angles" annotation(Dialog(tab="Advanced"));
        parameter Boolean enforceStates = false
          "Enforce cardan angles and w as states" annotation(Dialog(tab="Advanced"));
        parameter Boolean useQuaternions =  false
          "Use Quaternions instead of cardan angles" annotation(Dialog(tab="Advanced"));

        parameter Boolean useAdvancedInitialization = false
          "Enables setting manual setting of slip" annotation(Dialog(tab="Initialization", group="Advanced"));
        parameter WheelsAndTires.Tires.Commons.Types.InitSlip.Temp initSlip=
            WheelsAndTires.Tires.Commons.Types.InitSlip.RotSlip
          "The type of initialization for velocities and slip"
          annotation(Dialog(tab="Initialization", group="Advanced", enable = useAdvancedInitialization));
        parameter SI.Velocity v_start_advanced[3] = {0,0,0}
          "Initial velocity in the global coordinate system (2nd is optional for models with non flat surfaces)"
           annotation(Dialog(tab="Initialization", group="Advanced", enable = (initSlip <> InitSlip.RotSlip) and useAdvancedInitialization));
        parameter SI.AngularVelocity w_start_advanced[3] = {0,0,0}
          "Initial angular velocity in the rim body coordinate system"
           annotation(Dialog(tab="Initialization", group="Advanced", enable = (initSlip <> InitSlip.TransSlip) and useAdvancedInitialization));
        parameter SI.Velocity v_slip_start_advanced[3] = {0,0,0}
          "Initial velocity in the global coordinate system (2nd value is ignored)"
           annotation(Dialog(tab="Initialization", group="Advanced", enable = (initSlip <> InitSlip.TransRot) and useAdvancedInitialization));

      // variables used for initialization
        SI.Position xCP[3] "Position of the contact point frame";
        SI.Position xRim[3] "Position of the rim frame";
        SI.Velocity vRim[3] "Velocity of the rim frame";
        SI.Acceleration aRim[3] "Acceleration of the rim frame";
        SI.Angle phiRim[3](stateSelect=if not useQuaternions then (if enforceStates then
                        StateSelect.always else StateSelect.prefer) else  StateSelect.never)
          "cardan angles of the rim Frame";
        SI.Angle phi_dRim[3](stateSelect=if not useQuaternions then (if enforceStates then
                        StateSelect.always else StateSelect.prefer) else  StateSelect.never)
          "cardan angles derivatives of the Rim Frame";
        SI.AngularVelocity wRim[3](stateSelect=if useQuaternions then (if enforceStates then
                        StateSelect.always else StateSelect.prefer) else  StateSelect.default)
          "angular velocity of the Rim Frame";
        SI.AngularAcceleration zRim[3] "angular acceleration of the Rim";
        MultiBondLib.Mechanics3D.Types.Quaternion QRim(
          stateSelect=if useQuaternions then StateSelect.prefer else StateSelect.never,
          start=Q_start,
          fixed=false) "quaternions";

        SI.Velocity vSlipLong "Longitudinal slip velocity";
        SI.Velocity vSlipLat "Lateral slip velocity";

        WheelsAndTires.TireComponents.ContactPhysics.ContactBondNoDynamics
          ContactPhysics(
          visForcesEnabled=visForcesEnabled,
          forceScaling=forceScaling,
          arrowColor=arrowColor,
          arrowDiameter=arrowDiameter)
          annotation (extent=[-90,-60; -50,-20]);

        WheelsAndTires.TireComponents.Friction.AdvancedFriction Friction(
          vRotMin=vRotMin,
          vLongMin=vLongMin,
          fR0=fR0,
          rWheel=rWheel,
          vLongAdhesion=vLongAdhesion,
          vLongSlide=vLongSlide,
          sLongAdhesion=sLongAdhesion,
          sLongSlide=sLongSlide,
          muLongMaxN=muLongMaxN,
          muLongMinN=muLongMinN,
          vLatAdhesion=vLatAdhesion,
          vLatSlide=vLatSlide,
          sLatAdhesion=sLatAdhesion,
          sLatSlide=sLatSlide,
          muLatMaxN=muLatMaxN,
          muLatMinN=muLatMinN,
          muN=muN,
          mu2N=mu2N,
          fNNominal=fNNominal,
          fR1=fR1,
          fR4=fR4,
          muTurn=muTurn,
          camberGain=camberGain,
          cR=cR)
          annotation (extent=[-40,20; 0,60]);

        WheelsAndTires.TireComponents.Rim.SpokedRim Rim(
          rRim=rRim,
          bRim=2*height,
          mRim=mRim,
          height=height/2,
          I_11=I_11,
          I_22=I_22,
          I_33=I_33,
          I_21=I_21,
          I_31=I_31,
          I_32=I_32,
          visRimEnabled=visRimEnabled,
          rimRodColor=rimRodColor,
          rimSpecularCoefficient=rimSpecularCoefficient)
          annotation (extent=[40,-60; 80,-20]);

        MultiBondLib.Mechanics3D.Interfaces.Frame_a TireHub
          "connection to the superordinate vehicle model"
          annotation (extent=[90,-10; 110,10]);

        WheelsAndTires.TireComponents.BeltDynamics.TorsionBelt BeltDynamics(
          cBelt=cBelt,
          dBelt=dBelt,
          IBelt=IBelt)
          annotation (extent=[-10,-60; 30,-20]);

        WheelsAndTires.TireComponents.Geometry.CircularTire Geometry(
          rRim=rRim,
          height=height,
          visBeltEnabled=visBeltEnabled,
          beltColor=beltColor,
          beltSpecularCoefficient=beltSpecularCoefficient,
          visContactPointEnabled=visContactPointEnabled,
          contactColor=contactColor,
          contactPointSize=contactPointSize)
          annotation (extent=[40,20; 80,60]);
        WheelsAndTires.TireComponents.Center2ContactPoint.Center2CPBond
          center2CP(
          visCenter2CPEnabled=visCenter2CPEnabled,
          center2CPColor=center2CPColor)
          annotation (extent=[-22,-48; -38,-32],
                                             rotation=0);
        WheelsAndTires.TireComponents.VerticalDynamics.ElastoElevation
          VerticalDynamics(cR=cR, dR=dR)
          annotation (extent=[-90,20; -50,60]);

      protected
        outer WheelsAndTires.Environment.Surface Surface;
        Real eLong[3];
        Real eLat[3];
        Real eN[3];
        Real ePlane[3];
        annotation (Diagram,
          experiment(
            StopTime=10,
            NumberOfIntervals=1000,
            Tolerance=1e-006),
          experimentSetupOutput,
          Icon(
            Text(
              extent=[0,-100; 0,-80],
              style(color=10, rgbcolor={135,135,135}),
              string="Circular Dynamic")),
          Coordsys(extent=[-100,-100; 100,100], scale=0.2),
          Documentation(info="<html>

For further information see the documentation of the used models and section <a href=\"Modelica://WheelsAndTires.UsersGuide.Tires\">Provided Tire Models</a> of the <a href=\"Modelica://WheelsAndTires.UsersGuide\">User's Guide</a>.

</html>"));

      initial equation

        if onSurface and not (initType == MB.Types.Init.Position or
            initType == MB.Types.Init.PositionVelocity or
            initType == MB.Types.Init.PositionVelocityAcceleration) then
          xCP[2] = Surface.get_elevation((xRim[1] - Geometry.r_CP*ePlane), (xRim[3] - Geometry.r_CP*ePlane));
        end if; // to initialize the tire on the surface not with xRim[2] = 0;

        if initType == MB.Types.Init.Position or initType == MB.Types.Init.
            PositionVelocity or initType == MB.Types.Init.PositionVelocityAcceleration then
            xCP[1] = x_start[1];
            xCP[3] = x_start[3];
            if not Surface.FlatSurface then
              xRim[2] = x_start[2] - Geometry.r_CP * eN;
            else
              xCP[2] = 0;
            end if;
          if useQuaternions then
            QRim[1:3] = Q_start[1:3];
          else
            phiRim = phi_start;
          end if;
        end if;

        if initType == MB.Types.Init.PositionVelocity or initType == MB.Types.Init.
          PositionVelocityAcceleration or initType == MB.Types.Init.Velocity or
          initType == MB.Types.Init.VelocityAcceleration then

          if not useAdvancedInitialization then
            if useTransVelocities then
              vRim = v_start;
            else
              wRim = w_start;
              vRim[2] = 0;
            end if;

          else
            if initSlip <> InitSlip.RotSlip then
              vRim = v_start_advanced;
            end if;

            if initSlip <> InitSlip.TransRot then
              vSlipLong = v_slip_start_advanced[1];
              vSlipLat = v_slip_start_advanced[3];
            end if;

            if initSlip <> InitSlip.TransSlip then
              wRim = w_start_advanced;
            end if;

            if initSlip == InitSlip.RotSlip then
              vRim[2] = 0;
            end if;
          end if;
        end if;

        if initType == MB.Types.Init.VelocityAcceleration or initType == MB.Types.Init.
            PositionVelocityAcceleration then
          if useTransVelocities then
            aRim[1] = a_start[1];
            aRim[3] = a_start[3];
          else
            zRim = z_start;
          end if;
        end if;

        if initType == MB.Types.Init.SteadyState then
          wRim = zeros(3);
          zRim = zeros(3);
        end if;

      equation

        xCP = ContactPhysics.MBG2Mech1.x;
        xRim = Rim.rimMass.PotentialFBM1.x;
        vRim = Rim.rimMass.PotentialFBM1.v;
        aRim = Rim.rimMass.PotentialFBM1.a;
        phiRim = Rim.rimMass.PotentialFBM1.phi;
        phi_dRim = Rim.rimMass.PotentialFBM1.phi_d;
        wRim = Rim.rimMass.PotentialFBM1.w;
        zRim = Rim.rimMass.PotentialFBM1.z;
        QRim = Rim.rimMass.PotentialFBM1.Q;

        vSlipLong = Friction.v_Slip_Long;
        vSlipLat = Friction.v_Slip_Lat;

        eLong = Geometry.tireBus.UV.eLong;
        eLat = Geometry.tireBus.UV.eLat;
        eN = Geometry.tireBus.UV.eN;
        ePlane = Geometry.tireBus.UV.ePlane;

        connect(Rim.frame_b,TireHub)               annotation (points=[82,-40; 90,-40;
              90,0; 100,0],        style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(BeltDynamics.frame_b, Rim.frame_a)
                                               annotation (points=[32,-40; 38,-40],
            style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(Geometry.tireBus,ContactPhysics. tireBus)
                                                       annotation (points=[60,20;
              60,0; -82,0; -82,-20], style(
            color=42,
            rgbcolor={127,0,0},
            fillColor=7,
            rgbfillColor={255,255,255},
            fillPattern=1));
        connect(Geometry.tireBus, BeltDynamics.tireBus)
                                                    annotation (points=[60,20;
              60,0; 10,0; 10,-20],
                                 style(
            color=42,
            rgbcolor={127,0,0},
            fillColor=7,
            rgbfillColor={255,255,255},
            fillPattern=1));
        connect(Geometry.tireBus, Rim.tireBus) annotation (points=[60,20; 60,-20],
                          style(
            color=42,
            rgbcolor={127,0,0},
            fillColor=7,
            rgbfillColor={255,255,255},
            fillPattern=1));
        connect(ContactPhysics.frame_b, center2CP.frame_b)
                                                        annotation (points=[-48,-40;
              -38.8,-40],                                        style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(center2CP.frame_a, BeltDynamics.frame_a)
                                                     annotation (points=[-21.2,
              -40; -12,-40],                                  style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(center2CP.tireBus, Geometry.tireBus) annotation (points=[-30,-32;
              -30,0; 60,0; 60,20],                                         style(
              color=42, rgbcolor={127,0,0}));
        connect(Friction.tireBus, BeltDynamics.tireBus)
                                                    annotation (points=[-12,20;
              -12,0; 10,0; 10,-20], style(
            color=42,
            rgbcolor={127,0,0},
            fillColor=10,
            rgbfillColor={135,135,135},
            fillPattern=1));
        connect(VerticalDynamics.tireBus, ContactPhysics.tireBus)
                                                        annotation (points=[-82,20;
              -82,-20],     style(
            color=42,
            rgbcolor={127,0,0},
            fillColor=10,
            rgbfillColor={135,135,135},
            fillPattern=1));
        connect(VerticalDynamics.contactPhysics, ContactPhysics.Friction)
                                                                   annotation (
            points=[-58,20; -58,-20], style(
            color=58,
            rgbcolor={0,127,0},
            fillColor=9,
            rgbfillColor={175,175,175},
            fillPattern=1));
        connect(ContactPhysics.Friction, Friction.ContactPhysics) annotation (
            points=[-58,-20; -58,12; -32,12; -32,20], style(
            color=58,
            rgbcolor={0,127,0},
            fillColor=9,
            rgbfillColor={175,175,175},
            fillPattern=1));
      end Dynamic;
      annotation (Icon, Documentation(info="<html>

This package contains tires with a cross section modeled by a semi-circle. For further information see the documentation of the used models and section [<a href=\"Modelica://WheelsAndTires.UsersGuide.Tires\">Provided Tire Models</a>] of the [<a href=\"Modelica://WheelsAndTires.UsersGuide\">User's Guide</a>]

</html>"));
    end Circular;

    package Belt
      "contains tires with a cross-section including side walls and a section of a circle modeling the tread area."
      annotation(preferedView="info");

    extends WheelsAndTires.TireComponents.Utilities.Icons.TirePackage;

      model Ideal
        "model with belted geometry, ideal friction not able to lift from the ground. Just use with FlatSurface option of the Surface enabled"
        import MultiBondLib;
        import WheelsAndTires;
        import SI = Modelica.SIunits;
        import MB = Modelica.Mechanics.MultiBody;

        extends WheelsAndTires.Tires.Commons.ParametersCommon;
        extends WheelsAndTires.TireComponents.Utilities.Icons.TireModel;

      // geometry
        parameter SI.Distance beltWidth = 100e-3 "Width of the tire";
        parameter SI.Distance beltHeight = 50e-3
          "Height of the belt of the tire";
        parameter SI.Radius beltRadius = 75e-3 "Radius of the tread area";

      // rim
        parameter SI.Radius rRim = 14*2.54e-2 "The radius of the rim";

      // initialization
        parameter MB.Types.Init.Temp initType=MB.Types.Init.Free
          "Type of initialization (defines usage of start values below)" annotation(Dialog(tab="Initialization"));
        parameter Boolean useTransVelocities = false
          "Use the translational velocities (defines usage of start values below), does not work with every starting angle"
           annotation(Dialog(tab="Initialization"));
        parameter SI.Position x_start[3] = {0,0,0}
          "Initial position of the contact point in the global coordinate system ([2] is used if possible)"
           annotation(Dialog(tab="Initialization"), enable = not onSurface);
        parameter SI.Velocity v_start[3] = {0,0,0}
          "Initial velocity in the global coordinate system (2nd is optional for models with non flat surfaces)"
           annotation(Dialog(tab="Initialization",enable=useTransVelocities));
        parameter SI.Acceleration a_start[3] = {0,0,0}
          "deactivated due to not possible initialization"
           annotation(Dialog(tab="Initialization",enable=false));
        parameter SI.Angle phi_start[3] = {0,0,0}
          "Initial angles in the world coordinate system"
           annotation(Dialog(tab="Initialization"));
        parameter SI.AngularVelocity w_start[3] = {0,0,0}
          "Initial angular velocity in the rim body coordinate system"
           annotation(Dialog(tab="Initialization",enable=not useTransVelocities));
        parameter SI.AngularAcceleration z_start[3] = {0,0,0}
          "deactivated due to not possible initialization"
           annotation(Dialog(tab="Initialization",enable=false));
        final parameter MultiBondLib.Mechanics3D.Types.Quaternion Q_start=
            MultiBondLib.Mechanics3D.Utilities.AxesRotQ(phi_start,
            sequence_angles) "Initial quaternion";
        final parameter MultiBondLib.Mechanics3D.Types.RotationSequence
          sequence_angles={2,1,3} "Sequence of the cardan angles" annotation(Dialog(tab="Advanced"));
        parameter Boolean enforceStates = false
          "Enforce cardan angles and w as states" annotation(Dialog(tab="Advanced"));
        parameter Boolean useQuaternions =  false
          "Use Quaternions instead of cardan angles" annotation(Dialog(tab="Advanced"));

      // variables used for initialization
        SI.Position xCP[3] "Position of the contact point frame";
        SI.Position xRim[3] "Position of the rim frame";
        SI.Velocity vRim[3] "Velocity of the rim frame";
        SI.Acceleration aRim[3] "Acceleration of the rim frame";
        SI.Angle phiRim[3](stateSelect=if not useQuaternions then (if enforceStates then
                        StateSelect.always else StateSelect.prefer) else  StateSelect.never)
          "cardan angles of the rim Frame";
        SI.Angle phi_dRim[3](stateSelect=if not useQuaternions then (if enforceStates then
                        StateSelect.always else StateSelect.prefer) else  StateSelect.never)
          "cardan angles derivatives of the Rim Frame";
        SI.AngularVelocity wRim[3](stateSelect=if useQuaternions then (if enforceStates then
                        StateSelect.always else StateSelect.prefer) else  StateSelect.default)
          "angular velocity of the Rim Frame";
        SI.AngularAcceleration zRim[3] "angular acceleration of the Rim";
        MultiBondLib.Mechanics3D.Types.Quaternion QRim(
          stateSelect=if useQuaternions then StateSelect.prefer else StateSelect.never,
          start=Q_start,
          fixed=false) "quaternions";

        WheelsAndTires.TireComponents.ContactPhysics.ContactBondNoDynamics
          ContactPhysics(
          visForcesEnabled=visForcesEnabled,
          forceScaling=forceScaling,
          arrowColor=arrowColor,
          arrowDiameter=arrowDiameter)
          annotation (extent=[-90,-60; -50,-20]);
        WheelsAndTires.TireComponents.Friction.IdealFricition Friction
          annotation (extent=[-40,20; 0,60]);
        WheelsAndTires.TireComponents.Rim.SpokedRim Rim(
          rRim=rRim,
          bRim=beltWidth,
          mRim=mRim,
          I_11=I_11,
          I_22=I_22,
          I_33=I_33,
          I_21=I_21,
          I_31=I_31,
          I_32=I_32,
          visRimEnabled=visRimEnabled,
          rimRodColor=rimRodColor,
          rimSpecularCoefficient=rimSpecularCoefficient,
          height=beltHeight/2)
          annotation (extent=[40,-60; 80,-20]);
        MultiBondLib.Mechanics3D.Interfaces.Frame_a TireHub
          "connection to the superordinate vehicle model"
          annotation (extent=[90,-10; 110,10]);
        WheelsAndTires.TireComponents.BeltDynamics.RigidBelt BeltDynamics
          annotation (extent=[-10,-60; 30,-20]);

        WheelsAndTires.TireComponents.Geometry.BeltTire Geometry(
          rRim=rRim,
          visBeltEnabled=visBeltEnabled,
          beltColor=beltColor,
          beltSpecularCoefficient=beltSpecularCoefficient,
          visContactPointEnabled=visContactPointEnabled,
          contactColor=contactColor,
          contactPointSize=contactPointSize,
          width=beltWidth,
          height=beltHeight,
          r=beltRadius)
          annotation (extent=[40,20; 80,60]);
        WheelsAndTires.TireComponents.Center2ContactPoint.Center2CPBond
          center2CP(
          visCenter2CPEnabled=visCenter2CPEnabled,
          center2CPColor=center2CPColor)
          annotation (extent=[-22,-48; -38,-32],
          rotation=0);
        WheelsAndTires.TireComponents.VerticalDynamics.NoElevation
          VerticalDynamics
           annotation (extent=[-90,20; -50,60]);

      protected
        outer WheelsAndTires.Environment.Surface Surface;
        Real eLong[3];
        Real eLat[3];
        Real eN[3];
        Real ePlane[3];
        annotation (Diagram,
          experiment(
            StopTime=10,
            NumberOfIntervals=1000,
            Tolerance=1e-006),
          experimentSetupOutput,
          Icon(
            Text(
              extent=[0,-100; 0,-80],
              style(color=10, rgbcolor={135,135,135}),
              string="Belt Ideal")),
          Coordsys(extent=[-100,-100; 100,100], scale=0.2),
          Documentation(info="<html>
For further information see the documentation of the used models and section <a href=\"Modelica://WheelsAndTires.UsersGuide.Tires\">Provided Tire Models</a> of the <a href=\"Modelica://WheelsAndTires.UsersGuide\">User's Guide</a>

</html>"));

      initial equation

        if initType == MB.Types.Init.Position or initType == MB.Types.Init.
          PositionVelocity or initType == MB.Types.Init.PositionVelocityAcceleration then
            xCP[1] = x_start[1];
            xCP[3] = x_start[3];
          if useQuaternions then
            QRim[1:3] = Q_start[1:3];
          else
            phiRim = phi_start;
          end if;
        end if;

        if initType == MB.Types.Init.PositionVelocity or initType == MB.Types.Init.
            PositionVelocityAcceleration or initType == MB.Types.Init.Velocity or
            initType == MB.Types.Init.VelocityAcceleration then
          if useTransVelocities then
            vRim[1] = v_start[1];
            vRim[3] = v_start[3];
            wRim*eN = 0;
            if not Surface.FlatSurface then
              vRim[2] = v_start[2];
            end if;
          else
            wRim = w_start;
          end if;
        end if;

        if initType == MB.Types.Init.VelocityAcceleration or initType == MB.Types.Init.
            PositionVelocityAcceleration then
          if useTransVelocities then
            aRim[1] = a_start[1];
            aRim[3] = a_start[3];
          else
            zRim = z_start;
          end if;
        end if;

        if initType == MB.Types.Init.SteadyState then
          wRim = zeros(3);
          zRim = zeros(3);
        end if;

      equation
        xCP = ContactPhysics.MBG2Mech1.x;
        xRim = Rim.rimMass.PotentialFBM1.x;
        vRim = Rim.rimMass.PotentialFBM1.v;
        aRim = Rim.rimMass.PotentialFBM1.a;
        phiRim = Rim.rimMass.PotentialFBM1.phi;
        phi_dRim = Rim.rimMass.PotentialFBM1.phi_d;
        wRim = Rim.rimMass.PotentialFBM1.w;
        zRim = Rim.rimMass.PotentialFBM1.z;
        QRim = Rim.rimMass.PotentialFBM1.Q;

        eLong = Geometry.tireBus.UV.eLong;
        eLat = Geometry.tireBus.UV.eLat;
        eN = Geometry.tireBus.UV.eN;
        ePlane = Geometry.tireBus.UV.ePlane;

        connect(Rim.frame_b,TireHub)               annotation (points=[82,-40; 90,
              -40; 90,0; 100,0],   style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(BeltDynamics.frame_b, Rim.frame_a)
                                               annotation (points=[32,-40; 38,-40],
            style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(Geometry.tireBus,ContactPhysics. tireBus)
                                                       annotation (points=[60,20;
              60,0; -82,0; -82,-20], style(
            color=42,
            rgbcolor={127,0,0},
            fillColor=7,
            rgbfillColor={255,255,255},
            fillPattern=1));
        connect(Geometry.tireBus, BeltDynamics.tireBus)
                                                    annotation (points=[60,20;
              60,0; 10,0; 10,-20],
                                 style(
            color=42,
            rgbcolor={127,0,0},
            fillColor=7,
            rgbfillColor={255,255,255},
            fillPattern=1));
        connect(Geometry.tireBus, Rim.tireBus) annotation (points=[60,20; 60,-20],
                          style(
            color=42,
            rgbcolor={127,0,0},
            fillColor=7,
            rgbfillColor={255,255,255},
            fillPattern=1));
        connect(ContactPhysics.frame_b, center2CP.frame_b)
                                                        annotation (points=[-48,-40;
              -38.8,-40],                                        style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(center2CP.frame_a, BeltDynamics.frame_a)
                                                     annotation (points=[-21.2,
              -40; -12,-40],                                  style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(center2CP.tireBus, Geometry.tireBus) annotation (points=[-30,-32;
              -30,0; 60,0; 60,20],                                         style(
              color=42, rgbcolor={127,0,0}));
        connect(Friction.tireBus, BeltDynamics.tireBus)
                                                    annotation (points=[-12,20;
              -12,0; 10,0; 10,-20], style(
            color=42,
            rgbcolor={127,0,0},
            fillColor=10,
            rgbfillColor={135,135,135},
            fillPattern=1));
        connect(VerticalDynamics.tireBus, ContactPhysics.tireBus)
                                                        annotation (points=[-82,20;
              -82,-20],     style(
            color=42,
            rgbcolor={127,0,0},
            fillColor=10,
            rgbfillColor={135,135,135},
            fillPattern=1));
        connect(VerticalDynamics.contactPhysics, ContactPhysics.Friction)
                                                                   annotation (
            points=[-58,20; -58,-20], style(
            color=58,
            rgbcolor={0,127,0},
            fillColor=9,
            rgbfillColor={175,175,175},
            fillPattern=1));
        connect(ContactPhysics.Friction, Friction.ContactPhysics) annotation (
            points=[-58,-20; -58,12; -32,12; -32,20], style(
            color=58,
            rgbcolor={0,127,0},
            fillColor=9,
            rgbfillColor={175,175,175},
            fillPattern=1));
      end Ideal;

      model Slipping "belted tire with dry slipping behavior."
        import MultiBondLib;
        import WheelsAndTires;
        import SI = Modelica.SIunits;
        import MB = Modelica.Mechanics.MultiBody;
        import WheelsAndTires.Tires.Commons.Types.InitSlip;

        extends WheelsAndTires.Tires.Commons.ParametersCommon;
        extends WheelsAndTires.Tires.Commons.ParametersDryRollRes;
        extends WheelsAndTires.TireComponents.Utilities.Icons.TireModel;

      // geometry
        parameter SI.Distance beltWidth = 100e-3 "Width of the tire";
        parameter SI.Distance beltHeight = 50e-3
          "Height of the belt of the tire";
        parameter SI.Radius beltRadius = 75e-3 "Radius of the tread area";
        final parameter SI.Radius rWheel = rRim + beltHeight - sqrt(beltRadius^2-(beltWidth)^2) + beltRadius
          "Radius of the total wheel";

      // rim
        parameter SI.Radius rRim = 14*2.54e-2 "Radius of the Rim";

      // elevation
        parameter Real cR(
          final unit="N/m",
          final min=0) = 1e6 "Stiffness of the single spring" annotation(Dialog(tab="Elevation"));
        parameter Real dR(
          final unit="N/ (m/s)",
          final min=0) = 1e3
          "Damping constant of the spring-damper serial connection" annotation(Dialog(tab="Elevation"));

      // initialization
        parameter MB.Types.Init.Temp initType=MB.Types.Init.Free
          "Type of initialization (defines usage of start values below)" annotation(Dialog(tab="Initialization"));
        parameter Boolean onSurface = true
          "true: the tire will be initialized to start on the surface"
           annotation(Dialog(tab="Initialization", enable=
            not (initType == MB.Types.Init.Position or
            initType == MB.Types.Init.PositionVelocity or
            initType == MB.Types.Init.PositionVelocityAcceleration)));
        parameter Boolean useTransVelocities = false
          "Use the translational velocities (defines usage of start values below), does not work with every starting angle"
           annotation(Dialog(tab="Initialization"));
        parameter SI.Position x_start[3] = {0,0,0}
          "Initial position of the contact point in the global coordinate system ([2] is used if possible)"
           annotation(Dialog(tab="Initialization"), enable = not onSurface);
        parameter SI.Velocity v_start[3] = {0,0,0}
          "Initial velocity in the global coordinate system (2nd is optional for models with non flat surfaces)"
           annotation(Dialog(tab="Initialization",enable=useTransVelocities));
        parameter SI.Acceleration a_start[3] = {0,0,0}
          "deactivated due to not possible initialization"
           annotation(Dialog(tab="Initialization",enable=false));
        parameter SI.Angle phi_start[3] = {0,0,0}
          "Initial angles in the world coordinate system"
           annotation(Dialog(tab="Initialization"));
        parameter SI.AngularVelocity w_start[3] = {0,0,0}
          "Initial angular velocity in the rim body coordinate system"
           annotation(Dialog(tab="Initialization",enable=not useTransVelocities));
        parameter SI.AngularAcceleration z_start[3] = {0,0,0}
          "deactivated due to not possible initialization"
           annotation(Dialog(tab="Initialization",enable=false));
        final parameter MultiBondLib.Mechanics3D.Types.Quaternion Q_start=
            MultiBondLib.Mechanics3D.Utilities.AxesRotQ(phi_start,
            sequence_angles) "Initial quaternion";
        final parameter MultiBondLib.Mechanics3D.Types.RotationSequence
          sequence_angles={2,1,3} "Sequence of the cardan angles" annotation(Dialog(tab="Advanced"));
        parameter Boolean enforceStates = false
          "Enforce cardan angles and w as states" annotation(Dialog(tab="Advanced"));
        parameter Boolean useQuaternions =  false
          "Use Quaternions instead of cardan angles" annotation(Dialog(tab="Advanced"));

        parameter Boolean useAdvancedInitialization = false
          "Enables setting manual setting of slip" annotation(Dialog(tab="Initialization", group="Advanced"));
        parameter WheelsAndTires.Tires.Commons.Types.InitSlip.Temp initSlip=
            WheelsAndTires.Tires.Commons.Types.InitSlip.RotSlip
          "The type of initialization for velocities and slip"
          annotation(Dialog(tab="Initialization", group="Advanced", enable = useAdvancedInitialization));
        parameter SI.Velocity v_start_advanced[3] = {0,0,0}
          "Initial velocity in the global coordinate system (2nd is optional for models with non flat surfaces)"
           annotation(Dialog(tab="Initialization", group="Advanced", enable = (initSlip <> InitSlip.RotSlip) and useAdvancedInitialization));
        parameter SI.AngularVelocity w_start_advanced[3] = {0,0,0}
          "Initial angular velocity in the rim body coordinate system"
           annotation(Dialog(tab="Initialization", group="Advanced", enable = (initSlip <> InitSlip.TransSlip) and useAdvancedInitialization));
        parameter SI.Velocity v_slip_start_advanced[3] = {0,0,0}
          "Initial velocity in the global coordinate system (2nd value is ignored)"
           annotation(Dialog(tab="Initialization", group="Advanced", enable = (initSlip <> InitSlip.TransRot) and useAdvancedInitialization));

      // variables used for initialization
        SI.Position xCP[3] "Position of the contact point frame";
        SI.Position xRim[3] "Position of the rim frame";
        SI.Velocity vRim[3] "Velocity of the rim frame";
        SI.Acceleration aRim[3] "Acceleration of the rim frame";
        SI.Angle phiRim[3](stateSelect=if not useQuaternions then (if enforceStates then
                        StateSelect.always else StateSelect.prefer) else  StateSelect.never)
          "cardan angles of the rim Frame";
        SI.Angle phi_dRim[3](stateSelect=if not useQuaternions then (if enforceStates then
                        StateSelect.always else StateSelect.prefer) else  StateSelect.never)
          "cardan angles derivatives of the Rim Frame";
        SI.AngularVelocity wRim[3](stateSelect=if useQuaternions then (if enforceStates then
                        StateSelect.always else StateSelect.prefer) else  StateSelect.default)
          "angular velocity of the Rim Frame";
        SI.AngularAcceleration zRim[3] "angular acceleration of the Rim";
        MultiBondLib.Mechanics3D.Types.Quaternion QRim(
          stateSelect=if useQuaternions then StateSelect.prefer else StateSelect.never,
          start=Q_start,
          fixed=false) "quaternions";

        SI.Velocity vSlipLong "Longitudinal slip velocity";
        SI.Velocity vSlipLat "Lateral slip velocity";

        WheelsAndTires.TireComponents.ContactPhysics.ContactBondNoDynamics
          ContactPhysics(
          visForcesEnabled=visForcesEnabled,
          forceScaling=forceScaling,
          arrowColor=arrowColor,
          arrowDiameter=arrowDiameter)
          annotation (extent=[-90,-60; -50,-20]);

        WheelsAndTires.TireComponents.Friction.DryFricitionRollRes Friction(
          vRotMin=vRotMin,
          vLongMin=vLongMin,
          vAdhesion=vAdhesion,
          vSlide=vSlide,
          muMaxN=muMaxN,
          muMinN=muMinN,
          fR0=fR0,
          rWheel=rWheel)
          annotation (extent=[-40,20; 0,60]);

        WheelsAndTires.TireComponents.Rim.SpokedRim Rim(
          rRim=rRim,
          mRim=mRim,
          I_11=I_11,
          I_22=I_22,
          I_33=I_33,
          I_21=I_21,
          I_31=I_31,
          I_32=I_32,
          visRimEnabled=visRimEnabled,
          rimRodColor=rimRodColor,
          rimSpecularCoefficient=rimSpecularCoefficient,
          bRim=beltWidth,
          height=beltHeight/2)
          annotation (extent=[40,-60; 80,-20]);

        MultiBondLib.Mechanics3D.Interfaces.Frame_a TireHub
          "connection to the superordinate vehicle model"
          annotation (extent=[90,-10; 110,10]);

        WheelsAndTires.TireComponents.BeltDynamics.RigidBelt BeltDynamics
          annotation (extent=[-10,-60; 30,-20]);

        WheelsAndTires.TireComponents.Geometry.BeltTire Geometry(
          rRim=rRim,
          visBeltEnabled=visBeltEnabled,
          beltColor=beltColor,
          beltSpecularCoefficient=beltSpecularCoefficient,
          visContactPointEnabled=visContactPointEnabled,
          contactColor=contactColor,
          contactPointSize=contactPointSize,
          r=beltRadius,
          width=beltWidth,
          height=beltHeight)
          annotation (extent=[40,20; 80,60]);
        WheelsAndTires.TireComponents.Center2ContactPoint.Center2CPBond
          center2CP(
          visCenter2CPEnabled=visCenter2CPEnabled,
          center2CPColor=center2CPColor)
          annotation (extent=[-22,-48; -38,-32],
                                             rotation=0);
        WheelsAndTires.TireComponents.VerticalDynamics.KelvinElevation
          VerticalDynamics(cR=cR, dR=dR)
                      annotation (extent=[-90,20; -50,60]);

      protected
        outer WheelsAndTires.Environment.Surface Surface;
        Real eLong[3];
        Real eLat[3];
        Real eN[3];
        Real ePlane[3];

        annotation (Diagram,
          experiment(
            StopTime=10,
            NumberOfIntervals=1000,
            Tolerance=1e-006),
          experimentSetupOutput,
          Icon(
            Text(
              extent=[0,-100; 0,-80],
              style(color=10, rgbcolor={135,135,135}),
              string="Belt Slipping")),
          Coordsys(extent=[-100,-100; 100,100], scale=0.2),
          Documentation(info="<html>

For further information see the documentation of the used models and section <a href=\"Modelica://WheelsAndTires.UsersGuide.Tires\">Provided Tire Models</a> of the <a href=\"Modelica://WheelsAndTires.UsersGuide\">User's Guide</a>.

</html>"));

      initial equation

        if onSurface and not (initType == MB.Types.Init.Position or
            initType == MB.Types.Init.PositionVelocity or
            initType == MB.Types.Init.PositionVelocityAcceleration) then
          xCP[2] = Surface.get_elevation((xRim[1] - Geometry.r_CP*ePlane), (xRim[3] - Geometry.r_CP*ePlane));
        end if; // to initialize the tire on the surface not with xRim[2] = 0;

        if initType == MB.Types.Init.Position or initType == MB.Types.Init.
            PositionVelocity or initType == MB.Types.Init.PositionVelocityAcceleration then
            xCP[1] = x_start[1];
            xCP[3] = x_start[3];
            if not Surface.FlatSurface then
              xRim[2] = x_start[2] - Geometry.r_CP * eN;
            else
              xCP[2] = 0;
            end if;
          if useQuaternions then
            QRim[1:3] = Q_start[1:3];
          else
            phiRim = phi_start;
          end if;
        end if;

        if initType == MB.Types.Init.PositionVelocity or initType == MB.Types.Init.
          PositionVelocityAcceleration or initType == MB.Types.Init.Velocity or
          initType == MB.Types.Init.VelocityAcceleration then

          if not useAdvancedInitialization then
            if useTransVelocities then
              vRim = v_start;
            else
              wRim = w_start;
              vRim[2] = 0;
            end if;

          else
            if initSlip <> InitSlip.RotSlip then
              vRim = v_start_advanced;
            end if;

            if initSlip <> InitSlip.TransRot then
              vSlipLong = v_slip_start_advanced[1];
              vSlipLat = v_slip_start_advanced[3];
            end if;

            if initSlip <> InitSlip.TransSlip then
              wRim = w_start_advanced;
            end if;

            if initSlip == InitSlip.RotSlip then
              vRim[2] = 0;
            end if;
        end if;
        end if;

        if initType == MB.Types.Init.VelocityAcceleration or initType == MB.Types.Init.
            PositionVelocityAcceleration then
          if useTransVelocities then
            aRim[1] = a_start[1];
            aRim[3] = a_start[3];
          else
            zRim = z_start;
          end if;
        end if;

        if initType == MB.Types.Init.SteadyState then
          wRim = zeros(3);
          zRim = zeros(3);
        end if;

      equation

        xCP = ContactPhysics.MBG2Mech1.x;
        xRim = Rim.rimMass.PotentialFBM1.x;
        vRim = Rim.rimMass.PotentialFBM1.v;
        aRim = Rim.rimMass.PotentialFBM1.a;
        phiRim = Rim.rimMass.PotentialFBM1.phi;
        phi_dRim = Rim.rimMass.PotentialFBM1.phi_d;
        wRim = Rim.rimMass.PotentialFBM1.w;
        zRim = Rim.rimMass.PotentialFBM1.z;
        QRim = Rim.rimMass.PotentialFBM1.Q;

        vSlipLong = Friction.v_Slip_Long;
        vSlipLat = Friction.v_Slip_Lat;

        eLong = Geometry.tireBus.UV.eLong;
        eLat = Geometry.tireBus.UV.eLat;
        eN = Geometry.tireBus.UV.eN;
        ePlane = Geometry.tireBus.UV.ePlane;

        connect(Rim.frame_b,TireHub)               annotation (points=[82,-40; 90,
              -40; 90,0; 100,0],   style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(BeltDynamics.frame_b, Rim.frame_a)
                                               annotation (points=[32,-40; 38,-40],
            style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(Geometry.tireBus,ContactPhysics. tireBus)
                                                       annotation (points=[60,20;
              60,0; -82,0; -82,-20], style(
            color=42,
            rgbcolor={127,0,0},
            fillColor=7,
            rgbfillColor={255,255,255},
            fillPattern=1));
        connect(Geometry.tireBus, BeltDynamics.tireBus)
                                                    annotation (points=[60,20;
              60,0; 10,0; 10,-20],
                                 style(
            color=42,
            rgbcolor={127,0,0},
            fillColor=7,
            rgbfillColor={255,255,255},
            fillPattern=1));
        connect(Geometry.tireBus, Rim.tireBus) annotation (points=[60,20; 60,-20],
                          style(
            color=42,
            rgbcolor={127,0,0},
            fillColor=7,
            rgbfillColor={255,255,255},
            fillPattern=1));
        connect(ContactPhysics.frame_b, center2CP.frame_b)
                                                        annotation (points=[-48,-40;
              -38.8,-40],                                        style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(center2CP.frame_a, BeltDynamics.frame_a)
                                                     annotation (points=[-21.2,
              -40; -12,-40],                                  style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(center2CP.tireBus, Geometry.tireBus) annotation (points=[-30,-32;
              -30,0; 60,0; 60,20],                                         style(
              color=42, rgbcolor={127,0,0}));
        connect(Friction.tireBus, BeltDynamics.tireBus)
                                                    annotation (points=[-12,20;
              -12,0; 10,0; 10,-20], style(
            color=42,
            rgbcolor={127,0,0},
            fillColor=10,
            rgbfillColor={135,135,135},
            fillPattern=1));
        connect(VerticalDynamics.tireBus, ContactPhysics.tireBus)
                                                        annotation (points=[-82,20;
              -82,-20],     style(
            color=42,
            rgbcolor={127,0,0},
            fillColor=10,
            rgbfillColor={135,135,135},
            fillPattern=1));
        connect(VerticalDynamics.contactPhysics, ContactPhysics.Friction)
                                                                   annotation (
            points=[-58,20; -58,-20], style(
            color=58,
            rgbcolor={0,127,0},
            fillColor=9,
            rgbfillColor={175,175,175},
            fillPattern=1));
        connect(ContactPhysics.Friction, Friction.ContactPhysics) annotation (
            points=[-58,-20; -58,12; -32,12; -32,20], style(
            color=58,
            rgbcolor={0,127,0},
            fillColor=9,
            rgbfillColor={175,175,175},
            fillPattern=1));
      end Slipping;

      model Advanced "belted tire with advanced slipping behavior."
        import MultiBondLib;
        import WheelsAndTires;
        import SI = Modelica.SIunits;
        import MB = Modelica.Mechanics.MultiBody;
        import WheelsAndTires.Tires.Commons.Types.InitSlip;

        extends WheelsAndTires.Tires.Commons.ParametersCommon;
        extends WheelsAndTires.Tires.Commons.ParametersAdvancedFriction;
        extends WheelsAndTires.TireComponents.Utilities.Icons.TireModel;

      // geometry
        parameter SI.Distance beltWidth = 100e-3 "Width of the tire";
        parameter SI.Distance beltHeight = 50e-3
          "Height of the belt of the tire";
        parameter SI.Radius beltRadius = 75e-3 "Radius of the tread area";
        final parameter SI.Radius rWheel = rRim + beltHeight - sqrt(beltRadius^2-(beltWidth)^2) + beltRadius
          "Radius of the total wheel";

      // rim
        parameter SI.Radius rRim = 14*2.54e-2 "Radius of the Rim";

      // elevation
        parameter Real cR(
          final unit="N/m",
          final min=0) = 1e6 "Stiffness of the single spring" annotation(Dialog(tab="Elevation"));
        parameter Real dR(
          final unit="N/ (m/s)",
          final min=0) = 1e3
          "Damping constant of the spring-damper serial connection" annotation(Dialog(tab="Elevation"));

      // initialization
        parameter MB.Types.Init.Temp initType=MB.Types.Init.Free
          "Type of initialization (defines usage of start values below)" annotation(Dialog(tab="Initialization"));
        parameter Boolean onSurface = true
          "true: the tire will be initialized to start on the surface"
           annotation(Dialog(tab="Initialization", enable=
            not (initType == MB.Types.Init.Position or
            initType == MB.Types.Init.PositionVelocity or
            initType == MB.Types.Init.PositionVelocityAcceleration)));
        parameter Boolean useTransVelocities = false
          "Use the translational velocities (defines usage of start values below), does not work with every starting angle"
           annotation(Dialog(tab="Initialization"));
        parameter SI.Position x_start[3] = {0,0,0}
          "Initial position of the contact point in the global coordinate system ([2] is used if possible)"
           annotation(Dialog(tab="Initialization"), enable = not onSurface);
        parameter SI.Velocity v_start[3] = {0,0,0}
          "Initial velocity in the global coordinate system (2nd is optional for models with non flat surfaces)"
           annotation(Dialog(tab="Initialization",enable=useTransVelocities));
        parameter SI.Acceleration a_start[3] = {0,0,0}
          "deactivated due to not possible initialization"
           annotation(Dialog(tab="Initialization",enable=false));
        parameter SI.Angle phi_start[3] = {0,0,0}
          "Initial angles in the world coordinate system"
           annotation(Dialog(tab="Initialization"));
        parameter SI.AngularVelocity w_start[3] = {0,0,0}
          "Initial angular velocity in the rim body coordinate system"
           annotation(Dialog(tab="Initialization",enable=not useTransVelocities));
        parameter SI.AngularAcceleration z_start[3] = {0,0,0}
          "deactivated due to not possible initialization"
           annotation(Dialog(tab="Initialization",enable=false));
        final parameter MultiBondLib.Mechanics3D.Types.Quaternion Q_start=
            MultiBondLib.Mechanics3D.Utilities.AxesRotQ(phi_start,
            sequence_angles) "Initial quaternion";
        final parameter MultiBondLib.Mechanics3D.Types.RotationSequence
          sequence_angles={2,1,3} "Sequence of the cardan angles" annotation(Dialog(tab="Advanced"));
        parameter Boolean enforceStates = false
          "Enforce cardan angles and w as states" annotation(Dialog(tab="Advanced"));
        parameter Boolean useQuaternions =  false
          "Use Quaternions instead of cardan angles" annotation(Dialog(tab="Advanced"));

        parameter Boolean useAdvancedInitialization = false
          "Enables setting manual setting of slip" annotation(Dialog(tab="Initialization", group="Advanced"));
        parameter WheelsAndTires.Tires.Commons.Types.InitSlip.Temp initSlip=
            WheelsAndTires.Tires.Commons.Types.InitSlip.RotSlip
          "The type of initialization for velocities and slip"
          annotation(Dialog(tab="Initialization", group="Advanced", enable = useAdvancedInitialization));
        parameter SI.Velocity v_start_advanced[3] = {0,0,0}
          "Initial velocity in the global coordinate system (2nd is optional for models with non flat surfaces)"
           annotation(Dialog(tab="Initialization", group="Advanced", enable = (initSlip <> InitSlip.RotSlip) and useAdvancedInitialization));
        parameter SI.AngularVelocity w_start_advanced[3] = {0,0,0}
          "Initial angular velocity in the rim body coordinate system"
           annotation(Dialog(tab="Initialization", group="Advanced", enable = (initSlip <> InitSlip.TransSlip) and useAdvancedInitialization));
        parameter SI.Velocity v_slip_start_advanced[3] = {0,0,0}
          "Initial velocity in the global coordinate system (2nd value is ignored)"
           annotation(Dialog(tab="Initialization", group="Advanced", enable = (initSlip <> InitSlip.TransRot) and useAdvancedInitialization));

      // variables used for initialization
        SI.Position xCP[3] "Position of the contact point frame";
        SI.Position xRim[3] "Position of the rim frame";
        SI.Velocity vRim[3] "Velocity of the rim frame";
        SI.Acceleration aRim[3] "Acceleration of the rim frame";
        SI.Angle phiRim[3](stateSelect=if not useQuaternions then (if enforceStates then
                        StateSelect.always else StateSelect.prefer) else  StateSelect.never)
          "cardan angles of the rim Frame";
        SI.Angle phi_dRim[3](stateSelect=if not useQuaternions then (if enforceStates then
                        StateSelect.always else StateSelect.prefer) else  StateSelect.never)
          "cardan angles derivatives of the Rim Frame";
        SI.AngularVelocity wRim[3](stateSelect=if useQuaternions then (if enforceStates then
                        StateSelect.always else StateSelect.prefer) else  StateSelect.default)
          "angular velocity of the Rim Frame";
        SI.AngularAcceleration zRim[3] "angular acceleration of the Rim";
        MultiBondLib.Mechanics3D.Types.Quaternion QRim(
          stateSelect=if useQuaternions then StateSelect.prefer else StateSelect.never,
          start=Q_start,
          fixed=false) "quaternions";

        SI.Velocity vSlipLong "Longitudinal slip velocity";
        SI.Velocity vSlipLat "Lateral slip velocity";

        WheelsAndTires.TireComponents.ContactPhysics.ContactBondNoDynamics
          ContactPhysics(
          visForcesEnabled=visForcesEnabled,
          forceScaling=forceScaling,
          arrowColor=arrowColor,
          arrowDiameter=arrowDiameter)
          annotation (extent=[-90,-60; -50,-20]);

        WheelsAndTires.TireComponents.Friction.AdvancedFriction Friction(
          vRotMin=vRotMin,
          vLongMin=vLongMin,
          fR0=fR0,
          rWheel=rWheel,
          vLongAdhesion=vLongAdhesion,
          vLongSlide=vLongSlide,
          sLongAdhesion=sLongAdhesion,
          sLongSlide=sLongSlide,
          muLongMaxN=muLongMaxN,
          muLongMinN=muLongMinN,
          vLatAdhesion=vLatAdhesion,
          vLatSlide=vLatSlide,
          sLatAdhesion=sLatAdhesion,
          sLatSlide=sLatSlide,
          muLatMaxN=muLatMaxN,
          muLatMinN=muLatMinN,
          muN=muN,
          mu2N=mu2N,
          fNNominal=fNNominal,
          fR1=fR1,
          fR4=fR4,
          muTurn=muTurn,
          camberGain=camberGain,
          cR=cR)
          annotation (extent=[-40,20; 0,60]);

        WheelsAndTires.TireComponents.Rim.SpokedRim Rim(
          rRim=rRim,
          mRim=mRim,
          I_11=I_11,
          I_22=I_22,
          I_33=I_33,
          I_21=I_21,
          I_31=I_31,
          I_32=I_32,
          visRimEnabled=visRimEnabled,
          rimRodColor=rimRodColor,
          rimSpecularCoefficient=rimSpecularCoefficient,
          bRim=beltWidth,
          height=beltHeight/2)
          annotation (extent=[40,-60; 80,-20]);

        MultiBondLib.Mechanics3D.Interfaces.Frame_a TireHub
          "connection to the superordinate vehicle model"
          annotation (extent=[90,-10; 110,10]);

        WheelsAndTires.TireComponents.BeltDynamics.RigidBelt BeltDynamics
          annotation (extent=[-10,-60; 30,-20]);

        WheelsAndTires.TireComponents.Geometry.BeltTire Geometry(
          rRim=rRim,
          visBeltEnabled=visBeltEnabled,
          beltColor=beltColor,
          beltSpecularCoefficient=beltSpecularCoefficient,
          visContactPointEnabled=visContactPointEnabled,
          contactColor=contactColor,
          contactPointSize=contactPointSize,
          r=beltRadius,
          width=beltWidth,
          height=beltHeight)
          annotation (extent=[40,20; 80,60]);
        WheelsAndTires.TireComponents.Center2ContactPoint.Center2CPBond
          center2CP(
          visCenter2CPEnabled=visCenter2CPEnabled,
          center2CPColor=center2CPColor)
          annotation (extent=[-22,-48; -38,-32],
                                             rotation=0);
        WheelsAndTires.TireComponents.VerticalDynamics.ElastoElevation
          VerticalDynamics(cR=cR, dR=dR)
                      annotation (extent=[-90,20; -50,60]);

      protected
        outer WheelsAndTires.Environment.Surface Surface;
        Real eLong[3];
        Real eLat[3];
        Real eN[3];
        Real ePlane[3];

        annotation (Diagram,
          experiment(
            StopTime=10,
            NumberOfIntervals=1000,
            Tolerance=1e-006),
          experimentSetupOutput,
          Icon(
            Text(
              extent=[0,-100; 0,-80],
              style(color=10, rgbcolor={135,135,135}),
              string="Belt Advanced")),
          Coordsys(extent=[-100,-100; 100,100], scale=0.2),
          Documentation(info="<html>

For further information see the documentation of the used models and section <a href=\"Modelica://WheelsAndTires.UsersGuide.Tires\">Provided Tire Models</a> of the <a href=\"Modelica://WheelsAndTires.UsersGuide\">User's Guide</a>.

</html>"));

      initial equation

        if onSurface and not (initType == MB.Types.Init.Position or
            initType == MB.Types.Init.PositionVelocity or
            initType == MB.Types.Init.PositionVelocityAcceleration) then
          xCP[2] = Surface.get_elevation((xRim[1] - Geometry.r_CP*ePlane), (xRim[3] - Geometry.r_CP*ePlane));
        end if; // to initialize the tire on the surface not with xRim[2] = 0;

        if initType == MB.Types.Init.Position or initType == MB.Types.Init.
            PositionVelocity or initType == MB.Types.Init.PositionVelocityAcceleration then
            xCP[1] = x_start[1];
            xCP[3] = x_start[3];
            if not Surface.FlatSurface then
              xRim[2] = x_start[2] - Geometry.r_CP * eN;
            else
              xCP[2] = 0;
            end if;
          if useQuaternions then
            QRim[1:3] = Q_start[1:3];
          else
            phiRim = phi_start;
          end if;
        end if;

        if initType == MB.Types.Init.PositionVelocity or initType == MB.Types.Init.
          PositionVelocityAcceleration or initType == MB.Types.Init.Velocity or
          initType == MB.Types.Init.VelocityAcceleration then

          if not useAdvancedInitialization then
            if useTransVelocities then
              vRim = v_start;
            else
              wRim = w_start;
              vRim[2] = 0;
            end if;

          else
            if initSlip <> InitSlip.RotSlip then
              vRim = v_start_advanced;
            end if;

            if initSlip <> InitSlip.TransRot then
              vSlipLong = v_slip_start_advanced[1];
              vSlipLat = v_slip_start_advanced[3];
            end if;

            if initSlip <> InitSlip.TransSlip then
              wRim = w_start_advanced;
            end if;

            if initSlip == InitSlip.RotSlip then
              vRim[2] = 0;
            end if;
          end if;
        end if;

        if initType == MB.Types.Init.VelocityAcceleration or initType == MB.Types.Init.
            PositionVelocityAcceleration then
          if useTransVelocities then
            aRim[1] = a_start[1];
            aRim[3] = a_start[3];
          else
            zRim = z_start;
          end if;
        end if;

        if initType == MB.Types.Init.SteadyState then
          wRim = zeros(3);
          zRim = zeros(3);
        end if;

      equation

        xCP = ContactPhysics.MBG2Mech1.x;
        xRim = Rim.rimMass.PotentialFBM1.x;
        vRim = Rim.rimMass.PotentialFBM1.v;
        aRim = Rim.rimMass.PotentialFBM1.a;
        phiRim = Rim.rimMass.PotentialFBM1.phi;
        phi_dRim = Rim.rimMass.PotentialFBM1.phi_d;
        wRim = Rim.rimMass.PotentialFBM1.w;
        zRim = Rim.rimMass.PotentialFBM1.z;
        QRim = Rim.rimMass.PotentialFBM1.Q;

        vSlipLong = Friction.v_Slip_Long;
        vSlipLat = Friction.v_Slip_Lat;

        eLong = Geometry.tireBus.UV.eLong;
        eLat = Geometry.tireBus.UV.eLat;
        eN = Geometry.tireBus.UV.eN;
        ePlane = Geometry.tireBus.UV.ePlane;

        connect(Rim.frame_b,TireHub)               annotation (points=[82,-40; 90,
              -40; 90,0; 100,0],   style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(BeltDynamics.frame_b, Rim.frame_a)
                                               annotation (points=[32,-40; 38,-40],
            style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(Geometry.tireBus,ContactPhysics. tireBus)
                                                       annotation (points=[60,20;
              60,0; -82,0; -82,-20], style(
            color=42,
            rgbcolor={127,0,0},
            fillColor=7,
            rgbfillColor={255,255,255},
            fillPattern=1));
        connect(Geometry.tireBus, BeltDynamics.tireBus)
                                                    annotation (points=[60,20;
              60,0; 10,0; 10,-20],
                                 style(
            color=42,
            rgbcolor={127,0,0},
            fillColor=7,
            rgbfillColor={255,255,255},
            fillPattern=1));
        connect(Geometry.tireBus, Rim.tireBus) annotation (points=[60,20; 60,-20],
                          style(
            color=42,
            rgbcolor={127,0,0},
            fillColor=7,
            rgbfillColor={255,255,255},
            fillPattern=1));
        connect(ContactPhysics.frame_b, center2CP.frame_b)
                                                        annotation (points=[-48,-40;
              -38.8,-40],                                        style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(center2CP.frame_a, BeltDynamics.frame_a)
                                                     annotation (points=[-21.2,
              -40; -12,-40],                                  style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(center2CP.tireBus, Geometry.tireBus) annotation (points=[-30,-32;
              -30,0; 60,0; 60,20],                                         style(
              color=42, rgbcolor={127,0,0}));
        connect(Friction.tireBus, BeltDynamics.tireBus)
                                                    annotation (points=[-12,20;
              -12,0; 10,0; 10,-20], style(
            color=42,
            rgbcolor={127,0,0},
            fillColor=10,
            rgbfillColor={135,135,135},
            fillPattern=1));
        connect(VerticalDynamics.tireBus, ContactPhysics.tireBus)
                                                        annotation (points=[-82,20;
              -82,-20],     style(
            color=42,
            rgbcolor={127,0,0},
            fillColor=10,
            rgbfillColor={135,135,135},
            fillPattern=1));
        connect(VerticalDynamics.contactPhysics, ContactPhysics.Friction)
                                                                   annotation (
            points=[-58,20; -58,-20], style(
            color=58,
            rgbcolor={0,127,0},
            fillColor=9,
            rgbfillColor={175,175,175},
            fillPattern=1));
        connect(ContactPhysics.Friction, Friction.ContactPhysics) annotation (
            points=[-58,-20; -58,12; -32,12; -32,20], style(
            color=58,
            rgbcolor={0,127,0},
            fillColor=9,
            rgbfillColor={175,175,175},
            fillPattern=1));
      end Advanced;

      model LongLatDynamics
        "belted tire with advance slipping behavior and a dynamic belt able to deform in longitudinal and lateral direction."
        import MultiBondLib;
        import WheelsAndTires;
        import SI = Modelica.SIunits;
        import MB = Modelica.Mechanics.MultiBody;
        import WheelsAndTires.Tires.Commons.Types.InitSlip;

        extends WheelsAndTires.Tires.Commons.ParametersCommon;
        extends WheelsAndTires.Tires.Commons.ParametersAdvancedFriction;
        extends WheelsAndTires.TireComponents.Utilities.Icons.TireModel;

      // geometry
        parameter SI.Distance beltWidth = 100e-3 "Width of the tire";
        parameter SI.Distance beltHeight = 50e-3
          "Height of the belt of the tire";
        parameter SI.Radius beltRadius = 75e-3 "Radius of the tread area";
        final parameter SI.Radius rWheel = rRim + beltHeight - sqrt(beltRadius^2-(beltWidth)^2) + beltRadius
          "Radius of the total wheel";

      // rim
        parameter SI.Radius rRim = 14*2.54e-2 "Radius of the Rim";

      // elevation
        parameter Real cR(
          final unit="N/m",
          final min=0) = 1e6 "Stiffness of the single spring"
          annotation(Dialog(tab="Elevation"));
        parameter Real dR(
          final unit="N/ (m/s)",
          final min=0) = 1e3
          "Damping constant of the spring-damper serial connection"
          annotation(Dialog(tab="Elevation"));

      // dynamics
        parameter SI.Mass mBelt = 2 "The mass of the belt"
          annotation(Dialog(tab="Dynamics", group="Belt"));
        parameter Real cLong(final unit="N/m",final min=0) = 1e5
          "spring constant"
          annotation(Dialog(tab="Dynamics", group="Belt"));
        parameter Real dLong(final unit="N/ (m/s)",final min=0) = 1e4
          "spring constant"
          annotation(Dialog(tab="Dynamics", group="Belt"));
        parameter Real cLat(final unit="N/m",final min=0) = 1e5
          "spring constant"
          annotation(Dialog(tab="Dynamics", group="Belt"));
        parameter Real dLat(final unit="N/ (m/s)",final min=0) = 1e4
          "spring constant"
          annotation(Dialog(tab="Dynamics", group="Belt"));
        parameter Boolean visBeltDynamicsEnabled = true
          "= true: belt dynamics will be animated"
          annotation(Dialog(tab="Visualization", group="Belt"));

      // initialization
        parameter MB.Types.Init.Temp initType=MB.Types.Init.Free
          "Type of initialization (defines usage of start values below)" annotation(Dialog(tab="Initialization"));
        parameter Boolean onSurface = true
          "true: the tire will be initialized to start on the surface"
           annotation(Dialog(tab="Initialization", enable=
            not (initType == MB.Types.Init.Position or
            initType == MB.Types.Init.PositionVelocity or
            initType == MB.Types.Init.PositionVelocityAcceleration)));
        parameter Boolean useTransVelocities = false
          "Use the translational velocities (defines usage of start values below), does not work with every starting angle"
           annotation(Dialog(tab="Initialization"));
        parameter SI.Position x_start[3] = {0,0,0}
          "Initial position of the contact point in the global coordinate system ([2] is used if possible)"
           annotation(Dialog(tab="Initialization"), enable = not onSurface);
        parameter SI.Velocity v_start[3] = {0,0,0}
          "Initial velocity in the global coordinate system (2nd is optional for models with non flat surfaces)"
           annotation(Dialog(tab="Initialization",enable=useTransVelocities));
        parameter SI.Acceleration a_start[3] = {0,0,0}
          "deactivated due to not possible initialization"
           annotation(Dialog(tab="Initialization",enable=false));
        parameter SI.Angle phi_start[3] = {0,0,0}
          "Initial angles in the world coordinate system"
           annotation(Dialog(tab="Initialization"));
        parameter SI.AngularVelocity w_start[3] = {0,0,0}
          "Initial angular velocity in the rim body coordinate system"
           annotation(Dialog(tab="Initialization",enable=not useTransVelocities));
        parameter SI.AngularAcceleration z_start[3] = {0,0,0}
          "deactivated due to not possible initialization"
           annotation(Dialog(tab="Initialization",enable=false));
        final parameter MultiBondLib.Mechanics3D.Types.Quaternion Q_start=
            MultiBondLib.Mechanics3D.Utilities.AxesRotQ(phi_start,
            sequence_angles) "Initial quaternion";
        final parameter MultiBondLib.Mechanics3D.Types.RotationSequence
          sequence_angles={2,1,3} "Sequence of the cardan angles" annotation(Dialog(tab="Advanced"));
        parameter Boolean enforceStates = false
          "Enforce cardan angles and w as states" annotation(Dialog(tab="Advanced"));
        parameter Boolean useQuaternions =  false
          "Use Quaternions instead of cardan angles" annotation(Dialog(tab="Advanced"));

        parameter Boolean useAdvancedInitialization = false
          "Enables setting manual setting of slip" annotation(Dialog(tab="Initialization", group="Advanced"));
        parameter WheelsAndTires.Tires.Commons.Types.InitSlip.Temp initSlip=
            WheelsAndTires.Tires.Commons.Types.InitSlip.RotSlip
          "The type of initialization for velocities and slip"
          annotation(Dialog(tab="Initialization", group="Advanced", enable = useAdvancedInitialization));
        parameter SI.Velocity v_start_advanced[3] = {0,0,0}
          "Initial velocity in the global coordinate system (2nd is optional for models with non flat surfaces)"
           annotation(Dialog(tab="Initialization", group="Advanced", enable = (initSlip <> InitSlip.RotSlip) and useAdvancedInitialization));
        parameter SI.AngularVelocity w_start_advanced[3] = {0,0,0}
          "Initial angular velocity in the rim body coordinate system"
           annotation(Dialog(tab="Initialization", group="Advanced", enable = (initSlip <> InitSlip.TransSlip) and useAdvancedInitialization));
        parameter SI.Velocity v_slip_start_advanced[3] = {0,0,0}
          "Initial velocity in the global coordinate system (2nd value is ignored)"
           annotation(Dialog(tab="Initialization", group="Advanced", enable = (initSlip <> InitSlip.TransRot) and useAdvancedInitialization));

      // variables used for initialization
        SI.Position xCP[3] "Position of the contact point frame";
        SI.Position xRim[3] "Position of the rim frame";
        SI.Velocity vRim[3] "Velocity of the rim frame";
        SI.Acceleration aRim[3] "Acceleration of the rim frame";
        SI.Angle phiRim[3](stateSelect=if not useQuaternions then (if enforceStates then
                        StateSelect.always else StateSelect.prefer) else  StateSelect.never)
          "cardan angles of the rim Frame";
        SI.Angle phi_dRim[3](stateSelect=if not useQuaternions then (if enforceStates then
                        StateSelect.always else StateSelect.prefer) else  StateSelect.never)
          "cardan angles derivatives of the Rim Frame";
        SI.AngularVelocity wRim[3](stateSelect=if useQuaternions then (if enforceStates then
                        StateSelect.always else StateSelect.prefer) else  StateSelect.default)
          "angular velocity of the Rim Frame";
        SI.AngularAcceleration zRim[3] "angular acceleration of the Rim";
        MultiBondLib.Mechanics3D.Types.Quaternion QRim(
          stateSelect=if useQuaternions then StateSelect.prefer else StateSelect.never,
          start=Q_start,
          fixed=false) "quaternions";

        SI.Velocity vSlipLong "Longitudinal slip velocity";
        SI.Velocity vSlipLat "Lateral slip velocity";

        WheelsAndTires.TireComponents.ContactPhysics.ContactBondNoDynamics
          ContactPhysics(
          visForcesEnabled=visForcesEnabled,
          forceScaling=forceScaling,
          arrowColor=arrowColor,
          arrowDiameter=arrowDiameter)
          annotation (extent=[-90,-60; -50,-20]);

        WheelsAndTires.TireComponents.Friction.AdvancedFriction Friction(
          vRotMin=vRotMin,
          vLongMin=vLongMin,
          fR0=fR0,
          rWheel=rWheel,
          vLongAdhesion=vLongAdhesion,
          vLongSlide=vLongSlide,
          sLongAdhesion=sLongAdhesion,
          sLongSlide=sLongSlide,
          muLongMaxN=muLongMaxN,
          muLongMinN=muLongMinN,
          vLatAdhesion=vLatAdhesion,
          vLatSlide=vLatSlide,
          sLatAdhesion=sLatAdhesion,
          sLatSlide=sLatSlide,
          muLatMaxN=muLatMaxN,
          muLatMinN=muLatMinN,
          muN=muN,
          mu2N=mu2N,
          fNNominal=fNNominal,
          fR1=fR1,
          fR4=fR4,
          muTurn=muTurn,
          camberGain=camberGain,
          cR=cR)
          annotation (extent=[-40,20; 0,60]);

        WheelsAndTires.TireComponents.Rim.SpokedRim Rim(
          rRim=rRim,
          mRim=mRim,
          I_11=I_11,
          I_22=I_22,
          I_33=I_33,
          I_21=I_21,
          I_31=I_31,
          I_32=I_32,
          visRimEnabled=visRimEnabled,
          rimRodColor=rimRodColor,
          rimSpecularCoefficient=rimSpecularCoefficient,
          bRim=beltWidth,
          height=beltHeight/2)
          annotation (extent=[40,-60; 80,-20]);

        MultiBondLib.Mechanics3D.Interfaces.Frame_a TireHub
          "connection to the superordinate vehicle model"
          annotation (extent=[90,-10; 110,10]);

        WheelsAndTires.TireComponents.BeltDynamics.LongLatBelt BeltDynamics(
          visBeltDynamicsEnabled=visBeltDynamicsEnabled,
          mBelt=mBelt,
          cLong=cLong,
          dLong=dLong,
          cLat=cLat,
          dLat=dLat)
          annotation (extent=[-10,-60; 30,-20]);

        WheelsAndTires.TireComponents.Geometry.BeltTire Geometry(
          rRim=rRim,
          visBeltEnabled=visBeltEnabled,
          beltColor=beltColor,
          beltSpecularCoefficient=beltSpecularCoefficient,
          visContactPointEnabled=visContactPointEnabled,
          contactColor=contactColor,
          contactPointSize=contactPointSize,
          r=beltRadius,
          width=beltWidth,
          height=beltHeight)
          annotation (extent=[40,20; 80,60]);
        WheelsAndTires.TireComponents.Center2ContactPoint.Center2CPBond
          center2CP(
          visCenter2CPEnabled=visCenter2CPEnabled,
          center2CPColor=center2CPColor)
          annotation (extent=[-22,-48; -38,-32],
                                             rotation=0);
        WheelsAndTires.TireComponents.VerticalDynamics.ElastoElevation
          VerticalDynamics(cR=cR, dR=dR)
          annotation (extent=[-90,20; -50,60]);

      protected
        outer WheelsAndTires.Environment.Surface Surface;
        Real eLong[3];
        Real eLat[3];
        Real eN[3];
        Real ePlane[3];

        annotation (Diagram,
          experiment(
            StopTime=10,
            NumberOfIntervals=1000,
            Tolerance=1e-006),
          experimentSetupOutput,
          Icon(
            Text(
              extent=[0,-100; 0,-80],
              style(color=10, rgbcolor={135,135,135}),
              string="Belt Long Lat Dynamics")),
          Coordsys(extent=[-100,-100; 100,100], scale=0.2),
          Documentation(info="<html>

For further information see the documentation of the used models and section <a href=\"Modelica://WheelsAndTires.UsersGuide.Tires\">Provided Tire Models</a> of the <a href=\"Modelica://WheelsAndTires.UsersGuide\">User's Guide</a>.

</html>"));

      initial equation

        if onSurface and not (initType == MB.Types.Init.Position or
            initType == MB.Types.Init.PositionVelocity or
            initType == MB.Types.Init.PositionVelocityAcceleration) then
          xCP[2] = Surface.get_elevation((xRim[1] - Geometry.r_CP*ePlane), (xRim[3] - Geometry.r_CP*ePlane));
        end if; // to initialize the tire on the surface not with xRim[2] = 0;

        if initType == MB.Types.Init.Position or initType == MB.Types.Init.
            PositionVelocity or initType == MB.Types.Init.PositionVelocityAcceleration then
            xCP[1] = x_start[1];
            xCP[3] = x_start[3];
            if not Surface.FlatSurface then
              xRim[2] = x_start[2] - Geometry.r_CP * eN;
            else
              xCP[2] = 0;
            end if;
          if useQuaternions then
            QRim[1:3] = Q_start[1:3];
          else
            phiRim = phi_start;
          end if;
        end if;

        if initType == MB.Types.Init.PositionVelocity or initType == MB.Types.Init.
          PositionVelocityAcceleration or initType == MB.Types.Init.Velocity or
          initType == MB.Types.Init.VelocityAcceleration then

          if not useAdvancedInitialization then
            if useTransVelocities then
              vRim = v_start;
            else
              wRim = w_start;
              vRim[2] = 0;
            end if;

          else
            if initSlip <> InitSlip.RotSlip then
              vRim = v_start_advanced;
            end if;

            if initSlip <> InitSlip.TransRot then
              vSlipLong = v_slip_start_advanced[1];
              vSlipLat = v_slip_start_advanced[3];
            end if;

            if initSlip <> InitSlip.TransSlip then
              wRim = w_start_advanced;
            end if;

            if initSlip == InitSlip.RotSlip then
              vRim[2] = 0;
            end if;
          end if;
        end if;

        if initType == MB.Types.Init.VelocityAcceleration or initType == MB.Types.Init.
            PositionVelocityAcceleration then
          if useTransVelocities then
            aRim[1] = a_start[1];
            aRim[3] = a_start[3];
          else
            zRim = z_start;
          end if;
        end if;

        if initType == MB.Types.Init.SteadyState then
          wRim = zeros(3);
          zRim = zeros(3);
        end if;

      equation

        xCP = ContactPhysics.MBG2Mech1.x;
        xRim = Rim.rimMass.PotentialFBM1.x;
        vRim = Rim.rimMass.PotentialFBM1.v;
        aRim = Rim.rimMass.PotentialFBM1.a;
        phiRim = Rim.rimMass.PotentialFBM1.phi;
        phi_dRim = Rim.rimMass.PotentialFBM1.phi_d;
        wRim = Rim.rimMass.PotentialFBM1.w;
        zRim = Rim.rimMass.PotentialFBM1.z;
        QRim = Rim.rimMass.PotentialFBM1.Q;

        vSlipLong = Friction.v_Slip_Long;
        vSlipLat = Friction.v_Slip_Lat;

        eLong = Geometry.tireBus.UV.eLong;
        eLat = Geometry.tireBus.UV.eLat;
        eN = Geometry.tireBus.UV.eN;
        ePlane = Geometry.tireBus.UV.ePlane;

        connect(Rim.frame_b,TireHub)               annotation (points=[82,-40; 90,
              -40; 90,0; 100,0],   style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(BeltDynamics.frame_b, Rim.frame_a)
                                               annotation (points=[32,-40; 38,-40],
            style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(Geometry.tireBus,ContactPhysics. tireBus)
                                                       annotation (points=[60,20;
              60,0; -82,0; -82,-20], style(
            color=42,
            rgbcolor={127,0,0},
            fillColor=7,
            rgbfillColor={255,255,255},
            fillPattern=1));
        connect(Geometry.tireBus, BeltDynamics.tireBus)
                                                    annotation (points=[60,20;
              60,0; 10,0; 10,-20],
                                 style(
            color=42,
            rgbcolor={127,0,0},
            fillColor=7,
            rgbfillColor={255,255,255},
            fillPattern=1));
        connect(Geometry.tireBus, Rim.tireBus) annotation (points=[60,20; 60,-20],
                          style(
            color=42,
            rgbcolor={127,0,0},
            fillColor=7,
            rgbfillColor={255,255,255},
            fillPattern=1));
        connect(ContactPhysics.frame_b, center2CP.frame_b)
                                                        annotation (points=[-48,-40;
              -38.8,-40],                                        style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(center2CP.frame_a, BeltDynamics.frame_a)
                                                     annotation (points=[-21.2,
              -40; -12,-40],                                  style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(center2CP.tireBus, Geometry.tireBus) annotation (points=[-30,-32;
              -30,0; 60,0; 60,20],                                         style(
              color=42, rgbcolor={127,0,0}));
        connect(Friction.tireBus, BeltDynamics.tireBus)
                                                    annotation (points=[-12,20;
              -12,0; 10,0; 10,-20], style(
            color=42,
            rgbcolor={127,0,0},
            fillColor=10,
            rgbfillColor={135,135,135},
            fillPattern=1));
        connect(VerticalDynamics.tireBus, ContactPhysics.tireBus)
                                                        annotation (points=[-82,20;
              -82,-20],     style(
            color=42,
            rgbcolor={127,0,0},
            fillColor=10,
            rgbfillColor={135,135,135},
            fillPattern=1));
        connect(VerticalDynamics.contactPhysics, ContactPhysics.Friction)
                                                                   annotation (
            points=[-58,20; -58,-20], style(
            color=58,
            rgbcolor={0,127,0},
            fillColor=9,
            rgbfillColor={175,175,175},
            fillPattern=1));
        connect(ContactPhysics.Friction, Friction.ContactPhysics) annotation (
            points=[-58,-20; -58,12; -32,12; -32,20], style(
            color=58,
            rgbcolor={0,127,0},
            fillColor=9,
            rgbfillColor={175,175,175},
            fillPattern=1));
      end LongLatDynamics;

      model QuadDynamics
        "belted tire with advance slipping behavior and a dynamic belt able to deform defined by four 3D spring damper systems."
        import MultiBondLib;
        import WheelsAndTires;
        import SI = Modelica.SIunits;
        import MB = Modelica.Mechanics.MultiBody;
        import WheelsAndTires.Tires.Commons.Types.InitSlip;

        extends WheelsAndTires.Tires.Commons.ParametersCommon;
        extends WheelsAndTires.Tires.Commons.ParametersAdvancedFriction;
        extends WheelsAndTires.TireComponents.Utilities.Icons.TireModel;

      // geometry
        parameter SI.Distance beltWidth = 100e-3 "Width of the tire";
        parameter SI.Distance beltHeight = 50e-3
          "Height of the belt of the tire";
        parameter SI.Radius beltRadius = 75e-3 "Radius of the tread area";
        final parameter SI.Radius rWheel = rRim + beltHeight - sqrt(beltRadius^2-(beltWidth)^2) + beltRadius
          "Radius of the total wheel";

      // rim
        parameter SI.Radius rRim = 14*2.54e-2 "Radius of the Rim";

      // elevation
        parameter Real cR(
          final unit="N/m",
          final min=0) = 1e6 "Stiffness of the single spring"
          annotation(Dialog(tab="Elevation"));
        parameter Real dR(
          final unit="N/ (m/s)",
          final min=0) = 1e3
          "Damping constant of the spring-damper serial connection"
          annotation(Dialog(tab="Elevation"));

      // dynamics
        parameter Boolean visBeltDynamicsEnabled = false
          "tire will not be animated, 1: tire will be animated"
          annotation(Dialog(tab="Visualization", group="Belt Dynamics"));
        parameter SI.Mass mBelt = 5 "Mass of the Belt"
          annotation(Dialog(tab="Belt Dynamics"));
        parameter SI.Inertia I11Belt = 1
          "(1,1) element of the inertial tensor of the belt"
          annotation(Dialog(tab="Belt Dynamics"));
        parameter SI.Inertia I22Belt = 0.1
          "(2,2) element of the inertial Sensor of the belt"
          annotation(Dialog(tab="Belt Dynamics"));
        parameter SI.Inertia I33Belt = 0.1
          "(3,3) element of the inertial tensor of the belt"
          annotation(Dialog(tab="Belt Dynamics"));
        parameter Real c(
          final unit="N/m",
          final min=0) = 3e5 "spring constant"
          annotation(Dialog(tab="Belt Dynamics"));
        parameter Real d(
          final unit="N/ (m/s)",
          final min=0) = 1 "damper constant"
          annotation(Dialog(tab="Belt Dynamics"));
        parameter SI.Length s0 = 40e-3
          "Unstreched length of the belt (without internal pressure)"
          annotation(Dialog(tab="Belt Dynamics"));

      // initialization
        parameter MB.Types.Init.Temp initType=MB.Types.Init.Free
          "Type of initialization (defines usage of start values below)" annotation(Dialog(tab="Initialization"));
        parameter Boolean onSurface = true
          "true: the tire will be initialized to start on the surface"
           annotation(Dialog(tab="Initialization", enable=
            not (initType == MB.Types.Init.Position or
            initType == MB.Types.Init.PositionVelocity or
            initType == MB.Types.Init.PositionVelocityAcceleration)));
        parameter Boolean useTransVelocities = false
          "Use the translational velocities (defines usage of start values below), does not work with every starting angle"
           annotation(Dialog(tab="Initialization"));
        parameter SI.Position x_start[3] = {0,0,0}
          "Initial position of the contact point in the global coordinate system ([2] is used if possible)"
           annotation(Dialog(tab="Initialization"), enable = not onSurface);
        parameter SI.Velocity v_start[3] = {0,0,0}
          "Initial velocity in the global coordinate system (2nd is optional for models with non flat surfaces)"
           annotation(Dialog(tab="Initialization",enable=useTransVelocities));
        parameter SI.Acceleration a_start[3] = {0,0,0}
          "deactivated due to not possible initialization"
           annotation(Dialog(tab="Initialization",enable=false));
        parameter SI.Angle phi_start[3] = {0,0,0}
          "Initial angles in the world coordinate system"
           annotation(Dialog(tab="Initialization"));
        parameter SI.AngularVelocity w_start[3] = {0,0,0}
          "Initial angular velocity in the rim body coordinate system"
           annotation(Dialog(tab="Initialization",enable=not useTransVelocities));
        parameter SI.AngularAcceleration z_start[3] = {0,0,0}
          "deactivated due to not possible initialization"
           annotation(Dialog(tab="Initialization",enable=false));
        final parameter MultiBondLib.Mechanics3D.Types.Quaternion Q_start=
            MultiBondLib.Mechanics3D.Utilities.AxesRotQ(phi_start,
            sequence_angles) "Initial quaternion";
        final parameter MultiBondLib.Mechanics3D.Types.RotationSequence
          sequence_angles={2,1,3} "Sequence of the cardan angles" annotation(Dialog(tab="Advanced"));
        parameter Boolean enforceStates = false
          "Enforce cardan angles and w as states" annotation(Dialog(tab="Advanced"));
        parameter Boolean useQuaternions =  false
          "Use Quaternions instead of cardan angles" annotation(Dialog(tab="Advanced"));

        parameter Boolean useAdvancedInitialization = false
          "Enables setting manual setting of slip" annotation(Dialog(tab="Initialization", group="Advanced"));
        parameter WheelsAndTires.Tires.Commons.Types.InitSlip.Temp initSlip=
            WheelsAndTires.Tires.Commons.Types.InitSlip.RotSlip
          "The type of initialization for velocities and slip"
          annotation(Dialog(tab="Initialization", group="Advanced", enable = useAdvancedInitialization));
        parameter SI.Velocity v_start_advanced[3] = {0,0,0}
          "Initial velocity in the global coordinate system (2nd is optional for models with non flat surfaces)"
           annotation(Dialog(tab="Initialization", group="Advanced", enable = (initSlip <> InitSlip.RotSlip) and useAdvancedInitialization));
        parameter SI.AngularVelocity w_start_advanced[3] = {0,0,0}
          "Initial angular velocity in the rim body coordinate system"
           annotation(Dialog(tab="Initialization", group="Advanced", enable = (initSlip <> InitSlip.TransSlip) and useAdvancedInitialization));
        parameter SI.Velocity v_slip_start_advanced[3] = {0,0,0}
          "Initial velocity in the global coordinate system (2nd value is ignored)"
           annotation(Dialog(tab="Initialization", group="Advanced", enable = (initSlip <> InitSlip.TransRot) and useAdvancedInitialization));

      // variables used for initialization
        SI.Position xCP[3] "Position of the contact point frame";
        SI.Position xRim[3] "Position of the rim frame";
        SI.Velocity vRim[3] "Velocity of the rim frame";
        SI.Acceleration aRim[3] "Acceleration of the rim frame";
        SI.Angle phiRim[3](stateSelect=if not useQuaternions then (if enforceStates then
                        StateSelect.always else StateSelect.prefer) else  StateSelect.never)
          "cardan angles of the rim Frame";
        SI.Angle phi_dRim[3](stateSelect=if not useQuaternions then (if enforceStates then
                        StateSelect.always else StateSelect.prefer) else  StateSelect.never)
          "cardan angles derivatives of the Rim Frame";
        SI.AngularVelocity wRim[3](stateSelect=if useQuaternions then (if enforceStates then
                        StateSelect.always else StateSelect.prefer) else  StateSelect.default)
          "angular velocity of the Rim Frame";
        SI.AngularAcceleration zRim[3] "angular acceleration of the Rim";
        MultiBondLib.Mechanics3D.Types.Quaternion QRim(
          stateSelect=if useQuaternions then StateSelect.prefer else StateSelect.never,
          start=Q_start,
          fixed=false) "quaternions";

        SI.Velocity vSlipLong "Longitudinal slip velocity";
        SI.Velocity vSlipLat "Lateral slip velocity";

        WheelsAndTires.TireComponents.ContactPhysics.ContactBondNoDynamics
          ContactPhysics(
          visForcesEnabled=visForcesEnabled,
          forceScaling=forceScaling,
          arrowColor=arrowColor,
          arrowDiameter=arrowDiameter)
          annotation (extent=[-90,-60; -50,-20]);

        WheelsAndTires.TireComponents.Friction.AdvancedFriction Friction(
          vRotMin=vRotMin,
          vLongMin=vLongMin,
          fR0=fR0,
          rWheel=rWheel,
          vLongAdhesion=vLongAdhesion,
          vLongSlide=vLongSlide,
          sLongAdhesion=sLongAdhesion,
          sLongSlide=sLongSlide,
          muLongMaxN=muLongMaxN,
          muLongMinN=muLongMinN,
          vLatAdhesion=vLatAdhesion,
          vLatSlide=vLatSlide,
          sLatAdhesion=sLatAdhesion,
          sLatSlide=sLatSlide,
          muLatMaxN=muLatMaxN,
          muLatMinN=muLatMinN,
          muN=muN,
          mu2N=mu2N,
          fNNominal=fNNominal,
          fR1=fR1,
          fR4=fR4,
          muTurn=muTurn,
          camberGain=camberGain,
          cR=cR)
          annotation (extent=[-40,20; 0,60]);

        WheelsAndTires.TireComponents.Rim.SpokedRim Rim(
          rRim=rRim,
          mRim=mRim,
          I_11=I_11,
          I_22=I_22,
          I_33=I_33,
          I_21=I_21,
          I_31=I_31,
          I_32=I_32,
          visRimEnabled=visRimEnabled,
          rimRodColor=rimRodColor,
          rimSpecularCoefficient=rimSpecularCoefficient,
          bRim=beltWidth,
          height=beltHeight/2)
          annotation (extent=[40,-60; 80,-20]);

        MultiBondLib.Mechanics3D.Interfaces.Frame_a TireHub
          "connection to the superordinate vehicle model"
          annotation (extent=[90,-10; 110,10]);

        WheelsAndTires.TireComponents.BeltDynamics.QuadOrder2Belt BeltDynamics(
          visBeltDynamicsEnabled=visBeltDynamicsEnabled,
          c=c,
          d=d,
          s0=s0,
          rRim=rRim,
          mBelt=mBelt,
          I11Belt=I11Belt,
          I22Belt=I22Belt,
          I33Belt=I33Belt,
          height=beltHeight)
          annotation (extent=[-10,-60; 30,-20]);

        WheelsAndTires.TireComponents.Geometry.BeltTire Geometry(
          rRim=rRim,
          visBeltEnabled=visBeltEnabled,
          beltColor=beltColor,
          beltSpecularCoefficient=beltSpecularCoefficient,
          visContactPointEnabled=visContactPointEnabled,
          contactColor=contactColor,
          contactPointSize=contactPointSize,
          r=beltRadius,
          width=beltWidth,
          height=beltHeight)
          annotation (extent=[40,20; 80,60]);
        WheelsAndTires.TireComponents.Center2ContactPoint.Center2CPBond
          center2CP(
          visCenter2CPEnabled=visCenter2CPEnabled,
          center2CPColor=center2CPColor)
          annotation (extent=[-22,-48; -38,-32],
                                             rotation=0);
        WheelsAndTires.TireComponents.VerticalDynamics.ElastoElevation
          VerticalDynamics(cR=cR, dR=dR)
          annotation (extent=[-90,20; -50,60]);

      protected
        outer WheelsAndTires.Environment.Surface Surface;
        Real eLong[3];
        Real eLat[3];
        Real eN[3];
        Real ePlane[3];

        annotation (Diagram,
          experiment(
            StopTime=10,
            NumberOfIntervals=1000,
            Tolerance=1e-006),
          experimentSetupOutput,
          Icon(
            Text(
              extent=[0,-100; 0,-80],
              style(color=10, rgbcolor={135,135,135}),
              string="Belt Quad Dynamics")),
          Coordsys(extent=[-100,-100; 100,100], scale=0.2),
          Documentation(info="<html>
For further information see the documentation of the used models and section <a href=\"Modelica://WheelsAndTires.UsersGuide.Tires\">Provided Tire Models</a> of the <a href=\"Modelica://WheelsAndTires.UsersGuide\">User's Guide</a>.

</html>"));

      initial equation

        if onSurface and not (initType == MB.Types.Init.Position or
            initType == MB.Types.Init.PositionVelocity or
            initType == MB.Types.Init.PositionVelocityAcceleration) then
          xCP[2] = Surface.get_elevation((xRim[1] - Geometry.r_CP*ePlane), (xRim[3] - Geometry.r_CP*ePlane));
        end if; // to initialize the tire on the surface not with xRim[2] = 0;

        if initType == MB.Types.Init.Position or initType == MB.Types.Init.
            PositionVelocity or initType == MB.Types.Init.PositionVelocityAcceleration then
            xCP[1] = x_start[1];
            xCP[3] = x_start[3];
            if not Surface.FlatSurface then
              xRim[2] = x_start[2] - Geometry.r_CP * eN;
            else
              xCP[2] = 0;
            end if;
          if useQuaternions then
            QRim[1:3] = Q_start[1:3];
          else
            phiRim = phi_start;
          end if;
        end if;

        if initType == MB.Types.Init.PositionVelocity or initType == MB.Types.Init.
          PositionVelocityAcceleration or initType == MB.Types.Init.Velocity or
          initType == MB.Types.Init.VelocityAcceleration then

          if not useAdvancedInitialization then
            if useTransVelocities then
              vRim = v_start;
            else
              wRim = w_start;
              vRim[2] = 0;
            end if;

          else
            if initSlip <> InitSlip.RotSlip then
              vRim = v_start_advanced;
            end if;

            if initSlip <> InitSlip.TransRot then
              vSlipLong = v_slip_start_advanced[1];
              vSlipLat = v_slip_start_advanced[3];
            end if;

            if initSlip <> InitSlip.TransSlip then
              wRim = w_start_advanced;
            end if;

            if initSlip == InitSlip.RotSlip then
              vRim[2] = 0;
            end if;
          end if;
        end if;

        if initType == MB.Types.Init.VelocityAcceleration or initType == MB.Types.Init.
            PositionVelocityAcceleration then
          if useTransVelocities then
            aRim[1] = a_start[1];
            aRim[3] = a_start[3];
          else
            zRim = z_start;
          end if;
        end if;

        if initType == MB.Types.Init.SteadyState then
          wRim = zeros(3);
          zRim = zeros(3);
        end if;

      equation

        xCP = ContactPhysics.MBG2Mech1.x;
        xRim = Rim.rimMass.PotentialFBM1.x;
        vRim = Rim.rimMass.PotentialFBM1.v;
        aRim = Rim.rimMass.PotentialFBM1.a;
        phiRim = Rim.rimMass.PotentialFBM1.phi;
        phi_dRim = Rim.rimMass.PotentialFBM1.phi_d;
        wRim = Rim.rimMass.PotentialFBM1.w;
        zRim = Rim.rimMass.PotentialFBM1.z;
        QRim = Rim.rimMass.PotentialFBM1.Q;

        vSlipLong = Friction.v_Slip_Long;
        vSlipLat = Friction.v_Slip_Lat;

        eLong = Geometry.tireBus.UV.eLong;
        eLat = Geometry.tireBus.UV.eLat;
        eN = Geometry.tireBus.UV.eN;
        ePlane = Geometry.tireBus.UV.ePlane;

        connect(Rim.frame_b,TireHub)               annotation (points=[82,-40; 90,
              -40; 90,0; 100,0],   style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(BeltDynamics.frame_b, Rim.frame_a)
                                               annotation (points=[32,-40; 38,-40],
            style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(Geometry.tireBus,ContactPhysics. tireBus)
                                                       annotation (points=[60,20;
              60,0; -82,0; -82,-20], style(
            color=42,
            rgbcolor={127,0,0},
            fillColor=7,
            rgbfillColor={255,255,255},
            fillPattern=1));
        connect(Geometry.tireBus, BeltDynamics.tireBus)
                                                    annotation (points=[60,20;
              60,0; 10,0; 10,-20],
                                 style(
            color=42,
            rgbcolor={127,0,0},
            fillColor=7,
            rgbfillColor={255,255,255},
            fillPattern=1));
        connect(Geometry.tireBus, Rim.tireBus) annotation (points=[60,20; 60,-20],
                          style(
            color=42,
            rgbcolor={127,0,0},
            fillColor=7,
            rgbfillColor={255,255,255},
            fillPattern=1));
        connect(ContactPhysics.frame_b, center2CP.frame_b)
                                                        annotation (points=[-48,-40;
              -38.8,-40],                                        style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(center2CP.frame_a, BeltDynamics.frame_a)
                                                     annotation (points=[-21.2,
              -40; -12,-40],                                  style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(center2CP.tireBus, Geometry.tireBus) annotation (points=[-30,-32;
              -30,0; 60,0; 60,20],                                         style(
              color=42, rgbcolor={127,0,0}));
        connect(Friction.tireBus, BeltDynamics.tireBus)
                                                    annotation (points=[-12,20;
              -12,0; 10,0; 10,-20], style(
            color=42,
            rgbcolor={127,0,0},
            fillColor=10,
            rgbfillColor={135,135,135},
            fillPattern=1));
        connect(VerticalDynamics.tireBus, ContactPhysics.tireBus)
                                                        annotation (points=[-82,20;
              -82,-20],     style(
            color=42,
            rgbcolor={127,0,0},
            fillColor=10,
            rgbfillColor={135,135,135},
            fillPattern=1));
        connect(VerticalDynamics.contactPhysics, ContactPhysics.Friction)
                                                                   annotation (
            points=[-58,20; -58,-20], style(
            color=58,
            rgbcolor={0,127,0},
            fillColor=9,
            rgbfillColor={175,175,175},
            fillPattern=1));
        connect(ContactPhysics.Friction, Friction.ContactPhysics) annotation (
            points=[-58,-20; -58,12; -32,12; -32,20], style(
            color=58,
            rgbcolor={0,127,0},
            fillColor=9,
            rgbfillColor={175,175,175},
            fillPattern=1));
      end QuadDynamics;
      annotation (Icon, Documentation(info="<html>

This package contains tires with a cross section including side walls and a part of a circle modeling the tread area. For further information see the documentation of the used models and section [<a href=\"Modelica://WheelsAndTires.UsersGuide.Tires\">Provided Tire Models</a>] of the [<a href=\"Modelica://WheelsAndTires.UsersGuide\">User's Guide</a>].

</html>"));
    end Belt;
  end Tires;

  package Environment
    "contains models to describe roads either flat or uneven with frictional coefficients depending on the location."
    annotation(preferedView="info");

    extends WheelsAndTires.TireComponents.Utilities.Icons.EnvironmentPackage;

    partial model SurfaceBase
      "partial base model defining necessary functions used by the tire model."
      annotation(preferedView="info");

      import SI = Modelica.SIunits;
      annotation (defaultComponentName="Surface",
           Icon(
            Rectangle(extent=[-100,-100; 100,100],
           style(
            color=74,
            rgbcolor={0,0,127},
            fillColor=7,
            rgbfillColor={255,255,255})),
           Text(
            extent=[-100,100; 100,132],
           style(
              color=10,
              rgbcolor={135,135,135},
              fillPattern=1),
            string="%name")),
        Documentation(info="<html>

<p class=\"noindent\">This partial model defines the functions necessary to calculate the behavior of the tire. These
include the following functions.
     </p><ul class=\"itemize1\">
     <li class=\"itemize\"><span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">get_eN_Base</span></span></span> - returns the normal vector of the surface at the actual <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">x</span></span></span> and <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">z</span></span></span>

     coordinates.
     </li>
     <li class=\"itemize\"><span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">get_elevation_Base</span></span></span> - returns the y coordinate of the surface at the actual <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">x</span></span></span>
     and <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">z</span></span></span> coordinates.
     </li>
     <li class=\"itemize\"><span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">get_mu_Base</span></span></span> - returns the frictional coefficient at the actual <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">x</span></span></span> and <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">z</span></span></span> coordinates.</li></ul>

<!--l. 15--><p class=\"noindent\">From the description above, one can see that that inputs for all functions are the <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">x</span></span></span> and <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">z</span></span></span>
coordinates. How these values are determined is left open and can be defined by the
user.
<!--l. 17--></p>

</html>"));

    partial function get_eN_Base
        "partial base function calculating the normal vector on the surface at given positions for x and z."
      input SI.Position x
          "actual position to get the normal vector eN in x direction.";
      input SI.Position z
          "actual position to get the normal vector eN in z direction.";
      output Real eN[3] "normal vector on the surface.";
        annotation (Documentation(info="<html>

See the documentation <a href=\"Modelica://WheelsAndTires.Environment.SurfaceBase\">SurfaceBase</a> for more information.

</html>"));
    end get_eN_Base;

    partial function get_elevation_Base
        "partial base function calculating the elevation of the surface at given positions for x and z."
      input SI.Position x
          "actual position to get the elevation of the surface (y-coordinate) in x direction";
      input SI.Position z
          "actual position to get the elevation of the surface (y-coordinate) in z direction";
      output SI.Position elevation "y coordinate (elevation) of the surface.";
        annotation (Documentation(info="<html>

See the documentation <a href=\"Modelica://WheelsAndTires.Environment.SurfaceBase\">SurfaceBase</a> for more information.

</html>"));
    end get_elevation_Base;

    partial function get_mu_Base
        "partial base function calculating the frictional coefficient of the surface at given positions for x and z."
      input SI.Position x
          "actual position to get the friction coefficient of the surface in x direction";
      input SI.Position z
          "actual position to get the friction coefficient of the surface in z direction";
      output Real mu "the friction coefficient";
        annotation (Documentation(info="<html>

See the documentation <a href=\"Modelica://WheelsAndTires.Environment.SurfaceBase\">SurfaceBase</a> for more information.

</html>"));
    end get_mu_Base;

    end SurfaceBase;

    model Surface
      "implemetation of the surface class based on interoplation between four elevation points with eight paritial derivatives."
      annotation(preferedView="info", Documentation(info="<html>

Basically the method to be implemented must be able to compute elevation (the <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">y</span></span></span> coordinate
shown in Figure&nbsp;<a href=\"#x1-111001r1\">1<!--tex4ht:ref: F_SurfaceIteration --></a>) </p><hr class=\"figure\"><div class=\"figure\"><table class=\"figure\"><tbody><tr class=\"figure\"><td class=\"figure\">



<a id=\"x1-111001r1\"></a>


<div class=\"center\">
<!--l. 21--><p class=\"noindent\">
</p><div class=\"colorbox\" id=\"colorbox7\"> <img src=\"../images/Master_Doku_MarkusAndres161x.png\" alt=\"PIC\" class=\"graphics\" width=\"241.84843pt\" height=\"192.7578pt\"><!--tex4ht:graphics
name=\"Master_Doku_MarkusAndres161x.png\" src=\"pics/SurfaceIteration.eps\"
--> </div>
</div>
<br> <div class=\"caption\"><table class=\"caption\"><tbody><tr style=\"vertical-align: baseline;\" class=\"caption\"><td class=\"id\">Figure&nbsp;1: </td><td class=\"content\">The basis for the interpolation used to find the elevation <span class=\"cmtt-10x-x-109\">y </span>and normal
vector in one square.</td></tr></tbody></table></div><!--tex4ht:label?: x1-111001r1 -->



<!--l. 28--><p class=\"noindent\"></p></td></tr></tbody></table></div><hr class=\"endfigure\">
<!--l. 30--><p class=\"noindent\">and the normal vector on the surface. There are many substantially different approaches
whereas the chosen one is a rather simple and conveniently configurable one.
</p><h4 class=\"subsectionHead\"><span class=\"titlemark\"></span><a id=\"x1-1120001.1\"></a>The used Method</h4>
<!--l. 34--><p class=\"noindent\">The implemented version of the <span class=\"cmti-10x-x-109\">Surface </span>in the <span class=\"cmti-10x-x-109\">Wheels and Tires </span>Library is based on the
method shown in the following section and introduced in <span class=\"cite\">[<a href=\"Modelica://WheelsAndTires.UsersGuide.Literature\">AS93</a>]</span>. It is an interpolation in a
unit square based on four y values and the eight corresponding partial derivatives. A
sketch of the unit square is shown in Figure&nbsp;<a href=\"#x1-111001r1\">1<!--tex4ht:ref: F_SurfaceIteration --></a>. To enable the user to define more
complex surfaces, an arbitrary amount of these rectangles can be combined to
one surface. The only fact limiting the amount of rectangles is simulation time
especially the time consumed for compilation which rises quickly with growing
surfaces.

<!--l. 36--></p><p class=\"noindent\">
</p><h4 class=\"subsubsectionHead\"><span class=\"titlemark\"></span> <a id=\"x1-1130001.1.1\"></a>Limitation</h4>
<!--l. 38--><p class=\"noindent\">Limitations are given due to the single contact point model used. The radii describing the
surface have to be significantly greater than the tire's radius. This ensures that only a single
contact point occurs.
<!--l. 40--></p><p class=\"noindent\">As the model uses the interpolation structure, rather than e.g.&nbsp;a two dimensional
mathematical function, the results are not derivable by Dymola. This limits the application
of this surface models to elevation classes that have a non ideal derivative block to calculate
the normal velocity of the ideal penetration depth. These are all models in the <span class=\"cmti-10x-x-109\">Wheels and</span>
<span class=\"cmti-10x-x-109\">Tires </span>library except the <span class=\"cmti-10x-x-109\">No Elevation </span>class.
<!--l. 42--></p>

<h4><span class=\"titlemark\"> </span> <a id=\"x1-1160001.1.4\"></a>Combining multiple Rectangles of arbitrary size</h4>
<!--l. 155--><p class=\"noindent\">In order to be able to describe more complex surfaces t&nbsp;<a href=\"#x1-1140001.1.2\"><!--tex4ht:ref: InterplationInOneRectangleElement --></a>,
a possibility was created to add multiple surfaces to form one big surface. The major problem
regarding this strategy is that the functions presented in the foregoing chapter just work with
a single unit square.
<!--l. 157--></p><p class=\"noindent\">The interpolation method is based on a square element with a side length of 1. This is not
very convenient to describe bigger surfaces which are reasonable when modeling motorcycles
or cars. The <span class=\"cmti-10x-x-109\">Surface </span>class therefore enables the user to define the total length and width of
the Surface as well as the amount of grid points representing the vertices of the (in general)
rectangular elements shown in Figure&nbsp;<a href=\"#x1-116001r1\">2(a)<!--tex4ht:ref: F_Surface --></a>. Therefore, the values returned by the

<span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">get_</span></span></span><span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">rectangle</span></span></span> function have to be scaled to unitary values which is done by the following
equations.


</p><div class=\"verbatim\">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;rectangleX&nbsp;:=&nbsp;LengthX/(nu-1);
&nbsp;<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;localXNorm&nbsp;:=&nbsp;localX/rectangleX;
&nbsp;<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;X&nbsp;:={localXNorm^3,localXNorm^2,localXNorm,1};
</div>
<!--l. 162--><p class=\"nopar\">
<!--l. 164--></p><p class=\"noindent\">Hereby <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">LengthX</span></span></span> denotes the total length of the surface, <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">nu</span></span></span> the number of elements in the <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">x</span></span></span>

direction and <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">localX</span></span></span> is the position in the currently \"active\" rectangular element. These
values are then used to compute <span class=\"cmbx-10x-x-109\">X</span> and do the interpolation. The same is done for the <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">z</span></span></span>
coordinate.
<!--l. 166--></p><p class=\"noindent\">The number of connected rectangles is defined by [<span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">nu</span></span></span>, <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">nv</span></span></span>] as depicted in Figure&nbsp;<a href=\"#x1-116003r3\">2<!--tex4ht:ref: F_SurfaceFigure --></a>.

</p><hr class=\"figure\"><div class=\"figure\"><table class=\"figure\"><tbody><tr class=\"figure\"><td class=\"figure\">


<a id=\"x1-116003r3\"></a>


<div class=\"center\">
<!--l. 169--><p class=\"noindent\">
<a id=\"x1-116001r1\"></a>
</p><div class=\"subfigure\"><table><tbody><tr><td style=\"text-align: left;\"><span class=\"colorbox\" id=\"colorbox8\"> <img src=\"../images/Master_Doku_MarkusAndres175x.png\" alt=\"PIC\" class=\"graphics\" width=\"177.82973pt\" height=\"175.92517pt\"><!--tex4ht:graphics
name=\"Master_Doku_MarkusAndres175x.png\" src=\"pics/Surface.eps\"
--></span>
             <div class=\"subfigcaption\"><span class=\"cmr-9\">(a) Point indexes.</span></div>             </td></tr></tbody></table></div> &nbsp;
<a id=\"x1-116002r2\"></a><div class=\"subfigure\"><table><tbody><tr><td style=\"text-align: left;\"><span class=\"colorbox\" id=\"colorbox9\"> <img src=\"../images/Master_Doku_MarkusAndres176x.png\" alt=\"PIC\" class=\"graphics\" width=\"177.82973pt\" height=\"176.56155pt\"><!--tex4ht:graphics
name=\"Master_Doku_MarkusAndres176x.png\" src=\"pics/SurfaceIndex.eps\"
--></span>
             <div class=\"subfigcaption\"><span class=\"cmr-9\">(b) Area indexes.</span></div>             </td></tr></tbody></table></div> </div>

<br> <div class=\"caption\"><table class=\"caption\"><tbody><tr style=\"vertical-align: baseline;\" class=\"caption\"><td class=\"id\">Figure&nbsp;2: </td><td class=\"content\">Coordinates for multiple rectangles added together to form a bigger surface.</td></tr></tbody></table></div><!--tex4ht:label?: x1-116003r3 -->


<!--l. 181--><p class=\"noindent\"></p></td></tr></tbody></table></div><hr class=\"endfigure\">
<!--l. 183--><p class=\"noindent\">The size of the corresponding matrices of dy/dx and dy/dz obviously has to match the values of
<span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">nu</span></span></span>, <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">nv</span></span></span>.

<!--l. 185--></p><p class=\"noindent\">Therefore, the function <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">get_rectangle</span></span></span> was created and returns the values given below, as
this is useful for both functions <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">get_elevation</span></span></span> and <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">get_eN</span></span></span>.
     </p><ul class=\"itemize1\">
     <li class=\"itemize\"><span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">xIndex</span></span></span> - The index in <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">x</span></span></span> direction, denoting the area which the tire is in (see
     Figure&nbsp;<a href=\"#x1-116002r2\">2(b)<!--tex4ht:ref: F_SurfaceIndex --></a>).
     </li>

     <li class=\"itemize\"><span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">zIndex</span></span></span> - Same as <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">xIndex</span></span></span> for the <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">z</span></span></span> direction.
     </li>
     <li class=\"itemize\"><span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">inArea</span></span></span> - A boolean variable denoting whether the tire is in the area where a
     surface is defined or not<span class=\"footnote-mark\"><a href=\"Master_Doku_MarkusAndres16.html#fn1x5\"><sup class=\"textsuperscript\"></sup></a></span><a id=\"x1-116004f1\"></a>.
     </li>

     <li class=\"itemize\"><span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">localX</span></span></span> - The position in <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">x</span></span></span> direction in the current rectangle.
     </li>
     <li class=\"itemize\"><span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">localZ</span></span></span> - The same as <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">localX</span></span></span> in the <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">z</span></span></span> direction.</li></ul>

<!--l. 194--><p class=\"noindent\">Figure&nbsp;<a href=\"#x1-115001r2\">1<!--tex4ht:ref: F_SurfaceParameters --></a> shows the parameter window for the configuration of a <span class=\"cmti-10x-x-109\">Surface </span>class. Here
a quite simple one is shown with just two values 0 and all partial derivatives
= 0.
</p>

<h4>The Visualization</h4>
<!--l. 197--><p class=\"noindent\">For the visualization of the <span class=\"cmti-10x-x-109\">Surface</span>, the <span class=\"cmti-10x-x-109\">Surface Material </span>class is used. This is a class
provided with Dymola enabling a visualization of parametric surfaces.

<!--l. 199--></p><p class=\"noindent\">To utilize this class, one has to set the number of grid points <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">nu</span></span></span> and <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">nv</span></span></span> as they are shown in
Figure&nbsp;<a href=\"#x1-116001r1\">2(a)<!--tex4ht:ref: F_Surface --></a> . To be able to visualize the surface, one has to set <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">x</span></span></span>, <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">y</span></span></span> and <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">z</span></span></span>

coordinates for every point in that grid. As the surfaces in the <span class=\"cmti-10x-x-109\">Wheels and Tires </span>library have
a regular grid, this can be done by a double loop for the <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">x</span></span></span> and <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">z</span></span></span> coordinates in a linear
fashion. Building a grid for the visualization with exactly as many grid points used to define
the single sections of the surface results in a visualization shown in Figure&nbsp;<a href=\"#x1-117001r4\">3<!--tex4ht:ref: F_SurfaceResultNotIterpolated --></a>.


</p><hr class=\"figure\"><div class=\"figure\"><table class=\"figure\"><tbody><tr class=\"figure\"><td class=\"figure\">


<a id=\"x1-117001r4\"></a>


<div class=\"center\">
<!--l. 202--><p class=\"noindent\">

<!--l. 203--></p><p class=\"noindent\"><img src=\"../images/Master_Doku_MarkusAndres179x.png\" alt=\"PIC\" class=\"graphics\" width=\"241.84843pt\" height=\"134.52405pt\"><!--tex4ht:graphics
name=\"Master_Doku_MarkusAndres179x.png\" src=\"pics/SurfaceResultNotIterpolated.eps\"
--></p></div>
<br> <div class=\"caption\"><table class=\"caption\"><tbody><tr style=\"vertical-align: baseline;\" class=\"caption\"><td class=\"id\">Figure&nbsp;3: </td><td class=\"content\">The result of the surface configuration shown in Figure&nbsp;<a href=\"#x1-115001r2\">1<!--tex4ht:ref: F_SurfaceParameters --></a> without any
further interpolation for the visualization.</td></tr></tbody></table></div><!--tex4ht:label?: x1-117001r4 -->


<!--l. 207--><p class=\"noindent\"></p></td></tr></tbody></table></div><hr class=\"endfigure\">
<!--l. 209--><p class=\"noindent\">This will return the same simulation results as the one in Figure <a href=\"#x1-117002r5\">4<!--tex4ht:ref: F_SurfaceResult --></a> </p><hr class=\"figure\"><div class=\"figure\"><table class=\"figure\"><tbody><tr class=\"figure\"><td class=\"figure\">


<a id=\"x1-117002r5\"></a>



<div class=\"center\">
<!--l. 212--><p class=\"noindent\">
<!--l. 213--></p><p class=\"noindent\"><img src=\"../images/Master_Doku_MarkusAndres180x.png\" alt=\"PIC\" class=\"graphics\" width=\"241.84843pt\" height=\"1315157pt\"><!--tex4ht:graphics
name=\"Master_Doku_MarkusAndres180x.png\" src=\"pics/SurfaceResult.eps\"
--></p></div>
<br> <div class=\"caption\"><table class=\"caption\"><tbody><tr style=\"vertical-align: baseline;\" class=\"caption\"><td class=\"id\">Figure&nbsp;4: </td><td class=\"content\">The result of the surface configuration shown in Figure&nbsp;<a href=\"#x1-115001r2\">1<!--tex4ht:ref: F_SurfaceParameters --></a> without a <span class=\"cmtt-10x-x-109\">PNG</span>
as texture.</td></tr></tbody></table></div><!--tex4ht:label?: x1-117002r5 -->


<!--l. 217--><p class=\"noindent\"></p></td></tr></tbody></table></div><hr class=\"endfigure\">

<!--l. 219--><p class=\"noindent\">but with a confusing visualization. Therefore the parameter <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">IP</span></span></span> (see Figure&nbsp;<a href=\"#x1-115001r2\">1<!--tex4ht:ref: F_SurfaceParameters --></a>
has been introduced. This adds <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">IP</span></span></span> points between the original grid points providing a much
smoother visualization.
<!--l. 221--></p>

It is important that the interpolation just has optical reasons. The real values of <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">y</span></span></span> and <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">eN</span></span></span> the
simulation is based on are determined totally smoothly and independent of the
visualization.

<h4> Implementation Details </h4>
<p class=\"noindent\">In order to get functions in Dymola using parameters of a superposed model, it is possible to
utilize protected functions. This can be done in the following way.


</p><div class=\"verbatim\">
public
&nbsp;<br>&nbsp;&nbsp;function&nbsp;get_eN&nbsp;=&nbsp;get_eN_protected&nbsp;(

&nbsp;<br>&nbsp;&nbsp;&nbsp;&nbsp;Parameter1&nbsp;=&nbsp;Parameter1,
&nbsp;<br>&nbsp;&nbsp;&nbsp;&nbsp;Parameter2&nbsp;=&nbsp;Parameter2);
</div>
<!--l. 123--><p class=\"nopar\"> Where <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">get_eN_protected</span></span></span> is the function implementing the \"real\" body. The code
section above is just useful to pass parameters to the function without the user
caring about these. The protected function then receives these values as inputs as
follows.


</p><div class=\"verbatim\">
protected
&nbsp;<br>&nbsp;&nbsp;function&nbsp;get_eN_protected
&nbsp;<br>&nbsp;&nbsp;&nbsp;&nbsp;extends&nbsp;get_eN_Base;&nbsp;&nbsp;//&nbsp;adds&nbsp;x&nbsp;and&nbsp;z&nbsp;as&nbsp;inputs&nbsp;and&nbsp;eN[3]&nbsp;as&nbsp;output

&nbsp;<br>&nbsp;&nbsp;&nbsp;&nbsp;input&nbsp;Real&nbsp;Parameter1;
&nbsp;<br>&nbsp;&nbsp;&nbsp;&nbsp;input&nbsp;Real&nbsp;Parameter2;
&nbsp;<br>&nbsp;&nbsp;algorithm
&nbsp;<br>&nbsp;&nbsp; ...
&nbsp;<br>&nbsp;&nbsp;end&nbsp;get_eN_protected;
</div>
<!--l. 134--><p class=\"nopar\"> The result of this, at first sight slightly obscure construction, is that the user is able to call
<span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">get_eN(x,z)</span></span></span> with the function gathering the parameters from the <span class=\"cmti-10x-x-109\">Surface </span>on its own.
Otherwise, the call would have to include all the parameters from the surface which does not
make sense at all. So e.g.&nbsp;the <span class=\"cmti-10x-x-109\">Geometry </span>class would have to know about the parameters of
the <span class=\"cmti-10x-x-109\">Surface </span>class.

<!--l. 137--></p><p class=\"noindent\">Another important aspect describing the functionality of the <span class=\"cmti-10x-x-109\">Surface </span>class can be seen when
looking at the last code section. The base function is extended by the <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">get</span></span></span><span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">_eN</span></span></span><span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">protected</span></span></span>
function in order to add standardized in- and outputs.
<!--l. 139--></p>

</html>"));

      extends WheelsAndTires.Environment.SurfaceBase;
      import SI = Modelica.SIunits;
      import MB = Modelica.Mechanics.MultiBody;
      import WheelsAndTires.Visualization.BaseClasses.SurfaceMaterial;

      parameter Boolean FlatSurface = true
        "If true simpler equations for the functions can be used, false enables uneven surfaces";
      parameter Boolean visSurface = true
        "= true if the surfrace shall be shown in the animation window";

      parameter Integer nu(final min=2) = 4
        "Number of grid points in x direction";
      parameter Integer nv(final min=2) = 4
        "Number of grid points in z direction";
      parameter Integer IP(final min=0) = 5
        "Number of interpolation points between the grid points (just for visualization)";

      parameter Real PNG = 1 "Filename of the that shall be used as texture";
      parameter MB.Types.Color Color= {192,192,192}
        "Surface color (mixed with texture)";
      parameter MB.Types.SpecularCoefficient SpecularCoefficient = 0.1
        "Specular coefficient of the road surface without texture";

      parameter SI.Length LengthX = 50
        "Length of the surface area in x direction";
      parameter SI.Length LengthZ = 50
        "Length of the surface area in z direction";
      parameter SI.Length OffsetX = -LengthX/2 "Offset in x direction";
      parameter SI.Length OffsetZ = -LengthZ/2 "Offset in z direction";

      parameter SI.Position y[nu,nv] = zeros(nu,nv)
        "Matrix with the y (elevation) values at the grid points"
        annotation(Dialog(enable= not FlatSurface));
      parameter Real dy_dx[nu,nv] = zeros(nu,nv)
        "Matrix with the slope of the grid points in x direction"
        annotation(Dialog(enable= not FlatSurface));
      parameter Real dy_dz[nu,nv] = zeros(nu,nv)
        "Matrix with the slope of the grid points in y direction"
        annotation(Dialog(enable= not FlatSurface));
      parameter Real mu[nu-1,nv-1] = ones(nu-1,nv-1)
        "Matrix with the friction coefficient for every rectangle";

      final parameter Integer nuIP = nu+(nu-1)*IP
        "Number of the grid values in x direction with interpolation";
      final parameter Integer nvIP = nv+(nv-1)*IP
        "Number of the grid values in y direction with interpolation";

    public
      function get_eN = get_eN_protected (
        FlatSurface = FlatSurface,
        yMatrix=y,
        dy_dxMatrix=dy_dx,
        dy_dzMatrix=dy_dz,
        nu=nu,
        nv=nv,
        LengthX=LengthX,
        LengthZ=LengthZ,
        OffsetX=OffsetX,
        OffsetZ=OffsetZ) annotation (Documentation(info="<html>

See the documentation <a href=\"Modelica://WheelsAndTires.Environment.Surface\">Surface</a> for more information.

</html>"));
    protected
      function get_eN_protected
        extends get_eN_Base;  // adds x and z as inputs and eN[3] as output
        input Boolean FlatSurface;
        input SI.Distance yMatrix[:,:];
        input Real dy_dxMatrix[:,:];
        input Real dy_dzMatrix[:,:];
        input Integer nu;
        input Integer nv;
        input SI.Length LengthX;
        input SI.Length LengthZ;
        input SI.Distance OffsetX;
        input SI.Distance OffsetZ;
      protected
        Integer xIndex;
        Integer zIndex;
        SI.Distance localX;
        SI.Distance localZ;
        Boolean inArea;
        SI.Distance rectangleY[2,2];
        Real rectangleDy_dx[2,2];
        Real rectangleDy_dz[2,2];
        Real X[4];
        Real Z[4];
        Real G[4,4];
        constant Real H[4,4] =  [2,-3, 0, 1;-2, 3, 0, 0; 1,-2, 1, 0; 1,-1, 0, 0];
        constant Real dH[4,4] = [0, 6,-6, 0; 0,-6, 6, 0; 0, 3,-4, 1; 0, 3,-2, 0];
        Real dy_dx;
        Real dy_dz;
        SI.Distance factorX;
        SI.Distance factorZ;
        SI.Length localXNorm;
        SI.Length localZNorm;
        SI.Length rectangleX;
        SI.Length rectangleZ;
        Real dN[3];
      algorithm

        (xIndex, zIndex, inArea, localX, localZ) := get_rectangle(x=x,z=z,nu=nu,nv=nv,LengthX=LengthX,LengthZ=LengthZ,OffsetX=OffsetX,OffsetZ=OffsetZ);

        if inArea and not FlatSurface then

          rectangleX :=LengthX/(nu-1);
          rectangleZ :=LengthZ/(nv-1);

          rectangleY :=yMatrix[xIndex:xIndex + 1, zIndex:zIndex + 1];
          rectangleDy_dx :=dy_dxMatrix[xIndex:xIndex + 1, zIndex:zIndex + 1];
          rectangleDy_dz :=dy_dzMatrix[xIndex:xIndex + 1, zIndex:zIndex + 1];
          G :=[rectangleY, rectangleDy_dz*rectangleZ; rectangleDy_dx*rectangleX, zeros(2, 2)];

          localXNorm :=localX/rectangleX;
          localZNorm :=localZ/rectangleZ;

          X :={localXNorm^3,localXNorm^2,localXNorm,1};
          Z :={localZNorm^3,localZNorm^2,localZNorm,1};

          dy_dx := (dH*X)*G*(H*Z)/rectangleX;
          dy_dz := (H*X)*G*(dH*Z)/rectangleZ;

          dN :=cross({0,dy_dz,1}, {1,dy_dx,0});
          eN :=dN/sqrt(dN*dN);
        else
          eN :={0,1,0};
        end if;

      end get_eN_protected;

    public
      function get_elevation = get_elevation_protected (
        FlatSurface = FlatSurface,
        yMatrix=y,
        dy_dxMatrix=dy_dx,
        dy_dzMatrix=dy_dz,
        nu=nu,
        nv=nv,
        LengthX=LengthX,
        LengthZ=LengthZ,
        OffsetX=OffsetX,
        OffsetZ=OffsetZ) annotation (Documentation(info="<html>

See the documentation <a href=\"Modelica://WheelsAndTires.Environment.Surface\">Surface</a> for more information.

</html>"));

    protected
      function get_elevation_protected
        extends get_elevation_Base; // adds x and z as inputs and elevation as output
        input Boolean FlatSurface;
        input SI.Distance yMatrix[:,:];
        input Real dy_dxMatrix[:,:];
        input Real dy_dzMatrix[:,:];
        input Integer nu;
        input Integer nv;
        input SI.Length LengthX;
        input SI.Length LengthZ;
        input SI.Distance OffsetX;
        input SI.Distance OffsetZ;
      protected
        Integer xIndex;
        Integer zIndex;
        SI.Distance localX;
        SI.Distance localZ;
        Boolean inArea;
        SI.Distance rectangleY[2,2];
        Real rectangleDy_dx[2,2];
        Real rectangleDy_dz[2,2];
        Real X[4];
        Real Z[4];
        Real G[4,4];
        SI.Distance rectangleX;
        SI.Distance rectangleZ;
        Real localXNorm;
        Real localZNorm;
        constant Real H[4,4] = [2,-3, 0, 1; -2, 3, 0, 0; 1,-2, 1, 0; 1,-1, 0, 0]
          "Matrix used for the interpolation";

      algorithm
        (xIndex, zIndex, inArea, localX, localZ) := get_rectangle(x=x,z=z,nu=nu,nv=nv,LengthX=LengthX,LengthZ=LengthZ,OffsetX=OffsetX,OffsetZ=OffsetZ);

        if inArea and not FlatSurface then
          rectangleX := LengthX/(nu-1);
          rectangleZ := LengthZ/(nv-1);

          rectangleY :=yMatrix[xIndex:xIndex + 1, zIndex:zIndex + 1];
          rectangleDy_dx :=dy_dxMatrix[xIndex:xIndex + 1, zIndex:zIndex + 1];
          rectangleDy_dz :=dy_dzMatrix[xIndex:xIndex + 1, zIndex:zIndex + 1];
          G :=[rectangleY, rectangleDy_dz*rectangleZ; rectangleDy_dx*rectangleX, zeros(2, 2)];

          localXNorm :=localX/rectangleX;
          localZNorm :=localZ/rectangleZ;

          X :={localXNorm^3,localXNorm^2,localXNorm,1};
          Z :={localZNorm^3,localZNorm^2,localZNorm,1};

          elevation := (H*X)*G*(H*Z);
        else
          elevation := 0;
        end if;

      end get_elevation_protected;

    public
      function get_mu = get_mu_protected (
        muMatrix=mu,
        nu=nu,
        nv=nv,
        LengthX=LengthX,
        LengthZ=LengthZ,
        OffsetX=OffsetX,
        OffsetZ=OffsetZ) annotation (Documentation(info="<html>

See the documentation <a href=\"Modelica://WheelsAndTires.Environment.Surface\">Surface</a> for more information.

</html>"));

    protected
      function get_mu_protected
        extends get_mu_Base; // adds x and z as inputs and mu as output
        input Real muMatrix[:,:]; //additional input(s)
        input Integer nu;
        input Integer nv;
        input SI.Length LengthX;
        input SI.Length LengthZ;
        input SI.Distance OffsetX;
        input SI.Distance OffsetZ;
      protected
        Integer xIndex;
        Integer zIndex;
        Boolean inArea;
      algorithm
      (xIndex,zIndex,inArea) := get_rectangle(x=x,z=z,nu=nu,nv=nv,LengthX=LengthX,LengthZ=LengthZ,OffsetX=OffsetX,OffsetZ=OffsetZ);
        if inArea then
          mu := muMatrix[xIndex,zIndex];
        else
          mu := 1;
        end if;
      end get_mu_protected;

    public
      function get_rectangle
        "finds the rectangle which calculates the elevation and normal vector for the current position of the tire."
        input SI.Position x
          "acutal position to find active recthangle and relative position in x direction";
        input SI.Position z
          "acutal position to find active recthangle and relative position in z direction";
        input Integer nu "Number of grid points in x direction";
        input Integer nv "Number of grid points in z direction";
        input SI.Length LengthX "Length of the surface area in x direction";
        input SI.Length LengthZ "Length of the surface area in z direction";
        input SI.Distance OffsetX "Offset of the surface area in x direction";
        input SI.Distance OffsetZ "Offset of the surface area in z direction";

        output Integer rectX "index of the active rectange in x direction";
        output Integer rectZ "index of the active rectange in z direction";
        output Boolean inArea
          "true: tire is in the defined surface area, false: it is not.";
        output SI.Distance localX
          "relative position in the active rectangle in x direction.";
        output SI.Distance localZ
          "relative position in the active rectangle in z direction.";

      protected
        SI.Distance rectangleX;
        SI.Distance rectangleZ;

      algorithm
        rectX := integer(ceil(((x-OffsetX)/LengthX)*(nu-1)));
        rectZ := integer(ceil(((z-OffsetZ)/LengthZ)*(nv-1)));

        if rectX > nu-1 or rectX < 1 or rectZ > nv-1 or rectZ < 1 then
          inArea :=false;
        else
          inArea :=true;
        end if;

        rectangleX := LengthX/(nu-1);
        rectangleZ := LengthZ/(nv-1);

        // getting local position (in the rectangle the tire is in at the time of calling)
          localX :=mod(x - LengthX - OffsetX, rectangleX);
          localZ :=mod(z - LengthZ - OffsetZ, rectangleZ);

      end get_rectangle;

      annotation (defaultComponentName="Surface",
              defaultComponentPrefixes="inner",
              Icon(Polygon(points=[-78,-58; -34,-14; 74,-14; 38,-58; -78,-58],
              style(
              color=10,
              rgbcolor={135,135,135},
              fillColor=30,
              rgbfillColor={215,215,215})),
          Line(points=[-34,-14; -34,61],      style(color=0, thickness=2)),
          Line(points=[-34,-14; 65,-14],      style(color=0, thickness=2)),
          Polygon(points=[86,-14; 64,-2; 64,-26; 86,-14],         style(
              color=0,
              fillColor=0,
              fillPattern=1)),
          Text(
            extent=[84,-18; 84,-52],
            style(color=0),
            string="x"),
          Line(points=[-34,-14; -70,-50],     style(color=0, thickness=2)),
          Polygon(points=[-86,-66; -78,-42; -62,-58; -86,-66],    style(
              color=0,
              fillColor=0,
              fillPattern=1)),
          Polygon(points=[-44,60; -34,82; -24,60; -44,60],        style(
              color=0,
              fillColor=0,
              fillPattern=1)),
          Text(
            extent=[-58,100; -58,66],
            style(color=0),
            string="y"),
          Text(
            extent=[-88,-12; -88,-46],
            style(color=0),
            string="z")),
        Documentation(info="<html>

Basically the method to be implemented must be able to compute elevation (the <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">y</span></span></span> coordinate
shown in Figure&nbsp;<a href=\"#x1-111001r1\">1<!--tex4ht:ref: F_SurfaceIteration --></a>) </p><hr class=\"figure\"><div class=\"figure\"><table class=\"figure\"><tbody><tr class=\"figure\"><td class=\"figure\">



<a id=\"x1-111001r1\"></a>


<div class=\"center\">
<!--l. 21--><p class=\"noindent\">
</p><div class=\"colorbox\" id=\"colorbox7\"> <img src=\"../images/Master_Doku_MarkusAndres161x.png\" alt=\"PIC\" class=\"graphics\" width=\"241.84843pt\" height=\"192.7578pt\"><!--tex4ht:graphics
name=\"Master_Doku_MarkusAndres161x.png\" src=\"pics/SurfaceIteration.eps\"
--> </div>
</div>
<br> <div class=\"caption\"><table class=\"caption\"><tbody><tr style=\"vertical-align: baseline;\" class=\"caption\"><td class=\"id\">Figure&nbsp;1: </td><td class=\"content\">The basis for the interpolation used to find the elevation <span class=\"cmtt-10x-x-109\">y </span>and normal
vector in one square.</td></tr></tbody></table></div><!--tex4ht:label?: x1-111001r1 -->



<!--l. 28--><p class=\"noindent\"></p></td></tr></tbody></table></div><hr class=\"endfigure\">
<!--l. 30--><p class=\"noindent\">and the normal vector on the surface. There are many substantially different approaches
whereas the chosen one is a rather simple and conveniently configurable one.
</p><h4 class=\"subsectionHead\"><span class=\"titlemark\"></span><a id=\"x1-1120001.1\"></a>The used Method</h4>
<!--l. 34--><p class=\"noindent\">The implemented version of the <span class=\"cmti-10x-x-109\">Surface </span>in the <span class=\"cmti-10x-x-109\">Wheels and Tires </span>Library is based on the
method shown in the following section and introduced in <span class=\"cite\">[<a href=\"Modelica://WheelsAndTires.UsersGuide.Literature\">AS93</a>]</span>. It is an interpolation in a
unit square based on four y values and the eight corresponding partial derivatives. A
sketch of the unit square is shown in Figure&nbsp;<a href=\"#x1-111001r1\">1<!--tex4ht:ref: F_SurfaceIteration --></a>. To enable the user to define more
complex surfaces, an arbitrary amount of these rectangles can be combined to
one surface. The only fact limiting the amount of rectangles is simulation time
especially the time consumed for compilation which rises quickly with growing
surfaces.

<!--l. 36--></p><p class=\"noindent\">
</p><h4 class=\"subsubsectionHead\"><span class=\"titlemark\"></span> <a id=\"x1-1130001.1.1\"></a>Limitation</h4>
<!--l. 38--><p class=\"noindent\">Limitations are given due to the single contact point model used. The radii describing the
surface have to be significantly greater than the tire's radius. This ensures that only a single
contact point occurs.
<!--l. 40--></p><p class=\"noindent\">As the model uses the interpolation structure, rather than e.g.&nbsp;a two dimensional
mathematical function, the results are not derivable by Dymola. This limits the application
of this surface models to elevation classes that have a non ideal derivative block to calculate
the normal velocity of the ideal penetration depth. These are all models in the <span class=\"cmti-10x-x-109\">Wheels and</span>
<span class=\"cmti-10x-x-109\">Tires </span>library except the <span class=\"cmti-10x-x-109\">No Elevation </span>class.
<!--l. 42--></p>

<h4><span class=\"titlemark\"> </span> <a id=\"x1-1160001.1.4\"></a>Combining multiple Rectangles of arbitrary size</h4>
<!--l. 155--><p class=\"noindent\">In order to be able to describe more complex surfaces t&nbsp;<a href=\"#x1-1140001.1.2\"><!--tex4ht:ref: InterplationInOneRectangleElement --></a>,
a possibility was created to add multiple surfaces to form one big surface. The major problem
regarding this strategy is that the functions presented in the foregoing chapter just work with
a single unit square.
<!--l. 157--></p><p class=\"noindent\">The interpolation method is based on a square element with a side length of 1. This is not
very convenient to describe bigger surfaces which are reasonable when modeling motorcycles
or cars. The <span class=\"cmti-10x-x-109\">Surface </span>class therefore enables the user to define the total length and width of
the Surface as well as the amount of grid points representing the vertices of the (in general)
rectangular elements shown in Figure&nbsp;<a href=\"#x1-116001r1\">2(a)<!--tex4ht:ref: F_Surface --></a>. Therefore, the values returned by the

<span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">get_</span></span></span><span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">rectangle</span></span></span> function have to be scaled to unitary values which is done by the following
equations.


</p><div class=\"verbatim\">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;rectangleX&nbsp;:=&nbsp;LengthX/(nu-1);
&nbsp;<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;localXNorm&nbsp;:=&nbsp;localX/rectangleX;
&nbsp;<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;X&nbsp;:={localXNorm^3,localXNorm^2,localXNorm,1};
</div>
<!--l. 162--><p class=\"nopar\">
<!--l. 164--></p><p class=\"noindent\">Hereby <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">LengthX</span></span></span> denotes the total length of the surface, <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">nu</span></span></span> the number of elements in the <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">x</span></span></span>

direction and <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">localX</span></span></span> is the position in the currently ?active? rectangular element. These
values are then used to compute <span class=\"cmbx-10x-x-109\">X</span> and do the interpolation. The same is done for the <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">z</span></span></span>
coordinate.
<!--l. 166--></p><p class=\"noindent\">The number of connected rectangles is defined by [<span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">nu</span></span></span>, <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">nv</span></span></span>] as depicted in Figure&nbsp;<a href=\"#x1-116003r3\">2<!--tex4ht:ref: F_SurfaceFigure --></a>.

</p><hr class=\"figure\"><div class=\"figure\"><table class=\"figure\"><tbody><tr class=\"figure\"><td class=\"figure\">


<a id=\"x1-116003r3\"></a>


<div class=\"center\">
<!--l. 169--><p class=\"noindent\">
<a id=\"x1-116001r1\"></a>
</p><div class=\"subfigure\"><table><tbody><tr><td style=\"text-align: left;\"><span class=\"colorbox\" id=\"colorbox8\"> <img src=\"../images/Master_Doku_MarkusAndres175x.png\" alt=\"PIC\" class=\"graphics\" width=\"177.82973pt\" height=\"175.92517pt\"><!--tex4ht:graphics
name=\"Master_Doku_MarkusAndres175x.png\" src=\"pics/Surface.eps\"
--></span>
             <div class=\"subfigcaption\"><span class=\"cmr-9\">(a) Point indexes.</span></div>             </td></tr></tbody></table></div> &nbsp;
<a id=\"x1-116002r2\"></a><div class=\"subfigure\"><table><tbody><tr><td style=\"text-align: left;\"><span class=\"colorbox\" id=\"colorbox9\"> <img src=\"../images/Master_Doku_MarkusAndres176x.png\" alt=\"PIC\" class=\"graphics\" width=\"177.82973pt\" height=\"176.56155pt\"><!--tex4ht:graphics
name=\"Master_Doku_MarkusAndres176x.png\" src=\"pics/SurfaceIndex.eps\"
--></span>
             <div class=\"subfigcaption\"><span class=\"cmr-9\">(b) Area indexes.</span></div>             </td></tr></tbody></table></div> </div>

<br> <div class=\"caption\"><table class=\"caption\"><tbody><tr style=\"vertical-align: baseline;\" class=\"caption\"><td class=\"id\">Figure&nbsp;2: </td><td class=\"content\">Coordinates for multiple rectangles added together to form a bigger surface.</td></tr></tbody></table></div><!--tex4ht:label?: x1-116003r3 -->


<!--l. 181--><p class=\"noindent\"></p></td></tr></tbody></table></div><hr class=\"endfigure\">
<!--l. 183--><p class=\"noindent\">The size of the corresponding matrices of dy/dx and dy/dz obviously has to match the values of
<span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">nu</span></span></span>, <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">nv</span></span></span>.

<!--l. 185--></p><p class=\"noindent\">Therefore, the function <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">get_rectangle</span></span></span> was created and returns the values given below, as
this is useful for both functions <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">get_elevation</span></span></span> and <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">get_eN</span></span></span>.
     </p><ul class=\"itemize1\">
     <li class=\"itemize\"><span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">xIndex</span></span></span> - The index in <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">x</span></span></span> direction, denoting the area which the tire is in (see
     Figure&nbsp;<a href=\"#x1-116002r2\">2(b)<!--tex4ht:ref: F_SurfaceIndex --></a>).
     </li>

     <li class=\"itemize\"><span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">zIndex</span></span></span> - Same as <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">xIndex</span></span></span> for the <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">z</span></span></span> direction.
     </li>
     <li class=\"itemize\"><span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">inArea</span></span></span> - A boolean variable denoting whether the tire is in the area where a
     surface is defined or not<span class=\"footnote-mark\"><a href=\"Master_Doku_MarkusAndres16.html#fn1x5\"><sup class=\"textsuperscript\"></sup></a></span><a id=\"x1-116004f1\"></a>.
     </li>

     <li class=\"itemize\"><span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">localX</span></span></span> - The position in <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">x</span></span></span> direction in the current rectangle.
     </li>
     <li class=\"itemize\"><span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">localZ</span></span></span> - The same as <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">localX</span></span></span> in the <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">z</span></span></span> direction.</li></ul>

<!--l. 194--><p class=\"noindent\">Figure&nbsp;<a href=\"#x1-115001r2\">1<!--tex4ht:ref: F_SurfaceParameters --></a> shows the parameter window for the configuration of a <span class=\"cmti-10x-x-109\">Surface </span>class. Here
a quite simple one is shown with just two values 0 and all partial derivatives
= 0.
</p>

<h4>The Visualization</h4>
<!--l. 197--><p class=\"noindent\">For the visualization of the <span class=\"cmti-10x-x-109\">Surface</span>, the <span class=\"cmti-10x-x-109\">Surface Material </span>class is used. This is a class
provided with Dymola enabling a visualization of parametric surfaces.

<!--l. 199--></p><p class=\"noindent\">To utilize this class, one has to set the number of grid points <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">nu</span></span></span> and <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">nv</span></span></span> as they are shown in
Figure&nbsp;<a href=\"#x1-116001r1\">2(a)<!--tex4ht:ref: F_Surface --></a> . To be able to visualize the surface, one has to set <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">x</span></span></span>, <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">y</span></span></span> and <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">z</span></span></span>

coordinates for every point in that grid. As the surfaces in the <span class=\"cmti-10x-x-109\">Wheels and Tires </span>library have
a regular grid, this can be done by a double loop for the <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">x</span></span></span> and <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">z</span></span></span> coordinates in a linear
fashion. Building a grid for the visualization with exactly as many grid points used to define
the single sections of the surface results in a visualization shown in Figure&nbsp;<a href=\"#x1-117001r4\">3<!--tex4ht:ref: F_SurfaceResultNotIterpolated --></a>.


</p><hr class=\"figure\"><div class=\"figure\"><table class=\"figure\"><tbody><tr class=\"figure\"><td class=\"figure\">


<a id=\"x1-117001r4\"></a>


<div class=\"center\">
<!--l. 202--><p class=\"noindent\">

<!--l. 203--></p><p class=\"noindent\"><img src=\"../images/Master_Doku_MarkusAndres179x.png\" alt=\"PIC\" class=\"graphics\" width=\"241.84843pt\" height=\"134.52405pt\"><!--tex4ht:graphics
name=\"Master_Doku_MarkusAndres179x.png\" src=\"pics/SurfaceResultNotIterpolated.eps\"
--></p></div>
<br> <div class=\"caption\"><table class=\"caption\"><tbody><tr style=\"vertical-align: baseline;\" class=\"caption\"><td class=\"id\">Figure&nbsp;3: </td><td class=\"content\">The result of the surface configuration shown in Figure&nbsp;<a href=\"#x1-115001r2\">1<!--tex4ht:ref: F_SurfaceParameters --></a> without any
further interpolation for the visualization.</td></tr></tbody></table></div><!--tex4ht:label?: x1-117001r4 -->


<!--l. 207--><p class=\"noindent\"></p></td></tr></tbody></table></div><hr class=\"endfigure\">
<!--l. 209--><p class=\"noindent\">This will return the same simulation results as the one in Figure <a href=\"#x1-117002r5\">4<!--tex4ht:ref: F_SurfaceResult --></a> </p><hr class=\"figure\"><div class=\"figure\"><table class=\"figure\"><tbody><tr class=\"figure\"><td class=\"figure\">


<a id=\"x1-117002r5\"></a>



<div class=\"center\">
<!--l. 212--><p class=\"noindent\">
<!--l. 213--></p><p class=\"noindent\"><img src=\"../images/Master_Doku_MarkusAndres180x.png\" alt=\"PIC\" class=\"graphics\" width=\"241.84843pt\" height=\"1315157pt\"><!--tex4ht:graphics
name=\"Master_Doku_MarkusAndres180x.png\" src=\"pics/SurfaceResult.eps\"
--></p></div>
<br> <div class=\"caption\"><table class=\"caption\"><tbody><tr style=\"vertical-align: baseline;\" class=\"caption\"><td class=\"id\">Figure&nbsp;4: </td><td class=\"content\">The result of the surface configuration shown in Figure&nbsp;<a href=\"#x1-115001r2\">1<!--tex4ht:ref: F_SurfaceParameters --></a> without a <span class=\"cmtt-10x-x-109\">PNG</span>
as texture.</td></tr></tbody></table></div><!--tex4ht:label?: x1-117002r5 -->


<!--l. 217--><p class=\"noindent\"></p></td></tr></tbody></table></div><hr class=\"endfigure\">

<!--l. 219--><p class=\"noindent\">but with a confusing visualization. Therefore the parameter <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">IP</span></span></span> (see Figure&nbsp;<a href=\"#x1-115001r2\">1<!--tex4ht:ref: F_SurfaceParameters --></a>
has been introduced. This adds <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">IP</span></span></span> points between the original grid points providing a much
smoother visualization.
<!--l. 221--></p>

It is important that the interpolation just has optical reasons. The real values of <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">y</span></span></span> and <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">eN</span></span></span> the
simulation is based on are determined totally smoothly and independent of the
visualization.

<h4> Implementation Details </h4>
<p class=\"noindent\">In order to get functions in Dymola using parameters of a superposed model, it is possible to
utilize protected functions. This can be done in the following way.


</p><div class=\"verbatim\">
public
&nbsp;<br>&nbsp;&nbsp;function&nbsp;get_eN&nbsp;=&nbsp;get_eN_protected&nbsp;(

&nbsp;<br>&nbsp;&nbsp;&nbsp;&nbsp;Parameter1&nbsp;=&nbsp;Parameter1,
&nbsp;<br>&nbsp;&nbsp;&nbsp;&nbsp;Parameter2&nbsp;=&nbsp;Parameter2);
</div>
<!--l. 123--><p class=\"nopar\"> Where <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">get_eN_protected</span></span></span> is the function implementing the \"real\" body. The code
section above is just useful to pass parameters to the function without the user
caring about these. The protected function then receives these values as inputs as
follows.


</p><div class=\"verbatim\">
protected
&nbsp;<br>&nbsp;&nbsp;function&nbsp;get_eN_protected
&nbsp;<br>&nbsp;&nbsp;&nbsp;&nbsp;extends&nbsp;get_eN_Base;&nbsp;&nbsp;//&nbsp;adds&nbsp;x&nbsp;and&nbsp;z&nbsp;as&nbsp;inputs&nbsp;and&nbsp;eN[3]&nbsp;as&nbsp;output

&nbsp;<br>&nbsp;&nbsp;&nbsp;&nbsp;input&nbsp;Real&nbsp;Parameter1;
&nbsp;<br>&nbsp;&nbsp;&nbsp;&nbsp;input&nbsp;Real&nbsp;Parameter2;
&nbsp;<br>&nbsp;&nbsp;algorithm
&nbsp;<br>&nbsp;&nbsp; ...
&nbsp;<br>&nbsp;&nbsp;end&nbsp;get_eN_protected;
</div>
<!--l. 134--><p class=\"nopar\"> The result of this, at first sight slightly obscure construction, is that the user is able to call
<span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">get_eN(x,z)</span></span></span> with the function gathering the parameters from the <span class=\"cmti-10x-x-109\">Surface </span>on it?s own.
Otherwise, the call would have to include all the parameters from the surface which does not
make sense at all. So e.g.&nbsp;the <span class=\"cmti-10x-x-109\">Geometry </span>class would have to know about the parameters of
the <span class=\"cmti-10x-x-109\">Surface </span>class.

<!--l. 137--></p><p class=\"noindent\">Another important aspect describing the functionality of the <span class=\"cmti-10x-x-109\">Surface </span>class can be seen when
looking at the last code section. The base function is extended by the <span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">get</span></span></span><span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">_eN</span></span></span><span class=\"obeylines-h\"><span class=\"verb\"><span class=\"cmtt-10x-x-109\">protected</span></span></span>
function in order to add standardized in- and outputs.
<!--l. 139--></p>

</html>"));
    protected
      WheelsAndTires.Visualization.SurfaceVisualization
        surfaceVisualizationNotFlat(
        nu=nu,
        nv=nv,
        IP=IP,
        PNG=PNG,
        Color=Color,
        SpecularCoefficient=SpecularCoefficient,
        LengthX=LengthX,
        LengthZ=LengthZ,
        OffsetX=OffsetX,
        OffsetZ=OffsetZ,
        y=y,
        dy_dx=dy_dx,
        dy_dz=dy_dz) if visSurface and not FlatSurface;

      WheelsAndTires.Visualization.SurfaceVisualization
        surfaceVisualizationFlat(
        nu=nu,
        nv=nv,
        IP=IP,
        PNG=PNG,
        Color=Color,
        SpecularCoefficient=SpecularCoefficient,
        LengthX=LengthX,
        LengthZ=LengthZ,
        OffsetX=OffsetX,
        OffsetZ=OffsetZ,
        y=zeros(nu,nv),
        dy_dx=zeros(nu,nv),
        dy_dz=zeros(nu,nv)) if visSurface and FlatSurface;
    end Surface;

    annotation (Icon, Documentation(info="<html>

The environment in the current version of the library is limited to even or uneven surfaces
which the tire can have contact to. A very simple approach to describe an even surface is
to set the contact point to a constant height and the frictional coefficient to a
constant value as well. This simplifies some of the essential parts of tire modeling
drastically. Although it may not be the very core of the library, it was decided to
create an uneven surface, even if it is still a rather simple one. The main aspect of
this part is to create a kind of framework that guides future modelers through
expanding the library with more complex surfaces that the tire model is compatible
with.
<!--l. 5--></p><p class=\"noindent\">The following sections describe the <span class=\"cmti-10x-x-109\">Surface Base </span>that is intended to form the framework.
Afterwards, the section <span class=\"cmti-10x-x-109\">Surface </span>describes the implementation chosen in the <span class=\"cmti-10x-x-109\">Wheels And Tires</span>

library.
</p>

</html>"));
  end Environment;

  package TestBench
    "contains modles to check basic functionality of tire component and surface classes"
    annotation(preferedView="info");

    extends WheelsAndTires.TireComponents.Utilities.Icons.TestBenchPackage;

    package Elevation "contains models to test the vertical dynamics class."
      annotation(preferedView="info");

      extends WheelsAndTires.TireComponents.Utilities.Icons.TestBenchPackage;

      model Simple "tests the vertical dynamics class withouth a yaw angle."

        extends WheelsAndTires.TireComponents.Utilities.Icons.TestBenchModel;

        Tires.Belt.Slipping TestTire  annotation (extent=[-100,10; -80,30]);
        MultiBondLib.Mechanics3D.Joints.ActuatedPrismatic pris_Y(
          n={0,1,0})
          annotation (extent=[60,-30; 80,-10], rotation=90);
        MultiBondLib.Mechanics3D.Parts.Fixed fixed
                          annotation (extent=[60,-60; 80,-40], rotation=90);
        MultiBondLib.Mechanics3D.Joints.ActuatedPrismatic aPris_X(
            s_start=0, initType=Modelica.Mechanics.MultiBody.Types.Init.PositionVelocity)
          annotation (extent=[40,10; 60,30]);
        MultiBondLib.Mechanics3D.Joints.ActuatedRevolute aRev_Z(initType=Modelica.Mechanics.MultiBody.Types.Init.Free)
          annotation (extent=[-60,10; -40,30], rotation=180);
        annotation (Diagram,
          experiment(StopTime=5, NumberOfIntervals=1500),
          experimentSetupOutput,
          Documentation(info="<html>

<p>
This model accelerates the tire by a torque and a force lets it elevate from the ground. <br>
</p>

<img src=\"../images/ElevationSimple.png\" </img>

</html>"));
        inner MultiBondLib.Mechanics3D.World3D world3D
                              annotation (extent=[-100,-100; -80,-80]);
        MultiBondLib.Mechanics3D.Joints.ActuatedPrismatic aPris_Z(
          n={0,0,1},
          s_start=0.1,
          initType=Modelica.Mechanics.MultiBody.Types.Init.PositionVelocity)
          annotation (extent=[-8,10; 12,30],  rotation=180);
        BondLib.Mechanical.Rotational.Sources.Torque torque
          annotation (extent=[-53,40; -33,60], rotation=270);
        Modelica.Blocks.Sources.Trapezoid trapezoid_torque(
          nperiod=1,
          startTime=-1,
          period=8,
          amplitude=4,
          offset=-2,
          rising=2,
          width=2,
          falling=2) annotation (extent=[-53,73; -33,93], rotation=270);
        BondLib.Mechanical.Translational.Sources.Force force
          annotation (extent=[32,-23; 52,-3],  rotation=0);
        Modelica.Blocks.Math.Add3 add3_1 annotation (extent=[0,-50; 20,-30]);
        Modelica.Blocks.Sources.Step step(height=-300, startTime=5)
          annotation (extent=[-40,-50; -20,-30]);
        Modelica.Blocks.Sources.Trapezoid trapezoid(
          rising=1e-3,
          falling=1e-3,
          nperiod=1,
          startTime=1,
          width=1e-1,
          amplitude=200)
                      annotation (extent=[-40,-20; -20,0]);
        Modelica.Blocks.Sources.Step step1(height=300, startTime=8)
          annotation (extent=[-40,-80; -20,-60]);
        inner Environment.Surface Surface(
          LengthX=4,
          LengthZ=1,
          OffsetX=-0.5)                   annotation (extent=[80,-100; 100,-80]);
      equation
        connect(pris_Y.frame_a, fixed.frame_b)      annotation (points=[70,-31;
              70,-39], style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(torque.flange_b, aRev_Z.bearing) annotation (points=[-43,40;
              -43,27],                     style(color=0, rgbcolor={0,0,0}));
        connect(torque.bearing, aRev_Z.axis) annotation (points=[-53,50; -54,50;
              -54,40; -57,40; -57,27], style(color=0, rgbcolor={0,0,0}));
        connect(trapezoid_torque.y, torque.tau) annotation (points=[-43,72; -43,
              61], style(color=74, rgbcolor={0,0,127}));
        connect(aPris_X.frame_a, aPris_Z.frame_a) annotation (points=[39,20; 13,20],
                   style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(aPris_X.frame_b, pris_Y.frame_b) annotation (points=[61,20; 70,
              20; 70,-9],
                       style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(force.flange_b, pris_Y.axis)   annotation (points=[52,-13; 63,
              -13],
            style(color=58, rgbcolor={0,127,0}));
        connect(add3_1.y, force.f)   annotation (points=[21,-40; 28,-40; 28,-13;
              33,-13],                                                    style(
              color=74, rgbcolor={0,0,127}));
        connect(trapezoid.y, add3_1.u1) annotation (points=[-19,-10; -10,-10; -10,
              -32; -2,-32], style(color=74, rgbcolor={0,0,127}));
        connect(step.y, add3_1.u2) annotation (points=[-19,-40; -2,-40], style(
              color=74, rgbcolor={0,0,127}));
        connect(step1.y, add3_1.u3) annotation (points=[-19,-70; -9.5,-70; -9.5,-48;
              -2,-48],      style(color=74, rgbcolor={0,0,127}));
        connect(aRev_Z.frame_a, aPris_Z.frame_b) annotation (points=[-39,20; -9,
              20], style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(TestTire.TireHub, aRev_Z.frame_b) annotation (points=[-80,20;
              -61,20], style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
      end Simple;

      model Advanced
        "tests the vertical dynamics class with changing yaw angle."

        extends WheelsAndTires.TireComponents.Utilities.Icons.TestBenchModel;

        WheelsAndTires.Tires.Belt.Advanced TestTire
                                      annotation (extent=[-100,10; -80,30]);
        MultiBondLib.Mechanics3D.Joints.ActuatedPrismatic aPris_Y(
          n={0,1,0})
          annotation (extent=[60,-30; 80,-10], rotation=90);
        MultiBondLib.Mechanics3D.Parts.Fixed fixed
                          annotation (extent=[60,-60; 80,-40], rotation=90);
        MultiBondLib.Mechanics3D.Joints.ActuatedPrismatic aPris_X(initType=
              Modelica.Mechanics.MultiBody.Types.Init.Position)
          annotation (extent=[44,10; 64,30]);
        MultiBondLib.Mechanics3D.Joints.ActuatedRevolute aRev_Z(initType=Modelica.Mechanics.MultiBody.Types.Init.Position)
          annotation (extent=[-65,10; -45,30], rotation=180);
        annotation (Diagram,
          experiment(StopTime=10, NumberOfIntervals=2500),
          experimentSetupOutput,
          Documentation(info="<html>

<p>
This model accalerates the tire by a torque with a predefined ywa angle profile and a force lets it elevate from the ground. <br>
</p>

<img src=\"../images/ElevationAdvanced.png\" </img>

</html>"));
        inner MultiBondLib.Mechanics3D.World3D world3D
                              annotation (extent=[-100,-100; -80,-80]);
        MultiBondLib.Mechanics3D.Joints.ActuatedPrismatic aPris_Z(
          n={0,0,1}, initType=Modelica.Mechanics.MultiBody.Types.Init.Position)
          annotation (extent=[12,10; 32,30],  rotation=180);
        Modelica.Blocks.Sources.Sine sine_anglularVelocity(
          amplitude=5,
          freqHz=0.2,
          offset=5,
          phase=3*Modelica.Constants.pi/2)
                     annotation (extent=[-72,73; -52,93], rotation=270);
        BondLib.Mechanical.Translational.Sources.Force force
          annotation (extent=[32,-23; 52,-3],  rotation=0);
        Modelica.Blocks.Math.Add3 add3_1 annotation (extent=[0,-50; 20,-30]);
        Modelica.Blocks.Sources.Step step(height=-300, startTime=6)
          annotation (extent=[-40,-50; -20,-30]);
        Modelica.Blocks.Sources.Trapezoid trapezoid(
          rising=1e-3,
          falling=1e-3,
          nperiod=1,
          width=1e-1,
          startTime=2,
          amplitude=200)
                      annotation (extent=[-40,-20; -20,0]);
        Modelica.Blocks.Sources.Step step1(height=300, startTime=8)
          annotation (extent=[-40,-80; -20,-60]);
        MultiBondLib.Mechanics3D.Joints.ActuatedRevolute aRev_Y(n={0,1,0},
            initType=Modelica.Mechanics.MultiBody.Types.Init.Position)
          annotation (extent=[-25,10; -5,30],  rotation=180);
        WheelsAndTires.TireComponents.Utilities.AdditionalBG.Angle phiY
          annotation (extent=[-32,36; -12,56], rotation=270);
        Modelica.Blocks.Sources.Sine trapezoid_Bore(
          startTime=0,
          freqHz=0.2,
          amplitude=Modelica.Constants.pi/4)
                     annotation (extent=[-32,73; -12,93], rotation=270);
        WheelsAndTires.TireComponents.Utilities.AdditionalBG.AngularVelocity wZ
          annotation (extent=[-72,38; -52,58], rotation=270);
        inner Environment.Surface Surface(
          LengthX=25,
          LengthZ=10,
          OffsetX=-24)
          annotation (extent=[80,-100; 100,-80]);
      equation
        connect(aPris_Y.frame_a, fixed.frame_b)     annotation (points=[70,-31;
              70,-39], style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(aPris_X.frame_a, aPris_Z.frame_a) annotation (points=[43,20; 33,
              20], style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(aPris_X.frame_b, aPris_Y.frame_b)
                                                 annotation (points=[65,20; 70,
              20; 70,-9],
                       style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(force.flange_b, aPris_Y.axis)  annotation (points=[52,-13; 63,
              -13],
            style(color=58, rgbcolor={0,127,0}));
        connect(add3_1.y, force.f)   annotation (points=[21,-40; 28,-40; 28,-13;
              33,-13],                                                    style(
              color=74, rgbcolor={0,0,127}));
        connect(trapezoid.y, add3_1.u1) annotation (points=[-19,-10; -10,-10; -10,
              -32; -2,-32], style(color=74, rgbcolor={0,0,127}));
        connect(step.y, add3_1.u2) annotation (points=[-19,-40; -2,-40], style(
              color=74, rgbcolor={0,0,127}));
        connect(step1.y, add3_1.u3) annotation (points=[-19,-70; -9.5,-70; -9.5,-48;
              -2,-48],      style(color=74, rgbcolor={0,0,127}));
        connect(phiY.flange_b, aRev_Y.axis)
                                           annotation (points=[-22,36; -22,31.5;
              -22,31.5; -22,27], style(color=0, rgbcolor={0,0,0}));
        connect(phiY.phi_ref, trapezoid_Bore.y)
                                               annotation (points=[-22,57; -22,
              60.75; -22,60.75; -22,64.5; -22,72; -22,72],
                               style(color=74, rgbcolor={0,0,127}));
        connect(aRev_Y.frame_a, aPris_Z.frame_b) annotation (points=[-4,20; 11,20],
            style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(aRev_Y.frame_b, aRev_Z.frame_a) annotation (points=[-26,20; -44,
              20], style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(aRev_Z.axis, wZ.flange_b)
          annotation (points=[-62,27; -62,38], style(color=0, rgbcolor={0,0,0}));
        connect(wZ.w_ref, sine_anglularVelocity.y) annotation (points=[-62,59;
              -62,72],         style(
            color=74,
            rgbcolor={0,0,127},
            fillColor=58,
            rgbfillColor={0,127,0},
            fillPattern=1));
        connect(TestTire.TireHub, aRev_Z.frame_b) annotation (points=[-80,20;
              -66,20], style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
      end Advanced;
      annotation (Icon, Documentation(info="<html>

The models contained in this package are intended to test the Vertical Dynamics classes. The tire is fixed by prismatic and revolute joints to ensure a reasonable behavior.

</html>"));
    end Elevation;

    package FrictionEffects
      "contains models to test frictional effects contained in the tire componens package"
      annotation(preferedView="info");

      extends WheelsAndTires.TireComponents.Utilities.Icons.TestBenchPackage;

      model SlipLong
        "tests slip in longitudinal direction by accelerating the tire in longitudinal direction."

        extends WheelsAndTires.TireComponents.Utilities.Icons.TestBenchModel;

        Tires.Belt.Slipping TestTire  annotation (extent=[-100,-10; -80,10]);
        MultiBondLib.Mechanics3D.Joints.ActuatedPrismatic pris_Y(
          n={0,1,0})
          annotation (extent=[60,-50; 80,-30], rotation=90);
        MultiBondLib.Mechanics3D.Parts.Fixed fixed
                          annotation (extent=[60,-80; 80,-60], rotation=90);
        MultiBondLib.Mechanics3D.Joints.ActuatedPrismatic aPris_X(initType=Modelica.Mechanics.MultiBody.Types.Init.Position,
            s_start=0)
          annotation (extent=[40,-10; 60,10]);
        MultiBondLib.Mechanics3D.Joints.ActuatedRevolute aRev_Z(initType=Modelica.Mechanics.MultiBody.Types.Init.PositionVelocity)
          annotation (extent=[-60,-10; -40,10],rotation=180);
        annotation (Diagram,
          experiment(StopTime=2.5, NumberOfIntervals=625),
          experimentSetupOutput,
          Documentation(info="<html>

<p>
This model accelerates the tire by a strong torque making the tire slip in both longitudinal directions. <br>
</p>

<img src=\"../images/SlipLong.png\" </img>

</html>"));
        inner MultiBondLib.Mechanics3D.World3D world3D
                              annotation (extent=[-100,-100; -80,-80]);
        MultiBondLib.Mechanics3D.Joints.ActuatedPrismatic aPris_Z(
          n={0,0,1},
          s_start=0.1,
          initType=Modelica.Mechanics.MultiBody.Types.Init.Position)
          annotation (extent=[-13,-10; 7,10], rotation=180);
        WheelsAndTires.TireComponents.Utilities.AdditionalBG.AngularVelocity
          torque
          annotation (extent=[-67,14; -47,34], rotation=270);
        inner Environment.Surface Surface(
          LengthZ=1,
          LengthX=4,
          OffsetX=-3.5)
          annotation (extent=[-60,-100; -40,-80]);
        Modelica.Blocks.Continuous.FirstOrder firstOrder(T=0.1)
          annotation (extent=[-62,41; -52,52], rotation=270);
        Modelica.Blocks.Sources.Sine sine(amplitude=20, startTime=0.5)
          annotation (extent=[-67,72; -47,92], rotation=270);
      equation
        connect(pris_Y.frame_a, fixed.frame_b)      annotation (points=[70,-51;
              70,-59], style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(aPris_Z.frame_b, aRev_Z.frame_a) annotation (points=[-14,
              1.34707e-015; -39,-1.34707e-015],
                   style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(aPris_X.frame_a, aPris_Z.frame_a) annotation (points=[39,0; 8,
              -1.34707e-015],
                   style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(aPris_X.frame_b, pris_Y.frame_b) annotation (points=[61,0; 70,0; 70,
              -29],    style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(TestTire.TireHub, aRev_Z.frame_b) annotation (points=[-80,0;
              -61,1.34707e-015],
                       style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(torque.flange_b, aRev_Z.axis) annotation (points=[-57,14; -56.5,
              14; -56.5,7; -57,7], style(color=0, rgbcolor={0,0,0}));
        connect(firstOrder.y, torque.w_ref) annotation (points=[-57,40.45; -57,
              35], style(color=74, rgbcolor={0,0,127}));
        connect(sine.y, firstOrder.u) annotation (points=[-57,71; -57,53.1],
            style(color=74, rgbcolor={0,0,127}));
      end SlipLong;

      model SlipLat
        "test slip in lateral direction by moving the tire sideways."

        extends WheelsAndTires.TireComponents.Utilities.Icons.TestBenchModel;

        Tires.Belt.Slipping TestTire  annotation (extent=[-100,10; -80,30]);
        MultiBondLib.Mechanics3D.Joints.ActuatedPrismatic pris_Y(
          n={0,1,0})
          annotation (extent=[60,-30; 80,-10], rotation=90);
        MultiBondLib.Mechanics3D.Parts.Fixed fixed
                          annotation (extent=[60,-60; 80,-40], rotation=90);
        MultiBondLib.Mechanics3D.Joints.ActuatedPrismatic aPris_X(initType=Modelica.Mechanics.MultiBody.Types.Init.Position,
            s_start=0)
          annotation (extent=[40,10; 60,30]);
        MultiBondLib.Mechanics3D.Joints.ActuatedRevolute aRev_Z(initType=Modelica.Mechanics.MultiBody.Types.Init.PositionVelocity)
          annotation (extent=[-60,10; -40,30], rotation=180);
        annotation (Diagram,
          experiment(StopTime=2),
          experimentSetupOutput,
          Documentation(info="<html>

<p>
This model moves the tire by a Position Source with the tire slip in both lateral directions. <br>
</p>

<img src=\"../images/SlipLat.png\" </img>

</html>"));
        inner MultiBondLib.Mechanics3D.World3D world3D
                              annotation (extent=[-100,-100; -80,-80]);
        MultiBondLib.Mechanics3D.Joints.ActuatedPrismatic aPris_Z(
          n={0,0,1},
          s_start=0.1,
          initType=Modelica.Mechanics.MultiBody.Types.Init.Position)
          annotation (extent=[-8,10; 12,30],  rotation=180);
        WheelsAndTires.TireComponents.Utilities.AdditionalBG.Position position
          annotation (extent=[-15,-20; 5,0], rotation=90);
        Modelica.Blocks.Sources.Sine LateralSpeed(amplitude=1, startTime=0.5)
                      annotation (extent=[-15,-82; 5,-62], rotation=90);
        inner Environment.Surface Surface(LengthX=1, LengthZ=2)
          annotation (extent=[-60,-100; -40,-80]);
        Modelica.Blocks.Continuous.FirstOrder firstOrder(T=0.1)
          annotation (extent=[-15,-50; 5,-30], rotation=90);
      equation
        connect(pris_Y.frame_a, fixed.frame_b)      annotation (points=[70,-31;
              70,-39], style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(aPris_Z.frame_b, aRev_Z.frame_a) annotation (points=[-9,20; -39,
              20], style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(aPris_X.frame_a, aPris_Z.frame_a) annotation (points=[39,20; 13,20],
                   style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(aPris_X.frame_b, pris_Y.frame_b) annotation (points=[61,20; 70,
              20; 70,-9],
                       style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(position.flange_b, aPris_Z.axis)
                                              annotation (points=[-5,0; -5,3.25;
              -5,3.25; -5,6.5; -5,13; -5,13], style(color=58, rgbcolor={0,127,0}));
        connect(TestTire.TireHub, aRev_Z.frame_b) annotation (points=[-80,20; -61,20],
            style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(firstOrder.u, LateralSpeed.y) annotation (points=[-5,-52; -5,
              -54.25; -5,-54.25; -5,-56.5; -5,-61; -5,-61], style(color=74,
              rgbcolor={0,0,127}));
        connect(position.s_ref, firstOrder.y)
                                           annotation (points=[-5,-21; -5,-23;
              -5,-23; -5,-25; -5,-29; -5,-29],
                               style(color=74, rgbcolor={0,0,127}));
      end SlipLat;

      model RollResistance
        "tests the rolling resistance by accelerating the tire."

        extends WheelsAndTires.TireComponents.Utilities.Icons.TestBenchModel;

        annotation (Diagram,
          experiment(StopTime=240, NumberOfIntervals=6000),
          experimentSetupOutput,
          Documentation(info="<html>

<p>
This model moves the tire by a Velocity Source with rising speed in longitudinal direction. <br>
</p>

<img src=\"../images/RollResistance.png\" </img>

</html>"));
        inner MultiBondLib.Mechanics3D.World3D world3D
                              annotation (extent=[-100,-100; -80,-80]);
        Tires.Belt.Slipping TestTire  annotation (extent=[-90,0; -70,20]);
        MultiBondLib.Mechanics3D.Joints.ActuatedPrismatic pris_Y(
          n={0,1,0})
          annotation (extent=[70,-30; 90,-10], rotation=90);
        MultiBondLib.Mechanics3D.Parts.Fixed fixed
                          annotation (extent=[70,-70; 90,-50], rotation=90);
        MultiBondLib.Mechanics3D.Joints.ActuatedPrismatic aPris_X(initType=Modelica.Mechanics.MultiBody.Types.Init.Position,
            s_start=0)
          annotation (extent=[50,0; 70,20]);
        MultiBondLib.Mechanics3D.Joints.ActuatedRevolute aRev_Z
          annotation (extent=[-50,0; -30,20],  rotation=180);
        MultiBondLib.Mechanics3D.Joints.ActuatedPrismatic aPris_Z(
          n={0,0,1},
          s_start=0.1,
          initType=Modelica.Mechanics.MultiBody.Types.Init.Position)
          annotation (extent=[16,0; 36,20],   rotation=180);
        WheelsAndTires.TireComponents.Utilities.AdditionalBG.Velocity Velocity
          annotation (extent=[57,30; 77,50],   rotation=270);
        MultiBondLib.Mechanics3D.Joints.ActuatedRevolute aRev_Y(n={0,1,0})
          annotation (extent=[-16,0; 4,20],    rotation=180);
        Modelica.Blocks.Sources.Trapezoid longitudinalAngularVelocity(
          amplitude=200,
          offset=-100,
          nperiod=1,
          rising=60,
          width=60,
          falling=60,
          startTime=-30,
          period=240)  annotation (extent=[57,70; 77,90],   rotation=270);
        inner Environment.Surface Surface(
          LengthZ=4,
          OffsetX=5,
          LengthX=-10000)
                      annotation (extent=[-60,-100; -40,-80]);
      equation
        connect(pris_Y.frame_a,fixed. frame_b)      annotation (points=[80,-31;
              80,-49], style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(aPris_X.frame_a,aPris_Z. frame_a) annotation (points=[49,10; 43,
              10; 43,10; 37,10],
                   style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(aPris_X.frame_b,pris_Y. frame_b) annotation (points=[71,10; 80,
              10; 80,-9],
                       style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(aRev_Z.frame_a, aRev_Y.frame_b)  annotation (points=[-29,10;
              -26,10; -26,10; -23,10; -23,10; -17,10],
                             style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(aRev_Y.frame_a, aPris_Z.frame_b)  annotation (points=[5,10; 7.5,
              10; 7.5,10; 10,10; 10,10; 15,10],
                             style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(TestTire.TireHub, aRev_Z.frame_b) annotation (points=[-70,10;
              -60.5,10; -60.5,10; -51,10], style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(Velocity.flange_b, aPris_X.axis)        annotation (points=[67,
              30; 67,17], style(color=58, rgbcolor={0,127,0}));
        connect(longitudinalAngularVelocity.y, Velocity.v_ref) annotation (
            points=[67,69; 67,51],               style(color=74, rgbcolor={0,0,
                127}));
      end RollResistance;

      model BoreTorque "tests the bore torque by rotating the tire."

        extends WheelsAndTires.TireComponents.Utilities.Icons.TestBenchModel;

        WheelsAndTires.Tires.Belt.Advanced TestTire
                                      annotation (extent=[-88,-30; -68,-10]);
        MultiBondLib.Mechanics3D.Joints.ActuatedPrismatic pris_Y(
          n={0,1,0})
          annotation (extent=[70,-62; 90,-42], rotation=90);
        MultiBondLib.Mechanics3D.Parts.Fixed fixed
                          annotation (extent=[70,-100; 90,-80],rotation=90);
        annotation (Diagram,
          experiment(StopTime=20, NumberOfIntervals=5000),
          experimentSetupOutput,
          Documentation(info="<html>

<p>
This model rotates the tire around its vertical axis making it exhibt bore torque. <br>
</p>

<img src=\"../images/BoreTorque.png\" </img>

</html>"));
        inner MultiBondLib.Mechanics3D.World3D world3D
                              annotation (extent=[-100,-100; -80,-80]);
        MultiBondLib.Mechanics3D.Joints.ActuatedRevolute aRev_Y(n={0,1,0},
            initType=Modelica.Mechanics.MultiBody.Types.Init.PositionVelocity)
          annotation (extent=[-21,-30; -1,-10],rotation=180);
        Modelica.Blocks.Sources.Trapezoid trapezoid_Bore(
          width=1,
          period=7,
          nperiod=-1,
          rising=1,
          falling=1,
          offset=0,
          startTime=0,
          amplitude=2*Modelica.Constants.pi)
                     annotation (extent=[16,70; 36,90],   rotation=0);
      public
        MultiBondLib.Mechanics3D.Joints.ActuatedRevolute aRev_Z
          annotation (extent=[-54,-30; -34,-10],
                                               rotation=180);
        Modelica.Blocks.Sources.Ramp trapezoid_Speed(
          duration=0.5,
          height=.1*Modelica.Constants.pi,
          startTime=13.25)
                     annotation (extent=[-40,70; -20,90], rotation=270);
      public
        MultiBondLib.Mechanics3D.Joints.ActuatedPrismatic pris_X(
          n={1,0,0}, initType=Modelica.Mechanics.MultiBody.Types.Init.PositionVelocity)
          annotation (extent=[44,-30; 64,-10], rotation=180);
        MultiBondLib.Mechanics3D.Joints.ActuatedPrismatic pris_Z(
          n={0,0,1},
          initType=Modelica.Mechanics.MultiBody.Types.Init.Position,
          s_start=.1)
          annotation (extent=[12,-30; 32,-10], rotation=180);
        WheelsAndTires.TireComponents.Utilities.AdditionalBG.AngularVelocity
          anglularVelocityBore
                              annotation (extent=[-28,2; -8,22],   rotation=270);
        WheelsAndTires.TireComponents.Utilities.AdditionalBG.AngularVelocity
          angularVelocity
          annotation (extent=[-61,2; -41,22],  rotation=270);
        Modelica.Blocks.Sources.Ramp trapezoid_Speed2(
          duration=0.5,
          height=.1*Modelica.Constants.pi,
          startTime=6.25)
                     annotation (extent=[-80,70; -60,90], rotation=270);
        Modelica.Blocks.Math.Add add_Speed(k1=+1, k2=+1)
          annotation (extent=[-61,34; -41,54], rotation=270);
        Modelica.Blocks.Math.Add add_Bore(k1=+2, k2=+2)
          annotation (extent=[-11,40; 9,60],  rotation=180);
        Modelica.Blocks.Sources.Trapezoid trapezoid_Bore1(
          width=1,
          period=7,
          nperiod=-1,
          rising=1,
          falling=1,
          offset=0,
          startTime=3,
          amplitude=-2*Modelica.Constants.pi)
                     annotation (extent=[16,10; 36,30],   rotation=0);
        inner Environment.Surface Surface(LengthX=2, LengthZ=2)
          annotation (extent=[-60,-100; -40,-80]);
      equation
        connect(pris_Y.frame_a, fixed.frame_b)      annotation (points=[80,-63;
              80,-79], style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(aRev_Z.frame_a, aRev_Y.frame_b) annotation (points=[-33,-20;
              -22,-20],                                               style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(aRev_Y.frame_a, pris_Z.frame_b) annotation (points=[0,-20; 11,-20],
                                                                style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(pris_Z.frame_a, pris_X.frame_b) annotation (points=[33,-20; 43,
              -20],                                        style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(pris_X.frame_a, pris_Y.frame_b) annotation (points=[65,-20; 80,
              -20; 80,-41], style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(angularVelocity.flange_b, aRev_Z.axis)
          annotation (points=[-51,2; -51,-13], style(color=0, rgbcolor={0,0,0}));
        connect(anglularVelocityBore.flange_b, aRev_Y.axis)
                                             annotation (points=[-18,2; -18,
              -5.5; -18,-13; -18,-13],
                               style(color=0, rgbcolor={0,0,0}));
        connect(add_Speed.y, angularVelocity.w_ref)
                                                 annotation (points=[-51,33;
              -51,23],
                   style(color=74, rgbcolor={0,0,127}));
        connect(trapezoid_Speed2.y, add_Speed.u2)
                                               annotation (points=[-70,69; -70,
              62; -56,62; -56,56; -57,56],
                                       style(color=74, rgbcolor={0,0,127}));
        connect(trapezoid_Speed.y, add_Speed.u1)
                                              annotation (points=[-30,69; -30,
              62; -45,62; -45,56],
                               style(color=74, rgbcolor={0,0,127}));
        connect(add_Bore.y, anglularVelocityBore.w_ref)
                                                      annotation (points=[-12,50;
              -18,50; -18,23], style(color=74, rgbcolor={0,0,127}));
        connect(add_Bore.u2, trapezoid_Bore.y)
                                             annotation (points=[11,56; 50,56; 50,
              80; 37,80], style(color=74, rgbcolor={0,0,127}));
        connect(add_Bore.u1, trapezoid_Bore1.y)
                                              annotation (points=[11,44; 50,44;
              50,20; 37,20],
                          style(color=74, rgbcolor={0,0,127}));
        connect(TestTire.TireHub, aRev_Z.frame_b) annotation (points=[-68,-20;
              -55,-20], style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
      end BoreTorque;

      model CamberForce "tests the camber forcy by a changing lean angle."

        extends WheelsAndTires.TireComponents.Utilities.Icons.TestBenchModel;

        annotation (Diagram,
          experiment(StopTime=12, NumberOfIntervals=3000),
          experimentSetupOutput,
          Documentation(info="<html>

<p>
This model let's the tire move at different lean angles exibiting varying camber forces. <br>
</p>

<img src=\"../images/CamberForce.png\" </img>

</html>"));
        inner MultiBondLib.Mechanics3D.World3D world3D
                              annotation (extent=[-100,-100; -80,-80]);
        WheelsAndTires.TireComponents.Utilities.AdditionalBG.Angle angleLean
                              annotation (extent=[-28,2; -8,22],   rotation=270);
        WheelsAndTires.TireComponents.Utilities.AdditionalBG.AngularVelocity
          angularVelocity
          annotation (extent=[-61,2; -41,22],  rotation=270);
        Modelica.Blocks.Sources.Ramp trapezoid_Camber2(
          height=Modelica.Constants.pi - 0.02,
          duration=10,
          offset=0,
          startTime=2)
                     annotation (extent=[42,16; 62,36],   rotation=0);
        Modelica.Blocks.Sources.Ramp trapezoid_Camber1(duration=0.5, height=-
              Modelica.Constants.pi/2 + 0.01)
                     annotation (extent=[40,66; 60,86],   rotation=0);
        Modelica.Blocks.Math.Add add_Camber
          annotation (extent=[9,40; 29,60],    rotation=180);
        Modelica.Blocks.Sources.Trapezoid trapezoid_Bore(
          offset=0,
          period=10,
          nperiod=1,
          startTime=2,
          amplitude=2*Modelica.Constants.pi,
          rising=0.1,
          width=9.8,
          falling=0.1)
                     annotation (extent=[-61,50; -41,70], rotation=270);
        WheelsAndTires.Tires.Belt.Advanced TestTire
                                      annotation (extent=[-88,-30; -68,-10]);
        MultiBondLib.Mechanics3D.Joints.ActuatedPrismatic pris_Y(
          n={0,1,0})
          annotation (extent=[70,-62; 90,-42], rotation=90);
        MultiBondLib.Mechanics3D.Parts.Fixed fixed
                          annotation (extent=[70,-100; 90,-80],rotation=90);
        MultiBondLib.Mechanics3D.Joints.ActuatedRevolute aRev_Y(n={1,0,0})
          annotation (extent=[-21,-30; -1,-10],rotation=180);
      public
        MultiBondLib.Mechanics3D.Joints.ActuatedRevolute aRev_Z(n={0,0,1})
          annotation (extent=[-54,-30; -34,-10],
                                               rotation=180);
      public
        MultiBondLib.Mechanics3D.Joints.ActuatedPrismatic pris_X(
          n={1,0,0}, initType=Modelica.Mechanics.MultiBody.Types.Init.PositionVelocity)
          annotation (extent=[44,-30; 64,-10], rotation=180);
        inner Environment.Surface Surface(
          LengthZ=1,
          LengthX=27,
          OffsetX=-26)
          annotation (extent=[-60,-100; -40,-80]);
      public
        MultiBondLib.Mechanics3D.Joints.ActuatedPrismatic pris_Z(initType=
              Modelica.Mechanics.MultiBody.Types.Init.PositionVelocity, n={0,0,
              1})
          annotation (extent=[12,-30; 32,-10], rotation=180);
        BondLib.Mechanical.Translational.Sources.Force force
          annotation (extent=[40,-55; 60,-35], rotation=0);
        Modelica.Blocks.Sources.Constant const(k=-1000)
          annotation (extent=[8,-55; 28,-35]);
      equation
        connect(add_Camber.u2, trapezoid_Camber1.y)
                                                   annotation (points=[31,56;
              70,56; 70,76; 61,76],
                                 style(color=74, rgbcolor={0,0,127}));
        connect(add_Camber.u1, trapezoid_Camber2.y)
                                                   annotation (points=[31,44;
              70,44; 70,26; 63,26],
                                 style(color=74, rgbcolor={0,0,127}));
        connect(angleLean.phi_ref, add_Camber.y)            annotation (points=[-18,23;
              -18,50; 8,50],          style(color=74, rgbcolor={0,0,127}));
        connect(trapezoid_Bore.y, angularVelocity.w_ref) annotation (points=[-51,49;
              -51,23],     style(color=74, rgbcolor={0,0,127}));
        connect(pris_Y.frame_a,fixed. frame_b)      annotation (points=[80,-63;
              80,-79], style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(aRev_Z.frame_a,aRev_Y. frame_b) annotation (points=[-33,-20;
              -22,-20],                                               style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(pris_X.frame_a,pris_Y. frame_b) annotation (points=[65,-20; 80,
              -20; 80,-41], style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(aRev_Z.axis, angularVelocity.flange_b) annotation (points=[-51,-13;
              -51,2],                    style(color=0, rgbcolor={0,0,0}));
        connect(angleLean.flange_b, aRev_Y.axis)            annotation (points=[-18,2;
              -18,-5.5; -18,-5.5; -18,-13],   style(color=0, rgbcolor={0,0,0}));
        connect(TestTire.TireHub, aRev_Z.frame_b) annotation (points=[-68,-20;
              -55,-20], style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(pris_Z.frame_b, aRev_Y.frame_a) annotation (points=[11,-20; 0,
              -20], style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(pris_Z.frame_a, pris_X.frame_b) annotation (points=[33,-20; 43,
              -20], style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(force.flange_b, pris_Y.axis) annotation (points=[60,-45; 66,-45;
              66,-45; 73,-45], style(color=58, rgbcolor={0,127,0}));
        connect(const.y, force.f) annotation (points=[29,-45; 41,-45], style(
              color=74, rgbcolor={0,0,127}));
      end CamberForce;

      model LoadInfluence
        "tests the influence of the normal load on the frictional coefficient."

        extends WheelsAndTires.TireComponents.Utilities.Icons.TestBenchModel;

        WheelsAndTires.Tires.Belt.Advanced TestTire
                                      annotation (extent=[-98,-10; -78,10]);
        MultiBondLib.Mechanics3D.Joints.ActuatedPrismatic pris_Y(
          n={0,1,0})
          annotation (extent=[60,-42; 80,-22], rotation=90);
        MultiBondLib.Mechanics3D.Parts.Fixed fixed
                          annotation (extent=[60,-80; 80,-60], rotation=90);
        annotation (Diagram,
          experiment(StopTime=10, NumberOfIntervals=2500),
          experimentSetupOutput,
          Documentation(info="<html>

<p>
This model moves the tire in longitudinal direction with rising normal force pressing it to the ground. <br>
</p>

<img src=\"../images/LoadInfluence.png\" </img>

</html>"));
        inner MultiBondLib.Mechanics3D.World3D world3D
                              annotation (extent=[-100,-100; -80,-80]);
        MultiBondLib.Mechanics3D.Joints.ActuatedRevolute aRev_X(n={1,0,0},
            initType=Modelica.Mechanics.MultiBody.Types.Init.Free)
          annotation (extent=[-31,-10; -11,10],rotation=180);
      public
        MultiBondLib.Mechanics3D.Joints.ActuatedRevolute aRev_Z
          annotation (extent=[-64,-10; -44,10],rotation=180);
        Modelica.Blocks.Sources.Constant trapezoid_Torque(k=10)
                     annotation (extent=[-71,70; -51,90], rotation=270);
      public
        MultiBondLib.Mechanics3D.Joints.ActuatedPrismatic pris_X(
          n={1,0,0})
          annotation (extent=[34,-10; 54,10],  rotation=180);
        MultiBondLib.Mechanics3D.Parts.FixedTranslation fixedTranslation(r={0,0,
              0.3}) annotation (extent=[2,-10; 22,10],rotation=180);
        BondLib.Mechanical.Translational.Sources.Force force
          annotation (extent=[32,-35; 52,-15], rotation=0);
        Modelica.Blocks.Sources.Ramp normalLoad(
          duration=10,
          height=-10e3,
          offset=6*9.81)
                     annotation (extent=[-20,-50; 0,-30], rotation=0);
        Modelica.Blocks.Sources.Constant noFalling(k=0)
                     annotation (extent=[-38,70; -18,90], rotation=270);
        WheelsAndTires.TireComponents.Utilities.AdditionalBG.AngularVelocity
          angularVelocityX
          annotation (extent=[-38,30; -18,50], rotation=270);
        inner Environment.Surface Surface(
          LengthZ=2,
          LengthX=50,
          OffsetX=-48) annotation (extent=[-60,-100; -40,-80]);
        WheelsAndTires.TireComponents.Utilities.AdditionalBG.AngularVelocity
          angularVelocityZ
          annotation (extent=[-71,30; -51,50], rotation=270);
      equation
        connect(pris_Y.frame_a, fixed.frame_b)      annotation (points=[70,-43;
              70,-59], style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(aRev_Z.frame_a, aRev_X.frame_b) annotation (points=[-43,
              -1.34707e-015; -40.25,0; -32,0; -32,1.34707e-015],      style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(pris_X.frame_a, pris_Y.frame_b) annotation (points=[55,
              -1.34707e-015; 70,0; 70,-21],
                            style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(aRev_X.frame_a, fixedTranslation.frame_b) annotation (points=[-10,
              -1.34707e-015; -7.25,0; 1,0; 1,1.34707e-015],          style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(fixedTranslation.frame_a, pris_X.frame_b) annotation (points=[23,
              -1.34707e-015; 25.5,0; 33,0; 33,1.34707e-015],    style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(normalLoad.y, force.f)       annotation (points=[1,-40; 20,-40; 20,
              -25; 33,-25],    style(color=74, rgbcolor={0,0,127}));
        connect(force.flange_b, pris_Y.axis) annotation (points=[52,-25; 63,-25],
            style(color=58, rgbcolor={0,127,0}));
        connect(angularVelocityX.flange_b, aRev_X.axis)
                                                       annotation (points=[-28,30;
              -28,18.5; -28,7; -28,7],  style(
            color=0,
            rgbcolor={0,0,0},
            fillColor=7,
            rgbfillColor={255,255,255},
            fillPattern=1));
        connect(angularVelocityX.w_ref, noFalling.y)
                                                    annotation (points=[-28,51;
              -28,55.5; -28,55.5; -28,60; -28,69; -28,69], style(
            color=74,
            rgbcolor={0,0,127},
            fillColor=7,
            rgbfillColor={255,255,255},
            fillPattern=1));
        connect(TestTire.TireHub, aRev_Z.frame_b)        annotation (points=[-78,0;
              -71.5,0; -71.5,1.34707e-015; -65,1.34707e-015],        style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(angularVelocityZ.flange_b, aRev_Z.axis) annotation (points=[-61,30;
              -61,7],     style(color=0, rgbcolor={0,0,0}));
        connect(angularVelocityZ.w_ref, trapezoid_Torque.y) annotation (points=
              [-61,51; -61,69], style(color=74, rgbcolor={0,0,127}));
      end LoadInfluence;

      model Overturning
        "tests the overturning torque by applying different lean angles."

        extends WheelsAndTires.TireComponents.Utilities.Icons.TestBenchModel;

        WheelsAndTires.Tires.Belt.Advanced TestTire
                                      annotation (extent=[-100,-10; -80,10]);
        MultiBondLib.Mechanics3D.Joints.ActuatedPrismatic pris_Y(
          n={0,1,0})
          annotation (extent=[60,-42; 80,-22], rotation=90);
        MultiBondLib.Mechanics3D.Parts.Fixed fixed
                          annotation (extent=[60,-80; 80,-60], rotation=90);
        annotation (Diagram,
          experiment(StopTime=10, NumberOfIntervals=2500),
          experimentSetupOutput,
          Documentation(info="<html>

<p>
This model moves the tire in longitudinal direction at different lean angles. <br>
</p>

<img src=\"../images/Master_Doku_MarkusAndres184x.png\" </img>

</html>"));
        inner MultiBondLib.Mechanics3D.World3D world3D
                              annotation (extent=[-100,-100; -80,-80]);
        MultiBondLib.Mechanics3D.Joints.ActuatedRevolute aRev_X(n={1,0,0},
            initType=Modelica.Mechanics.MultiBody.Types.Init.PositionVelocity)
          annotation (extent=[-31,-10; -11,10],rotation=180);
        Modelica.Blocks.Sources.Trapezoid trapezoid_Camber(
          amplitude=Modelica.Constants.pi - 1e-2,
          rising=3,
          width=3,
          falling=3,
          period=10,
          offset=-(Modelica.Constants.pi/2 - 0.5e-2),
          startTime=-1.5)
                     annotation (extent=[-38,70; -18,90], rotation=270);
      public
        MultiBondLib.Mechanics3D.Joints.ActuatedRevolute aRev_Z(initType=Modelica.Mechanics.MultiBody.Types.Init.Position)
          annotation (extent=[-64,-10; -44,10],rotation=180);
        Modelica.Blocks.Sources.Ramp trapezoid_Speed(duration=10, height=3)
                     annotation (extent=[-71,70; -51,90], rotation=270);
      public
        MultiBondLib.Mechanics3D.Joints.ActuatedPrismatic pris_X(
          n={1,0,0}, initType=Modelica.Mechanics.MultiBody.Types.Init.PositionVelocity)
          annotation (extent=[34,-10; 54,10],  rotation=180);
        MultiBondLib.Mechanics3D.Parts.FixedTranslation fixedTranslation(r={0,0,
              0.3}) annotation (extent=[2,-10; 22,10],rotation=180);
        WheelsAndTires.TireComponents.Utilities.AdditionalBG.Angle angle
                              annotation (extent=[-38,12; -18,32],rotation=270);
        WheelsAndTires.TireComponents.Utilities.AdditionalBG.AngularVelocity
          angularVelocity
          annotation (extent=[-71,30; -51,50], rotation=270);
        Modelica.Blocks.Continuous.FirstOrder firstOrder(T=0.1)
          annotation (extent=[-38,40; -18,60], rotation=270);
        inner Environment.Surface Surface(
          LengthX=10,
          LengthZ=2,
          OffsetX=-8) annotation (extent=[-60,-100; -40,-80]);
      equation
        connect(pris_Y.frame_a, fixed.frame_b)      annotation (points=[70,-43;
              70,-59], style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(aRev_Z.frame_a, aRev_X.frame_b) annotation (points=[-43,
              -1.34707e-015; -40.25,0; -32,0; -32,1.34707e-015],      style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(pris_X.frame_a, pris_Y.frame_b) annotation (points=[55,
              -1.34707e-015; 70,0; 70,-21],
                            style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(aRev_X.frame_a, fixedTranslation.frame_b) annotation (points=[-10,
              -1.34707e-015; -7.25,0; 1,0; 1,1.34707e-015],          style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(fixedTranslation.frame_a, pris_X.frame_b) annotation (points=[23,
              -1.34707e-015; 25.5,0; 33,0; 33,1.34707e-015],    style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(angle.flange_b, aRev_X.axis) annotation (points=[-28,12; -28,
              9.5; -28,7; -28,7],
                               style(color=0, rgbcolor={0,0,0}));
        connect(angularVelocity.w_ref, trapezoid_Speed.y) annotation (points=[-61,51;
              -61,69],     style(color=74, rgbcolor={0,0,127}));
        connect(angularVelocity.flange_b, aRev_Z.axis)
          annotation (points=[-61,30; -61,7],  style(color=0, rgbcolor={0,0,0}));
        connect(firstOrder.y, angle.phi_ref) annotation (points=[-28,39; -28,
              37.5; -28,37.5; -28,36; -28,33; -28,33],
                                                 style(color=74, rgbcolor={0,0,
                127}));
        connect(firstOrder.u, trapezoid_Camber.y) annotation (points=[-28,62;
              -28,63.75; -28,63.75; -28,65.5; -28,69; -28,69],
                                                           style(color=74,
              rgbcolor={0,0,127}));
        connect(TestTire.TireHub, aRev_Z.frame_b) annotation (points=[-80,0;
              -71.5,0; -71.5,1.34707e-015; -65,1.34707e-015], style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
      end Overturning;

      model SelfAligning
        "tests the self aligning torque by moving a rotating tire sidways."

        extends WheelsAndTires.TireComponents.Utilities.Icons.TestBenchModel;

        Tires.Belt.Advanced TestTire  annotation (extent=[-90,10; -70,30]);
        MultiBondLib.Mechanics3D.Joints.ActuatedPrismatic pris_Y(
          n={0,1,0})
          annotation (extent=[70,-20; 90,0],   rotation=90);
        MultiBondLib.Mechanics3D.Parts.Fixed fixed
                          annotation (extent=[70,-60; 90,-40], rotation=90);
        MultiBondLib.Mechanics3D.Joints.ActuatedPrismatic aPris_X(initType=
              Modelica.Mechanics.MultiBody.Types.Init.Position)
          annotation (extent=[50,10; 70,30],  rotation=180);
        MultiBondLib.Mechanics3D.Joints.ActuatedRevolute aRev_Z
          annotation (extent=[-50,10; -30,30], rotation=180);
        annotation (Diagram,
          experiment(StopTime=10, NumberOfIntervals=2500),
          experimentSetupOutput,
          Documentation(info="<html>

<p>
This model moves the tire in longitudinal direction with a superposed lateral movement resulting in a self-aligning torque. <br>
</p>

<img src=\"../images/SelfAligning.png\" </img>

</html>"));
        inner MultiBondLib.Mechanics3D.World3D world3D
                              annotation (extent=[-100,-100; -80,-80]);
        MultiBondLib.Mechanics3D.Joints.ActuatedRevolute aRev_Y(n={0,1,0},
            initType=Modelica.Mechanics.MultiBody.Types.Init.Position)
          annotation (extent=[-16,10; 4,30],   rotation=180);
        Modelica.Blocks.Sources.Constant noTurning(k=0)
                     annotation (extent=[-23,70; -3,90],  rotation=270);
        WheelsAndTires.TireComponents.Utilities.AdditionalBG.Angle angle
          annotation (extent=[-23,40; -3,60],  rotation=270);
        WheelsAndTires.TireComponents.Utilities.AdditionalBG.Velocity velocityX
          annotation (extent=[43,-12; 63,8],   rotation=90);
        MultiBondLib.Mechanics3D.Joints.ActuatedPrismatic aPris_Z(
          n={0,0,1}, initType=Modelica.Mechanics.MultiBody.Types.Init.Position)
          annotation (extent=[17,10; 37,30], rotation=180);
        WheelsAndTires.TireComponents.Utilities.AdditionalBG.Velocity velocityZ
          annotation (extent=[10,-12; 30,8],  rotation=90);
        Modelica.Blocks.Sources.Ramp rampLow(               height=2, duration=
              0.01)    annotation (extent=[-28,-44; -8,-24],  rotation=0);
        Modelica.Blocks.Sources.Trapezoid lateralSpeed(
          rising=1,
          width=1,
          falling=1,
          period=5,
          amplitude=10,
          offset=-5) annotation (extent=[-70,-26; -50,-6],  rotation=0);
        Modelica.Blocks.Math.Add longitudinalSpeed
          annotation (extent=[12,-58; 32,-38]);
        Modelica.Blocks.Sources.Ramp rampHigh(
          startTime=5,
          height=8,
          duration=0.1)
                       annotation (extent=[-28,-76; -8,-56],  rotation=0);
        inner Environment.Surface Surface(
          LengthX=100,
          LengthZ=20,
          OffsetX=-5) annotation (extent=[-60,-100; -40,-80]);
      equation
        connect(pris_Y.frame_a, fixed.frame_b)      annotation (points=[80,-21;
              80,-39], style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(aRev_Z.frame_a, aRev_Y.frame_b)  annotation (points=[-29,20;
              -17,20],       style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(angle.flange_b, aRev_Y.axis) annotation (points=[-13,40; -13,
              33.5; -13,27; -13,27],
                             style(color=0, rgbcolor={0,0,0}));
        connect(angle.phi_ref, noTurning.y)        annotation (points=[-13,61;
              -13,63; -13,63; -13,65; -13,69; -13,69], style(color=74, rgbcolor={
                0,0,127}));
        connect(aPris_X.frame_a, pris_Y.frame_b) annotation (points=[71,20; 80,20;
              80,1],                                    style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(velocityX.flange_b, aPris_X.axis) annotation (points=[53,8; 53,13],
                   style(color=58, rgbcolor={0,127,0}));
        connect(aRev_Y.frame_a, aPris_Z.frame_b) annotation (points=[5,20; 16,20],
            style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(aPris_Z.frame_a, aPris_X.frame_b) annotation (points=[38,20; 49,
              20],           style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(aPris_Z.axis, velocityZ.flange_b) annotation (points=[20,13; 20,8],
                    style(color=58, rgbcolor={0,127,0}));
        connect(longitudinalSpeed.u1, rampLow.y) annotation (points=[10,-42; 0,-42;
              0,-34; -7,-34],         style(color=74, rgbcolor={0,0,127}));
        connect(rampHigh.y, longitudinalSpeed.u2) annotation (points=[-7,-66; 0,-66;
              0,-54; 10,-54],           style(color=74, rgbcolor={0,0,127}));
        connect(TestTire.TireHub, aRev_Z.frame_b) annotation (points=[-70,20; -51,
              20], style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(velocityZ.v_ref, lateralSpeed.y) annotation (points=[20,-13; 20,
              -16; -49,-16], style(color=74, rgbcolor={0,0,127}));
        connect(velocityX.v_ref, longitudinalSpeed.y) annotation (points=[53,
              -13; 53,-48; 33,-48], style(color=74, rgbcolor={0,0,127}));
      end SelfAligning;

      annotation (Icon, Documentation(info="<html>

The models contained in this package are intended to test the Friction classes. The tire is fixed by prismatic and revolute joints to ensure a reasonable behavior.

</html>"));
    end FrictionEffects;

    package Surfaces
      "covers models to test the functionality of the tire with the surface class."
      annotation(preferedView="info");

      extends WheelsAndTires.TireComponents.Utilities.Icons.TestBenchPackage;

      model PartlySliperySurface
        "a tire on a surface that is has a friction coefficient of 0 at its outer parts."

        extends WheelsAndTires.TireComponents.Utilities.Icons.TestBenchModel;

        Tires.Belt.Advanced BeltTire(
          useAdvancedInitialization=true,
          v_start_advanced={2,0,0},
          initSlip=WheelsAndTires.Tires.Commons.Types.InitSlip.RotSlip,
          w_start_advanced={0,0,5},
          phi_start={15*Modelica.Constants.pi/180,0,0},
          initType=Modelica.Mechanics.MultiBody.Types.Init.PositionVelocity,
          visContactPointEnabled=true,
          rRim=0.29)              annotation (extent=[40,20; 80,60]);

        annotation (experiment(StopTime=4, NumberOfIntervals=1000),
            experimentSetupOutput,
          Diagram,
          Documentation(info="<html>

<p>
In this model three different tires start from the middle of a square rotating and moving to the outside. This square is build of 3x3 surface elements with the one in the middle having a frictional coefficient µ = 1. The surrounding eight squares have µ = 0. Therefore the tires start slipping at the border of the frictional coefficient. When they reach the border of the surface µ gets 1 again and they therefore exhibit friction again, as µ = 1 and y = 0 when exiting the defined surface.
</p>

<p>
The figure below was manipulated to show the borders of the friction approximatly as this is not possible with the current version of the library.
</p>

<img src=\"../images/PartlySliperySurface.png\" </img>

</html>"));
        inner MultiBondLib.Mechanics3D.World3D world3D(animateWorld=false,
            animateGravity=false)
          annotation (extent=[-100,-100; -80,-80]);
        inner WheelsAndTires.Environment.Surface Surface(
          mu=[0,0,0; 0,1,0; 0,0,0],
          LengthX=10,
          LengthZ=10,
          FlatSurface=false)
          annotation (extent=[80,-100; 100,-80]);
        Tires.Circular.Advanced CircularTire(
          rimSpecularCoefficient=0.3,
          useAdvancedInitialization=true,
          v_start_advanced={2,0,0},
          initSlip=WheelsAndTires.Tires.Commons.Types.InitSlip.RotSlip,
          w_start_advanced={0,0,5},
          phi_start={15*Modelica.Constants.pi/180,0,0},
          initType=Modelica.Mechanics.MultiBody.Types.Init.PositionVelocity)
                                  annotation (extent=[-20,20; 20,60]);

        Tires.Slim.Advanced SlimTire(
          useAdvancedInitialization=true,
          v_start_advanced={2,0,0},
          initSlip=WheelsAndTires.Tires.Commons.Types.InitSlip.RotSlip,
          w_start_advanced={0,0,5},
          phi_start={15*Modelica.Constants.pi/180,0,0},
          initType=Modelica.Mechanics.MultiBody.Types.Init.PositionVelocity)
                                  annotation (extent=[-80,20; -40,60]);

      end PartlySliperySurface;

      model UnevenSurfaceDroppingTire "lets a tire drop on an uneven surface."

        extends WheelsAndTires.TireComponents.Utilities.Icons.TestBenchModel;

        Tires.Belt.Advanced Tire(
          rimSpecularCoefficient=0.3,
          useTransVelocities=false,
          initType=Modelica.Mechanics.MultiBody.Types.Init.Position,
          x_start={2,2,0})        annotation (extent=[-20,-20; 20,20]);
        annotation (experiment(StopTime=10, NumberOfIntervals=2500),
            experimentSetupOutput,
          Diagram,
          Documentation(info="<html>

<p>
In this model the function of the uneven surface gets tested by a tire rolling on a waved surface.
</p>

<img src=\"../images/Master_Doku_MarkusAndres185x.png\" </img>

</html>"));
        inner MultiBondLib.Mechanics3D.World3D world3D
          annotation (extent=[-100,-100; -80,-80]);
        inner WheelsAndTires.Environment.Surface Surface(
          LengthX=6,
          LengthZ=6,
          nu=4,
          nv=4,
          FlatSurface=false,
          y=0.5*[1,1,1,1; 0,0,0,0; 0,0,0,0; 1,1,1,1])
          annotation (extent=[80,-100; 100,-80]);
      end UnevenSurfaceDroppingTire;
      annotation (Icon);

      model UnevenSurfaceRotatingTire
        "lets a rotating tire roll up and down an uneven surface."

        extends WheelsAndTires.TireComponents.Utilities.Icons.TestBenchModel;

        Tires.Belt.Advanced Tire(
          useTransVelocities=false,
          initType=Modelica.Mechanics.MultiBody.Types.Init.PositionVelocity,
          useAdvancedInitialization=true,
          phi_start={10*Modelica.Constants.pi/180,0,0},
          fR0=0,
          w_start_advanced={0,0,8})
                                  annotation (extent=[-20,-20; 20,20]);
        annotation (experiment(StopTime=4.5, NumberOfIntervals=1125),
            experimentSetupOutput,
          Diagram,
          Documentation(info="<html>

<p>
In this model the function of the uneven surface gets tested by a tire dropping in a waved surface.
</p>

<img src=\"../images/Master_Doku_MarkusAndres186x.png\" </img>

</html>"));
        inner MultiBondLib.Mechanics3D.World3D world3D
          annotation (extent=[-100,-100; -80,-80]);
        inner Environment.Surface Surface(
          LengthZ=6,
          FlatSurface=false,
          OffsetZ=-1,
          nu=5,
          nv=2,
          LengthX=6,
          OffsetX=-5.5,
          IP=10,
          y=[1.2,1.2; 0.8,0.8; 0.4,0.4; 0,0; 0,0])
          annotation (extent=[80,-100; 100,-80]);
      end UnevenSurfaceRotatingTire;

    end Surfaces;

    package PlottingFunctions
      "provides functions to plot 3D relations of the slip property classes"
      annotation(preferedView="info");

      extends WheelsAndTires.TireComponents.Utilities.Icons.TestBenchPackage;

      function plot3D_mu
        "plots 3D diagramms of different frictional behaviors."

        import SI = Modelica.SIunits;

        input Real vSlipMax = 5 "maximum slip velocity";
        input Real vRollMax = 10 "maximum roll velocity";
        input Integer nvSlip = 50
          "points that are calculated in the direction of vSlip";
        input Integer nvRoll = 50
          "points that are calculated in the direction of vRoll";
        input Integer Type(final min = 1, final max = 4) = 1
          "Type of Friction used: 1=DLRSlip, 2=f(vSlip), 3=f(s), 4=Rill Style";
        input Boolean useNegativeValues = false
          "0 if vSlip and vRoll have no negative values, 1 if they should be symmetric to 0";

        parameter SI.Velocity vLongAdhesion = 0.3;
        parameter SI.Velocity vLongSlide = 1;
        parameter Real sLongAdhesion = 0.15;
        parameter Real sLongSlide = 0.4;
        final parameter Real dmu_dvSlip_LongN(
          final unit="N/s^2",
          final min=0) = 1/(10*sLongAdhesion)
          "Curves Gradient at zero crossing";

        parameter Real muLongMaxN(min = 0) = 1; // at nominal Load (index N)
        parameter Real muLongMinN(min = 0) = 0.6; // at nominal Load (index N)

        parameter SI.Velocity vLatAdhesion = 0.4;
        parameter SI.Velocity vLatSlide = 1.2;
        parameter Real sLatAdhesion = 0.2;
        parameter Real sLatSlide = 0.5;
        final parameter Real dmu_dvSlip_LatN(
          final unit="N/s^2",
          final min=0) = 1/(10*sLongAdhesion)
          "Curves Gradient at zero crossing";

        parameter Real muLatMaxN(min = 0) = 1; // at nominal Load (index N)
        parameter Real muLatMinN(min = 0) = 0.6; // at nominal Load (index N)

      protected
        Real xVector[nvSlip] = if useNegativeValues then linspace(-vSlipMax,vSlipMax,nvSlip) else linspace(0,vSlipMax,nvSlip);
        Real yVector[nvRoll] = if useNegativeValues then linspace(-vRollMax,vRollMax,nvRoll) else linspace(0,vRollMax,nvRoll);

        Real xMatrix[nvSlip,nvSlip];
        Real yMatrix[nvRoll,nvRoll];

        Real vAR;
        Real vSR;
        Real vSlip;
        Real vRotLong;

        Real alpha = 0;
        Real sinAlpha = sin(alpha);
        Real cosAlpha = cos(alpha);

        Real mu[nvSlip,nvRoll];
        Plot3D.Types.Scale xScale = {0,5,10};

        Real vAdhesion;
        Real vSlide;
        Real sAdhesion;
        Real sSlide;
        Real muMaxN;
        Real muMinN;
        Real dmu_dvSlipN;
        Real mu_vSlip;

      algorithm
        (xMatrix,yMatrix) := Plot3D.Internal.GenerateGrid(xVector, yVector);

        vAdhesion :=sqrt((cosAlpha*vLongAdhesion)^2 + (sinAlpha*vLatAdhesion)^2);
        vSlide :=sqrt((cosAlpha*vLongSlide)^2 + (sinAlpha*vLatSlide)^2);
        sAdhesion :=sqrt((cosAlpha*sLongAdhesion)^2 + (sinAlpha*sLatAdhesion)^2);
        sSlide :=sqrt((cosAlpha*sLongSlide)^2 + (sinAlpha*sLatSlide)^2);
        muMaxN :=sqrt((cosAlpha*muLongMaxN)^2 + (sinAlpha*muLatMaxN)^2);
        muMinN :=sqrt((cosAlpha*muLongMinN)^2 + (sinAlpha*muLatMinN)^2);
        dmu_dvSlipN :=sqrt((cosAlpha*dmu_dvSlip_LongN)^2 + (sinAlpha*dmu_dvSlip_LatN)^2);

        for i in 1:nvSlip loop
          for j in 1:nvRoll loop
              vSlip := xVector[i];
              vRotLong := yVector[j];

              if Type == 1 then
              vAR := WheelsAndTires.TireComponents.Friction.SlipProperties.SoftMaxTol(
                                                                       vAdhesion,
                sAdhesion*vRotLong);
              vSR := WheelsAndTires.TireComponents.Friction.SlipProperties.SoftMaxTol(
                                                                       vSlide,
                sSlide*vRotLong);
              elseif Type == 2 then
                vAR := vAdhesion;
                vSR := vSlide;
              elseif Type == 3 then
                if abs(vRotLong) > 1e-6 then
                  vAR := sAdhesion*vRotLong;
                  vSR := sSlide*vRotLong;
                else
                  vAR := sAdhesion*1e-6;
                  vSR := sSlide*1e-6;
                end if;
              else
                vAR := sAdhesion*(vRotLong+1e-6);
                vSR := sSlide*(vRotLong+1e-6);
              end if;

            mu_vSlip := WheelsAndTires.TireComponents.Friction.SlipProperties.GetMu_vSlip(
                  muMaxN,
                  muMinN,
                  dmu_dvSlipN,
                  vSlip,
                  vAR,
                  vSR);
              mu[i,j] := abs(mu_vSlip*vSlip);
          end for;
        end for;

        Plot3D.plotSurface({Plot3D.Records.ParametricSurfaceData(
                              plotData=Plot3D.Records.PlotData(x=xMatrix, y=yMatrix, z=mu),
                              vectorField=Plot3D.Records.VectorFieldData(nx=zeros(3,3), ny=zeros(3,3), nz=zeros(3,3)),
                              styleData=Plot3D.Internal.StyleDataSurface(plotVectorField=false, style1=2))},
                            Plot3D.Records.CoordinateSystem(xAxisLabel="vSlip [m/s]", yAxisLabel="vRoll [m/s]", zAxisLabel="µ"));
        annotation (Documentation(info="<html>

The figures showing the dependence of µ on vRoll and vSlip found in <a href=\"Modelica://WheelsAndTires.TireComponents.Friction.SlipProperties.CombinedFriction\">CombinedFriction</a> and <a href=\"Modelica://WheelsAndTires.TireComponents.Friction.SlipProperties.SoftMaxTol\">SoftMaxTol</a> were created using this function.

</html>"));
      end plot3D_mu;
      annotation (Icon, Documentation(info="<html>

Contains functions to plot complex relationships between multiple variables in 3D plots.

</html>"));
    end PlottingFunctions;
    annotation (Icon, Documentation(info="<html>

Models contained in the <span class=\"cmti-10x-x-109\">Test Bench </span>are designed to verify fundamental properties of the
tested tires. The packages contained are listed and described below.
     </p><ul class=\"itemize1\">
     <li class=\"itemize\"><span class=\"cmti-10x-x-109\">Elevation </span>- Two models to test basic properties of the <span class=\"cmti-10x-x-109\">Elevation </span>objects. The
     first as a rather simple and the latter a little more complex.
     </li>
     <li class=\"itemize\"><span class=\"cmti-10x-x-109\">Friction Effects </span>- Eight models to test the objects of the <span class=\"cmti-10x-x-109\">Friction </span>class.
     </li>

     <li class=\"itemize\"><span class=\"cmti-10x-x-109\">Surfaces </span>- Three models to gain some knowledge about the usage of the <span class=\"cmti-10x-x-109\">Surface</span>
     class and its configuration.
     </li>
     <li class=\"itemize\"><span class=\"cmti-10x-x-109\">Plotting Functions  </span>- One function to plot the behavior of different frictional
     classes. Results are shown in the Examplary results section of the User's Guide.
</li>
</p>

</html>"));
  end TestBench;

  package Examples "covers ready-made example models"
    annotation(preferedView="info");

    extends WheelsAndTires.TireComponents.Utilities.Icons.ExamplesPackage;

    annotation (Icon, Documentation(info="<html>
<p>
Six examples are provided with the library. Five of the Examples are two-wheeled
(single-track) vehicles, whereas three are unsprung bicycle models composed of rigid
elements exclusively. The other two model sprung motorcycles including front and rear
suspension. For both vehicles, models are provided to analyze the uncontrolled stability,
e.g.&nbsp;with different tire properties for geometry and friction for the bicycle. The other two models are ?nice to show? models with the bicycle being
accelerated by a strong torque to make the front wheel lift from the ground and the motorcycle jumping over a gap.
</p>


<p>
In contrast to the motorcycle the bicycle example has a proper visualization. For the
motorcycle (and the four-wheeled vehicle), no further effort was spent regarding the
visualization, as it is not the crucial aspect of the examples. Both two-wheeled models (found
in the <span class=\"cmti-10x-x-109\">Used Models </span>package) were provided by Thomas Schmitt and were part of the
development of the <span class=\"cmti-10x-x-109\">Motorcycle Library </span><span class=\"cite\">[<a href=\"Modelica://WheelsAndTires.UsersGuide.Literature\">Sch09</a>]</span>.
<!--l. 114--></p><p class=\"noindent\">The sixth example is a very basic undamped model of a four-wheeled vehicle with a
predefined steering angle profile and driving torques acting on the rear tires. The result of the
quite simple input signals is a rather curious behavior of the vehicle with the car drifting at
the end of the simulation, due to an impulse in the driving torque. This is \"reacted\" on by a full breaking of all wheels marking the wheels slide to standstill of the vehicle.
</p>

</html>"));
    model UncontrolledBicycleIdealFriction
      "compares to identical bicycle models with tires differing in their geometric properties."
      import MotorcycleDynamicsV7;
      import SI = Modelica.SIunits;
      extends WheelsAndTires.TireComponents.Utilities.Icons.ExampleModel;

      parameter SI.Velocity v = 5 "Initial speed of the bicycle";

      annotation (
        Diagram,
        experiment(StopTime=8, NumberOfIntervals=2000),
        experimentSetupOutput,
        Icon,
        Documentation(info="<html>

<p>
This example compares two identical bicycles equipped with non-slipping tires only differing in their geometrical properties.
</p>

<img src=\"../images/Master_Doku_MarkusAndres187x.png\" </img>

</html>"));
      inner MultiBondLib.Mechanics3D.World3D world3D(
        g=9.81,
        n={0,-1,0},
        nominalLength=2)                     annotation (extent=[-100,-100; -80,
            -80]);
      inner WheelsAndTires.Environment.Surface Surface(OffsetX=-49, LengthZ=40)
                                        annotation (extent=[80,-100; 100,-80]);
      WheelsAndTires.Examples.UsedModels.Bicycle bicycleComplete2(
        p1={0.3,0.9,0},
        p2={0.9,0.7,0},
        p3={0.8,0.9,0},
        I_FF_11=0.0546,
        I_FF_22=0.0114,
        I_FF_33=0.06,
        I_FF_21=-0.0162,
        I_RF_11=9.2,
        I_RF_22=2.8,
        I_RF_33=11,
        I_RF_21=2.4) annotation (extent=[-48,-52; 46,8]);
      Tires.Belt.Ideal RearTire2(
        I_11=0.06,
        I_22=0.06,
        I_33=0.12,
        mRim=2,
        phi_start={0.1,0,0},
        beltWidth=20e-3,
        visContactPointEnabled=true,
        initType=Modelica.Mechanics.MultiBody.Types.Init.Position,
        beltRadius=20e-3,
        rRim=0.282,
        beltHeight=20e-3) annotation (extent=[100,-66; 60,-26]);

      Tires.Belt.Ideal FrontTire2(
        mRim=3,
        I_11=0.14,
        I_22=0.14,
        I_33=0.28,
        w_start={0,0,v/0.35},
        initType=Modelica.Mechanics.MultiBody.Types.Init.Velocity,
        beltWidth=20e-3,
        visContactPointEnabled=true,
        beltRadius=20e-3,
        beltHeight=20e-3,
        rRim=0.327)
                   annotation (extent=[-100,-63; -60,-23]);
      WheelsAndTires.Examples.UsedModels.Bicycle bicycleComplete1(
        p1={0.3,0.9,0},
        p2={0.9,0.7,0},
        p3={0.8,0.9,0},
        I_FF_11=0.0546,
        I_FF_22=0.0114,
        I_FF_33=0.06,
        I_FF_21=-0.0162,
        I_RF_11=9.2,
        I_RF_22=2.8,
        I_RF_33=11,
        I_RF_21=2.4) annotation (extent=[-48,28; 46,88]);
      Tires.Slim.IdealTire FrontTire1(
        mRim=3,
        I_11=0.14,
        I_22=0.14,
        I_33=0.28,
        rWheel=0.35,
        initType=Modelica.Mechanics.MultiBody.Types.Init.Velocity,
        w_start={0,0,v/0.35},
        visContactPointEnabled=true)
                   annotation (extent=[-100,17; -60,57]);
      Tires.Slim.IdealTire RearTire1(
        I_11=0.06,
        I_22=0.06,
        I_33=0.12,
        mRim=2,
        rWheel=0.305,
        phi_start={0.1,0,0},
        visContactPointEnabled=true,
        initType=Modelica.Mechanics.MultiBody.Types.Init.Position)
                          annotation (extent=[100,14; 60,54]);
    equation
      connect(FrontTire2.TireHub, bicycleComplete2.connectFW)
                                                            annotation (points=[-60,-43;
            -50.8923,-43],           style(
          color=0,
          rgbcolor={0,0,0},
          thickness=2,
          fillColor=30,
          rgbfillColor={215,215,215},
          fillPattern=1));
      connect(bicycleComplete2.connectRW, RearTire2.TireHub)
                                                           annotation (points=[45.2769,
            -46; 60,-46],         style(
          color=0,
          rgbcolor={0,0,0},
          thickness=2,
          fillColor=30,
          rgbfillColor={215,215,215},
          fillPattern=1));
      connect(FrontTire1.TireHub, bicycleComplete1.connectFW) annotation (
          points=[-60,37; -50.8923,37], style(
          color=0,
          rgbcolor={0,0,0},
          thickness=2));
      connect(bicycleComplete1.connectRW, RearTire1.TireHub) annotation (points=[45.2769,
            34; 60,34],                       style(
          color=0,
          rgbcolor={0,0,0},
          thickness=2));
    end UncontrolledBicycleIdealFriction;

    model UncontrolledBicycleSlim
      "compares to identical bicycles with tires differing in their frictional properties."
      import MotorcycleDynamicsV7;
      import SI = Modelica.SIunits;
      extends WheelsAndTires.TireComponents.Utilities.Icons.ExampleModel;

      parameter SI.Velocity v = 5 "Initial speed of the bicycle";

      annotation (
        Diagram,
        experiment(StopTime=5, NumberOfIntervals=1250),
        experimentSetupOutput,
        Icon,
        Documentation(info="<html>

<p>
This example compares two identical bicycles equipped with ideally slim slipping tires only differing in their frictional properties.
</p>

<img src=\"../images/Master_Doku_MarkusAndres188x.png\" </img>

</html>"));
      inner MultiBondLib.Mechanics3D.World3D world3D(
        g=9.81,
        n={0,-1,0},
        nominalLength=2)                     annotation (extent=[-100,-100; -80,
            -80]);
      inner WheelsAndTires.Environment.Surface Surface(
        LengthX=20,
        LengthZ=20,
        OffsetX=-19,
        OffsetZ=-1)                     annotation (extent=[80,-100; 100,-80]);
      WheelsAndTires.Examples.UsedModels.Bicycle bicycleComplete2(
        p1={0.3,0.9,0},
        p2={0.9,0.7,0},
        p3={0.8,0.9,0},
        I_FF_11=0.0546,
        I_FF_22=0.0114,
        I_FF_33=0.06,
        I_FF_21=-0.0162,
        I_RF_11=9.2,
        I_RF_22=2.8,
        I_RF_33=11,
        I_RF_21=2.4) annotation (extent=[-48,-52; 46,8]);

      WheelsAndTires.Examples.UsedModels.Bicycle bicycleComplete1(
        p1={0.3,0.9,0},
        p2={0.9,0.7,0},
        p3={0.8,0.9,0},
        I_FF_11=0.0546,
        I_FF_22=0.0114,
        I_FF_33=0.06,
        I_FF_21=-0.0162,
        I_RF_11=9.2,
        I_RF_22=2.8,
        I_RF_33=11,
        I_RF_21=2.4) annotation (extent=[-48,28; 46,88]);
      Tires.Slim.Slipping FrontTire1(
        mRim=3,
        I_11=0.14,
        I_22=0.14,
        I_33=0.28,
        w_start={0,0,v/0.35},
        initType=Modelica.Mechanics.MultiBody.Types.Init.Velocity,
        onSurface=false,
        rWheel=0.35,
        rRim=0.31) annotation (extent=[-100,17; -60,57]);
      Tires.Slim.Slipping RearTire1(
        I_11=0.06,
        I_22=0.06,
        I_33=0.12,
        mRim=2,
        initType=Modelica.Mechanics.MultiBody.Types.Init.PositionVelocity,
        phi_start={0.1,0,0},
        useAdvancedInitialization=true,
        w_start_advanced={0,0,v/0.305},
        rRim=0.27,
        rWheel=0.305)     annotation (extent=[100,14; 60,54]);
      Tires.Slim.Advanced FrontTire2(
        mRim=3,
        I_11=0.14,
        I_22=0.14,
        I_33=0.28,
        w_start={0,0,v/0.35},
        initType=Modelica.Mechanics.MultiBody.Types.Init.Velocity,
        onSurface=false,
        rWheel=0.35,
        rRim=0.31) annotation (extent=[-100,-63; -60,-23]);
      Tires.Slim.Advanced RearTire2(
        I_11=0.06,
        I_22=0.06,
        I_33=0.12,
        mRim=2,
        initType=Modelica.Mechanics.MultiBody.Types.Init.PositionVelocity,
        phi_start={0.1,0,0},
        useAdvancedInitialization=true,
        w_start_advanced={0,0,v/0.305},
        rRim=0.27,
        rWheel=0.305)     annotation (extent=[100,-66; 60,-26]);
    equation
      connect(FrontTire1.TireHub, bicycleComplete1.connectFW) annotation (
          points=[-60,37; -50.8923,37], style(
          color=0,
          rgbcolor={0,0,0},
          thickness=2));
      connect(RearTire1.TireHub, bicycleComplete1.connectRW) annotation (points=[60,34;
            45.2769,34],        style(
          color=0,
          rgbcolor={0,0,0},
          thickness=2));
      connect(FrontTire2.TireHub, bicycleComplete2.connectFW) annotation (
          points=[-60,-43; -50.8923,-43], style(
          color=0,
          rgbcolor={0,0,0},
          thickness=2));
      connect(RearTire2.TireHub, bicycleComplete2.connectRW) annotation (points=[60,-46;
            45.2769,-46],         style(
          color=0,
          rgbcolor={0,0,0},
          thickness=2));
    end UncontrolledBicycleSlim;

    model UncontrolledBicycleTorque
      "a bicycle is accelerated by a torque on its rear wheel."
      import MotorcycleDynamicsV7;
      import SI = Modelica.SIunits;
      extends WheelsAndTires.TireComponents.Utilities.Icons.ExampleModel;

      WheelsAndTires.Examples.UsedModels.Bicycle bicycle_complete(
        p1={0.3,0.9,0},
        p2={0.9,0.7,0},
        p3={0.8,0.9,0},
        I_FF_11=0.0546,
        I_FF_22=0.0114,
        I_FF_33=0.06,
        I_FF_21=-0.0162,
        I_RF_11=9.2,
        I_RF_22=2.8,
        I_RF_33=11,
        I_RF_21=2.4) annotation (extent=[-48,20; 46,80]);
      annotation (
        Diagram,
        experiment(StopTime=3, NumberOfIntervals=750),
        experimentSetupOutput,
        Icon,
        Documentation(info="<html>

<p>
This example accalerates a bicycle model by a strong torque acting on the rear wheel, making the front tire lift from the ground.
</p>

<img src=\"../images/Master_Doku_MarkusAndres189x.png\" </img>

</html>"));
      inner MultiBondLib.Mechanics3D.World3D world3D(
        g=9.81,
        n={0,-1,0},
        nominalLength=2)                     annotation (extent=[-100,-100; -80,
            -80]);
      Tires.Belt.Advanced RearTire(
        I_11=0.06,
        I_22=0.06,
        I_33=0.12,
        mRim=2,
        initType=Modelica.Mechanics.MultiBody.Types.Init.Position,
        rRim=0.24,
        beltWidth=50e-3,
        beltRadius=50e-3)     annotation (extent=[100,6; 60,46]);
      Tires.Belt.Advanced FrontTire(
        mRim=3,
        I_11=0.14,
        I_22=0.14,
        I_33=0.28,
        rRim=0.285,
        beltWidth=50e-3,
        beltRadius=50e-3)
                   annotation (extent=[-100,9; -60,49]);
      MultiBondLib.Mechanics3D.Forces.BodyTorque bodyTorque
        annotation (extent=[40,-28; 60,-8],  rotation=90);
      Modelica.Blocks.Sources.Trapezoid trapezoid(
        nperiod=1,
        width=1,
        rising=0.1,
        falling=0.1,
        period=1.2,
        amplitude=170.5)
                   annotation (extent=[12,-50; 32,-30],  rotation=0);
      Modelica.Blocks.Sources.Constant const[2](k={0,0})
        annotation (extent=[90,-50; 70,-30]);
      inner WheelsAndTires.Environment.Surface Surface(
        LengthZ=10,
        LengthX=20,
        OffsetX=-19)
        annotation (extent=[80,-100; 100,-80]);
    equation
      connect(bodyTorque.frame_b, bicycle_complete.connectRW) annotation (
          points=[50,-7; 50,26; 45.2769,26],    style(
          color=0,
          rgbcolor={0,0,0},
          thickness=2));
      connect(trapezoid.y, bodyTorque.torque[3])
                                            annotation (points=[33,-40; 49.3333,
            -40; 49.3333,-28.4], style(color=74, rgbcolor={0,0,127}));
      connect(const[1:2].y, bodyTorque.torque[1:2]) annotation (points=[69,-40;
            50,-40; 50,-28.4; 50.6667,-28.4], style(color=74, rgbcolor={0,0,127}));
      connect(FrontTire.TireHub, bicycle_complete.connectFW) annotation (points=[-60,29;
            -50.8923,29], style(
          color=0,
          rgbcolor={0,0,0},
          thickness=2));
      connect(bicycle_complete.connectRW, RearTire.TireHub) annotation (points=[45.2769,
            26; 60,26],                                  style(
          color=0,
          rgbcolor={0,0,0},
          thickness=2));
    end UncontrolledBicycleTorque;

    model UncontrolledMotorcycle
      "a sprung motorcylce model with initial lean angle and velocity"
      import MotorcycleDynamicsV7;
      import SI = Modelica.SIunits;
      extends WheelsAndTires.TireComponents.Utilities.Icons.ExampleModel;

      parameter SI.Velocity v = 8 "Initial velocity of the motorcycle";

      annotation (
        Diagram,
        experiment(StopTime=4, NumberOfIntervals=1000),
        experimentSetupOutput,
        Icon,
        Documentation(info="<html>

<p>
This example initializes a sprung motorcycle without proper visualization with a initial velocity and lean angle making it perform a tail motion and getting instable after a certain amount of time.
</p>

<img src=\"../images/UncontrolledMotorcycle.png\" </img>

</html>"));
      inner MultiBondLib.Mechanics3D.World3D world3D(
        g=9.81,
        n={0,-1,0},
        nominalLength=2)                     annotation (extent=[-100,-100; -80,
            -80]);
      inner WheelsAndTires.Environment.Surface Surface(LengthZ=10, OffsetX=-45)
                                        annotation (extent=[80,-100; 100,-80]);
      WheelsAndTires.Examples.UsedModels.Motorcycle motorcycle
                                       annotation (extent=[-34,-24; 34,24]);
      Tires.Slim.Slipping RearTire(
        I_11=0.06,
        I_22=0.06,
        I_33=0.12,
        mRim=2,
        rRim=0.285,
        initType=Modelica.Mechanics.MultiBody.Types.Init.Velocity,
        useAdvancedInitialization=true,
        initSlip=WheelsAndTires.Tires.Commons.Types.InitSlip.TransSlip,
        v_start_advanced={-v,0,0})
                          annotation (extent=[90,-40; 50,0]);

      Tires.Slim.Slipping FrontTire(
        mRim=3,
        I_11=0.14,
        I_22=0.14,
        I_33=0.28,
        rRim=0.33,
        onSurface=false,
        initType=Modelica.Mechanics.MultiBody.Types.Init.PositionVelocity,
        enforceStates=true,
        useAdvancedInitialization=true,
        initSlip=WheelsAndTires.Tires.Commons.Types.InitSlip.TransSlip,
        v_start_advanced={-v,0,0},
        phi_start={1*Modelica.Constants.pi/180,0,0})
                   annotation (extent=[-90,-40; -50,0]);

    equation
      connect(FrontTire.TireHub, motorcycle.frame_a) annotation (points=[-50,
            -20; -35.2,-20], style(
          color=0,
          rgbcolor={0,0,0},
          thickness=2));
      connect(motorcycle.frame_b, RearTire.TireHub) annotation (points=[35.2,
            -20; 50,-20], style(
          color=0,
          rgbcolor={0,0,0},
          thickness=2));
    end UncontrolledMotorcycle;

    model UncontrolledMotorcycleTorque
      "a motorcycle accelerated by a torque on an uneven surface."

      extends WheelsAndTires.TireComponents.Utilities.Icons.ExampleModel;

      annotation (Diagram,
        experiment(StopTime=13, NumberOfIntervals=3250),
        experimentSetupOutput,
        Documentation(info="<html>

<p>
This example accalerates a sprung motorcycle model by a strong torque gaining a high velocity and jumping over a gap defined by an uneven surface.
</p>

<img src=\"../images/Master_Doku_MarkusAndres190x.png\" </img>

</html>"));
      MultiBondLib.Mechanics3D.Forces.BodyTorque bodyTorque
        annotation (extent=[42,-20; 58,-6],  rotation=90);
      Modelica.Blocks.Sources.Trapezoid DrivingTorque(
        nperiod=1,
        rising=.01,
        falling=.01,
        amplitude=275,
        width=10,
        period=10.02)
                   annotation (extent=[28,-38; 40,-26],  rotation=0);
      Modelica.Blocks.Sources.Constant const[2](k={0,0})
        annotation (extent=[72,-38; 60,-26]);
      inner MultiBondLib.Mechanics3D.World3D world3D(
        g=9.81,
        n={0,-1,0},
        nominalLength=2)                     annotation (extent=[-100,-100; -80,
            -80]);
      inner Environment.Surface Surface(
        FlatSurface=false,
        LengthZ=10,
        OffsetZ=-5,
        nv=2,
        LengthX=250,
        nu=19,
        OffsetX=-240,
        y=3*[0,0; 0,0; 0.2,0.2; 1,1; 0,0; 1,1; 0.2,0.2; 0,0; 0,0; 0,0; 0,0; 0,0;
            0,0; 0,0; 0,0; 0,0; 0,0; 0,0; 0,0],
        dy_dx=0.2*[0,0; 0,0; 0.75,0.75; 1,1; 0,0; -1,-1; -0.75,-0.75; 0,0; 0,0;
            0,0; 0,0; 0,0; 0,0; 0,0; 0,0; 0,0; 0,0; 0,0; 0,0])
        annotation (extent=[80,-100; 100,-80]);
      Tires.Slim.Advanced RearTire(
        I_11=0.06,
        I_22=0.06,
        I_33=0.12,
        mRim=2,
        rRim=0.285,
        onSurface=false)  annotation (extent=[96,0; 56,40]);
      Tires.Slim.Advanced FrontTire(
        mRim=3,
        I_11=0.14,
        I_22=0.14,
        I_33=0.28,
        rRim=0.33,
        enforceStates=true,
        onSurface=false,
        initType=Modelica.Mechanics.MultiBody.Types.Init.PositionVelocity)
                   annotation (extent=[-84,0; -44,40]);
      UsedModels.Motorcycle motorcycle(FWRevolute(initType=Modelica.Mechanics.MultiBody.Types.Init.Position))
                                       annotation (extent=[-28,16; 40,64]);
    equation
      connect(DrivingTorque.y, bodyTorque.torque[3])
                                            annotation (points=[40.6,-32;
            49.4667,-32; 49.4667,-20.28],
                                 style(color=74, rgbcolor={0,0,127}));
      connect(const[1:2].y,bodyTorque. torque[1:2]) annotation (points=[59.4,-32;
            50,-32; 50,-20.28; 50.5333,-20.28],
                                              style(color=74, rgbcolor={0,0,127}));
      connect(FrontTire.TireHub,motorcycle. frame_a) annotation (points=[-44,20;
            -29.2,20],  style(
          color=0,
          rgbcolor={0,0,0},
          thickness=2));
      connect(motorcycle.frame_b,RearTire. TireHub) annotation (points=[41.2,20;
            56,20],       style(
          color=0,
          rgbcolor={0,0,0},
          thickness=2));
      connect(bodyTorque.frame_b, motorcycle.frame_b) annotation (points=[50,-5.3;
            50,20; 41.2,20],       style(
          color=0,
          rgbcolor={0,0,0},
          thickness=2));
    end UncontrolledMotorcycleTorque;

    model FourWheeledVehicle
      "a four wheeled vehicle with breaks and a torque acting on the rear tires."
      import MotorcycleDynamicsV7;
      import SI = Modelica.SIunits;
      extends WheelsAndTires.TireComponents.Utilities.Icons.ExampleModel;

      annotation (
        Diagram,
        experiment(StopTime=30, NumberOfIntervals=7500),
        experimentSetupOutput,
        Icon,
        Coordsys(extent=[-200,-150; 200,150], scale=0.1),
        Documentation(info="<html>

<p>
This example contains a very basic unspung four-wheeled vehicle. Its movement is determined by pre-defined profiles for driving torque acting on the rear wheels and angle profiles for the steering angle. A impulse of the driving torque makes the vehicle slide after 22s that is reacted on by a full breaking to make the vehicle come to a stand-still.
</p>

<img src=\"../images/Master_Doku_MarkusAndres191x.png\" </img>

</html>"));
      inner MultiBondLib.Mechanics3D.World3D world3D(
        g=9.81,
        n={0,-1,0},
        nominalLength=2)                     annotation (extent=[-200,-150;
            -180,-130]);
      inner WheelsAndTires.Environment.Surface Surface(
        LengthX=300,
        LengthZ=300,
        OffsetX=-10,
        OffsetZ=-290)                   annotation (extent=[180,-150; 200,-130]);

      Tires.Belt.Slipping RearLeftTire(mRim=25, onSurface=true,
        initType=Modelica.Mechanics.MultiBody.Types.Init.Free)
                   annotation (extent=[-200,-60; -160,-20]);
      Tires.Belt.Slipping FrontLeftTire(mRim=25, onSurface=false)
                   annotation (extent=[-200,70; -160,110]);
      Tires.Belt.Slipping FrontRightTire(mRim=25, onSurface=false)
                   annotation (extent=[160,70; 120,110]);
      Tires.Belt.Slipping RearRightTire(mRim=25, onSurface=false)
                   annotation (extent=[160,-60; 120,-20]);
      MultiBondLib.Mechanics3D.Parts.FixedTranslation LengthTranslation(r={3.5,
            0,0}) annotation (extent=[-30,50; -10,70],rotation=90);
      MultiBondLib.Mechanics3D.Parts.FixedTranslation FrontLeftTranslation(r={0,
            0,-0.8}) annotation (extent=[-48,80; -28,100],
                                                         rotation=180);
      MultiBondLib.Mechanics3D.Parts.FixedTranslation FrontRightTranslation(r={
            0,0,0.8}) annotation (extent=[-12,80; 8,100],
                                                        rotation=0);
      MultiBondLib.Mechanics3D.Parts.FixedTranslation RearLeftTranslation(r={0,
            0,-1}) annotation (extent=[-48,-50; -28,-30],rotation=180);
      MultiBondLib.Mechanics3D.Parts.FixedTranslation RearRightTransation(r={0,
            0,1}) annotation (extent=[-12,-50; 8,-30],rotation=0);
      MultiBondLib.Mechanics3D.Joints.ActuatedRevolute FrontLeftRevolute
        annotation (extent=[-152,80; -132,100]);
      MultiBondLib.Mechanics3D.Joints.ActuatedRevolute RearLeftRevolute(
          enforceStates=true)
        annotation (extent=[-150,-50; -130,-30]);
      MultiBondLib.Mechanics3D.Joints.ActuatedRevolute FrontRightRevolute
        annotation (extent=[92,80; 112,100]);
      MultiBondLib.Mechanics3D.Joints.ActuatedRevolute revolute3
        annotation (extent=[90,-50; 110,-30]);
      MultiBondLib.Mechanics3D.Joints.ActuatedRevolute LeftSteeringRevolute(n={
            0,1,0}) annotation (extent=[-100,80; -80,100]);
      MultiBondLib.Mechanics3D.Joints.ActuatedRevolute RightSteeringRevolute(n=
            {0,1,0}) annotation (extent=[40,80; 60,100],rotation=180);
      MultiBondLib.Mechanics3D.Parts.FixedTranslation CenterTranslation(r={1.75,
            0,0})
                annotation (extent=[-10,-20; 10,0],rotation=90);
      MultiBondLib.Mechanics3D.Parts.Body body(
        m=1000,
        I_11=100,
        I_22=200,
        I_33=300) annotation (extent=[-10,52; 10,72],rotation=90);
      BondLib.Mechanical.Rotational.Sources.Torque LeftDrivingTorque
        annotation (extent=[-123,-126; -143,-106],
                                                 rotation=90);
      BondLib.Mechanical.Rotational.Sources.Torque RightDrivingTorque
        annotation (extent=[87,-126; 107,-106],rotation=90);
      Modelica.Blocks.Sources.Trapezoid DrivingTorque(
        amplitude=1000,
        rising=0.1,
        falling=0.1,
        width=0.1,
        nperiod=1,
        period=1,
        startTime=22,
        offset=400)    annotation (extent=[-30,-126; -10,-106],
                                                             rotation=270);
      Modelica.Blocks.Sources.Pulse const(
        amplitude=0.5,
        width=50,
        offset=-0.4,
        period=10)   annotation (extent=[-180,0; -160,20]);
      TireComponents.Utilities.AdditionalBG.Angle LeftSteeringAngle
        annotation (extent=[-93,50; -73,70], rotation=90);
      TireComponents.Utilities.AdditionalBG.Angle RightSteeringAngle
        annotation (extent=[19,50; 39,70], rotation=90);
      MultiBondLib.Mechanics3D.Parts.FixedTranslation FrontRightTranslation1(r=
            {0,0,0.2}) annotation (extent=[66,80; 86,100], rotation=0);
      MultiBondLib.Mechanics3D.Parts.FixedTranslation FrontLeftTranslation1(r={
            0,0,-0.2}) annotation (extent=[-126,80; -106,100],
                                                             rotation=180);
      Modelica.Blocks.Continuous.FirstOrder firstOrder(T=0.25)
        annotation (extent=[-140,0; -120,20]);
      BondLib.Mechanical.Rotational.Passive.Brake BrakeRearLeft(fn_max=1e5)
        annotation (extent=[-142,-86; -122,-66], rotation=270);
      BondLib.Mechanical.Rotational.Passive.Brake BrakeRearRight(fn_max=1e5)
        annotation (extent=[97,-88; 117,-68], rotation=270);
      BondLib.Mechanical.Rotational.Passive.Brake BrakeFrontLeft(fn_max=1e5)
        annotation (extent=[-145,40; -125,60], rotation=270);
      BondLib.Mechanical.Rotational.Passive.Brake BrakeFrontRight(fn_max=1e5)
        annotation (extent=[99,40; 119,60], rotation=270);
      Modelica.Blocks.Sources.Ramp BreakControl(
        height=1,
        duration=0.1,
        startTime=23) annotation (extent=[200,10; 180,30], rotation=0);
    equation
      connect(FrontLeftTranslation.frame_a, LengthTranslation.frame_b)
        annotation (points=[-27,90; -20,90; -20,71],                  style(
          color=0,
          rgbcolor={0,0,0},
          thickness=2));
      connect(FrontRightTranslation.frame_a, LengthTranslation.frame_b)
        annotation (points=[-13,90; -20,90; -20,71],                 style(
          color=0,
          rgbcolor={0,0,0},
          thickness=2));
      connect(RearRightTransation.frame_a, LengthTranslation.frame_a)
        annotation (points=[-13,-40; -20,-40; -20,49],                   style(
          color=0,
          rgbcolor={0,0,0},
          thickness=2));
      connect(RearLeftTranslation.frame_a, LengthTranslation.frame_a)
        annotation (points=[-27,-40; -20,-40; -20,49],                    style(
          color=0,
          rgbcolor={0,0,0},
          thickness=2));
      connect(FrontLeftRevolute.frame_a, FrontLeftTire.TireHub) annotation (
          points=[-153,90; -160,90], style(
          color=0,
          rgbcolor={0,0,0},
          thickness=2));
      connect(RearLeftTire.TireHub, RearLeftRevolute.frame_a) annotation (
          points=[-160,-40; -151,-40], style(
          color=0,
          rgbcolor={0,0,0},
          thickness=2));
      connect(FrontRightRevolute.frame_b, FrontRightTire.TireHub) annotation (
          points=[113,90; 120,90], style(
          color=0,
          rgbcolor={0,0,0},
          thickness=2));
      connect(RearRightTire.TireHub, revolute3.frame_b) annotation (points=[120,-40;
            111,-40],      style(
          color=0,
          rgbcolor={0,0,0},
          thickness=2));
      connect(LeftSteeringRevolute.frame_b, FrontLeftTranslation.frame_b)
        annotation (points=[-79,90; -49,90], style(
          color=0,
          rgbcolor={0,0,0},
          thickness=2));
      connect(RearLeftTranslation.frame_b, RearLeftRevolute.frame_b)
        annotation (points=[-49,-40; -129,-40], style(
          color=0,
          rgbcolor={0,0,0},
          thickness=2));
      connect(RearRightTransation.frame_b, revolute3.frame_a) annotation (
          points=[9,-40; 89,-40],   style(
          color=0,
          rgbcolor={0,0,0},
          thickness=2));
      connect(CenterTranslation.frame_a, LengthTranslation.frame_a) annotation (
         points=[-6.73533e-016,-21; 0,-28; -20,-28; -20,49],           style(
          color=0,
          rgbcolor={0,0,0},
          thickness=2));
      connect(body.frame_a, CenterTranslation.frame_b) annotation (points=[
            -6.73533e-016,51; 6.73533e-016,1],
                       style(
          color=0,
          rgbcolor={0,0,0},
          thickness=2));
      connect(DrivingTorque.y, RightDrivingTorque.tau) annotation (points=[-20,-127;
            -20,-140; 97,-140; 97,-127],                           style(color=
              74, rgbcolor={0,0,127}));
      connect(DrivingTorque.y, LeftDrivingTorque.tau) annotation (points=[-20,-127;
            -20,-140; -133,-140; -133,-127],                         style(
            color=74, rgbcolor={0,0,127}));
      connect(LeftSteeringRevolute.axis, LeftSteeringAngle.flange_b)
        annotation (points=[-83,83; -83,70], style(color=0, rgbcolor={0,0,0}));
      connect(RightSteeringRevolute.frame_b, FrontRightTranslation.frame_b)
        annotation (points=[39,90; 9,90],  style(
          color=0,
          rgbcolor={0,0,0},
          thickness=2));
      connect(RightSteeringRevolute.axis, RightSteeringAngle.flange_b)
        annotation (points=[43,97; 43,108; 29,108; 29,70],
                                                         style(color=0,
            rgbcolor={0,0,0}));
      connect(FrontRightTranslation1.frame_a, RightSteeringRevolute.frame_a)
        annotation (points=[65,90; 61,90], style(
          color=0,
          rgbcolor={0,0,0},
          thickness=2));
      connect(FrontRightTranslation1.frame_b, FrontRightRevolute.frame_a)
        annotation (points=[87,90; 91,90],   style(
          color=0,
          rgbcolor={0,0,0},
          thickness=2));
      connect(FrontLeftRevolute.frame_b, FrontLeftTranslation1.frame_b)
        annotation (points=[-131,90; -127,90], style(
          color=0,
          rgbcolor={0,0,0},
          thickness=2));
      connect(FrontLeftTranslation1.frame_a, LeftSteeringRevolute.frame_a)
        annotation (points=[-105,90; -101,90],
                                             style(
          color=0,
          rgbcolor={0,0,0},
          thickness=2));
      connect(firstOrder.u, const.y) annotation (points=[-142,10; -159,10],
          style(color=74, rgbcolor={0,0,127}));
      connect(LeftSteeringAngle.phi_ref, firstOrder.y) annotation (points=[-83,
            49; -83,10; -119,10], style(color=74, rgbcolor={0,0,127}));
      connect(RightSteeringAngle.phi_ref, firstOrder.y) annotation (points=[29,
            49; 29,10; -119,10], style(color=74, rgbcolor={0,0,127}));
      connect(BrakeRearLeft.flange_a, RearLeftRevolute.axis) annotation (points=
           [-132,-66; -132,-47; -133,-47], style(color=0, rgbcolor={0,0,0}));
      connect(BrakeRearLeft.flange_b, LeftDrivingTorque.flange_b) annotation (
          points=[-132,-86; -132,-106; -133,-106], style(color=0, rgbcolor={0,0,
              0}));
      connect(BrakeRearLeft.bearing, RearLeftRevolute.bearing) annotation (
          points=[-142,-76; -147,-76; -147,-47], style(color=0, rgbcolor={0,0,0}));
      connect(revolute3.axis, BrakeRearRight.flange_a) annotation (points=[107,
            -47; 107,-68], style(color=0, rgbcolor={0,0,0}));
      connect(BrakeRearRight.bearing, revolute3.bearing) annotation (points=[97,
            -78; 93,-78; 93,-47], style(color=0, rgbcolor={0,0,0}));
      connect(BrakeFrontLeft.flange_a, FrontLeftRevolute.axis) annotation (
          points=[-135,60; -135,83], style(color=0, rgbcolor={0,0,0}));
      connect(BrakeFrontRight.flange_a, FrontRightRevolute.axis)
        annotation (points=[109,60; 109,83], style(color=0, rgbcolor={0,0,0}));
      connect(FrontRightRevolute.bearing, BrakeFrontRight.bearing) annotation (
          points=[95,83; 95,66.5; 99,66.5; 99,50], style(color=0, rgbcolor={0,0,
              0}));
      connect(FrontLeftRevolute.bearing, BrakeFrontLeft.bearing) annotation (
          points=[-149,83; -149,67.5; -145,67.5; -145,50], style(color=0,
            rgbcolor={0,0,0}));
      connect(BreakControl.y, BrakeFrontRight.f_normalized) annotation (points=
            [179,20; 130,20; 130,50; 119,50], style(color=45, rgbcolor={255,128,
              0}));
      connect(BreakControl.y, BrakeFrontLeft.f_normalized) annotation (points=[
            179,20; -104,20; -104,50; -125,50], style(color=45, rgbcolor={255,
              128,0}));
      connect(BreakControl.y, BrakeRearRight.f_normalized) annotation (points=[
            179,20; 172,20; 172,-78; 117,-78], style(color=45, rgbcolor={255,
              128,0}));
      connect(BreakControl.y, BrakeRearLeft.f_normalized) annotation (points=[
            179,20; 172,20; 172,-90; -114,-90; -114,-76; -122,-76], style(color=
             45, rgbcolor={255,128,0}));
      connect(BrakeRearLeft.bearing, LeftDrivingTorque.bearing) annotation (
          points=[-142,-76; -147,-76; -147,-116; -143,-116], style(color=0,
            rgbcolor={0,0,0}));
      connect(RightDrivingTorque.bearing, BrakeRearRight.flange_b) annotation (
          points=[107,-116; 107,-88], style(color=0, rgbcolor={0,0,0}));
      connect(RightDrivingTorque.flange_b, BrakeRearRight.bearing) annotation (
          points=[97,-106; 93,-106; 93,-78; 97,-78], style(color=0, rgbcolor={0,
              0,0}));
    end FourWheeledVehicle;

    package UsedModels
      "contains the single track vehicles which are provided by Thomas Schmitt, Autor of the MotorcycleLib."
      annotation(preferedView="info");

      extends WheelsAndTires.TireComponents.Utilities.Icons.ExamplesPackage;

      model Bicycle "A simple bicycle model based on rigid elements."

        import SI = Modelica.SIunits;
        import CO = Modelica.SIunits.Conversions;
        import MB = Modelica.Mechanics.MultiBody;

        // general parameter (valid for whole motorcycle)
        parameter SI.Distance rRW = 0.30 "Rear wheel radius";
        parameter SI.Distance rFW = 0.35 "Front wheel radius";
        parameter SI.Distance p = 1.02 "Wheel base";
        parameter SI.Distance t = 0.08 "Trail";

        parameter CO.NonSIunits.Angle_deg alpha = Modelica.Math.atan(3)*180/Modelica.Constants.pi
          "Steering head angle";
        final parameter SI.Angle alpha_rad = CO.from_deg(alpha);
        final parameter SI.Angle epsilon_rad = Modelica.Constants.pi/2 - alpha_rad;
        final parameter SI.Position nSt[3] = {sin(epsilon_rad),cos(epsilon_rad),0}
          "direction of steering axis";

        parameter SI.Position p1[3] = {1,1,0} "Center of mass rear frame";
        final parameter SI.Position CoM_RF[3] = {-p1[1], p1[2] - rRW, p1[3]};

        parameter SI.Position p2[3] = {1, 1, 0} "Center of mass front frame";
        final parameter SI.Position CoM_FF[3] = {p - p2[1], p2[2] - rFW, p2[3]};

        parameter SI.Position p3[3] = {1, 1, 0} "Steering axis position";
        final parameter SI.Position rRF[3] = {p3[1], rRW-p3[2], p3[3]};

        // Calculate the distance between rear wheel center point and front wheel center point
        final parameter SI.Distance p_rRW_rFW = sqrt( abs(rFW-rRW)^2 + p^2);

        final parameter SI.Position rFF[3] = {p_rRW_rFW-rRF[1], p3[2]-rFW, p3[3]};

        parameter SI.Mass mFF = 4 "Front frame mass";
        parameter SI.Mass mRF = 85 "Rear frame mass";

        // Rear Frame parameter
        parameter SI.Inertia I_RF_11=0.001 "(1,1) element of inertia tensor"
          annotation(Dialog(tab="Inertia tensor of the Rear Frame", group="Inertia Tensor (world co-ordinates)"));
        parameter SI.Inertia I_RF_22=0.001 "(2,2) element of inertia tensor"
        annotation(Dialog(tab="Inertia tensor of the Rear Frame", group="Inertia Tensor (world co-ordinates)"));
        parameter SI.Inertia I_RF_33=0.001 "(3,3) element of inertia tensor"
        annotation(Dialog(tab="Inertia tensor of the Rear Frame", group="Inertia Tensor (world co-ordinates)"));
        parameter SI.Inertia I_RF_21=0 "(2,1) element of inertia tensor"
        annotation(Dialog(tab="Inertia tensor of the Rear Frame", group="Inertia Tensor (world co-ordinates)"));
        parameter SI.Inertia I_RF_31=0 "(3,1) element of inertia tensor"
        annotation(Dialog(tab="Inertia tensor of the Rear Frame", group="Inertia Tensor (world co-ordinates)"));
        parameter SI.Inertia I_RF_32=0 "(3,2) element of inertia tensor"
        annotation(Dialog(tab="Inertia tensor of the Rear Frame", group="Inertia Tensor (world co-ordinates)"));

        // Front Frame parameter
        parameter SI.Inertia I_FF_11=0.001 "(1,1) element of inertia tensor"
          annotation(Dialog(tab="Inertia tensor of the Front Frame", group="Inertia Tensor (body co-ordinates)"));
        parameter SI.Inertia I_FF_22=0.001 "(2,2) element of inertia tensor"
        annotation(Dialog(tab="Inertia tensor of the Front Frame", group="Inertia Tensor (body co-ordinates)"));
        parameter SI.Inertia I_FF_33=0.001 "(3,3) element of inertia tensor"
        annotation(Dialog(tab="Inertia tensor of the Front Frame", group="Inertia Tensor (body co-ordinates)"));
        parameter SI.Inertia I_FF_21=0 "(2,1) element of inertia tensor"
        annotation(Dialog(tab="Inertia tensor of the Front Frame", group="Inertia Tensor (body co-ordinates)"));
        parameter SI.Inertia I_FF_31=0 "(3,1) element of inertia tensor"
        annotation(Dialog(tab="Inertia tensor of the Front Frame", group="Inertia Tensor (body co-ordinates)"));
        parameter SI.Inertia I_FF_32=0 "(3,2) element of inertia tensor"
        annotation(Dialog(tab="Inertia tensor of the Front Frame", group="Inertia Tensor (body co-ordinates)"));

        // Geometric description
        annotation (Images(Parameters(name="", source="images/bicycle_3dof.jpg")),
            Diagram,
          Icon(
            Rectangle(extent=[-130,100; 130,-100], style(
                color=74,
                rgbcolor={0,0,127},
                fillColor=7,
                rgbfillColor={255,255,255},
                fillPattern=1)),
            Bitmap(extent=[-126,93; 126,-99],   name="images/Bicycle_Logo.png"),
            Line(points=[100,-80; 128,-80],   style(color=10, rgbcolor={95,95,95})),
            Line(points=[-128,-70; -98,-70],  style(color=10, rgbcolor={95,95,95})),
            Text(
              extent=[-130,126; 130,100],
              string="%name",
              style(
                color=9,
                rgbcolor={175,175,175},
                fillColor=10,
                rgbfillColor={135,135,135},
                fillPattern=1))));

        // Animation
        // -------------------------------------------------------------------------------------

        parameter SI.Angle saddlepipeAngle = 75
          "|Animation || angle of saddlepipe";
        final parameter SI.Angle saddlepipeAngleRad = SI.Conversions.from_deg(saddlepipeAngle);
        parameter SI.Position saddlenodeHeight = 0.4
          "|Animation || height of the saddle node";
        parameter SI.Position saddleHeight = 0.15
          "|Animation || height of the saddle above the saddlenode";
        parameter SI.Position chainwheelPos = 1.3*0.3
          "|Animation || xposition of the chainwheel";
        parameter Real ladyFactor = 0
          "|Animation || factor for low entrance: Pushes down the upper frame bar.";
        parameter SI.Angle handlebarAngle = 110
          "|Animation || angle of the handlebar";
        final parameter SI.Angle handlebarAngleRad = SI.Conversions.from_deg(handlebarAngle);

        final parameter SI.Position chainwheel[3] = {-chainwheelPos,0,0};
        final parameter SI.Position saddlenode[3] = {chainwheel[1]+(1/tan(saddlepipeAngleRad))*saddlenodeHeight,saddlenodeHeight,0};
        final parameter SI.Position upperframenode[3] = ladyFactor*chainwheel + (1-ladyFactor)*saddlenode;

        MultiBondLib.Mechanics3D.Joints.Revolute FWRevolute(
          phi(stateSelect=StateSelect.always),
          initType=Modelica.Mechanics.MultiBody.Types.Init.Position,
          phi_start=0,
          animation=true,
          cylinderLength=0.05,
          cylinderDiameter=0.08,
          cylinderColor={255,0,0},
          enforceStates=true)
          annotation (extent=[-110,-80; -90,-60],rotation=0);
        MultiBondLib.Mechanics3D.Parts.SimpleBody FrontMass(
          sphereDiameter=0.1,
          animation=true,
          sphereColor={0,180,0},
          I_11=I_FF_11,
          I_22=I_FF_22,
          I_33=I_FF_33,
          I_21=I_FF_21,
          I_31=I_FF_31,
          I_32=I_FF_32,
          m=mFF)
               annotation (extent=[-110,40; -90,60],rotation=90);
        MultiBondLib.Mechanics3D.Parts.SimpleBody RearMass(
          animation=true,
          sphereDiameter=0.1,
          sphereColor={0,180,0},
          I_11=I_RF_11,
          I_22=I_RF_22,
          I_33=I_RF_33,
          I_21=I_RF_21,
          I_31=I_RF_31,
          I_32=I_RF_32,
          m=mRF)
               annotation (extent=[50,70; 70,90], rotation=90);
        MultiBondLib.Mechanics3D.Parts.FixedTranslation fixedTranslation1(
                      animation=false, r=CoM_RF)
                      annotation (extent=[50,40; 70,60], rotation=90);
        MultiBondLib.Mechanics3D.Parts.FixedTranslation FrontMassPos(
                             animation=false, r=CoM_FF)
                                                 annotation (extent=[-110,0;
              -90,20],
            rotation=90);

      Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape RWSuspRight(
           lengthDirection=chainwheel,
           length=sqrt(chainwheel*chainwheel),
           shapeType="box",
           color={0,0,100},
           width=0.05,
           height=0.03,
           r_shape={0,0,0.050},
           r=RearFrame.frame_b.P.x,
           R=MB.Frames.Orientation(T=RearFrame.frame_b.P.R,w=zeros(3)));

       Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape RWSusp2Right(
           length=sqrt(saddlenode*saddlenode),
           shapeType="box",
           color={0,0,100},
           lengthDirection=saddlenode,
           width=0.05,
           height=0.03,
           r_shape={0,0,0.050},
           r=RearFrame.frame_b.P.x,
           R=MB.Frames.Orientation(T=RearFrame.frame_b.P.R,w=zeros(3)));

       Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape RWSuspLeft(
           lengthDirection=chainwheel,
           length=sqrt(chainwheel*chainwheel),
           shapeType="box",
           color={0,0,100},
           width=0.05,
           height=0.03,
           r_shape={0,0,-0.050},
           r=RearFrame.frame_b.P.x,
           R=MB.Frames.Orientation(T=RearFrame.frame_b.P.R,w=zeros(3)));

       Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape RWSusp2Left(
           length=sqrt(saddlenode*saddlenode),
           shapeType="box",
           color={0,0,100},
           lengthDirection=saddlenode,
           width=0.05,
           height=0.03,
           r_shape={0,0,-0.050},
           r=RearFrame.frame_b.P.x,
           R=MB.Frames.Orientation(T=RearFrame.frame_b.P.R,w=zeros(3)));

        Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape SaddlePipe(
          shapeType="cylinder",
          color={0,0,100},
          r_shape=chainwheel,
          lengthDirection=saddlenode-chainwheel,
          width=0.06,
          height=0.06,
          length=(saddlenodeHeight+saddleHeight)*(1/sin(saddlepipeAngleRad)),
          r=RearFrame.frame_b.P.x,
          R=MB.Frames.Orientation(T=RearFrame.frame_b.P.R,w=zeros(3)));

         Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape lowerframepipe(
           shapeType="box",
           color={0,0,100},
           r_shape=chainwheel,
           width=0.1,
           height=0.06,
           lengthDirection=-RearFrame.r-chainwheel,
           widthDirection={0,0,1},
           length=sqrt((-RearFrame.r-chainwheel)*(-RearFrame.r-chainwheel)),
           r=RearFrame.frame_b.P.x,
           R=MB.Frames.Orientation(T=RearFrame.frame_b.P.R,w=zeros(3)));

         Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape upperframepipe(
           shapeType="box",
           color={0,0,100},
           width=0.1,
           height=0.06,
           widthDirection={0,0,1},
           r_shape=upperframenode,
           lengthDirection=(-RearFrame.r-upperframenode),
           length=sqrt((-RearFrame.r-upperframenode)*(-RearFrame.r-upperframenode)),
           r=RearFrame.frame_b.P.x,
           R=MB.Frames.Orientation(T=RearFrame.frame_b.P.R,w=zeros(3)));

        Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape chainwheelpipe(
          shapeType="cylinder",
          color={0,0,100},
          widthDirection={1,0,0},
          r_shape=chainwheel+{0,0,-0.08},
          lengthDirection={0,0,1},
          width=0.1,
          height=0.1,
          length=0.16,
          r=RearFrame.frame_b.P.x,
          R=MB.Frames.Orientation(T=RearFrame.frame_b.P.R,w=zeros(3)));

       Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape Saddle(
          color={0,0,0},
          shapeType="beam",
          lengthDirection={-1,0,0},
          widthDirection={0,0,1},
          length=0.2,
          width=0.1,
          height=0.04,
          r_shape={saddlenode[1]+(saddleHeight/tan(saddlepipeAngleRad))+0.07,saddleHeight+saddlenodeHeight,0},
          r=RearFrame.frame_b.P.x,
          R=MB.Frames.Orientation(T=RearFrame.frame_b.P.R,w=zeros(3)));

        Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape ForkPipe1(
          shapeType="box",
          color={0,0,100},
          lengthDirection={cos(handlebarAngleRad),sin(handlebarAngleRad),0},
          r_shape={0,0,0},
          length=0.134,
          width=0.05,
          height=0.05,
          r=FrontFrame.frame_b.P.x,
          R=MB.Frames.Orientation(T=FrontFrame.frame_b.P.R,w=zeros(3)));

        Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape ForkPipe2(
          shapeType="cylinder",
          color={0,0,0},
          lengthDirection={0,0,1},
          width=0.06,
          height=0.04,
          r_shape={cos(handlebarAngleRad),sin(handlebarAngleRad),0}*0.134+{0,0,-0.22},
          length=0.44,
          r=FrontFrame.frame_b.P.x,
          R=MB.Frames.Orientation(T=FrontFrame.frame_b.P.R,w=zeros(3)));

        Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape FWSuspLeft(
          shapeType="box",
          r_shape={0,0,-0.050},
          color={0,0,100},
          width=0.03,
          height=0.03,
          lengthDirection=Steering.n,
          length=-FrontFrame.r*Steering.n/sqrt(Steering.n*Steering.n),
          r=FrontFrame.frame_b.P.x,
          R=MB.Frames.Orientation(T=FrontFrame.frame_b.P.R,w=zeros(3)));

        Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape FWSuspRight(
          shapeType="box",
          color={0,0,100},
          width=0.03,
          height=0.03,
          lengthDirection=Steering.n,
          r_shape={0,0,0.050},
          length=-FrontFrame.r*Steering.n/sqrt(Steering.n*Steering.n),
          r=FrontFrame.frame_b.P.x,
          R=MB.Frames.Orientation(T=FrontFrame.frame_b.P.R,w=zeros(3)));

        annotation (
          Diagram(
      Rectangle(extent=[-102,-62; -82,-82],
                                          style(color=83, rgbcolor={255,85,255})),
      Text(
      extent=[-102,-62; -82,-82],
      style(color=83, rgbcolor={255,85,255}),
      string="Connected?"),
            Line(points=[-82,-72; 50,-72],  style(color=83, rgbcolor={255,85,
                    255})),
            Line(points=[-72,-50; -46,-50], style(color=83, rgbcolor={255,85,
                    255})),
            Line(points=[-72,-72; -72,-50], style(color=83, rgbcolor={255,85,
                    255})),
            Line(points=[50,-72; 50,-66],   style(color=83, rgbcolor={255,85,
                    255}))),
          experiment(StopTime=10),
          experimentSetupOutput,
          Documentation(info="<html>
This example presents the model of a bicycle. This model is a slight modification of Dirk Zimmers Bicycle.
<p>
  --> The steering angle is changed to arctan(3)
</p>

<p>
  --> The coordinates of the bicycle are modified
</p>

However, the dynamic characteristics of the bycicle are not changed in any way.

<p>
<img src=\"../Images/Bicycle_mod.png\">
</p>

<p>
The joints of the bicycle are frictionless and the wheels are ideally rolling.
The bicycle is uncontrolled, but due to its initial velocity it is self-stabilizing.
Within a certain a range of driving velocity a bicycle is stable.
<p>

A bicycle has 7 degrees of freedom on positional level and 3 degrees of freedom on
velocity level.
</html>"),Coordsys(extent=[-130,-100; 130,100], scale=0.4),
          Icon(
            Rectangle(extent=[130,100; -130,-100], style(
                color=7,
                rgbcolor={255,255,255},
                fillColor=7,
                rgbfillColor={255,255,255})),
            Bitmap(extent=[-131,100; 129,-100], name="Images/Bicycle_Logo.png"),
            Line(points=[-10,-100; -10,-2; -10,10; -60,60],
                                                      style(color=10, rgbcolor={
                    95,95,95})),
            Line(points=[-60,60; -60,-100], style(color=10, rgbcolor={95,95,95})),
            Line(points=[-128,-70; -124,-70], style(color=10, rgbcolor={95,95,95})),
            Line(points=[122,-80; 128,-80],   style(color=10, rgbcolor={95,95,95})),
            Line(points=[-2,36; -2,36; 42,80; 130,80],       style(color=10,
                  rgbcolor={95,95,95})),
            Line(points=[120,-100; 120,-84], style(color=10, rgbcolor={95,95,95})),
            Line(points=[120,-76; 120,-30; 130,-30; 134,-30],style(color=10,
                  rgbcolor={95,95,95}))));
        MultiBondLib.Mechanics3D.Joints.Revolute RWRevolute(
          phi_start=0,
          animation=true,
          cylinderLength=0.05,
          cylinderDiameter=0.08,
          cylinderColor={255,0,0},
          initType=Modelica.Mechanics.MultiBody.Types.Init.Free,
          w_start=0,
          enforceStates=false) annotation (extent=[80,-90; 100,-70],rotation=0);
        MultiBondLib.Mechanics3D.Parts.FixedTranslation RearFrame(animation=false, r=
              rRF)                               annotation (extent=[2,16; 22,
              36],
            rotation=0);
        MultiBondLib.Mechanics3D.Parts.FixedTranslation FrontFrame(                 r=
             rFF, animation=false)               annotation (extent=[-70,-40;
              -50,-20],
                   rotation=90);
        MultiBondLib.Mechanics3D.Joints.Revolute Steering(
          phi(stateSelect=StateSelect.always),
          initType=Modelica.Mechanics.MultiBody.Types.Init.Position,
          phi_start=0,
          cylinderDiameter=0.07,
          cylinderColor={255,0,0},
          cylinderLength=0.1,
          n=nSt,
          enforceStates=true)
          annotation (extent=[-70,-4; -50,16],rotation=90);
        MultiBondLib.Mechanics3D.Interfaces.Frame_a connectFW
          "interface front wheel revolute joint"
          annotation (extent=[-148,-80; -128,-60], rotation=0);
        MultiBondLib.Mechanics3D.Interfaces.Frame_a connectRW
          "interface rear wheel revolute joint"
          annotation (extent=[118,-90; 138,-70], rotation=0);
      equation

        connect(RearMass.frame_a, fixedTranslation1.frame_b) annotation (points=[60,69;
              60,61],     style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(FrontMassPos.frame_b, FrontMass.frame_a) annotation (points=[-100,21;
              -100,39],style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(FrontMassPos.frame_a, FWRevolute.frame_b) annotation (points=[-100,-1;
              -100,-52; -80,-52; -80,-70; -89,-70],
                            style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(RWRevolute.frame_a, fixedTranslation1.frame_a) annotation (points=[79,-80;
              60,-80; 60,39], style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(FrontFrame.frame_b,Steering. frame_a) annotation (points=[-60,-19;
              -60,-5],
                     style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(Steering.frame_b,RearFrame. frame_a) annotation (points=[-60,17;
              -60,26; 1,26],
                     style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(RearFrame.frame_b, RWRevolute.frame_a) annotation (points=[23,26;
              60,26; 60,-80; 79,-80],
                          style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(FWRevolute.frame_a,connectFW)
                                             annotation (points=[-111,-70; -138,
              -70],      style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(RWRevolute.frame_b, connectRW) annotation (points=[101,-80; 128,
              -80],     style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(FrontFrame.frame_a, FWRevolute.frame_b) annotation (points=[-60,-41;
              -60,-52; -80,-52; -80,-70; -89,-70],      style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2,
            fillColor=10,
            rgbfillColor={135,135,135},
            fillPattern=1));
      end Bicycle;

      annotation (Icon, Documentation(info="<html>

This package contains models used by the Examples package that were provided by [<a href=\"Modelica://WheelsAndTires.UsersGuide.Literature\">Sch09</a>].

</html>"));
      model Motorcycle
        "A basic motorcycle model with front and rear suspension."

        import MotorcycleDynamicsV6;
        import SI = Modelica.SIunits;
        import MB = Modelica.Mechanics.MultiBody;

        final parameter SI.Distance offset = 0.0656;
        final parameter SI.Distance offset_vector[3] = {cos(0.5236)*offset, -sin(0.5236)*offset, 0};

        final parameter SI.Position p2_offset[3] = {1.168+cos(0.5236)*offset, 0.834+sin(0.5236)*offset, 0};
        final parameter SI.Distance r[3] = {1.225 - p2_offset[1], p2_offset[2] - 0.867, 0};

        // Animation
        // -------------------------------------------------------------------------------------

        // x Coordinates of the nodes
        parameter SI.Position node1 = 0.305+0.1
          "|Animation || xposition of node1";
      protected
        parameter SI.Position stabPos = node1 + 0.2
          "|Animation || xposition of the stabilization pipe";
        parameter SI.Position node3 = stabPos + 0.2
          "|Animation || xposition of node3";
        parameter SI.Position node4 = node1 "|Animation || xposition of node4";
        parameter SI.Position node5 = stabPos
          "|Animation || xposition of node5";

        // The Rear Frame of the motorcycle is defined by 5 nodes
      protected
        final parameter SI.Position RFnode1[3] = {-node1,0,0};
        final parameter SI.Position RFnode2[3] = {-stabPos,0,0};
        final parameter SI.Position RFnode3[3] = {-node3,0,0};
        final parameter SI.Position RFnode4[3] = {-node4,0.7-0.305,0};
        final parameter SI.Position RFnode5[3] = {-node5,0.82-0.305,0};

      public
        parameter SI.Angle handlebarAngle = 65
          "|Animation || angle of the handlebar";
      protected
        final parameter SI.Angle handlebarAngleRad = SI.Conversions.from_deg(handlebarAngle);

        // Color of the motorcycle parts
      public
        parameter MB.Types.Color FrameColor = {20,20,100}
          "|Animation|| Color of the Rear Frame";
        parameter MB.Types.Color HandleBarColor = {155,155,155}
          "|Animation|| Color of the HandleBar";
        parameter MB.Types.Color HandleColor = {55,55,55}
          "|Animation|| Color of the HandleBar";
       /*
    Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape RW12Right(
     lengthDirection= RFnode2 "Vector in length direction",
     length=stabPos - node1 "Length of visual object",
     shapeType="cylinder",
     color=FrameColor,
     width=0.08 "Width of visual object",
     height=0.05 "Height of visual object",
     r_shape=RFnode1 + {0,0,0.1},
     r=RearFrame.frame_b.P.x "Origin of visual object",
     R=MB.Frames.Orientation(T=RearFrame.frame_b.P.R,w=zeros(3)));

  Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape RW12Left(
     lengthDirection= RFnode2,
     length=stabPos - node1,
     shapeType="cylinder",
     color=FrameColor,
     width=0.08,
     height=0.05,
     r_shape=RFnode1 + {0,0,-0.1},
     r=RearFrame.frame_b.P.x,
     R=MB.Frames.Orientation(T=RearFrame.frame_b.P.R,w=zeros(3)));

  Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape Node1Pipe(
    shapeType="cylinder",
    color=FrameColor,
    widthDirection={1,0,0},
    r_shape=RFnode1+{0,0,-0.08},
    lengthDirection={0,0,1},
    width=0.08,
    height=0.08,
    length=0.16,
    r=RearFrame.frame_b.P.x,
    R=MB.Frames.Orientation(T=RearFrame.frame_b.P.R,w=zeros(3)));

  Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape RWSuspRight(
     lengthDirection=RFnode2,
     length=sqrt(RFnode1*RFnode1),
     shapeType="cylinder",
     color=FrameColor,
     width=0.08,
     height=0.05,
     r_shape={0,0,0.1},
     r=RearFrame.frame_b.P.x,
     R=MB.Frames.Orientation(T=RearFrame.frame_b.P.R,w=zeros(3)));

  Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape RWSuspLeft(
     lengthDirection=RFnode2,
     length=sqrt(RFnode1*RFnode1),
     shapeType="cylinder",
     color=FrameColor,
     width=0.08,
     height=0.05,
     r_shape={0,0,-0.1},
     r=RearFrame.frame_b.P.x,
     R=MB.Frames.Orientation(T=RearFrame.frame_b.P.R,w=zeros(3)));

  Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape StabPosPipe(
    shapeType="cylinder",
    color=FrameColor,
    widthDirection={1,0,0},
    r_shape=RFnode2+{0,0,-0.08},
    lengthDirection={0,0,1},
    width=0.08,
    height=0.08,
    length=0.16,
    r=RearFrame.frame_b.P.x,
    R=MB.Frames.Orientation(T=RearFrame.frame_b.P.R,w=zeros(3)));

  Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape VertPipeRight(
    shapeType="cylinder",
    color=FrameColor,
    r_shape=RFnode1 + {0,0,0.1},
    lengthDirection=RFnode4-RFnode1,
    width=0.08,
    height=0.05,
    length= RFnode4[2],
    r=RearFrame.frame_b.P.x,
    R=MB.Frames.Orientation(T=RearFrame.frame_b.P.R,w=zeros(3)));

  Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape VertPipeLeft(
    shapeType="cylinder",
    color=FrameColor,
    r_shape=RFnode1 + {0,0,-0.1},
    lengthDirection=RFnode4-RFnode1,
    width=0.08,
    height=0.05,
    length= RFnode4[2],
    r=RearFrame.frame_b.P.x,
    R=MB.Frames.Orientation(T=RearFrame.frame_b.P.R,w=zeros(3)));

  Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape Node4Pipe(
    shapeType="cylinder",
    color=FrameColor,
    widthDirection={1,0,0},
    r_shape=RFnode4+{0,0,-0.08},
    lengthDirection={0,0,1},
    width=0.08,
    height=0.08,
    length=0.16,
    r=RearFrame.frame_b.P.x,
    R=MB.Frames.Orientation(T=RearFrame.frame_b.P.R,w=zeros(3)));

  Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape BackRight(
     lengthDirection= {1,0.2,0},
     length= 0.4,
     shapeType="cylinder",
     color=FrameColor,
     width=0.08,
     height=0.05,
     r_shape=RFnode4 + {0,0,0.1},
     r=RearFrame.frame_b.P.x,
     R=MB.Frames.Orientation(T=RearFrame.frame_b.P.R,w=zeros(3)));

  Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape BackLeft(
     lengthDirection= {1,0.2,0},
     length= 0.4,
     shapeType="cylinder",
     color=FrameColor,
     width=0.08,
     height=0.05,
     r_shape=RFnode4 + {0,0,-0.1},
     r=RearFrame.frame_b.P.x,
     R=MB.Frames.Orientation(T=RearFrame.frame_b.P.R,w=zeros(3)));

  Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape RW45Right(
     lengthDirection= RFnode4 - RFnode5,
     length=sqrt((RFnode5[1]-RFnode4[1])*(RFnode5[1]-RFnode4[1]) + (RFnode5[2]-RFnode4[2])*(RFnode5[2]-RFnode4[2])),
     shapeType="cylinder",
     color=FrameColor,
     width=0.08,
     height=0.05,
     r_shape=RFnode5 + {0,0,0.1},
     r=RearFrame.frame_b.P.x,
     R=MB.Frames.Orientation(T=RearFrame.frame_b.P.R,w=zeros(3)));

  Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape RW45Left(
     lengthDirection= RFnode4 - RFnode5,
     length=sqrt((RFnode5[1]-RFnode4[1])*(RFnode5[1]-RFnode4[1]) + (RFnode5[2]-RFnode4[2])*(RFnode5[2]-RFnode4[2])),
     shapeType="cylinder",
     color=FrameColor,
     width=0.08,
     height=0.05,
     r_shape=RFnode5 + {0,0,-0.1},
     r=RearFrame.frame_b.P.x,
     R=MB.Frames.Orientation(T=RearFrame.frame_b.P.R,w=zeros(3)));

  Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape Node5Pipe(
    shapeType="cylinder",
    color=FrameColor,
    widthDirection={1,0,0},
    r_shape=RFnode5+{0,0,-0.08},
    lengthDirection={0,0,1},
    width=0.08,
    height=0.08,
    length=0.16,
    r=RearFrame.frame_b.P.x,
    R=MB.Frames.Orientation(T=RearFrame.frame_b.P.R,w=zeros(3)));

  Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape Stabilizer(
    shapeType="cylinder",
    color=FrameColor,
    r_shape=RFnode2,
    lengthDirection=RFnode5 - RFnode2,
    width=0.08,
    height=0.05,
    length=RFnode5[2],
    r=RearFrame.frame_b.P.x,
    R=MB.Frames.Orientation(T=RearFrame.frame_b.P.R,w=zeros(3)));

  Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape Node3Pipe(
    shapeType="cylinder",
    color=FrameColor,
    widthDirection={1,0,0},
    r_shape=RFnode3+{0,0,-0.08},
    lengthDirection={0,0,1},
    width=0.08,
    height=0.08,
    length=0.16,
    r=RearFrame.frame_b.P.x,
    R=MB.Frames.Orientation(T=RearFrame.frame_b.P.R,w=zeros(3)));

  Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape RW23Right(
     lengthDirection= RFnode2 - RFnode3,
     length=node3 - stabPos,
     shapeType="cylinder",
     color=FrameColor,
     width=0.08,
     height=0.05,
     r_shape=RFnode3 + {0,0,0.1},
     r=RearFrame.frame_b.P.x,
     R=MB.Frames.Orientation(T=RearFrame.frame_b.P.R,w=zeros(3)));

  Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape RW23Left(
     lengthDirection= RFnode2 - RFnode3,
     length=node3 - stabPos,
     shapeType="cylinder",
     color=FrameColor,
     width=0.08,
     height=0.05,
     r_shape=RFnode3 + {0,0,-0.1},
     r=RearFrame.frame_b.P.x,
     R=MB.Frames.Orientation(T=RearFrame.frame_b.P.R,w=zeros(3)));

  Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape lowerframepipeRight(
     shapeType="cylinder",
     color=FrameColor,
     r_shape=RFnode3+{0,0,0.1},
     width=0.05,
     height=0.08,
     lengthDirection=-RearFrame.r-RFnode3,
     widthDirection={0,0,1},
     length=sqrt((-RearFrame.r-RFnode3)*(-RearFrame.r-RFnode3)),
     r=RearFrame.frame_b.P.x,
     R=MB.Frames.Orientation(T=RearFrame.frame_b.P.R,w=zeros(3)));

  Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape lowerframepipeLeft(
     shapeType="cylinder",
     color=FrameColor,
     r_shape=RFnode3+{0,0,-0.1},
     width=0.05,
     height=0.08,
     lengthDirection=-RearFrame.r-RFnode3,
     widthDirection={0,0,1},
     length=sqrt((-RearFrame.r-RFnode3)*(-RearFrame.r-RFnode3)),
     r=RearFrame.frame_b.P.x,
     R=MB.Frames.Orientation(T=RearFrame.frame_b.P.R,w=zeros(3)));

   Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape upperframepipeRight(
     shapeType="cylinder",
     color=FrameColor,
     width=0.05,
     height=0.08,
     widthDirection={0,0,1},
     r_shape=RFnode5+{0,0,0.1},
     lengthDirection=(-RearFrame.r-RFnode5),
     length=sqrt((-RearFrame.r-RFnode5)*(-RearFrame.r-RFnode5)),
     r=RearFrame.frame_b.P.x,
     R=MB.Frames.Orientation(T=RearFrame.frame_b.P.R,w=zeros(3)));

  Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape upperframepipeLeft(
     shapeType="cylinder",
     color=FrameColor,
     width=0.05,
     height=0.08,
     widthDirection={0,0,1},
     r_shape=RFnode5+{0,0,-0.1},
     lengthDirection=(-RearFrame.r-RFnode5),
     length=sqrt((-RearFrame.r-RFnode5)*(-RearFrame.r-RFnode5)),
     r=RearFrame.frame_b.P.x,
     R=MB.Frames.Orientation(T=RearFrame.frame_b.P.R,w=zeros(3)));

  Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape ForkPipe1_Right(
    shapeType="cylinder",
    color=HandleBarColor,
    lengthDirection={cos(handlebarAngleRad),sin(handlebarAngleRad),0},
    r_shape={0,0,0.11},
    length=0.134,
    width=0.08,
    height=0.05,
    r=FrontFrame.frame_b.P.x,
    R=MB.Frames.Orientation(T=FrontFrame.frame_b.P.R,w=zeros(3)));

  Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape ForkPipe1_Left(
    shapeType="cylinder",
    color=HandleBarColor,
    lengthDirection={cos(handlebarAngleRad),sin(handlebarAngleRad),0},
    r_shape={0,0,-0.11},
    length=0.134,
    width=0.08,
    height=0.05,
    r=FrontFrame.frame_b.P.x,
    R=MB.Frames.Orientation(T=FrontFrame.frame_b.P.R,w=zeros(3)));

  Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape ForkPipe2(
    shapeType="cylinder",
    color=HandleBarColor,
    lengthDirection={0,0,1},
    width=0.05,
    height=0.1,
    r_shape={cos(handlebarAngleRad),sin(handlebarAngleRad),0}*0.134+{0,0,-0.17},
    length=0.34,
    r=FrontFrame.frame_b.P.x,
    R=MB.Frames.Orientation(T=FrontFrame.frame_b.P.R,w=zeros(3)));

  Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape HandleRight(
    shapeType="cylinder",
    color=HandleColor,
    lengthDirection={0.3,0,1},
    width=0.05,
    height=0.1,
    r_shape={cos(handlebarAngleRad), sin(handlebarAngleRad), 0}*0.134+{0,0,0.17},
    length=0.2,
    r=FrontFrame.frame_b.P.x,
    R=MB.Frames.Orientation(T=FrontFrame.frame_b.P.R,w=zeros(3)));

  Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape HandleLeft(
    shapeType="cylinder",
    color=HandleColor,
    lengthDirection={-0.3,-0,1},
    width=0.05,
    height=0.1,
    r_shape={cos(handlebarAngleRad), sin(handlebarAngleRad), 0}*0.134+{0,0,-0.17},
    length=-0.2,
    r=FrontFrame.frame_b.P.x,
    R=MB.Frames.Orientation(T=FrontFrame.frame_b.P.R,w=zeros(3)));

  Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape FWSuspLeft(
    shapeType="cylinder",
    r_shape={0,0,-0.11},
    color=HandleBarColor,
    width=0.08,
    height=0.05,
    lengthDirection=Steering.n,
    length=-FrontFrame.r*Steering.n/sqrt(Steering.n*Steering.n),
    r=FrontFrame.frame_b.P.x,
    R=MB.Frames.Orientation(T=FrontFrame.frame_b.P.R,w=zeros(3)));

  Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape FWSuspRight(
    shapeType="cylinder",
    color=HandleBarColor,
    width=0.08,
    height=0.05,
    lengthDirection=Steering.n,
    r_shape={0,0,0.11},
    length=-FrontFrame.r*Steering.n/sqrt(Steering.n*Steering.n),
    r=FrontFrame.frame_b.P.x,
    R=MB.Frames.Orientation(T=FrontFrame.frame_b.P.R,w=zeros(3)));

  Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape FrontPlate(
    shapeType="box",
    color=HandleBarColor,
    width=0.02,
    height=0.2,
    lengthDirection=Steering.n,
    r_shape={-0.025,0.01,0},
    length=-FrontFrame.r*Steering.n/sqrt(Steering.n*Steering.n)*0.4,
    r=FrontFrame.frame_b.P.x,
    R=MB.Frames.Orientation(T=FrontFrame.frame_b.P.R,w=zeros(3))); */

        annotation (
          Diagram(
            Rectangle(extent=[-186,-84; -120,-116], style(
                color=9,
                rgbcolor={175,175,175},
                thickness=4)),
            Rectangle(extent=[120,-84; 186,-116],   style(
                color=9,
                rgbcolor={175,175,175},
                thickness=4)),
            Text(
              extent=[126,-100; 158,-118],
              string="RearWheel",
              style(
                color=10,
                rgbcolor={135,135,135},
                thickness=4)),
            Text(
              extent=[-154,-106; -122,-116],
              string="FrontWheel",
              style(
                color=10,
                rgbcolor={135,135,135},
                thickness=4)),
            Rectangle(extent=[-144,-82; -148,-86], style(
                color=10,
                rgbcolor={135,135,135},
                thickness=4,
                fillColor=1,
                rgbfillColor={255,0,0})),
            Rectangle(extent=[-50,112; 28,12],      style(
                color=9,
                rgbcolor={175,175,175},
                thickness=4)),
            Rectangle(extent=[74,92; 168,-78],      style(
                color=9,
                rgbcolor={175,175,175},
                thickness=4)),
            Line(points=[-162,72; -56,72; -56,-14; -14,-14; -14,-78; -162,-78;
                  -162,72], style(
                color=9,
                rgbcolor={175,175,175},
                thickness=4)),
            Line(points=[-8,6; -8,-46; 68,-46; 68,112; 34,112; 34,6; -8,6; -8,6],
                style(
                color=9,
                rgbcolor={175,175,175},
                thickness=4)),
            Text(
              extent=[98,108; 142,86],
              string="SwingingArm",
              style(
                color=10,
                rgbcolor={135,135,135},
                thickness=4)),
            Text(
              extent=[14,-44; 46,-62],
              string="RearFrame",
              style(
                color=10,
                rgbcolor={135,135,135},
                thickness=4)),
            Text(
              extent=[-96,86; -56,66],
              string="FrontFrame",
              style(
                color=10,
                rgbcolor={135,135,135},
                thickness=4)),
            Rectangle(extent=[-6,-34; -10,-38],style(
                color=10,
                rgbcolor={135,135,135},
                thickness=4,
                fillColor=1,
                rgbfillColor={255,0,0})),
            Rectangle(extent=[-6,-4; -10,-8], style(
                color=10,
                rgbcolor={135,135,135},
                thickness=4,
                fillColor=1,
                rgbfillColor={255,0,0})),
            Rectangle(extent=[70,78; 66,74], style(
                color=10,
                rgbcolor={135,135,135},
                thickness=4,
                fillColor=1,
                rgbfillColor={255,0,0})),
            Rectangle(extent=[76,78; 72,74], style(
                color=10,
                rgbcolor={135,135,135},
                thickness=4,
                fillColor=1,
                rgbfillColor={255,0,0})),
            Rectangle(extent=[70,-34; 66,-38], style(
                color=10,
                rgbcolor={135,135,135},
                thickness=4,
                fillColor=1,
                rgbfillColor={255,0,0})),
            Rectangle(extent=[72,-34; 76,-38], style(
                color=10,
                rgbcolor={135,135,135},
                thickness=4,
                fillColor=1,
                rgbfillColor={255,0,0})),
            Rectangle(extent=[-12,-34; -16,-38], style(
                color=10,
                rgbcolor={135,135,135},
                thickness=4,
                fillColor=1,
                rgbfillColor={255,0,0})),
            Rectangle(extent=[158,-80; 154,-76], style(
                color=10,
                rgbcolor={135,135,135},
                thickness=4,
                fillColor=1,
                rgbfillColor={255,0,0})),
            Rectangle(extent=[158,-82; 154,-86], style(
                color=10,
                rgbcolor={135,135,135},
                thickness=4,
                fillColor=1,
                rgbfillColor={255,0,0})),
            Rectangle(extent=[-144,-80; -148,-76], style(
                color=10,
                rgbcolor={135,135,135},
                thickness=4,
                fillColor=1,
                rgbfillColor={255,0,0})),
            Rectangle(extent=[-28,14; -32,10],style(
                color=10,
                rgbcolor={135,135,135},
                thickness=4,
                fillColor=1,
                rgbfillColor={255,0,0})),
            Rectangle(extent=[-24,-106; -28,-110], style(
                color=10,
                rgbcolor={135,135,135},
                thickness=4,
                fillColor=1,
                rgbfillColor={255,0,0})),
            Text(
              extent=[18,-116; -20,-102],
              style(
                color=10,
                rgbcolor={135,135,135},
                thickness=4,
                fillColor=1,
                rgbfillColor={255,0,0},
                fillPattern=1),
              string="... Interfaces"),
            Text(
              extent=[4,108; 26,98],
              string="Rider",
              style(
                color=10,
                rgbcolor={135,135,135},
                thickness=4))),
          experiment(StopTime=10),
          experimentSetupOutput,
          Documentation(info="<html>
This example presents the model of a motorcycle.
<p>
The specific data of the Multi-Body-Model are introduced in the book \"Motorcycle Dynamics, 2nd Edition, 2006\" published by Vittore Cossalter (ISBN: 978-1-4303-0861-4).
</p>

<p>
<b>
Differences:
</b>
</p>
<p>
--> Ideal wheels (discs) are used instead of wheels including the cornering- and camber stiffness
</p>

<p>
<img src=\"../Images/motorcycle4.png\">
</p>

<p>
<b>
Short Description:
</b>
</p>

<p>
The motorcycle model is based on the Multi-Bond-Graph Library which was developed by Dirk Zimmer in 2006. The motorcycle is a further development of an uncontrolled    bicycle which was \"as well\" developed by Dirk Zimmer.
</p>

<p>
The joints of the motorcycle are frictionless and the wheels are ideally rolling.
The motorcycle is uncontrolled, but due to its initial velocity it is self-stabilizing.
Within a certain range of driving velocity a motorcycle is stable.
</p>


<p>
<b>
Remark:
</b>
</p>

<p>
Since the coordinate system of V. Cossalters motorcycle model is different to dymola the inertial-tensor of the front-frame was recalculated.
<pre>
    % Inertial Tensor for principal axis (refer to Motorcycle Dynamics page 262)
    I11 = 1.23;
    I22 = 0.44;

    I = zeros(3);
    I(1,1) = I11;
    I(2,2) = I22;

    % Calculation of the new Inertial Tensor (rotation about z-axis)

    % rotation angle (caster angle)
    eps = -27*pi/180;

    R = [cos(eps) -sin(eps) 0; sin(eps) cos(eps) 0; 0 0 1];
    I_new = R'*I*R
</pre>
</p>
</html>"),Coordsys(extent=[-170,-120; 170,120], scale=0.1),
          uses(BondLib(version="2.3")),
          Icon(
            Rectangle(extent=[-170,120; 170,-120], style(
                color=74,
                rgbcolor={0,0,127},
                fillColor=7,
                rgbfillColor={255,255,255})),
            Ellipse(extent=[-34,-54; -94,6], style(color=30, rgbcolor={215,215,
                    215})),
            Ellipse(extent=[106,-54; 46,6], style(color=30, rgbcolor={215,215,
                    215})),
            Line(points=[-64,-24; -34,66; -14,66; -14,66], style(color=0,
                  rgbcolor={0,0,0})),
            Line(points=[76,-24; 34,-24; -4,-24; -40,46; 26,26; 38,-24],  style(
                  color=0, rgbcolor={0,0,0})),
            Line(points=[26,26; 86,46], style(color=0, rgbcolor={0,0,0})),
            Ellipse(extent=[-59,-29; -69,-19], style(color=0, rgbcolor={0,0,0})),
            Ellipse(extent=[81,-29; 71,-19], style(color=0, rgbcolor={0,0,0})),
            Line(points=[-170,-100; -64,-100; -64,-24], style(
                color=0,
                rgbcolor={0,0,0},
                fillColor=7,
                rgbfillColor={255,255,255})),
            Line(points=[170,-100; 76,-100; 76,-24], style(
                color=0,
                rgbcolor={0,0,0},
                fillColor=7,
                rgbfillColor={255,255,255})),
            Text(
              extent=[-170,144; 170,120],
              string="%name",
              style(
                color=9,
                rgbcolor={175,175,175},
                fillColor=10,
                rgbfillColor={135,135,135},
                fillPattern=1))));
        MultiBondLib.Mechanics3D.Interfaces.Frame_a frame_a
          annotation (extent=[-186,-110; -166,-90]);
        MultiBondLib.Mechanics3D.Interfaces.Frame_b frame_b
          annotation (extent=[166,-110; 186,-90]);
        MultiBondLib.Mechanics3D.Parts.FixedTranslation fixedTranslation(r={0.4,0,
              0})
          annotation (extent=[108,-46; 128,-26]);
        MultiBondLib.Mechanics3D.Joints.CutJoints.PlanarRevolute planarRevolute(
            n={0,0,1})
          annotation (extent=[82,-46; 102,-26]);
        MultiBondLib.Mechanics3D.Parts.FixedTranslation SwingingArmCoM(
            animation=false, r={-0.1,0.33 - 0.321,0})
                                                 annotation (extent=[146,0; 166,
              20],
            rotation=90);
        MultiBondLib.Mechanics3D.Parts.SimpleBody SwingingArmMass(
          sphereDiameter=0.1,
          animation=true,
          m=1e-3,
          I_11=0,
          I_22=0,
          I_33=0,
          I_21=0,
          I_31=0,
          I_32=0)
               annotation (extent=[146,42; 166,62], rotation=90);
        MultiBondLib.Mechanics3D.Joints.Revolute SARevoluteUpper(
          phi_start=0,
          animation=true,
          cylinderDiameter=0.08,
          cylinderColor={255,0,0},
          initType=Modelica.Mechanics.MultiBody.Types.Init.Free,
          w_start=0,
          cylinderLength=0.15) annotation (extent=[92,66; 112,86],  rotation=0);
        MultiBondLib.Mechanics3D.Joints.Revolute RWRevolute(
          cylinderDiameter=0.08,
          cylinderColor={255,0,0},
          cylinderLength=0.15,
          enforceStates=true)  annotation (extent=[146,-72; 166,-52],
                                                                    rotation=270);
        MultiBondLib.Mechanics3D.Joints.ActuatedPrismatic actuatedPrismaticRear(
          n={0,1,0},
          initType=Modelica.Mechanics.MultiBody.Types.Init.Position,
          s_start=0.4)
          annotation (extent=[124,40; 144,60],rotation=90);
        BondLib.Mechanical.Translational.Passive.Spring spring(                   s_rel0=
              0.4, c=25700)
                annotation (extent=[104,40; 124,60], rotation=90);
        BondLib.Mechanical.Translational.Passive.Damper damper(d=8*1100)
          annotation (extent=[84,40; 104,60],  rotation=90);
        MultiBondLib.Mechanics3D.Parts.FixedTranslation fixedTranslation1(r={0,
              0.33 - 0.3321,0})
          annotation (extent=[124,-24; 144,-4],
                                              rotation=90);
        MultiBondLib.Mechanics3D.Parts.FixedTranslation fixedTranslationSA(
            animation=true, r={1.168 - 0.4,-(0.861 - 0.321),0})
                                                 annotation (extent=[4,-46; 24,
              -26]);
        MultiBondLib.Mechanics3D.Parts.FixedTranslation fixedTranslationRS(
                   animation=true, r={-0.4,0.321 - 0.7,0})
          annotation (extent=[32,10; 52,30], rotation=270);
        MultiBondLib.Mechanics3D.Parts.SimpleBody RearMass(
          sphereDiameter=0.1,
          animation=true,
          m=209.6,
          I_11=0,
          I_22=0,
          I_33=0,
          I_21=0,
          I_31=0,
          I_32=0)
               annotation (extent=[44,88; 64,108],rotation=90);
        MultiBondLib.Mechanics3D.Parts.FixedTranslation RearFrameCoM(animation=
              false, r={0.28,-0.532 + 0.321,0})
                      annotation (extent=[44,-20; 64,0], rotation=270);
        MultiBondLib.Mechanics3D.Parts.FixedTranslation AttachmentPoint(
            animation=false, r={0.2,0.321 - 1,0})
                                                 annotation (extent=[4,-16; 24,
              4],
            rotation=0);
        MultiBondLib.Mechanics3D.Parts.FixedTranslation RiderCoM(
            animation=true, r={0,1.19 - 1,0})    annotation (extent=[-40,54;
              -20,74],
            rotation=90);
        MultiBondLib.Mechanics3D.Parts.SimpleBody FrontSuspensionMass(
          animation=true,
          sphereColor={0,180,0},
          m=44.5,
          I_31=0,
          I_32=0,
          I_11=1.3,
          I_22=1.4,
          I_33=2.1,
          I_21=0.3,
          sphereDiameter=0.2)
               annotation (extent=[-40,84; -20,104],rotation=90);
        MultiBondLib.Mechanics3D.Joints.ActuatedRevolute actuatedRevolute(
          n={1,0,0},
          phi_offset=0,
          phi_start=1,
          initType=Modelica.Mechanics.MultiBody.Types.Init.Velocity,
          cylinderLength=0.1,
          cylinderDiameter=0.05,
          cylinderColor={155,0,0})
          annotation (extent=[-40,24; -20,44], rotation=90);
        MultiBondLib.Mechanics3D.Joints.ActuatedRevolute Steering(
          cylinderLength=0.10,
          cylinderDiameter=0.07,
          cylinderColor={100,100,100},
          initType=Modelica.Mechanics.MultiBody.Types.Init.Position,
          n={sin(0.5236),cos(0.5236),0},
          enforceStates=true)
          annotation (extent=[-44,-46; -24,-26]);
        BondLib.Mechanical.Rotational.Passive.Damper damper2(d=7.4)
          annotation (extent=[-44,-70; -24,-50],
                                               rotation=180);
        MultiBondLib.Mechanics3D.Joints.Revolute FWRevolute(
          phi(stateSelect=StateSelect.always),
          cylinderDiameter=0.08,
          cylinderColor={255,0,0},
          cylinderLength=0.15)
          annotation (extent=[-156,-70; -136,-50],
                                                 rotation=90);
        MultiBondLib.Mechanics3D.Parts.FixedTranslation FixedTranslation_Offset(
            animation=true, r=offset_vector)     annotation (extent=[-70,-46;
              -50,-26],
            rotation=0);
        MultiBondLib.Mechanics3D.Joints.ActuatedPrismatic
          actuatedPrismaticFront(
          s_offset=0,
          boxColor={155,0,0},
          n={sin(0.5236),cos(0.5236),0},
          s_start=sqrt((1.539 - 1.225)*(1.539 - 1.225) + (0.321 - 0.867)*(0.321
               - 0.867)),
          initType=Modelica.Mechanics.MultiBody.Types.Init.Position,
          enforceStates=true) annotation (extent=[-132,-30; -112,-10],
                                                                  rotation=0);
        BondLib.Mechanical.Translational.Passive.Spring spring2(s_rel0=sqrt((
              1.539 - 1.225)*(1.539 - 1.225) + (0.321 - 0.867)*(0.321 - 0.867))
               + 0.1, c=9000)
          annotation (extent=[-132,18; -112,38],
                                               rotation=0);
        BondLib.Mechanical.Translational.Passive.Damper damper3(d=8*550)
          annotation (extent=[-132,-4; -112,16],
                                               rotation=0);
        MultiBondLib.Mechanics3D.Parts.FixedTranslation FrontSuspensionCoM(
            animation=false, r={0,0,0})          annotation (extent=[-156,0;
              -136,20],
            rotation=90);
        MultiBondLib.Mechanics3D.Parts.SimpleBody FrontSuspensionMass1(
          sphereDiameter=0.1,
          animation=true,
          m=17.5,
          I_21=0,
          I_31=0,
          I_32=0,
          I_11=1e-3,
          I_22=1e-3,
          I_33=1e-3)
               annotation (extent=[-156,42; -136,62],
                                                    rotation=90);
        MultiBondLib.Mechanics3D.Parts.FixedTranslation FrontFrame(animation=true, r=r)
                                                 annotation (extent=[-104,-30;
              -84,-10]);
        MultiBondLib.Mechanics3D.Parts.FixedTranslation FixedTranslation(
                                       animation=false, r={p2_offset[1] - 1.165,
              0.869 - p2_offset[2],0})           annotation (extent=[-88,0; -68,
              20],
            rotation=90);
        MultiBondLib.Mechanics3D.Parts.SimpleBody FrontFrameMass(
          sphereDiameter=0.1,
          animation=true,
          m=13.1,
          I_11=0.8,
          I_22=0.5,
          I_33=1.2,
          I_21=0,
          I_31=0,
          I_32=0)
               annotation (extent=[-88,42; -68,62], rotation=90);
        BondLib.Mechanical.Rotational.Passive.Damper damper1(d=85.2)
          annotation (extent=[4,24; 24,44],    rotation=270);
        BondLib.Mechanical.Rotational.Passive.Spring spring1(    phi_rel0=0, c=10000)
          annotation (extent=[-16,24; 4,44],   rotation=270);
        MultiBondLib.Mechanics3D.Joints.Revolute SARevoluteLower(
          phi_start=0,
          animation=true,
          cylinderDiameter=0.08,
          cylinderColor={255,0,0},
          initType=Modelica.Mechanics.MultiBody.Types.Init.Free,
          w_start=0,
          cylinderLength=0.15,
          enforceStates=true)  annotation (extent=[124,8; 144,28],  rotation=90);
      equation
        connect(SwingingArmMass.frame_a,SwingingArmCoM. frame_b)   annotation (
            points=[156,41; 156,21], style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2,
            gradient=2,
            fillColor=10,
            rgbfillColor={95,95,95}));
        connect(damper.flange_a,spring. flange_a) annotation (points=[94,40;
              114,40], style(color=58, rgbcolor={0,127,0}));
        connect(RWRevolute.frame_a,SwingingArmCoM. frame_a) annotation (points=[156,-51;
              156,-1],                 style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(damper.flange_b,spring. flange_b) annotation (points=[94,59.9;
              94,60; 114,60; 114,59.9],
                                 style(color=58, rgbcolor={0,127,0}));
        connect(RearFrameCoM.frame_a,RearMass. frame_a) annotation (points=[54,1; 54,
              87],                      style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2,
            fillColor=30,
            rgbfillColor={215,215,215},
            fillPattern=1));
        connect(RearFrameCoM.frame_b,planarRevolute. frame_a) annotation (points=[54,-21;
              54,-36; 81,-36],          style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(fixedTranslationRS.frame_b,planarRevolute. frame_a) annotation (
            points=[42,9; 42,-36; 81,-36], style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(RiderCoM.frame_b,FrontSuspensionMass. frame_a) annotation (
            points=[-30,75; -30,83], style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(actuatedRevolute.frame_b,RiderCoM. frame_a) annotation (points=[-30,45;
              -30,53],    style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2,
            fillColor=1,
            rgbfillColor={255,0,0},
            fillPattern=1));
        connect(actuatedRevolute.frame_a,AttachmentPoint. frame_a) annotation (
            points=[-30,23; -30,-6; 3,-6],   style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(damper2.flange_b,Steering. bearing)
                                                   annotation (points=[-44,-60;
              -44,-43; -41,-43],
                       style(color=0, rgbcolor={0,0,0}));
        connect(FixedTranslation_Offset.frame_b,Steering. frame_a) annotation (
            points=[-49,-36; -45,-36],
                                   style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(Steering.frame_b,fixedTranslationSA. frame_a) annotation (points=[-23,-36;
              3,-36],           style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(fixedTranslationSA.frame_b,planarRevolute. frame_a) annotation (
            points=[25,-36; 81,-36], style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(AttachmentPoint.frame_b,planarRevolute. frame_a) annotation (
            points=[25,-6; 42,-6; 42,-36; 81,-36],   style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(planarRevolute.frame_b,fixedTranslation. frame_a) annotation (
            points=[103,-36; 107,-36], style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(fixedTranslation.frame_b,RWRevolute. frame_a) annotation (points=[129,-36;
              156,-36; 156,-51],           style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(RWRevolute.frame_a,fixedTranslation1. frame_a) annotation (points=[156,-51;
              156,-36; 134,-36; 134,-25],          style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(Steering.axis,damper2. flange_a) annotation (points=[-27,-43;
              -24,-43; -24,-60],
                             style(color=0, rgbcolor={0,0,0}));
        connect(spring2.flange_a,damper3. flange_a)
                                                   annotation (points=[-132,28;
              -132,6], style(color=58, rgbcolor={0,127,0}));
        connect(spring2.flange_b,damper3. flange_b)
                                                   annotation (points=[-112.1,28;
              -112,28; -112,6; -112.1,6],    style(color=58, rgbcolor={0,127,0}));
        connect(actuatedPrismaticFront.bearing, damper3.flange_a)
                                                            annotation (points=[-128,-13;
              -132,-13; -132,6],       style(color=58, rgbcolor={0,127,0}));
        connect(actuatedPrismaticFront.axis, damper3.flange_b)
                                                         annotation (points=[-115,-13;
              -112.1,-13; -112.1,6],    style(color=58, rgbcolor={0,127,0}));
        connect(FrontSuspensionMass1.frame_a,FrontSuspensionCoM. frame_b)
          annotation (points=[-146,41; -146,21], style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(FrontSuspensionCoM.frame_a,FWRevolute. frame_b) annotation (
            points=[-146,-1; -146,-49], style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(actuatedPrismaticFront.frame_a, FWRevolute.frame_b)
                                                                annotation (
            points=[-133,-20; -146,-20; -146,-49], style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(fixedTranslationRS.frame_a, SARevoluteUpper.frame_a)
                                                                 annotation (
            points=[42,31; 42,76; 91,76],                          style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(actuatedPrismaticFront.frame_b, FrontFrame.frame_a)
                                                                annotation (
            points=[-111,-20; -105,-20],
                                       style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(FrontFrame.frame_b,FixedTranslation_Offset. frame_a) annotation (
            points=[-83,-20; -78,-20; -78,-36; -71,-36],                   style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(FrontFrameMass.frame_a,FixedTranslation. frame_b)  annotation (
            points=[-78,41; -78,21], style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2,
            gradient=2,
            fillColor=10,
            rgbfillColor={95,95,95}));
        connect(FixedTranslation.frame_a,FixedTranslation_Offset. frame_a)
          annotation (points=[-78,-1; -78,-36; -71,-36], style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2,
            fillPattern=1));
        connect(damper1.flange_a,spring1. flange_a)
          annotation (points=[14,44; -6,44],style(color=0, rgbcolor={0,0,0}));
        connect(damper1.flange_b,spring1. flange_b)
                                                  annotation (points=[14,24; -6,
              24],      style(color=0, rgbcolor={0,0,0}));
        connect(spring1.flange_b,actuatedRevolute. bearing)
                                                           annotation (points=[-6,24;
              -18,24; -18,27; -23,27],             style(
            color=0,
            rgbcolor={0,0,0},
            fillColor=1,
            rgbfillColor={255,0,0},
            fillPattern=1));
        connect(spring1.flange_a,actuatedRevolute. axis)
                                                        annotation (points=[-6,44;
              -18,44; -18,41; -23,41],   style(
            color=0,
            rgbcolor={0,0,0},
            fillColor=1,
            rgbfillColor={255,0,0},
            fillPattern=1));
        connect(SARevoluteLower.frame_a, fixedTranslation1.frame_b) annotation (
           points=[134,7; 134,-3], style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(RWRevolute.frame_b, frame_b) annotation (points=[156,-73; 156,
              -100; 176,-100], style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(frame_a, FWRevolute.frame_a) annotation (points=[-176,-100;
              -146,-100; -146,-71], style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(actuatedPrismaticRear.frame_a, SARevoluteLower.frame_b)
          annotation (points=[134,39; 134,29], style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(actuatedPrismaticRear.frame_b, SARevoluteUpper.frame_b)
          annotation (points=[134,61; 134,76; 113,76], style(
            color=0,
            rgbcolor={0,0,0},
            thickness=2));
        connect(spring.flange_b, actuatedPrismaticRear.axis) annotation (points=
             [114,59.9; 118,59.9; 118,58; 127,58; 127,57], style(color=58,
              rgbcolor={0,127,0}));
        connect(spring.flange_a, actuatedPrismaticRear.bearing) annotation (
            points=[114,40; 118,40; 118,44; 127,44], style(color=58, rgbcolor={
                0,127,0}));
      end Motorcycle;
    end UsedModels;

  end Examples;

  package Visualization "Tools to visualize the tyre and road"

  annotation (
    preferedView="info",
    Documentation(info="<HTML>
<p>
This packages enables the use of <b>parametric surfaces</b> as visualization tool.
The road model for <b>uneven terrain</b> creates the animation in this fashion using VisualBase.
You can use the model VisualizerBase to bind a parametric surface to a MultiBody frame.
A <b>Torus</b> is provided, which is used to visualize the wheel shape.
</p>

</HTML>"),
      uses(Modelica(version="2.2.1")));
    package BaseClasses
      "contains classes used by other visualization classes. Not created by the Author of the WheelsAndTires Lib."
      annotation(preferedView="info");

      model SurfaceMaterial

      annotation (
        preferedView="info",
        Documentation(info="<HTML>
<p>
This is the <b>base class</b> for all kinds of parametric surfaces.
If you want to create your own parametric surface see VisualBase which extends SurfaceMaterial.
The most <b>basic specification</b> are done here:<br>
- material of the surface(color and specular coefficient) <br>
- number of grid points: NumberOfU * NumberOfV<br> </p> </HTML>"));
        extends WheelsAndTires.Visualization.BaseClasses.VisualBase;
        output Real material annotation (Hide=false);
        output Real extra annotation (Hide=false);
        output Real NumberOfU annotation (Hide=false);
        output Real NumberOfV annotation (Hide=false);
        output Real x[nu, nv] annotation (Hide=false);
        output Real y[nu, nv] annotation (Hide=false);
        output Real z[nu, nv] annotation (Hide=false);
        parameter Integer nu=2 "Number of points for u.";
        parameter Integer nv=2 "Number of points for v.";
        parameter Real Material[4]={1,0,0,0.5}
          "Color and specular coefficient.";
        parameter Real Extra=0.0 "Additional parameters.";
        annotation (Coordsys(extent=[-100, -100; 100, 100]));
      equation
        ObjectType = 57;
        NumberOfU = nu;
        NumberOfV = nv;
        material = PackMaterial(Material[1], Material[2], Material[3], Material[4]);
        extra = Extra;
      end SurfaceMaterial;

      partial model VisualBase

      annotation (
        preferedView="info",
        Documentation(info="<HTML>
<p>
To create your own <b>parametric surface</b> extend this model and define the output variables <b>x y z</b> of the base class SurfaceMaterial.
Therefore find functions of the form:<br> x = fx(u,v)<br> y = fy(u,v)<br> z = fz(u,v)<br> for NumberOfU values for u and NumberOfV values for v<br> Possible implementations can be found in Roads.UnevenRoad and Torus (even though Torus builds actually up on VisualizerBase).
</p>
<p>
The parametric surface is resolved in the inertial frame and automatically visualized.
If you want to bind your parametric surface to a MultiBody Frame use VisualizerBase instead.
</p>
</HTML>"));
        //constant Real VisualObject = 987000;
        Real ObjectType;
        output Real Form = 987000 + ObjectType  annotation(Hide=false);
        annotation (
          Coordsys(extent=[-100, -100; 100, 100]));
      end VisualBase;

      partial model VisualizerBase "Parametric surface with visulization"

      annotation (
        preferedView="info",
        Documentation(info="<HTML>
<p>
To create your own <b>parametric surface</b> bounded to a MultiBody frame extend this model.
Define the output variables x2 y2 z2 of this class. Therefore find functions of the form:<br>
x2 = fx(u,v)<br>
y2 = fy(u,v)<br>
z2 = fz(u,v)<br>
for NumberOfU values for u and NumberOfV values for v<br> </p> <p> To <b>bind the surface to a MultiBody frame</b> state equations of the form:<br> R = MultiBodyObject.frame_a.R<br> and...<br> r_0 = MultiBodyObject.frame_a.r_0 <br> A possible implementation can be found in Torus and in Wheels.Internal.WheelBase.
</p>
</HTML>"));
        import C = Modelica.Constants;
        import SI = Modelica.SIunits;
        import MB = Modelica.Mechanics.MultiBody;
        extends WheelsAndTires.Visualization.BaseClasses.SurfaceMaterial;

        MB.Frames.Orientation R = MB.Frames.nullRotation();
        SI.Position[3] r_0 = zeros(3);

      public
          output Real rxvisobj[3]
          "x-axis unit vector of shape, resolved in world frame"
            annotation (Hide=false);
          output Real ryvisobj[3]
          "y-axis unit vector of shape, resolved in world frame"
            annotation (Hide=false);
          output SI.Position rvisobj[3]
          "position vector from world frame to shape frame, resolved in world frame"
            annotation (Hide=false);

      protected
        Real x2[nu, nv];
        Real y2[nu, nv];
        Real z2[nu, nv];

      equation
       x = {{(r_0[1] + (MB.Frames.resolve1(R, {x2[alpha, beta],y2[alpha, beta],z2[
          alpha, beta]}))[1])
          for beta in (1:nv)}
          for alpha in (1:nu)};

       y = {{(r_0[2] + (MB.Frames.resolve1(R, {x2[alpha, beta],y2[alpha, beta],z2[
          alpha, beta]}))[2])
          for beta in (1:nv)}
          for alpha in (1:nu)};

       z = {{(r_0[3] + (MB.Frames.resolve1(R, {x2[alpha, beta],y2[alpha, beta],z2[
          alpha, beta]}))[3])
          for beta in (1:nv)}
          for alpha in (1:nu)};

        rxvisobj = MB.Frames.resolve1(R,{1,0,0});
        ryvisobj = MB.Frames.resolve1(R,{0,1,0});
        rvisobj = r_0;

        annotation (Icon(Rectangle(extent=[-60,60; 60,-60], style(color=3, rgbcolor={
                    0,0,255}))), Diagram);

      end VisualizerBase;
    end BaseClasses;

    model Torus "Parametric surface with visulization"
                                                       annotation (
      preferedView="info",
      Documentation(info="<HTML>
<p>
This object defines a <b>torus</b> with the inner radius ri and the outer radius ro.
Material and resolution properties can be defined by the inherited
parameters:
Material, NumberOfU and NumberOfV
</p>
<p>
To <b>bind the torus to a MultiBody frame</b> state equations of the form:<br> R = MultiBodyObject.frame_a.R<br> and...<br> r_0 = MultiBodyObject.frame_a.r_0 <br> A possible implementation can be found Wheels.Internal.WheelBase.
</p>
</HTML>"),
        Icon(Text(
            extent=[-52,-52; 52,50],
            style(pattern=0, gradient=2),
            string="Torus")));

      import C = Modelica.Constants;
      import SI = Modelica.SIunits;
      import MB = Modelica.Mechanics.MultiBody;
      extends WheelsAndTires.Visualization.BaseClasses.VisualizerBase;

    public
      parameter SI.Radius ri=1 "inner radius of the torus";
      parameter SI.Radius ro=0.2 "outer radius (=width/2) of the torus";
      parameter SI.Angle opening=0 "opening angle of the torus";
      parameter SI.Angle startAngle= -C.pi
        "useful to draw only a slice of the torus";
      parameter SI.Angle stopAngle= C.pi
        "useful to draw only a slice of the torus";

    protected
      Real x2[nu, nv];
      Real y2[nu, nv];
      Real z2[nu, nv];

    equation
      x2 = {{ (ri+ro*cos(beta))*sin(alpha)
        for beta in linspace(-C.pi+opening, C.pi-opening, nv)}
        for alpha in linspace(startAngle, stopAngle, nu)};
      y2 = {{ ro*sin(beta)
        for beta in linspace(-C.pi+opening, C.pi-opening, nv)}
        for alpha in linspace(startAngle, stopAngle, nu)};
      z2 = {{ (ri+ro*cos(beta))*cos(alpha)
        for beta in linspace(-C.pi+opening, C.pi-opening, nv)}
        for alpha in  linspace(startAngle, stopAngle, nu)};

      annotation (Icon(Text(
            extent=[-50,50; 50,-50],
            style(color=3, rgbcolor={0,0,255}),
            string="Torus")));

    end Torus;

    model SurfaceVisualization
      "visualizes the surface used in the Environment package"

      import SI = Modelica.SIunits;
      import MB = Modelica.Mechanics.MultiBody;
      import WheelsAndTires.Visualization.BaseClasses.SurfaceMaterial;

      parameter Integer nu(final min=2) = 4
        "Number of grid points in x direction";
      parameter Integer nv(final min=2) = 4
        "Number of grid points in y direction";
      parameter Integer IP(final min=0) = 5
        "Number of interpolation points between the grid points (just for visualization)";

      parameter Real PNG = 1 "Filename of the that shall be used as texture";
      parameter MB.Types.Color Color= {255,255,255}
        "Surface color (mixed with texture)";
      parameter MB.Types.SpecularCoefficient SpecularCoefficient = 0.1
        "Specular coefficient of the road surface without texture";

      parameter SI.Length LengthX = 10
        "Length of the surface area in x direction";
      parameter SI.Length LengthZ = 10
        "Length of the surface area in z direction";
      parameter SI.Length OffsetX = -LengthX/2 "Offset in x direction";
      parameter SI.Length OffsetZ = -LengthZ/2 "Offset in z direction";

      parameter SI.Distance y[nu,nv] = zeros(nu,nv)
        "Matrix with the y (elevation) values at the grid points";
      parameter Real dy_dx[nu,nv] = zeros(nu,nv)
        "Matrix with the slope of the grid points in x direction";
      parameter Real dy_dz[nu,nv] = zeros(nu,nv)
        "Matrix with the slope of the grid points in y direction";

      final parameter Integer nuIP = nu+(nu-1)*IP
        "Number of the grid values in x direction with interpolation";
      final parameter Integer nvIP = nv+(nv-1)*IP
        "Number of the grid values in y direction with interpolation";

      WheelsAndTires.Visualization.BaseClasses.SurfaceMaterial SM(
        nu = nuIP,
        nv = nvIP,
        Extra = 10*(PNG+10*100),
        Material=vector([Color/255;SpecularCoefficient]));

    protected
      outer MultiBondLib.Mechanics3D.World3D world3D;
      SI.Position x "acutal x value for the interpolation";
      SI.Position z "actual z value for the interpolation";
      SI.Position X[4] "vector with powers of x (for the interpolation)";
      SI.Position Z[4] "vector with powers of Z (for the interpolation)";
      constant Real H[4,4] = [2,-3, 0, 1; -2, 3, 0, 0; 1,-2, 1, 0; 1,-1, 0, 0]
        "Matrix used for the interpolation";
      Real G[4,4] "Matrix used for the interpolation";
      SI.Length rectangleX "Scaling factor for dy_dx";
      SI.Length rectangleZ "Scaling factor for dy_dz";

    algorithm
    when {initial() and world3D.enableAnimation} then

      rectangleX := LengthX/(nu-1);
      rectangleZ := LengthZ/(nv-1);

      // loop for the single rectangles (Interpolation just works within one rectangle)
      for m in 1:nu-1 loop
        for n in 1:nv-1 loop

          // creating the grid in x and z direction
          for i in 1:nuIP loop
            for j in 1:nvIP loop
              SM.x[i,j] := LengthX*(i - 1)/(nuIP - 1) + OffsetX;
              SM.z[i,j] := LengthZ*(j - 1)/(nvIP - 1) + OffsetZ;
            end for;
          end for;

          // definition of the matrix G for the interpolation
          G :=[y[m:m+1, n:n+1], dy_dz[m:m+1, n:n+1]*rectangleZ; dy_dx[m:m+1, n:n+1]*rectangleX, zeros(2, 2)];

          // interpolation of the y (elevation) values for the single rectangles
          for i in 1:IP+2 loop
            for j in 1:IP+2 loop
              x := mod((SM.x[i,j] - OffsetX)/rectangleX * (1-(LengthX/1e6)), 1);
              z := mod((SM.z[i,j] - OffsetZ)/rectangleZ * (1-(LengthX/1e6)), 1);
                /* *(1-(LengthX/1e6)) ensures that the the first argument of the
              mod() will not reach one. This would cause x and z to
              get 0 what is wrong as it should be 1. This is
              considered the best solution as it causes invisibly
              small difference in the visualization. */
              X := {x^3,x^2,x,1};
              Z := {z^3,z^2,z,1};
              SM.y[(m-1)*(IP+1)+i, (n-1)*(IP+1)+j] := (H*X)*G*(H*Z);
            end for;
          end for;

        end for;
      end for;

    end when;

      annotation (Icon(
             Text(
            extent=[-52,-52; 52,50],
            style(pattern=0, gradient=2),
            string="%name"),
                       Rectangle(extent=[-60,60; 60,-60], style(color=3, rgbcolor={
                  0,0,255}))));
    end SurfaceVisualization;

    model Arrow
      "Visualizing an arrow with variable size; all data have to be set as modifiers (see info layer), slightly modified."

      import SI = Modelica.SIunits;
      import Modelica.Mechanics.MultiBody.Types;
      import Modelica.Mechanics.MultiBody.Frames;

      input Frames.Orientation R=Frames.nullRotation()
        "Orientation object to rotate the world frame into the arrow frame." annotation(Dialog);
      input SI.Position r[3]={0,0,0}
        "Position vector from origin of world frame to origin of arrow frame, resolved in world frame"
                                                                                                       annotation(Dialog);
      input SI.Position r_tail[3]={0,0,0}
        "Position vector from origin of arrow frame to arrow tail, resolved in arrow frame"
                                                                                            annotation(Dialog);
      input SI.Position r_head[3]={0,0,0}
        "Position vector from arrow tail to the head of the arrow, resolved in arrow frame"
                                                                                            annotation(Dialog);
      input SI.Diameter diameter=world3D.defaultArrowDiameter
        "Diameter of arrow line" annotation(Dialog);
      input Modelica.Mechanics.MultiBody.Types.Color color=Modelica.Mechanics.MultiBody.Types.Defaults.ArrowColor
        "Color of arrow" annotation(Dialog);
      input Types.SpecularCoefficient specularCoefficient = 0
        "Material property describing the reflecting of ambient light (= 0 means, that light is completely absorbed)"
                                                                                                            annotation(Dialog);
    protected
      outer MultiBondLib.Mechanics3D.World3D world3D;
      SI.Length length=Frames.length(r_head) "Length of arrow";
      Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape arrowLine(
        length=noEvent(max(0, length - diameter*Types.Defaults.ArrowHeadLengthFraction)),
        width=diameter,
        height=diameter,
        lengthDirection=r_head,
        widthDirection={0,1,0},
        shapeType="cylinder",
        color=color,
        specularCoefficient=specularCoefficient,
        r_shape=r_tail,
        r=r,
        R=R) if world3D.enableAnimation;

      Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape arrowHead(
        length=noEvent(max(0, min(length, diameter*Types.Defaults.ArrowHeadLengthFraction))),
        width=noEvent(max(0, diameter*Types.Defaults.ArrowHeadWidthFraction)),
        height=noEvent(max(0, diameter*Types.Defaults.ArrowHeadWidthFraction)),
        lengthDirection=r_head,
        widthDirection={0,1,0},
        shapeType="cone",
        color=color,
        specularCoefficient=specularCoefficient,
        r=arrowLine.rvisobj + arrowLine.rxvisobj*arrowLine.length,
        R=R) if world3D.enableAnimation;

      annotation (
        preferedView="info",
        Documentation(info="<HTML>
<p>
Model <b>Arrow</b> defines an arrow that is dynamically
visualized at the defined location (see variables below).
</p>
<IMG SRC=\"../Images/MultiBody/Visualizers/Arrow.png\" ALT=\"model Visualizers.Advanced.Arrow\">
<p>
The variables under heading <b>Parameters</b> below
are declared as (time varying) <b>input</b> variables.
If the default equation is not appropriate, a corresponding
modifier equation has to be provided in the
model where an <b>Arrow</b> instance is used, e.g., in the form
</p>
<pre>
    Visualizers.Advanced.Arrow arrow(diameter = sin(time));
</pre>

<p>
Variable <b>color</b> is an Integer vector with 3 elements,
{r, g, b}, and specifies the color of the shape.
{r,g,b} are the \"red\", \"green\" and \"blue\" color parts.
Note, r g, b are given in the range 0 .. 255.
The predefined type <b>MultiBody.Types.Color</b> contains
a menu definition of the colors used in the MultiBody
library (will be replaced by a color editor).
</p>
</HTML>"),
        Icon(
          Rectangle(extent=[-100, 28; 20, -30], style(color=10, fillColor=10)),
          Polygon(points=[20, 60; 100, 0; 20, -60; 20, 60], style(color=10,
                fillColor=10)),
          Text(extent=[-146, 124; 142, 62], string="%name")),
        Diagram);

    end Arrow;
  end Visualization;

end WheelsAndTires;
