#include <aSubRecord.h>
#include <registryFunction.h>
#include <epicsExport.h>
#include <epicsTypes.h>

extern "C" {

long logicInit(aSubRecord* /*p*/) { return 0; }

long logicProc(aSubRecord* p)
{
    const double tempC   = *(double*)p->a
    const double spC     = *(double*)p->b;
    const int    modeAuto= (int)(*(double*)p->c);
    const int    manCmd  = (int)(*(double*)p->d);

    epicsInt32 outVal;
    if (modeAuto == 0) {
        outVal = manCmd ? 1 : 0;
    } else {
        outVal = (tempC < spC) ? 1 : 0;
    }

    ((epicsInt32*)p->vala)[0] = outVal;
    return 0;
}

} // extern "C"

epicsRegisterFunction(logicInit);
epicsRegisterFunction(logicProc);

