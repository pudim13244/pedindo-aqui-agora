
import React, { useState } from 'react';
import { Link } from 'react-router-dom';
import { User, Edit, LogOut, Settings, MapPin, Heart } from 'lucide-react';
import { Button } from '@/components/ui/button';
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card';
import { Tabs, TabsContent, TabsList, TabsTrigger } from '@/components/ui/tabs';
import Header from '@/components/Header';
import ProfileForm from '@/components/ProfileForm';

const Profile = () => {
  const [user, setUser] = useState({
    name: 'João Silva',
    email: 'joao@example.com',
    phone: '(11) 99999-9999',
    avatar: '/placeholder.svg'
  });

  const [isEditing, setIsEditing] = useState(false);

  const handleSaveProfile = (updatedUser: typeof user) => {
    setUser(updatedUser);
    setIsEditing(false);
  };

  const menuItems = [
    { icon: MapPin, label: 'Meus Endereços', link: '/address' },
    { icon: Heart, label: 'Favoritos', link: '/favorites' },
    { icon: Settings, label: 'Configurações', link: '/settings' },
  ];

  return (
    <div className="min-h-screen bg-primary-50">
      <Header title="Perfil" showBack />
      
      <div className="max-w-md mx-auto px-4 pb-20">
        {/* Profile Header */}
        <div className="py-6">
          <Card className="border-0 shadow-lg">
            <CardContent className="p-6">
              <div className="flex items-center gap-4 mb-4">
                <div className="w-16 h-16 rounded-full bg-primary-100 flex items-center justify-center">
                  <User className="w-8 h-8 text-primary-600" />
                </div>
                <div className="flex-1">
                  <h2 className="text-xl font-semibold text-gray-900">{user.name}</h2>
                  <p className="text-sm text-gray-600">{user.email}</p>
                  <p className="text-sm text-gray-600">{user.phone}</p>
                </div>
                <Button
                  variant="outline"
                  size="sm"
                  onClick={() => setIsEditing(true)}
                  className="border-primary-300 text-primary-600 hover:bg-primary-50"
                >
                  <Edit className="w-4 h-4" />
                </Button>
              </div>
            </CardContent>
          </Card>
        </div>

        <Tabs defaultValue="menu" className="space-y-6">
          <TabsList className="grid w-full grid-cols-2">
            <TabsTrigger value="menu">Menu</TabsTrigger>
            <TabsTrigger value="edit">Editar Perfil</TabsTrigger>
          </TabsList>

          <TabsContent value="menu" className="space-y-4">
            {menuItems.map((item) => (
              <Link key={item.label} to={item.link}>
                <Card className="border-0 shadow-md hover:shadow-lg transition-shadow">
                  <CardContent className="p-4">
                    <div className="flex items-center gap-3">
                      <div className="w-10 h-10 rounded-full bg-primary-100 flex items-center justify-center">
                        <item.icon className="w-5 h-5 text-primary-600" />
                      </div>
                      <span className="font-medium text-gray-900">{item.label}</span>
                    </div>
                  </CardContent>
                </Card>
              </Link>
            ))}

            <Card className="border-0 shadow-md">
              <CardContent className="p-4">
                <Button
                  variant="ghost"
                  className="w-full justify-start text-red-600 hover:bg-red-50 hover:text-red-700"
                >
                  <LogOut className="w-5 h-5 mr-3" />
                  Sair da Conta
                </Button>
              </CardContent>
            </Card>

            <div className="text-center py-4">
              <p className="text-sm text-gray-600 mb-2">
                Não tem uma conta?
              </p>
              <Link to="/register">
                <Button variant="outline" className="border-primary-300 text-primary-600 hover:bg-primary-50">
                  Criar Conta
                </Button>
              </Link>
            </div>
          </TabsContent>

          <TabsContent value="edit">
            <ProfileForm
              user={user}
              onSave={handleSaveProfile}
              onCancel={() => setIsEditing(false)}
            />
          </TabsContent>
        </Tabs>
      </div>
    </div>
  );
};

export default Profile;
