import os.path

def mygrain():
   '''
   Returns custom grain data
   '''
   if os.path.exists('/etc/yum'):
       return {'z_my_test_grain':'test-grain-1.1.0'}
   if os.path.exists('/etc/apt'):
       return {'z_my_test_grain':'test-grain-3.2.0'}
   return {'z_my_test_grain':'test-grain-0.0.0'}
