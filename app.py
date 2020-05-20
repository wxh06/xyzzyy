from flask import Flask, jsonify, request, send_file, send_from_directory
from os import listdir, path
from urllib.parse import urlunsplit
import xyzzyy


app = Flask(
    __name__,
    static_url_path='/node_modules', static_folder='node_modules'
)


@app.route('/')
def index():
    return send_file('index.html')


@app.route('/data/<string:scheme>/<string:netloc>/<string:database>/students/')
def students(scheme, netloc, database):
    return jsonify(
        xyzzyy.session.Session(
            urlunsplit((scheme, netloc, '', '', '')),
            f'iUserId=0&iGroupId=300&sDatabase={database}'
        ).data.school_GetStudentList()['aUser']
    )


@app.route('/data/<string:scheme>/<string:netloc>/<string:database>/exams/')
def exams(scheme, netloc, database):
    return jsonify(
        xyzzyy.actions.exam(
            xyzzyy.session.Session(
                urlunsplit((scheme, netloc, '', '', '')),
                f"iUserId={request.args.get('user')}&iGroupId=300&sDatabase={database}"
            ),
            {None: None, 'true': True, 'false': False}[request.args.get('all')],
            {None: '0', 'true': '1', 'false': '0'}[request.args.get('exam')]
        )
    )


@app.route('/licenses/')
def licenses():
    return jsonify([{'header': f[:f.rindex('.')], 'path': f'/licenses/{f}', 'content': open(path.join(path.dirname(__file__), 'licenses', f)).read()} for f in sorted(listdir(path.join(path.dirname(__file__), 'licenses')), key=str.casefold)])


@app.route('/licenses/<path:path>')
def license(path):
    return send_from_directory('licenses', path)


if __name__ == '__main__':
    app.run()
