#pragma once

struct KlazzA;
struct KlazzB;

namespace A { struct Foo; }
namespace B { struct Foo; }

extern KlazzA& GetA();
extern KlazzB& GetB();

extern A::Foo& GetFooA();
extern B::Foo& GetFooB();

