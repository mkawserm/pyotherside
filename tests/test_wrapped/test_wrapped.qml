import QtQuick 2.0
import io.thp.pyotherside 1.0

Rectangle {
    id: page
    width: 300
    height: 300

    Python {
        Component.onCompleted: {
            addImportPath(Qt.resolvedUrl('.'));

            importModule('test_wrapped', function () {
                console.log('"test_wrapped" imported successfully');

                var foo = call_sync('test_wrapped.get_foo', []);
                console.log('got foo: ' + foo);

                var result = call_sync('test_wrapped.set_foo', [foo]);
                console.log('got result: ' + result);
            });
        }

        onError: {
            console.log('Received error: ' + traceback);
        }
    }
}
