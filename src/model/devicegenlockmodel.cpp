#include "devicegenlockmodel.h"

DeviceGenlockModel::DeviceGenlockModel()
{
    connect(this,SIGNAL(dataChanged()),this,SIGNAL(enableChanged()));
    connect(this,SIGNAL(dataChanged()),this,SIGNAL(typeChanged()));
    connect(this,SIGNAL(dataChanged()),this,SIGNAL(inputIdChanged()));
#ifdef DEBUG_WITHOUT_MIDDLEWARE
    setFileName("DeviceGenlock.json");
#endif
}
