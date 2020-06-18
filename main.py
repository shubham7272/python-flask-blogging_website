from flask import Flask, render_template,request,session,redirect
from flask_sqlalchemy import SQLAlchemy
from werkzeug import secure_filename
from flask_mail import Mail



import math
import os
import json
from datetime import datetime


with open('config.json',"r")as c:
    param = json.load(c)["param"]

local_server = True
app = Flask(__name__)
app.config["upload_folder"] = param["upload_location"]
app.secret_key='super-secret-key'
app.config.update(
    MAIL_SERVER = 'smtp.gmail.com',
    MAIL_PORT = '465',
    MAIL_USE_SSL = True,
    MAIL_USERNAME = param['gmail-user'],
    MAIL_PASSWORD = param['gmail-pass']
)

mail = Mail(app)
if(local_server):
    app.config['SQLALCHEMY_DATABASE_URI'] =param['local_uri']
else:
    app.config['SQLALCHEMY_DATABASE_URI'] = param['prod_uri']
db = SQLAlchemy(app)


class Contacts(db.Model):#SNO,name,e_mail,phone_num,mess,date
    SNO = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), nullable=False)
    e_mail = db.Column(db.String(100), nullable=False)
    phone_num = db.Column(db.String(20), nullable=False)
    mess = db.Column(db.String(120), nullable=False)
    date = db.Column(db.String(120), nullable=True)


class Post(db.Model):#SNO,name,e_mail,phone_num,mess,date
    SNO = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(100), nullable=False)
    tagline = db.Column(db.String(100), nullable=False)
    slug = db.Column(db.String(30),nullable=False)
    contents = db.Column(db.String(20), nullable=False)
    date = db.Column(db.String(120), nullable=True)
    img_file = db.Column(db.String(120), nullable=True)



@app.route("/")
def home():
    post = Post.query.filter_by().all()
    #[0:param['no_of_posts']]
    last=math.ceil(len(post)/int(param['no_of_posts']))
    page=request.args.get('page')
    if(not str(page).isnumeric()):
        page=1
    page=int(page)
    post=post[(page-1)*int(param['no_of_posts']):(page-1)*int(param['no_of_posts'])+int(param['no_of_posts'])]
    #pagination logic
    #first
    if (page==1):
        prev= "#"
        next= "/?page="+str(page+1)
    elif(page==last):
        prev="/?page="+str(page-1)
        next="#"
    else:
        prev="/?page=" + str(page - 1)
        next="/?page="+str(page+1)


    return render_template("index.html",param=param,post=post,prev=prev,next=next)




@app.route("/about")
def about():

    return render_template("about.html",param=param)

@app.route("/dashboard",methods = ['GET','POST'])
def login():
    if('user'in session and session['user']==param['admin_user']):
        post = Post.query.all()
        return render_template("dashboard.html",param=param,post=post)
    if request.method=='POST':
        username=request.form.get('uname')
        userpass = request.form.get('pass')
        if (username==param['admin_user'] and userpass==param['admin_pass']):
            session['user']=username
            post=Post.query.all()
            return render_template("dashboard.html",param=param,post=post)
    return render_template("login.html",param=param)



@app.route("/post/<string:post_slug>", methods = ['GET'])
def post(post_slug):
    post=Post.query.filter_by(slug=post_slug).first()
    return render_template("post.html",param=param,post=post)



@app.route("/delete/<string:SNO>", methods = ['GET', 'POST'])
def delete(SNO):
    if ('user' in session and session['user'] == param['admin_user']):
        post = Post.query.filter_by(SNO=SNO).first()
        db.session.delete(post)
        db.session.commit()
        return redirect('/dashboard')



@app.route("/edit/<string:SNO>", methods = ['GET', 'POST'])
def edit(SNO):
    if ('user' in session and session['user'] == param['admin_user']):
        if request.method=='POST':
            box_title=request.form.get('title')
            tline=request.form.get('tline')
            slug=request.form.get('slug')
            content=request.form.get('content')
            img_file=request.form.get('img_file')
            date = datetime.now()

            if SNO=='0':
                post=Post(title=box_title,tagline=tline,slug=slug,contents=content,img_file=img_file,date=datetime.now())
                db.session.add(post)
                db.session.commit()

            else:
                post=Post.query.filter_by(SNO=SNO).first()
                post.title = box_title
                post.tagline=tline
                post.slug=slug
                post.contents=content
                post.img_file=img_file
                post.date=date
                db.session.commit()
                return redirect('/edit/'+SNO)
        post = Post.query.filter_by(SNO=SNO).first()
        return render_template("edit.html",param=param,post=post)



@app.route("/logout")
def logout():
    session.pop('user')
    return redirect('/dashboard')



@app.route("/uploader", methods = ['GET', 'POST'])
def uploader():
    if ('user' in session and session['user'] == param['admin_user']):
        if (request.method == 'POST'):
            f=request.files['file1']
            f.save(os.path.join(app.config['upload_folder'],secure_filename(f.filename)))
            return "Uploaded Successfuly"



@app.route("/contact", methods = ['GET', 'POST'])
def contact():
    if(request.method=='POST'):
        name=request.form.get('name')
        email = request.form.get('email')
        phone = request.form.get('phone')
        message = request.form.get('message')
        entry = Contacts(name=name, e_mail=email, phone_num=phone, mess=message, date=datetime.now())
        db.session.add(entry)
        db.session.commit()
        mail.send_message('New message from ' + name,
                          sender=email,
                          recipients = [param['gmail-user']],
                          body = message + "\n" + phone
                          )
    return render_template("contact.html",param=param)

app.run(debug=True)
