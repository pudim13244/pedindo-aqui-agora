
import React, { useState } from 'react';
import { Link } from 'react-router-dom';
import { Search, MapPin, Clock, Star, ChevronRight } from 'lucide-react';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { Card, CardContent } from '@/components/ui/card';
import Header from '@/components/Header';
import Modal from '@/components/Modal';

const Index = () => {
  const [location, setLocation] = useState('R. das Flores, 123 - Centro');
  const [isModalOpen, setIsModalOpen] = useState(false);

  const categories = [
    { id: 1, name: 'Pizza', icon: '🍕', color: 'bg-orange-100' },
    { id: 2, name: 'Hambúrguer', icon: '🍔', color: 'bg-yellow-100' },
    { id: 3, name: 'Japonesa', icon: '🍣', color: 'bg-green-100' },
    { id: 4, name: 'Brasileira', icon: '🍖', color: 'bg-red-100' },
    { id: 5, name: 'Italiana', icon: '🍝', color: 'bg-purple-100' },
    { id: 6, name: 'Doces', icon: '🍰', color: 'bg-pink-100' },
  ];

  const restaurants = [
    {
      id: 1,
      name: 'Pizzaria Bella Napoli',
      category: 'Pizza',
      rating: 4.8,
      deliveryTime: '25-35 min',
      deliveryFee: 'R$ 4,99',
      distance: '1.2 km',
      image: '/placeholder.svg',
      promoted: true,
      discount: '20% OFF'
    },
    {
      id: 2,
      name: 'Burger House',
      category: 'Hambúrguer',
      rating: 4.6,
      deliveryTime: '30-40 min',
      deliveryFee: 'R$ 3,99',
      distance: '0.8 km',
      image: '/placeholder.svg',
      promoted: false
    },
    {
      id: 3,
      name: 'Sushi Zen',
      category: 'Japonesa',
      rating: 4.9,
      deliveryTime: '40-50 min',
      deliveryFee: 'R$ 5,99',
      distance: '2.1 km',
      image: '/placeholder.svg',
      promoted: true,
      discount: 'Frete Grátis'
    },
  ];

  const promos = [
    {
      id: 1,
      title: 'Frete Grátis',
      subtitle: 'Em pedidos acima de R$ 30',
      image: '/placeholder.svg',
      color: 'bg-primary'
    },
    {
      id: 2,
      title: '20% OFF',
      subtitle: 'Na primeira compra',
      image: '/placeholder.svg',
      color: 'bg-secondary'
    },
  ];

  return (
    <div className="min-h-screen bg-primary-50">
      <Header />
      
      {/* Location Banner */}
      <div className="bg-white border-b border-gray-200 px-4 py-3">
        <div className="flex items-center gap-2 max-w-md mx-auto">
          <MapPin className="w-5 h-5 text-primary-500" />
          <div className="flex-1">
            <p className="text-sm text-gray-600">Entregar em</p>
            <p className="font-medium text-gray-900">{location}</p>
          </div>
          <Button 
            variant="ghost" 
            size="sm"
            onClick={() => setIsModalOpen(true)}
            className="text-primary-500 hover:bg-primary-50"
          >
            Alterar
          </Button>
        </div>
      </div>

      <div className="max-w-md mx-auto px-4 pb-20">
        {/* Search Bar */}
        <div className="py-4">
          <div className="relative">
            <Search className="absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400 w-5 h-5" />
            <Input
              placeholder="Buscar por restaurante ou comida"
              className="pl-10 pr-4 py-3 rounded-full border-gray-300 focus:border-primary-300 focus:ring-primary-200"
              onClick={() => window.location.href = '/search'}
            />
          </div>
        </div>

        {/* Promos */}
        <div className="mb-6">
          <div className="flex gap-3 overflow-x-auto pb-3">
            {promos.map((promo) => (
              <Card key={promo.id} className="flex-shrink-0 w-64 overflow-hidden border-0 shadow-lg">
                <div className={`${promo.color} text-white p-4 h-24 flex items-center justify-between`}>
                  <div>
                    <h3 className="font-bold text-lg">{promo.title}</h3>
                    <p className="text-sm opacity-90">{promo.subtitle}</p>
                  </div>
                  <ChevronRight className="w-6 h-6" />
                </div>
              </Card>
            ))}
          </div>
        </div>

        {/* Categories */}
        <div className="mb-6">
          <h2 className="text-lg font-semibold text-gray-900 mb-3">Categorias</h2>
          <div className="grid grid-cols-3 gap-3">
            {categories.map((category) => (
              <Link
                key={category.id}
                to="/search"
                className="flex flex-col items-center p-3 bg-white rounded-lg border border-gray-200 hover:border-primary-300 hover:shadow-md transition-all"
              >
                <div className={`${category.color} w-12 h-12 rounded-full flex items-center justify-center text-2xl mb-2 shadow-sm`}>
                  {category.icon}
                </div>
                <span className="text-sm font-medium text-gray-700">{category.name}</span>
              </Link>
            ))}
          </div>
        </div>

        {/* Restaurants */}
        <div>
          <h2 className="text-lg font-semibold text-gray-900 mb-3">Restaurantes próximos</h2>
          <div className="space-y-3">
            {restaurants.map((restaurant) => (
              <Link
                key={restaurant.id}
                to={`/restaurant/${restaurant.id}`}
                className="block"
              >
                <Card className="overflow-hidden hover:shadow-lg transition-shadow border-0 shadow-md">
                  <div className="relative">
                    <img
                      src={restaurant.image}
                      alt={restaurant.name}
                      className="w-full h-32 object-cover"
                    />
                    {restaurant.promoted && (
                      <div className="absolute top-2 left-2 bg-primary text-white px-2 py-1 rounded text-xs font-medium shadow-sm">
                        {restaurant.discount}
                      </div>
                    )}
                  </div>
                  <CardContent className="p-3">
                    <h3 className="font-semibold text-gray-900">{restaurant.name}</h3>
                    <p className="text-sm text-gray-600 mb-2">{restaurant.category}</p>
                    <div className="flex items-center justify-between text-xs text-gray-600">
                      <div className="flex items-center gap-1">
                        <Star className="w-3 h-3 fill-accent-400 text-accent-400" />
                        <span>{restaurant.rating}</span>
                      </div>
                      <div className="flex items-center gap-1">
                        <Clock className="w-3 h-3" />
                        <span>{restaurant.deliveryTime}</span>
                      </div>
                      <span>{restaurant.deliveryFee}</span>
                      <span>{restaurant.distance}</span>
                    </div>
                  </CardContent>
                </Card>
              </Link>
            ))}
          </div>
        </div>
      </div>

      {/* Modal para alterar endereço */}
      <Modal
        isOpen={isModalOpen}
        onClose={() => setIsModalOpen(false)}
        title="Alterar Endereço"
        maxWidth="max-w-lg"
      >
        <div className="space-y-4">
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-2">
              Novo Endereço
            </label>
            <Input
              type="text"
              placeholder="Digite seu endereço"
              value={location}
              onChange={(e) => setLocation(e.target.value)}
              className="w-full focus:border-primary-300 focus:ring-primary-200"
            />
          </div>
          <div className="flex gap-3 justify-end">
            <Button 
              variant="outline" 
              onClick={() => setIsModalOpen(false)}
              className="border-gray-300 text-gray-700 hover:bg-gray-50"
            >
              Cancelar
            </Button>
            <Button 
              onClick={() => setIsModalOpen(false)}
              className="bg-primary hover:bg-primary-600 text-white border-0"
            >
              Confirmar
            </Button>
          </div>
        </div>
      </Modal>
    </div>
  );
};

export default Index;
