#include "mvrenablemodel.h"
#include "src/modelmanager.h"

RIGSTER_MODEL(MVREnableModel)
MVREnableModel::MVREnableModel()
{
    connect(this,SIGNAL(dataChanged()),this,SIGNAL(enableChanged()));
#ifdef DEBUG_WITHOUT_MIDDLEWARE
    setFileName("MVREnable.json");
#endif
}
