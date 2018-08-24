#ifndef CUSTOM_DECLARE_H
#define CUSTOM_DECLARE_H

#define __DECLARE_GET_INSTANCE(CLASS_NAME,BASE_CLASS)    \
    static BASE_CLASS* getInstance()\
    {\
        static  BASE_CLASS* __instance = NULL;\
        if(__instance == NULL)\
            __instance = new CLASS_NAME;\
        return __instance;\
    }

#define DECLARE_GET_INSTANCE(CLASS_NAME)    __DECLARE_GET_INSTANCE(CLASS_NAME,CLASS_NAME)

#endif // CUSTOM_DECLARE_H
