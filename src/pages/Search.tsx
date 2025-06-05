
import React, { useState } from 'react';
import { Link } from 'react-router-dom';
import { Search as SearchIcon, Filter, Star, Clock } from 'lucide-react';
import { Input } from '@/components/ui/input';
import { Button } from '@/components/ui/button';
import { Card, CardContent } from '@/components/ui/card';
import Header from '@/components/Header';

const Search = () => {
  const [searchTerm, setSearchTerm] = useState('');
  const [selectedCategory, setSelectedCategory] = useState('all');

  const categories = [
    { id: 'all', name: 'Todos' },
    { id: 'pizza', name: 'Pizza' },
    { id: 'hamburger', name: 'Hambúrguer' },
    { id: 'japanese', name: 'Japonesa' },
    { id: 'brazilian', name: 'Brasileira' },
    { id: 'italian', name: 'Italiana' },
    { id: 'dessert', name: 'Doces' },
  ];

  const allRestaurants = [
    {
      id: 1,
      name: 'Pizzaria Bella Napoli',
      category: 'pizza',
      categoryName: 'Pizza',
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
      category: 'hamburger',
      categoryName: 'Hambúrguer',
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
      category: 'japanese',
      categoryName: 'Japonesa',
      rating: 4.9,
      deliveryTime: '40-50 min',
      deliveryFee: 'R$ 5,99',
      distance: '2.1 km',
      image: '/placeholder.svg',
      promoted: true,
      discount: 'Frete Grátis'
    },
    {
      id: 4,
      name: 'Churrascaria do Gaúcho',
      category: 'brazilian',
      categoryName: 'Brasileira',
      rating: 4.7,
      deliveryTime: '35-45 min',
      deliveryFee: 'R$ 6,99',
      distance: '1.8 km',
      image: '/placeholder.svg',
      promoted: false
    },
    {
      id: 5,
      name: 'Pasta & Vino',
      category: 'italian',
      categoryName: 'Italiana',
      rating: 4.5,
      deliveryTime: '20-30 min',
      deliveryFee: 'R$ 4,99',
      distance: '0.9 km',
      image: '/placeholder.svg',
      promoted: false
    },
  ];

  const filteredRestaurants = allRestaurants.filter(restaurant => {
    const matchesSearch = restaurant.name.toLowerCase().includes(searchTerm.toLowerCase()) ||
                         restaurant.categoryName.toLowerCase().includes(searchTerm.toLowerCase());
    const matchesCategory = selectedCategory === 'all' || restaurant.category === selectedCategory;
    return matchesSearch && matchesCategory;
  });

  return (
    <div className="min-h-screen bg-gray-50">
      <Header title="Buscar" showBack />
      
      <div className="max-w-md mx-auto px-4 pb-20">
        {/* Search Bar */}
        <div className="py-4">
          <div className="relative">
            <SearchIcon className="absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400 w-5 h-5" />
            <Input
              placeholder="Buscar por restaurante ou comida"
              className="pl-10 pr-4 py-3 rounded-full border-gray-300"
              value={searchTerm}
              onChange={(e) => setSearchTerm(e.target.value)}
            />
          </div>
        </div>

        {/* Categories Filter */}
        <div className="mb-4">
          <div className="flex items-center gap-2 mb-3">
            <Filter className="w-5 h-5 text-gray-600" />
            <span className="font-medium text-gray-900">Categorias</span>
          </div>
          <div className="flex gap-2 overflow-x-auto pb-2">
            {categories.map((category) => (
              <Button
                key={category.id}
                variant={selectedCategory === category.id ? "default" : "outline"}
                size="sm"
                className="flex-shrink-0 rounded-full"
                onClick={() => setSelectedCategory(category.id)}
              >
                {category.name}
              </Button>
            ))}
          </div>
        </div>

        {/* Results */}
        <div>
          <p className="text-sm text-gray-600 mb-3">
            {filteredRestaurants.length} restaurantes encontrados
          </p>
          
          <div className="space-y-3">
            {filteredRestaurants.map((restaurant) => (
              <Link
                key={restaurant.id}
                to={`/restaurant/${restaurant.id}`}
                className="block"
              >
                <Card className="overflow-hidden hover:shadow-md transition-shadow">
                  <div className="relative">
                    <img
                      src={restaurant.image}
                      alt={restaurant.name}
                      className="w-full h-32 object-cover"
                    />
                    {restaurant.promoted && (
                      <div className="absolute top-2 left-2 bg-primary-500 text-white px-2 py-1 rounded text-xs font-medium">
                        {restaurant.discount}
                      </div>
                    )}
                  </div>
                  <CardContent className="p-3">
                    <h3 className="font-semibold text-gray-900">{restaurant.name}</h3>
                    <p className="text-sm text-gray-600 mb-2">{restaurant.categoryName}</p>
                    <div className="flex items-center justify-between text-xs text-gray-600">
                      <div className="flex items-center gap-1">
                        <Star className="w-3 h-3 fill-yellow-400 text-yellow-400" />
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
    </div>
  );
};

export default Search;
