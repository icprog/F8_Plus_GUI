//用qml容器重新封装c++方法传回的单例业务数据指针，避免c++业务单例被js垃圾回收机制误释放
pragma Singleton
import QtQuick 2.0
Item{
    property var models : null
    function _getModels(){
        if(models === null)
            models = {}
        return models
    }
    function getModel(name) {
        console.log("qml getModel")
        console.log(name)
        if(!_getModels().hasOwnProperty(name))
        {
            var model = ModelManager.getModel(name)
            if(model === null)
            {
                console.log(name+" not found!")
                return null
            }
            else
                _getModels()[name] = model
        }
        return _getModels()[name]
    }

}
