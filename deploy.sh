# creating virtual environment
echo "... creating virtual environment"
python3 -m venv venv
test $? = 0 && echo "... virtual environment created"
# activating virtual environment
source venv/bin/activate
pip install --upgrade pip > /dev/null
test $? = 0 && echo "... virtual environment activated"
# installing requirements
pip3 install -r requirements.txt > /dev/null
test $? = 0 && echo "... requirements installed"
# make migration
./manage.py makemigration > /dev/null
# migrate
./manage.py migrate > /dev/null
# launch server
./manage.py runserver 0.0.0.0:8000 > /dev/null
test $? = 0 && echo "... project running at http://<your_ip_address>:8000"